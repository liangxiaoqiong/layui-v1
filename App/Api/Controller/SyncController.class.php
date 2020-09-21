<?php

namespace Api\Controller;

use Common\Model\AutoBuyModel;
use Common\Model\GoodsModel;
use Common\Model\GroupModel;
use Common\Model\OrderModel;
use Common\Model\TradeDetailModel;
use Common\Util\CacheLock;
use mysql_xdevapi\Exception;
use Org\Util\TPString;
use Think\Cache\Driver\Redis;
use Think\Model;

class SyncController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        header("Content-Type: text/html; charset=UTF-8");
        set_time_limit(3500);
    }

    /**
     * 开团
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-18 11:39:58
     * Update: 2020-06-18 11:39:58
     * Version: 1.00
     */
    public function buildGroup()
    {
        ini_set('memory_limit', '1024M');
        $t1 = microtime(true);
        $taskStatus = S('build_group_status');
        if ($taskStatus == 'processing') {
            logWrite("上一个轮询还在进行");
            die('上一个轮询还在进行');
        }
        S('build_group_status', 'processing');
        $configModel = M('system_config');
        $groupModel = M('group');
        $groupRecordModel = M('group_record');
        $goodsModel = M('goods');
        $autoBuyModel = M('auto_buy');
        $memberModel = M('member');
        $systemConfigs = $configModel->where(['is_delete' => NOT_DELETED])->select();
        foreach ($systemConfigs as $config) {
            $today = date('Y-m-d');
            $fiftyBeginTime = strtotime("{$today} {$config['begin_time_50']}");
            $fiftyEndTime = strtotime("{$today} {$config['end_time_50']}");
            $thousandBeginTime = strtotime("{$today} {$config['begin_time_1000']}");
            $thousandEndTime = strtotime("{$today} {$config['end_time_1000']}");
            $groupData = [];        //新团购数组
            $updateGroupData = [];  //团购更新数组
            $winData = [];      //成单数组
            $goodsData = [];    //库存数组
            $autoBuyData = [];  //自动复购数组
            //找出正在进行的团购
            $groups = $groupModel->where(['is_delete' => NOT_DELETED,
                'group_status' => GroupModel::GROUP_ONGOING,
                'mall_id' => $config['mall_id']])->select();
            if (empty($groups)) {
                //当前没有进行的团，判断是否要开团
                logWrite('当前无正在进行的团');
                //判断50元团购区是否开团
                if ($config['group_status_50'] == 1) {
                    if (NOW_TIME >= $fiftyBeginTime && NOW_TIME < $fiftyEndTime) {
                        //需要开团
                        $fiftyGroup = $this->buildGroupData($config, 1);
                        $groupData[] = $fiftyGroup;
                    }
                } else {
                    logWrite('50团购区未开启');
                }
                //判断1000元团购区是否开团
                if ($config['group_status_1000'] == 1) {
                    if (NOW_TIME >= $thousandBeginTime && NOW_TIME < $thousandEndTime) {
                        //需要开团
                        $thousandGroup = $this->buildGroupData($config, 2);
                        $groupData[] = $thousandGroup;
                    }
                } else {
                    logWrite('1000团购区未开启');
                }

            } else {
                foreach ($groups as $group) {
                    $isDone = 0;
                    //region 判断团是否需要完结
                    //参团人数
                    $joinNum = $groupRecordModel->where(['group_key_id' => $group['group_key_id']])->count();
                    //判断是否已到时间
                    if (($group['begin_time'] + (60 * $group['group_time'])) <= NOW_TIME) {
                        //团已到时间
                        if ($joinNum >= $group['people_num_min']) {
                            //成团
                            $update = [];
                            $update['group_key_id'] = $group['group_key_id'];
                            $update['group_status'] = GroupModel::GROUP_COMPLETE;
                            $update['join_num'] = $joinNum;
                            $update['end_time'] = NOW_TIME;
                            //随机抽取成单的人
                            $joinMember = $groupRecordModel->where(['group_key_id' => $group['group_key_id']])
                                ->field('record_id,member_id,member_name,goods_id')->select();
                            $random = [];
                            while (count($random) < $group['win_num']) {
                                $ran = mt_rand(0, ($joinNum - 1));
                                list($s1, $s2) = explode(' ', microtime());
                                $microTime = (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
                                $ran = ($microTime % $joinNum + $ran) % $joinNum;
                                if (!in_array($ran, $random)) {
                                    $random[] = $ran;
                                }
                            }
                            $remark = '成单人：';
                            foreach ($random as $index) {
                                $win = [];
                                $win['record_id'] = $joinMember[$index]['record_id'];
                                $win['is_win'] = 1;
                                $winData[] = $win;
                                $remark .= "{$joinMember[$index]['member_name']}、";
                                if (isset($goodsData[$joinMember[$index]['goods_id']])) {
                                    $goodsData[$joinMember[$index]['goods_id']]['num'] += 1;
                                } else {
                                    $goodsData[$joinMember[$index]['goods_id']]['goods_id'] = $joinMember[$index]['goods_id'];
                                    $goodsData[$joinMember[$index]['goods_id']]['num'] = 1;
                                }
                                //region 判断成单人是否需要关闭自动复购
                                $autoBuyWhere = [];
                                $autoBuyWhere['is_delete'] = NOT_DELETED;
                                $autoBuyWhere['is_history'] = 0;
                                $autoBuyWhere['member_id'] = $joinMember[$index]['member_id'];
                                $autoBuyWhere['group_type'] = $group['group_type'];
                                $autoBuy = $autoBuyModel->where($autoBuyWhere)->find();
                                if (!empty($autoBuy)) {
                                    if ($autoBuy['auto_buy_type'] == 0) {
                                        $closeAutoBuy = [];
                                        $closeAutoBuy['id'] = $autoBuy['id'];
                                        $closeAutoBuy['close_time'] = NOW_TIME;
                                        $memberInfo = $memberModel->where(['id' => $joinMember[$index]['member_id']])->find();
                                        $closeAutoBuy['cash_money'] = $memberInfo['cash_money'];
                                        $closeAutoBuy['is_history'] = 1;
                                        $closeAutoBuy['remark'] = '已成单自动终止复购';
                                        $autoBuyData[] = $closeAutoBuy;
                                    }
                                }
                                //endregion

                            }
                            $remark = substr($remark, 0, (strlen($remark) - 1));
                            $update['remark'] = $remark;
                            $updateGroupData[] = $update;
                            $isDone = 1;
                        } else {
                            //未成团
                            $update = [];
                            $update['group_key_id'] = $group['group_key_id'];
                            $update['group_status'] = GroupModel::GROUP_FAIL;
                            $update['join_num'] = $joinNum;
                            $update['end_time'] = NOW_TIME;
                            $update['remark'] = '达到时间，未达到人数，团购失败';
                            $updateGroupData[] = $update;
                            $isDone = 1;
                        }
                    } else {
                        //团未到时间
                        if ($joinNum >= $group['people_num_max']) {
                            //人数已到成团
                            $update = [];
                            $update['group_key_id'] = $group['group_key_id'];
                            $update['group_status'] = GroupModel::GROUP_COMPLETE;
                            $update['join_num'] = $joinNum;
                            $update['end_time'] = NOW_TIME;
                            //随机抽取成单的人
                            $joinMember = $groupRecordModel->where(['group_key_id' => $group['group_key_id']])
                                ->field('record_id,member_id,member_name,goods_id')->select();
                            $random = [];
                            while (count($random) < $group['win_num']) {
                                $ran = mt_rand(0, ($joinNum - 1));
                                list($s1, $s2) = explode(' ', microtime());
                                $microTime = (float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000);
                                $ran = ($microTime % $joinNum + $ran) % $joinNum;
                                if (!in_array($ran, $random)) {
                                    $random[] = $ran;
                                }
                            }
                            $remark = '成单人：';
                            foreach ($random as $index) {
                                $win = [];
                                $win['record_id'] = $joinMember[$index]['record_id'];
                                $win['is_win'] = 1;
                                $winData[] = $win;
                                $remark .= "{$joinMember[$index]['member_name']}、";
                                if (isset($goodsData[$joinMember[$index]['goods_id']])) {
                                    $goodsData[$joinMember[$index]['goods_id']]['num'] += 1;
                                } else {
                                    $goodsData[$joinMember[$index]['goods_id']]['goods_id'] = $joinMember[$index]['goods_id'];
                                    $goodsData[$joinMember[$index]['goods_id']]['num'] = 1;
                                }
                                //region 判断成单人是否需要关闭自动复购
                                $autoBuyWhere = [];
                                $autoBuyWhere['is_delete'] = NOT_DELETED;
                                $autoBuyWhere['is_history'] = 0;
                                $autoBuyWhere['member_id'] = $joinMember[$index]['member_id'];
                                $autoBuyWhere['group_type'] = $group['group_type'];
                                $autoBuy = $autoBuyModel->where($autoBuyWhere)->find();
                                if (!empty($autoBuy)) {
                                    if ($autoBuy['auto_buy_type'] == 0) {
                                        $closeAutoBuy = [];
                                        $closeAutoBuy['id'] = $autoBuy['id'];
                                        $closeAutoBuy['close_time'] = NOW_TIME;
                                        $memberInfo = $memberModel->where(['id' => $joinMember[$index]['member_id']])->find();
                                        $closeAutoBuy['cash_money'] = $memberInfo['cash_money'];
                                        $closeAutoBuy['is_history'] = 1;
                                        $closeAutoBuy['remark'] = '已成单自动终止复购';
                                        $autoBuyData[] = $closeAutoBuy;
                                    }
                                }
                                //endregion
                            }
                            $remark = substr($remark, 0, (strlen($remark) - 1));
                            $update['remark'] = $remark;
                            $updateGroupData[] = $update;
                            $isDone = 1;
                        }
                    }
                    //endregion
                    if ($isDone == 1) {
                        //上个团需要完结，需要重新开团
                        if ($group['group_type'] == 1) {
                            //50团购区
                            if ($config['group_status_50'] == 1) {
                                if (NOW_TIME >= $fiftyBeginTime && NOW_TIME < $fiftyEndTime) {
                                    //需要开团
                                    $fiftyGroup = $this->buildGroupData($config, 1);
                                    $groupData[] = $fiftyGroup;
                                }
                            } else {
                                logWrite('50团购区未开启');
                            }
                        } elseif ($group['group_type'] == 2) {
                            //1000团购区
                            if ($config['group_status_1000'] == 1) {
                                if (NOW_TIME >= $thousandBeginTime && NOW_TIME < $thousandEndTime) {
                                    //需要开团
                                    $thousandGroup = $this->buildGroupData($config, 2);
                                    $groupData[] = $thousandGroup;
                                }
                            } else {
                                logWrite('1000团购区未开启');
                            }
                        }
                    }
                }
                $haveNewFiftyGroup = 0;
                $haveNewThousandGroup = 0;
                if (!empty($groupData)) {
                    foreach ($groupData as $newGroup) {
                        if ($newGroup['group_type'] == 1) {
                            $haveNewFiftyGroup = 1;
                        } elseif ($newGroup['group_type'] == 2) {
                            $haveNewThousandGroup = 1;
                        }
                    }
                }

                if ($config['group_status_50'] == 1) {
                    if (NOW_TIME >= $fiftyBeginTime && NOW_TIME < $fiftyEndTime) {
                        //需要开团
                        $ongoingFiftyGroup = $groupModel->where([
                            'mall_id' => $config['mall_id'],
                            'group_type' => 1,
                            'is_delete' => NOT_DELETED,
                            'group_status' => GroupModel::GROUP_ONGOING])->find();
                        if ($haveNewFiftyGroup == 0 && empty($ongoingFiftyGroup)) {
                            $fiftyGroup = $this->buildGroupData($config, 1);
                            $groupData[] = $fiftyGroup;
                        }
                    }
                } else {
                    logWrite('50团购区未开启');
                }
                if ($config['group_status_1000'] == 1) {
                    if (NOW_TIME >= $thousandBeginTime && NOW_TIME < $thousandEndTime) {
                        $ongoingThousandGroup = $groupModel->where([
                            'mall_id' => $config['mall_id'],
                            'group_type' => 2,
                            'is_delete' => NOT_DELETED,
                            'group_status' => GroupModel::GROUP_ONGOING])->find();
                        if ($haveNewThousandGroup == 0 && empty($ongoingThousandGroup)) {
                            //需要开团
                            $thousandGroup = $this->buildGroupData($config, 2);
                            $groupData[] = $thousandGroup;
                        }
                    }
                } else {
                    logWrite('1000团购区未开启');

                }
            }
            $results = [];
            $groupModel->startTrans();
            //更新团购状态
            if (!empty($updateGroupData)) {
                $updateGroupSql = buildSaveAllSQL('wjd_group', $updateGroupData, 'group_key_id');
                $results[] = $groupModel->execute($updateGroupSql);
                foreach ($updateGroupData as $datum) {
                    $results[] = $groupRecordModel->where(['group_key_id' => $datum['group_key_id']])->save(['group_status' => $datum['group_status'], 'group_end_time' => $datum['end_time']]);
                }
            }
            //更新成单人数
            if (!empty($winData)) {
                $winSql = buildSaveAllSQL('wjd_group_record', $winData, 'record_id');
                $results[] = $groupRecordModel->execute($winSql);
            }
            //更新库存
            if (!empty($goodsData)) {
                foreach ($goodsData as $k => $v) {
                    $results[] = $goodsModel->where(['goods_id' => $v['goods_id']])->setDec('goods_stock', $v['num']);
                }
            }
            // 关闭自动复购
            if (!empty($autoBuyData)) {
                $autoBuySql = buildSaveAllSQL('wjd_auto_buy', $autoBuyData, 'id');
                $results[] = $autoBuyModel->execute($autoBuySql);
            }
            //开新团
            if (!empty($groupData)) {
                foreach ($groupData as $groupDatum) {
                    //更新redis的商品列表
                    $redisGoodsListName = 'goods_list_50_' . $groupDatum['mall_id'];
                    $redisGroupName = 'ongoing_group_info_50_' . $groupDatum['mall_id'];
                    $redisGroupJoinNumName = 'ongoing_group_join_num_50_' . $groupDatum['mall_id'];
                    $where = [];
                    $where['is_delete'] = NOT_DELETED;
                    $where['on_shelf'] = GoodsModel::ON_SHELF;
                    $where['is_recycle'] = GoodsModel::OFF_RECYCLE;
                    $where['group_attribution'] = 1;
//                    $where['goods_stock'] = ['egt', $config['win_num_50']];
                    if ($groupDatum['group_type'] == 2) {
                        $where['group_attribution'] = 2;
//                        $where['goods_stock'] = ['egt', $config['win_num_1000']];
                        $redisGoodsListName = 'goods_list_1000_' . $groupDatum['mall_id'];
                        $redisGroupName = 'ongoing_group_info_1000_' . $groupDatum['mall_id'];
                        $redisGroupJoinNumName = 'ongoing_group_join_num_1000_' . $groupDatum['mall_id'];
                    }
                    $where['mall_id'] = $config['mall_id'];
                    $goodsList = D('Goods')->where($where)->order('goods_sort desc')->select();
                    $redis = Redis::getInstance();
                    $redis->del($redisGoodsListName);
                    foreach ($goodsList as $goods) {
                        $redis->rPush($redisGoodsListName, jsonEncode($goods));
                    }
                    $groupKeyId = $groupModel->add($groupDatum);
                    $results[] = $groupKeyId;
                    $groupDatum['group_key_id'] = $groupKeyId;
                    $redis->set($redisGroupName, jsonEncode($groupDatum));
                    $redis->set($redisGroupJoinNumName, 0);
                }
            }
            if (in_array(false, $results, true)) {
                $groupModel->rollback();
                logWrite('失败,回滚');
            }
            $groupModel->commit();
            $groupModel->_after_update([], []);
            $groupRecordModel->_after_update([], []);
            $goodsModel->_after_update([], []);
            $autoBuyModel->_after_update([], []);
        }
        S('build_group_status', 'stop');
        $t2 = microtime(true);
        logWrite('运行结束，运行时间：' . ($t2 - $t1) . '秒');
    }

    /**
     * 处理已结束的团
     * 1、将成单的人生成订单数据
     * 2、计算该团的每个人奖励及未成单退还参团金额
     * 3、生成该团的业绩单
     * 4、修改团的结算状态
     * 5、释放轮询状态
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-18 11:39:58
     * Update: 2020-06-18 11:39:58
     * Version: 1.00
     */
    public function handleGroup()
    {
        ini_set('memory_limit', '1024M');
        $t1 = microtime(true);
        $taskStatus = S('handle_group_status');
        if ($taskStatus == 'processing') {
            logWrite("上一个轮询还在进行");
            die('上一个轮询还在进行');
        }
        S('handle_group_status', 'processing');
        //region 处理团
        $configModel = M('system_config');
        $groupModel = M('group');
        $groupRecordModel = M('group_record');
        $orderModel = M('order');
        $inventoryModel = M('inventory');
        $memberModel = M('member');
        $performanceModel = M('performance');
        $tradeModel = D('TradeDetail');
        $goodsModel = M('goods');
        $systemConfigs = $configModel->where(['is_delete' => NOT_DELETED])->select();
        foreach ($systemConfigs as $config) {
            //找出已经结束并未处理的团购
            $groupWhere = [];
            $groupWhere['is_delete'] = NOT_DELETED;
            $groupWhere['group_status'] = ['in', [GroupModel::GROUP_COMPLETE, GroupModel::GROUP_FAIL]];
            $groupWhere['mall_id'] = $config['mall_id'];
            $groupWhere['is_settle'] = 0;
            $groups = $groupModel->where($groupWhere)->select();
            logWrite("处理的团:" . jsonEncode($groups));
            if (empty($groups)) {
                //当前没有需要处理的团
                logWrite('当前没有需要处理的团');
                continue;
            } else {
                foreach ($groups as $group) {
                    $now = NOW_TIME;
                    $lock = new CacheLock("handle_group_{$now}");
                    $lock->lock();
                    $orderData = [];    //订单表数据
                    $inventoryData = [];    //订单清单表数据
                    $memberData = [];   //会员结算数据
                    $joinMemberData = [];   //参团会员结算
                    $performanceData = [];  //业绩表数据
                    $tradeData = [];    //资金流水数据
                    $groupRecordData = [];  //参团记录数据
                    //处理团 找出该团所有的参团记录
                    $records = $groupRecordModel->where(['group_key_id' => $group['group_key_id']])->select();
                    logWrite("处理的参团记录:" . jsonEncode($records));
                    $changeStatus = []; //得到所有参团编号更改流水表信息
                    foreach ($records as $record) {
                        $changeStatus[] = $record['group_sn'];
                    }
                    if ($group['group_status'] == GroupModel::GROUP_COMPLETE) {
                        //成团，遍历记录进行每个人的处理
                        foreach ($records as $record) {
                            $rMember = $memberModel->where(['id' => $record['member_id']])->find();
                            logWrite("成团rMember:" . jsonEncode($rMember));
                            $fMember = $memberModel->where(['id' => $record['first_recommend_member_id']])->find();
                            logWrite("成团fMember:" . jsonEncode($fMember));
                            $sMember = $memberModel->where(['id' => $record['second_recommend_member_id']])->find();
                            logWrite("成团sMember:" . jsonEncode($sMember));
                            //region是否成单。成单写入订单数据，未成单返回金额并生成一条资金返回流水
                            if ($record['is_win'] == 1) {
                                //成单
                                $order = [];
                                $order['mall_id'] = $record['mall_id'];
                                $order['record_id'] = $record['record_id'];
                                $order['order_sn'] = $record['group_sn'];
                                $order['member_id'] = $record['member_id'];
                                $order['member_name'] = $record['member_name'];
                                $order['member_nickname'] = $record['member_nickname'];
                                $order['total_amount'] = 1;
                                $order['total_money'] = $record['goods_price'];
                                $order['order_status'] = OrderModel::ORDER_WAIT_SHIP;
                                $order['pay_status'] = 1;
                                $order['order_type'] = 0;
                                $order['create_time'] = NOW_TIME;
                                $orderData[] = $order;
                                $inventory = [];
                                $goodsInfo = $goodsModel->where(['mall_id' => $record['mall_id'], 'goods_id' => $record['goods_id'], 'is_delete' => NOT_DELETED])->find();
                                $goodsImg = jsonDecodeToArr($goodsInfo['goods_img']);
                                $inventory['record_id'] = $record['record_id'];
                                $inventory['mall_id'] = $record['mall_id'];
                                $inventory['goods_id'] = $record['goods_id'];
                                $inventory['goods_name'] = $record['goods_name'];
                                $inventory['goods_img'] = $goodsImg['0'];
                                $inventory['goods_price'] = $goodsInfo['goods_price'];
                                $inventory['goods_num'] = 1;
                                $inventory['create_time'] = NOW_TIME;
                                $inventoryData[$record['record_id']] = $inventory;
                                $joinMemberData[$record['member_id']]['id'] = $record['member_id'];
                                $joinMemberData[$record['member_id']]['cash_money'] = $rMember['cash_money'];
                                $joinMemberData[$record['member_id']]['can_transfer_share_money'] = $rMember['can_transfer_share_money'] + $record['goods_price'];

                            } else {
                                //修改参团记录状态
                                $groupRecord = [];
                                $groupRecord['record_id'] = $record['record_id'];
                                $groupRecord['join_status_time'] = NOW_TIME;
                                $groupRecordData[] = $groupRecord;
                                //未成单
                                $joinMemberData[$record['member_id']]['id'] = $record['member_id'];
                                $joinMemberData[$record['member_id']]['cash_money'] = $rMember['cash_money'] + $record['goods_price'];
                                $joinMemberData[$record['member_id']]['can_transfer_share_money'] = $rMember['can_transfer_share_money'];
                                //添加流水
                                $params = [];
                                $params['mall_id'] = $record['mall_id'];
                                $params['trade_no'] = $record['group_sn'];
                                $params['member_id'] = $record['member_id'];
                                $params['member_name'] = $record['member_name'];
                                $params['member_nickname'] = $record['member_nickname'];
                                $params['trade_project'] = TradeDetailModel::CONSUMPTION_RETURN;
                                $params['funds_type'] = TradeDetailModel::CASH_MONEY;
                                $params['flow_type'] = TradeDetailModel::INFLOW;
                                $params['money'] = $record['goods_price'];
                                $params['result_money'] = $joinMemberData[$record['member_id']]['cash_money'];
                                $trade = $tradeModel->buildTradeData($params);
                                $tradeData[] = $trade;
                            }
                            //endregion
                            //region 直推间推结算
                            if (!empty($fMember)) {
                                if (isset($memberData[$record['first_recommend_member_id']])) {
                                    //人气红包
                                    $memberData[$record['first_recommend_member_id']]['pop_money'] += $record['first_recommend_pop_money'];
                                    //分享红包
                                    $memberData[$record['first_recommend_member_id']]['share_money'] += $record['first_recommend_share_money'];
                                    //推广业绩
                                    $memberData[$record['first_recommend_member_id']]['promote_performance_num'] += 1;
                                    //总人气红包
                                    $memberData[$record['first_recommend_member_id']]['total_pop_money'] += $record['first_recommend_pop_money'];
                                    //总分享红包
                                    $memberData[$record['first_recommend_member_id']]['total_share_money'] += $record['first_recommend_share_money'];
                                } else {
                                    $memberData[$record['first_recommend_member_id']]['id'] = $record['first_recommend_member_id'];
                                    //人气红包
                                    $memberData[$record['first_recommend_member_id']]['pop_money'] = $fMember['pop_money'] + $record['first_recommend_pop_money'];
                                    //分享红包
                                    $memberData[$record['first_recommend_member_id']]['share_money'] = $fMember['share_money'] + $record['first_recommend_share_money'];
                                    //推广业绩
                                    $memberData[$record['first_recommend_member_id']]['promote_performance_num'] = $fMember['promote_performance_num'] + 1;
                                    //人气红包
                                    $memberData[$record['first_recommend_member_id']]['total_pop_money'] = $fMember['total_pop_money'] + $record['first_recommend_pop_money'];
                                    //分享红包
                                    $memberData[$record['first_recommend_member_id']]['total_share_money'] = $fMember['total_share_money'] + $record['first_recommend_share_money'];
                                }
                                logWrite("成团计算直推奖励:" . jsonEncode($memberData));
                                //生成流水
                                $params = [];
                                $params['mall_id'] = $record['mall_id'];
                                $params['trade_no'] = $record['group_sn'];
                                $params['member_id'] = $record['first_recommend_member_id'];
                                $params['member_name'] = $fMember['username'];
                                $params['member_nickname'] = $fMember['nick_name'];
                                $params['trade_project'] = TradeDetailModel::FIRST_RECOMMEND_REWARD;
                                $params['funds_type'] = TradeDetailModel::POP_MONEY;
                                $params['flow_type'] = TradeDetailModel::INFLOW;
                                $params['money'] = $record['first_recommend_pop_money'];
                                $params['result_money'] = $memberData[$record['first_recommend_member_id']]['pop_money'];
                                $trade = $tradeModel->buildTradeData($params);
                                $tradeData[] = $trade;
                                $params['funds_type'] = TradeDetailModel::SHARE_MONEY;
                                $params['money'] = $record['first_recommend_share_money'];
                                $params['result_money'] = $memberData[$record['first_recommend_member_id']]['share_money'];
                                $trade = $tradeModel->buildTradeData($params);
                                $tradeData[] = $trade;
                            }
                            //间推人员结算
                            if ($record['group_type'] == 2) {
                                if (!empty($sMember)) {
                                    if (isset($memberData[$record['second_recommend_member_id']])) {
                                        //人气红包
                                        $memberData[$record['second_recommend_member_id']]['pop_money'] += $record['second_recommend_pop_money'];
                                        //分享红包
                                        $memberData[$record['second_recommend_member_id']]['share_money'] += $record['second_recommend_share_money'];
                                        //推广业绩
                                        $memberData[$record['second_recommend_member_id']]['promote_performance_num'] += 1;
                                        //总人气红包
                                        $memberData[$record['second_recommend_member_id']]['total_pop_money'] += $record['second_recommend_pop_money'];
                                        //总分享红包
                                        $memberData[$record['second_recommend_member_id']]['total_share_money'] += $record['second_recommend_share_money'];
                                    } else {
                                        $memberData[$record['second_recommend_member_id']]['id'] = $record['second_recommend_member_id'];
                                        //人气红包
                                        $memberData[$record['second_recommend_member_id']]['pop_money'] = $sMember['pop_money'] + $record['second_recommend_pop_money'];
                                        //分享红包
                                        $memberData[$record['second_recommend_member_id']]['share_money'] = $sMember['share_money'] + $record['second_recommend_share_money'];
                                        //推广业绩
                                        $memberData[$record['second_recommend_member_id']]['promote_performance_num'] = $sMember['promote_performance_num'] + 1;
                                        //人气红包
                                        $memberData[$record['second_recommend_member_id']]['total_pop_money'] = $sMember['total_pop_money'] + $record['second_recommend_pop_money'];
                                        //分享红包
                                        $memberData[$record['second_recommend_member_id']]['total_share_money'] = $sMember['total_share_money'] + $record['second_recommend_share_money'];
                                    }
                                    logWrite("成团计算剪推奖励:" . jsonEncode($memberData));
                                    //生成流水
                                    $params = [];
                                    $params['mall_id'] = $record['mall_id'];
                                    $params['trade_no'] = $record['group_sn'];
                                    $params['member_id'] = $record['second_recommend_member_id'];
                                    $params['member_name'] = $sMember['username'];
                                    $params['member_nickname'] = $sMember['nick_name'];
                                    $params['trade_project'] = TradeDetailModel::SECOND_RECOMMEND_REWARD;
                                    $params['funds_type'] = TradeDetailModel::POP_MONEY;
                                    $params['flow_type'] = TradeDetailModel::INFLOW;
                                    $params['money'] = $record['second_recommend_pop_money'];
                                    $params['result_money'] = $memberData[$record['second_recommend_member_id']]['pop_money'];
                                    $trade = $tradeModel->buildTradeData($params);
                                    $tradeData[] = $trade;
                                    $params['funds_type'] = TradeDetailModel::SHARE_MONEY;
                                    $params['money'] = $record['second_recommend_share_money'];
                                    $params['result_money'] = $memberData[$record['second_recommend_member_id']]['share_money'];
                                    $trade = $tradeModel->buildTradeData($params);
                                    $tradeData[] = $trade;
                                }
                            }
                            //endregion
                            //region 计算下线业绩
                            if (!empty($fMember)) {
                                if (isset($performanceData[$record['first_recommend_member_id']])) {
                                    //是否成单
                                    if ($record['is_win'] == 1) {
                                        //销售额
                                        $performanceData[$record['first_recommend_member_id']]['sales'] += $record['goods_price'];
                                    }
                                    //参团数
                                    $performanceData[$record['first_recommend_member_id']]['join_group_num'] += 1;
                                    //获得的人气红包
                                    $performanceData[$record['first_recommend_member_id']]['pop_money'] += $record['first_recommend_pop_money'];
                                    //获得的分享红包
                                    $performanceData[$record['first_recommend_member_id']]['share_money'] += $record['first_recommend_share_money'];
                                } else {
                                    $performanceData[$record['first_recommend_member_id']]['mall_id'] = $record['mall_id'];
                                    $performanceData[$record['first_recommend_member_id']]['group_key_id'] = $record['group_key_id'];
                                    $performanceData[$record['first_recommend_member_id']]['group_id'] = $record['group_id'];
                                    $performanceData[$record['first_recommend_member_id']]['create_time'] = NOW_TIME;
                                    $performanceData[$record['first_recommend_member_id']]['member_id'] = $record['first_recommend_member_id'];
                                    $performanceData[$record['first_recommend_member_id']]['member_name'] = $fMember['username'];
                                    $performanceData[$record['first_recommend_member_id']]['member_nickname'] = $fMember['nick_name'];
                                    //是否成单
                                    if ($record['is_win'] == 1) {
                                        //销售额
                                        $performanceData[$record['first_recommend_member_id']]['sales'] = $record['goods_price'];
                                    } else {
                                        //销售额
                                        $performanceData[$record['first_recommend_member_id']]['sales'] = 0;
                                    }
                                    //参团数
                                    $performanceData[$record['first_recommend_member_id']]['join_group_num'] = 1;
                                    //获得的人气红包
                                    $performanceData[$record['first_recommend_member_id']]['pop_money'] = $record['first_recommend_pop_money'];
                                    //获得的分享红包
                                    $performanceData[$record['first_recommend_member_id']]['share_money'] = $record['first_recommend_share_money'];
                                }
                            }
                            logWrite("成团计算直推业绩:" . jsonEncode($performanceData));
                            //间推人员
                            if (!empty($sMember)) {
                                if (isset($performanceData[$record['second_recommend_member_id']])) {
                                    //是否成单
                                    if ($record['is_win'] == 1) {
                                        //销售额
                                        $performanceData[$record['second_recommend_member_id']]['sales'] += $record['goods_price'];
                                    }
                                    //参团数
                                    $performanceData[$record['second_recommend_member_id']]['join_group_num'] += 1;
                                    //获得的人气红包
                                    $performanceData[$record['second_recommend_member_id']]['pop_money'] += $record['second_recommend_pop_money'];
                                    //获得的分享红包
                                    $performanceData[$record['second_recommend_member_id']]['share_money'] += $record['second_recommend_share_money'];
                                } else {
                                    $performanceData[$record['second_recommend_member_id']]['mall_id'] = $record['mall_id'];
                                    $performanceData[$record['second_recommend_member_id']]['group_key_id'] = $record['group_key_id'];
                                    $performanceData[$record['second_recommend_member_id']]['group_id'] = $record['group_id'];
                                    $performanceData[$record['second_recommend_member_id']]['create_time'] = NOW_TIME;
                                    $performanceData[$record['second_recommend_member_id']]['member_id'] = $record['second_recommend_member_id'];
                                    $performanceData[$record['second_recommend_member_id']]['member_name'] = $sMember['username'];
                                    $performanceData[$record['second_recommend_member_id']]['member_nickname'] = $sMember['nick_name'];
                                    //是否成单
                                    if ($record['is_win'] == 1) {
                                        //销售额
                                        $performanceData[$record['second_recommend_member_id']]['sales'] = $record['goods_price'];
                                    } else {
                                        //销售额
                                        $performanceData[$record['second_recommend_member_id']]['sales'] = 0;
                                    }
                                    //参团数
                                    $performanceData[$record['second_recommend_member_id']]['join_group_num'] = 1;
                                    //获得的人气红包
                                    $performanceData[$record['second_recommend_member_id']]['pop_money'] = $record['second_recommend_pop_money'];
                                    //获得的分享红包
                                    $performanceData[$record['second_recommend_member_id']]['share_money'] = $record['second_recommend_share_money'];
                                }
                            }
                            logWrite("成团计算间推业绩:" . jsonEncode($performanceData));
                            //endregion
                        }
                        //region重新遍历，单独处理参团奖励
                        foreach ($records as $record) {
                            if ($record['is_win'] == 1) {
                                if (isset($memberData[$record['member_id']])) {
                                    $joinMemberData[$record['member_id']]['pop_money'] = $memberData[$record['member_id']]['pop_money'];
                                    $joinMemberData[$record['member_id']]['total_pop_money'] = $memberData[$record['member_id']]['total_pop_money'];
                                } else {
                                    $rMember = $memberModel->where(['id' => $record['member_id']])->find();
                                    $joinMemberData[$record['member_id']]['pop_money'] = $rMember['pop_money'];
                                    $joinMemberData[$record['member_id']]['total_pop_money'] = $rMember['total_pop_money'];
                                }
                            } else {
                                if (isset($memberData[$record['member_id']])) {
                                    $joinMemberData[$record['member_id']]['pop_money'] = $memberData[$record['member_id']]['pop_money'] + $record['join_reward'];
                                    $joinMemberData[$record['member_id']]['total_pop_money'] = $memberData[$record['member_id']]['total_pop_money'] + $record['join_reward'];
                                } else {
                                    $rMember = $memberModel->where(['id' => $record['member_id']])->find();
                                    $joinMemberData[$record['member_id']]['pop_money'] = $rMember['pop_money'] + $record['join_reward'];
                                    $joinMemberData[$record['member_id']]['total_pop_money'] = $rMember['total_pop_money'] + $record['join_reward'];
                                }
                                //生成流水
                                $params = [];
                                $params['mall_id'] = $record['mall_id'];
                                $params['trade_no'] = $record['group_sn'];
                                $params['member_id'] = $record['member_id'];
                                $params['member_name'] = $record['member_name'];
                                $params['member_nickname'] = $record['member_nickname'];
                                $params['trade_project'] = TradeDetailModel::NO_WIN_REWARD;
                                $params['funds_type'] = TradeDetailModel::POP_MONEY;
                                $params['flow_type'] = TradeDetailModel::INFLOW;
                                $params['money'] = $record['join_reward'];
                                $params['result_money'] = $joinMemberData[$record['member_id']]['pop_money'];
                                $trade = $tradeModel->buildTradeData($params);
                                $tradeData[] = $trade;
                            }
                            logWrite("成团计算参团奖励:" . jsonEncode($joinMemberData));
                        }
                        //endregion
                    } else {
                        // 未成团
                        foreach ($records as $record) {
                            $rMember = $memberModel->where(['id' => $record['member_id']])->find();
                            logWrite("未成团rMebmber:" . jsonEncode($rMember));
                            $fMember = $memberModel->where(['id' => $record['first_recommend_member_id']])->find();
                            logWrite("未成团fMebmber:" . jsonEncode($fMember));
                            $sMember = $memberModel->where(['id' => $record['second_recommend_member_id']])->find();
                            logWrite("未成团sMebmber:" . jsonEncode($sMember));
                            //修改参团记录状态
                            $groupRecord = [];
                            $groupRecord['record_id'] = $record['record_id'];
                            $groupRecord['join_status_time'] = NOW_TIME;
                            $groupRecordData[] = $groupRecord;
                            //region所有人退回参团金额
                            $joinMemberData[$record['member_id']]['id'] = $record['member_id'];
                            $joinMemberData[$record['member_id']]['cash_money'] = $rMember['cash_money'] + $record['goods_price'];
                            //添加流水
                            $params = [];
                            $params['mall_id'] = $record['mall_id'];
                            $params['trade_no'] = $record['group_sn'];
                            $params['member_id'] = $record['member_id'];
                            $params['member_name'] = $record['member_name'];
                            $params['member_nickname'] = $record['member_nickname'];
                            $params['trade_project'] = TradeDetailModel::CONSUMPTION_RETURN;
                            $params['funds_type'] = TradeDetailModel::CASH_MONEY;
                            $params['flow_type'] = TradeDetailModel::INFLOW;
                            $params['money'] = $record['goods_price'];
                            $params['result_money'] = $joinMemberData[$record['member_id']]['cash_money'];
                            $trade = $tradeModel->buildTradeData($params);
                            $tradeData[] = $trade;
                            //endregion
                            //region 计算下线业绩
                            if (!empty($fMember)) {
                                if (isset($performanceData[$record['first_recommend_member_id']])) {
                                    //参团数
                                    $performanceData[$record['first_recommend_member_id']]['join_group_num'] += 1;
                                } else {
                                    $performanceData[$record['first_recommend_member_id']]['mall_id'] = $record['mall_id'];
                                    $performanceData[$record['first_recommend_member_id']]['group_key_id'] = $record['group_key_id'];
                                    $performanceData[$record['first_recommend_member_id']]['group_id'] = $record['group_id'];
                                    $performanceData[$record['first_recommend_member_id']]['create_time'] = NOW_TIME;
                                    $performanceData[$record['first_recommend_member_id']]['member_id'] = $record['first_recommend_member_id'];
                                    $performanceData[$record['first_recommend_member_id']]['member_name'] = $fMember['username'];
                                    $performanceData[$record['first_recommend_member_id']]['member_nickname'] = $fMember['nick_name'];
                                    //销售额
                                    $performanceData[$record['first_recommend_member_id']]['sales'] = 0;
                                    //参团数
                                    $performanceData[$record['first_recommend_member_id']]['join_group_num'] = 1;
                                    //获得的人气红包
                                    $performanceData[$record['first_recommend_member_id']]['pop_money'] = 0;
                                    //获得的分享红包
                                    $performanceData[$record['first_recommend_member_id']]['share_money'] = 0;
                                }
                            }
                            logWrite("未成团直推业绩:" . jsonEncode($performanceData));
                            //间推人员
                            if (!empty($sMember)) {
                                if (isset($performanceData[$record['second_recommend_member_id']])) {
                                    //参团数
                                    $performanceData[$record['second_recommend_member_id']]['join_group_num'] += 1;
                                } else {
                                    $performanceData[$record['second_recommend_member_id']]['mall_id'] = $record['mall_id'];
                                    $performanceData[$record['second_recommend_member_id']]['group_key_id'] = $record['group_key_id'];
                                    $performanceData[$record['second_recommend_member_id']]['group_id'] = $record['group_id'];
                                    $performanceData[$record['second_recommend_member_id']]['create_time'] = NOW_TIME;
                                    $performanceData[$record['second_recommend_member_id']]['member_id'] = $record['second_recommend_member_id'];
                                    $performanceData[$record['second_recommend_member_id']]['member_name'] = $sMember['username'];
                                    $performanceData[$record['second_recommend_member_id']]['member_nickname'] = $sMember['nick_name'];
                                    //销售额
                                    $performanceData[$record['second_recommend_member_id']]['sales'] = 0;
                                    //参团数
                                    $performanceData[$record['second_recommend_member_id']]['join_group_num'] = 1;
                                    //获得的人气红包
                                    $performanceData[$record['second_recommend_member_id']]['pop_money'] = 0;
                                    //获得的分享红包
                                    $performanceData[$record['second_recommend_member_id']]['share_money'] = 0;
                                }
                            }
                            logWrite("未成团推业绩:" . jsonEncode($performanceData));
                            //endregion
                        }
                    }
                    $results = [];
                    $groupModel->startTrans();
                    //添加订单记录
                    if (!empty($orderData)) {
                        foreach ($orderData as $order) {
                            $orderId = $orderModel->add($order);
                            $results[] = $orderId;
                            $inventoryData[$order['record_id']]['order_id'] = $orderId;
                        }
                    }
                    //订单清单表
                    if (!empty($inventoryData)) {
                        $inventoryData = array_values($inventoryData);
                        $results[] = $inventoryModel->addAll($inventoryData);
                    }
                    //会员奖励 一定要先写入会员奖励数据，在写入参团奖励
                    if (!empty($memberData)) {
                        $memberData = array_values($memberData);
                        $rewardSql = buildSaveAllSQL('wjd_member', $memberData, 'id');
                        $results[] = $memberModel->execute($rewardSql);
                    }
                    //参团会员结算
                    if (!empty($joinMemberData)) {
                        $joinMemberData = array_values($joinMemberData);
                        $joinMemberSql = buildSaveAllSQL('wjd_member', $joinMemberData, 'id');
                        $results[] = $memberModel->execute($joinMemberSql);
                    }
                    //业绩表结算
                    if (!empty($performanceData)) {
                        $performanceData = array_values($performanceData);
                        $results[] = $performanceModel->addAll($performanceData);
                    }
                    //流水写入
                    if (!empty($tradeData)) {
                        $results[] = $tradeModel->addAll($tradeData);
                    }
                    //修改为中单参团记录的退单时间
                    if (!empty($groupRecordData)) {
                        $groupRecordSql = buildSaveAllSQL('wjd_group_record', $groupRecordData, 'record_id');
                        $results[] = $groupRecordModel->execute($groupRecordSql);
                    }
                    //给资金明细表更改团状态
                    if (!empty($changeStatus)) {
                        $where = [];
                        $where['trade_no'] = ['in', $changeStatus];
                        $where['trade_project'] = ['in', [TradeDetailModel::CONSUMPTION_RETURN, TradeDetailModel::EXPENDITURES]];
                        $results[] = $tradeModel->where($where)->save(['is_finish' => 1]);
                    }
                    //更新团结算状态
                    $results[] = $groupModel->where(['group_key_id' => $group['group_key_id']])->save(['is_settle' => 1]);
                    if (in_array(false, $results, true)) {
                        $groupModel->rollback();
                        logWrite('失败,回滚');
                    }
                    $groupModel->commit();
                    $lock->unlock();
                }
            }
        }
        $memberModel->_after_update([], []);
        $groupRecordModel->_after_update([], []);
        //endregion
        //region自动复购
        $autoBuyModel = D('AutoBuy');
        $groupModel = D('Group');
        $groupRecordModel = D('GroupRecord');
        $mallModel = M('mall');
        $goodsModel = M('Goods');
        $memberModel = M('member');
        $mallList = $mallModel->where(['mall_status' => 1, 'is_delete' => NOT_DELETED])->field(['mall_id', 'auto_buy_delay_time'])->select();
        foreach ($mallList as $mall) {
            $winNum = 1;
            $fiftyIsFull = 0;
            $thousandIsFull = 0;
            $groupWhere = [];
            $groupWhere['is_delete'] = NOT_DELETED;
            $groupWhere['mall_id'] = $mall['mall_id'];
            $groupWhere['group_status'] = GroupModel::GROUP_ONGOING;
            $groupField = ['group_key_id', 'group_type', 'begin_time', 'group_time', 'people_num_max', 'win_num'];
            $groups = $groupModel->where($groupWhere)->field($groupField)->select();
            $fiftyGroup = [];
            $thousandGroup = [];
            if (!empty($groups)) {
                foreach ($groups as $group) {
                    $limitWhere = [];
                    $limitWhere['group_key_id'] = $group['group_key_id'];
                    $limitWhere['id_delete'] = NOT_DELETED;
                    $nowJoinNum = $groupRecordModel->where($limitWhere)->count();
                    $limit = $group['people_num_max'] - $nowJoinNum;
                    $groupType = 1;
                    if ($group['group_type'] == 1) {
                        $winNum = $group['win_num'];
                        $fiftyGroup = $group;
                        $where = [];
                        $where['group_key_id'] = $group['group_key_id'];
                        $where['id_delete'] = NOT_DELETED;
                        $fiftyJoinMember = $groupRecordModel->where($where)->getField('member_id', true);
                    } elseif ($group['group_type'] == 2) {
                        $groupType = 2;
                        $winNum = $group['win_num'];
                        $thousandGroup = $group;
                        $where = [];
                        $where['group_key_id'] = $group['group_key_id'];
                        $where['id_delete'] = NOT_DELETED;
                        $thousandJoinMember = $groupRecordModel->where($where)->getField('member_id', true);
                    }
                    // 找出自动复购的会员
                    $where = [];
                    $where['is_delete'] = NOT_DELETED;
                    $where['is_history'] = 0;
                    $where['mall_id'] = $mall['mall_id'];
                    $where['group_type'] = $groupType;
                    $whereStr = '';
                    if ($groupType == 1) {
                        if (!empty($fiftyJoinMember)) {
                            $fiftyJoinMemberStr = implode(',', $fiftyJoinMember);
                            $whereStr = "(member_id not in ($fiftyJoinMemberStr))";
                        }
                    }
                    if ($groupType == 2) {
                        if (!empty($thousandJoinMember)) {
                            $thousandJoinMemberStr = implode(',', $thousandJoinMember);
                            $whereStr .= "(member_id not in ($thousandJoinMemberStr))";
                        }
                    }
                    if (!empty($whereStr)) {
                        $where['_string'] = $whereStr;
                    }
                    $order = 'last_auto_buy_time asc,id asc';
                    $autoBuyList = $autoBuyModel->where($where)->order($order)->limit($limit)->select();
                    if (!empty($autoBuyList)) {
                        foreach ($autoBuyList as $item) {
                            if ($item['group_type'] == 1) {
                                if ($fiftyIsFull == 1) {
                                    continue;
                                }
                                $groupInfo = $fiftyGroup;
                            } elseif ($item['group_type'] == 2) {
                                if ($thousandIsFull == 1) {
                                    continue;
                                }
                                $groupInfo = $thousandGroup;
                            } else {
                                $groupInfo = [];
                            }
                            if (empty($groupInfo)) {
                                continue;
                            }
                            //自动参团的时间要大于配置的延迟时间
                            $autoBeginTime = $groupInfo['begin_time'] + $mall['auto_buy_delay_time'];
                            if ($autoBeginTime > NOW_TIME) {
                                continue;
                            }
                            //判断团是否结束
                            $endTime = $groupInfo['begin_time'] + (60 * $groupInfo['group_time']);
                            if ($endTime < NOW_TIME) {
                                continue;
                            }
                            //判断人数
                            $where = [];
                            $where['group_key_id'] = $groupInfo['group_key_id'];
                            $where['id_delete'] = NOT_DELETED;
                            $joinNum = $groupRecordModel->where($where)->count();
                            if ($joinNum >= $groupInfo['people_num_max']) {
                                if ($groupInfo['group_type'] == 1) {
                                    $fiftyIsFull = 1;
                                } elseif ($groupInfo['group_type'] == 2) {
                                    $thousandIsFull = 1;
                                }
                                continue;
                            }
                            //判断库存
                            $goodsInfo = $goodsModel->where(['goods_id' => $item['goods_id'], 'is_delete' => NOT_DELETED])->find();
                            if ($goodsInfo['goods_stock'] < $winNum) {
                                $cashMoney = $memberModel->where(['id' => $item['member_id']])->getField('cash_money');
                                $v = [];
                                $v['close_time'] = NOW_TIME;
                                $v['cash_money'] = $cashMoney;
                                $v['is_history'] = 1;
                                $v['remark'] = $autoBuyModel->getRemarkStr(AutoBuyModel::STOP_BY_GOODS, $cashMoney);
                            } else {
                                $request = [];
                                $request['group_key_id'] = $groupInfo['group_key_id'];
                                $request['goods_id'] = $item['goods_id'];
                                $request['join_num'] = $joinNum;
                                $result = $groupRecordModel->joinGroup($item['mall_id'], $item['member_id'], $request, 'auto');
                                if (isSuccess($result)) {
                                    $v = [];
                                    $v['last_auto_buy_time'] = NOW_TIME;
                                    logWrite("参团成功,团ID:{$request['group_key_id']},参团人ID:{$item['member_id']}");
                                } else {
                                    logWrite("参团失败，失败原因：" . jsonEncode($result));
                                    if ($result['code'] == CODE_INSUFFICIENT_BALANCE) {
                                        $v = [];
                                        $v['close_time'] = NOW_TIME;
                                        $v['cash_money'] = $result['data']['cash_money'];
                                        $v['is_history'] = 1;
                                        $v['remark'] = $autoBuyModel->getRemarkStr(AutoBuyModel::STOP_BY_BALANCE, $v['cash_money']);
                                    }
                                }
                            }
                            if (!empty($v)) {
                                $autoResult = $autoBuyModel->where(['id' => $item['id']])->save($v);
                                logWrite("自动复购后的复购记录结果：" . $autoResult);
                            }
                        }
                    }
                }
            }
        }
        //endregion
        S('handle_group_status', 'stop');
        $t2 = microtime(true);
        logWrite('运行结束，运行时间：' . ($t2 - $t1) . '秒');
    }

    /**
     * 自动收货
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-30 15:23:09
     * Update: 2020-06-30 15:23:09
     * Version: 1.00
     */
    public function autoReceipt()
    {
        $orderModel = M('order');
        $data = [];
        $malls = D('Mall')->where(['is_delete' => NOT_DELETED])->field('mall_id,auto_receipt_day')->select();
        foreach ($malls as $mall) {
            $where = [];
            $where['mall_id'] = $mall['mall_id'];
            $where['is_delete'] = NOT_DELETED;
            $where['refund_status'] = OrderModel::NO_REFUND;
            $where['order_status'] = OrderModel::ORDER_WAIT_RECEIPT;
            $autoReceiptTime = NOW_TIME - (3600 * 24 * $mall['auto_receipt_day']);
            $autoReceiptTime = strtotime(date('Y-m-d', $autoReceiptTime));
            $where['delivery_time'] = ['lt', $autoReceiptTime];
            $orders = $orderModel->where($where)->field('order_id')->select();
            foreach ($orders as $order) {
                $v = [];
                $v['order_id'] = $order['order_id'];
                $v['order_status'] = OrderModel::ORDER_RECEIPTED;
                $data[] = $v;
            }
        }
        $orderSql = buildSaveAllSQL('wjd_order', $data, 'order_id');
        $result = $orderModel->execute($orderSql);
        $orderModel->_after_update([], []);
    }

    /**
     * 创建团购数据
     * @param array $systemConfig
     * @param int $groupType
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-15 21:45:55
     * Update: 2020-06-15 21:45:55
     * Version: 1.00
     */
    private function buildGroupData($systemConfig = [], $groupType = 1)
    {
        $groupArea = $groupType == 2 ? '1000' : '50';
        $data = [];
        $data['mall_id'] = $systemConfig['mall_id'];
        $data['begin_time'] = NOW_TIME;
        $data['people_num_max'] = $systemConfig["group_num_max_{$groupArea}"];
        $data['people_num_min'] = $systemConfig["group_num_min_{$groupArea}"];
        $data['group_time'] = $systemConfig["group_time_{$groupArea}"];
        $data['group_status'] = GroupModel::GROUP_ONGOING;
        $data['group_type'] = $groupType;
        $data['win_num'] = $systemConfig["win_num_{$groupArea}"];
        $data['first_recommend_share_money'] = $systemConfig["first_recommend_share_money_{$groupArea}"];
        $data['first_recommend_pop_money'] = $systemConfig["first_recommend_pop_money_{$groupArea}"];
        $data['join_reward'] = $systemConfig["join_group_reward_{$groupArea}"];
        if ($groupType == 2) {
            $data['second_recommend_share_money'] = $systemConfig["second_recommend_share_money_{$groupArea}"];
            $data['second_recommend_pop_money'] = $systemConfig["second_recommend_pop_money_{$groupArea}"];
        } else {
            $data['second_recommend_share_money'] = 0;
            $data['second_recommend_pop_money'] = 0;
        }
        $data['create_time'] = NOW_TIME;
        $data['group_id'] = D('Group')->getGroupId($systemConfig['mall_id'], $groupType);
        return $data;
    }

    /**
     * 自动复购
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-07-30 16:59:31
     * Update: 2020-07-30 16:59:31
     * Version: 1.00
     */
    public function autoJoinGroup()
    {
        ini_set('memory_limit', '1024M');
        $t1 = microtime(true);
        $autoBuyStatus = S('auto_buy_status');
        if ($autoBuyStatus == 'processing') {
            logWrite("上一个轮询还在进行");
            die('上一个轮询还在进行');
        }
        S('auto_buy_status', 'processing');
        $autoBuyModel = D('AutoBuy');
        $groupModel = D('Group');
        $groupRecordModel = D('GroupRecord');
        $mallModel = M('mall');
        $goodsModel = M('Goods');
        $configModel = M('system_config');
        $memberModel = M('member');
        $mallList = $mallModel->where(['mall_status' => 1, 'is_delete' => NOT_DELETED])->field(['mall_id', 'auto_buy_delay_time'])->select();
        foreach ($mallList as $mall) {
            $winNum = 1;
            $fiftyIsFull = 0;
            $thousandIsFull = 0;
            $groupWhere = [];
            $groupWhere['is_delete'] = NOT_DELETED;
            $groupWhere['mall_id'] = $mall['mall_id'];
            $groupWhere['group_status'] = GroupModel::GROUP_ONGOING;
            $groupField = ['group_key_id', 'group_type', 'begin_time', 'group_time', 'people_num_max', 'win_num'];
            $groups = $groupModel->where($groupWhere)->field($groupField)->select();
            $fiftyGroup = [];
            $thousandGroup = [];
            if (!empty($groups)) {
                foreach ($groups as $group) {
                    $limitWhere = [];
                    $limitWhere['group_key_id'] = $group['group_key_id'];
                    $limitWhere['id_delete'] = NOT_DELETED;
                    $nowJoinNum = $groupRecordModel->where($limitWhere)->count();
                    $limit = $group['people_num_max'] - $nowJoinNum;
                    $groupType = 1;
                    if ($group['group_type'] == 1) {
                        $winNum = $group['win_num'];
                        $fiftyGroup = $group;
                        $where = [];
                        $where['group_key_id'] = $group['group_key_id'];
                        $where['id_delete'] = NOT_DELETED;
                        $fiftyJoinMember = $groupRecordModel->where($where)->getField('member_id', true);
                    } elseif ($group['group_type'] == 2) {
                        $groupType = 2;
                        $winNum = $group['win_num'];
                        $thousandGroup = $group;
                        $where = [];
                        $where['group_key_id'] = $group['group_key_id'];
                        $where['id_delete'] = NOT_DELETED;
                        $thousandJoinMember = $groupRecordModel->where($where)->getField('member_id', true);
                    }
                    // 找出自动复购的会员
                    $where = [];
                    $where['is_delete'] = NOT_DELETED;
                    $where['is_history'] = 0;
                    $where['mall_id'] = $mall['mall_id'];
                    $where['group_type'] = $groupType;
                    $whereStr = '';
                    if ($groupType == 1) {
                        if (!empty($fiftyJoinMember)) {
                            $fiftyJoinMemberStr = implode(',', $fiftyJoinMember);
                            $whereStr = "(member_id not in ($fiftyJoinMemberStr))";
                        }
                    }
                    if ($groupType == 2) {
                        if (!empty($thousandJoinMember)) {
                            $thousandJoinMemberStr = implode(',', $thousandJoinMember);
                            $whereStr .= "(member_id not in ($thousandJoinMemberStr))";
                        }
                    }
                    if (!empty($whereStr)) {
                        $where['_string'] = $whereStr;
                    }
                    $order = 'last_auto_buy_time asc,id asc';
                    $autoBuyList = $autoBuyModel->where($where)->order($order)->limit($limit)->select();
                    if (!empty($autoBuyList)) {
                        foreach ($autoBuyList as $item) {
                            if ($item['group_type'] == 1) {
                                if ($fiftyIsFull == 1) {
                                    continue;
                                }
                                $groupInfo = $fiftyGroup;
                            } elseif ($item['group_type'] == 2) {
                                if ($thousandIsFull == 1) {
                                    continue;
                                }
                                $groupInfo = $thousandGroup;
                            } else {
                                $groupInfo = [];
                            }
                            if (empty($groupInfo)) {
                                continue;
                            }
                            //自动参团的时间要大于配置的延迟时间
                            $autoBeginTime = $groupInfo['begin_time'] + $mall['auto_buy_delay_time'];
                            if ($autoBeginTime > NOW_TIME) {
                                continue;
                            }
                            //判断团是否结束
                            $endTime = $groupInfo['begin_time'] + (60 * $groupInfo['group_time']);
                            if ($endTime < NOW_TIME) {
                                continue;
                            }
                            //判断人数
                            $where = [];
                            $where['group_key_id'] = $groupInfo['group_key_id'];
                            $where['id_delete'] = NOT_DELETED;
                            $joinNum = $groupRecordModel->where($where)->count();
                            if ($joinNum >= $groupInfo['people_num_max']) {
                                if ($groupInfo['group_type'] == 1) {
                                    $fiftyIsFull = 1;
                                } elseif ($groupInfo['group_type'] == 2) {
                                    $thousandIsFull = 1;
                                }
                                continue;
                            }
                            //判断库存
                            $goodsInfo = $goodsModel->where(['goods_id' => $item['goods_id'], 'is_delete' => NOT_DELETED])->find();
                            if ($goodsInfo['goods_stock'] < $winNum) {
                                $cashMoney = $memberModel->where(['id' => $item['member_id']])->getField('cash_money');
                                $v = [];
                                $v['close_time'] = NOW_TIME;
                                $v['cash_money'] = $cashMoney;
                                $v['is_history'] = 1;
                                $v['remark'] = $autoBuyModel->getRemarkStr(AutoBuyModel::STOP_BY_GOODS, $cashMoney);
                            } else {
                                $request = [];
                                $request['group_key_id'] = $groupInfo['group_key_id'];
                                $request['goods_id'] = $item['goods_id'];
                                $request['join_num'] = $joinNum;
                                $result = $groupRecordModel->joinGroup($item['mall_id'], $item['member_id'], $request, 'auto');
                                if (isSuccess($result)) {
                                    $v = [];
                                    $v['last_auto_buy_time'] = NOW_TIME;
                                    logWrite("参团成功,团ID:{$request['group_key_id']},参团人ID:{$item['member_id']}");
                                } else {
                                    logWrite("参团失败，失败原因：" . jsonEncode($result));
                                    if ($result['code'] == CODE_INSUFFICIENT_BALANCE) {
                                        $v = [];
                                        $v['close_time'] = NOW_TIME;
                                        $v['cash_money'] = $result['data']['cash_money'];
                                        $v['is_history'] = 1;
                                        $v['remark'] = $autoBuyModel->getRemarkStr(AutoBuyModel::STOP_BY_BALANCE, $v['cash_money']);
                                    }
                                }
                            }
                            if (!empty($v)) {
                                $autoResult = $autoBuyModel->where(['id' => $item['id']])->save($v);
                                logWrite("自动复购后的复购记录结果：" . $autoResult);
                            }
                        }
                    }
                }
            }
        }
        S('auto_buy_status', 'stop');
        $t2 = microtime(true);
        logWrite('运行结束，运行时间：' . ($t2 - $t1) . '秒');
    }

    /**
     * 统计资金对账数据
     * 每天0点统计一次
     * User: hdc
     * Date: 2020-08-17 10:56:33
     * Update: 2020-08-17 10:56:33
     * Version: 1.00
     */
    public function buildFundReconciliationMeta()
    {
        ini_set('memory_limit', '1024M');
        $model = D('FundReconciliation');
        $results = [];
        $time = NOW_TIME - 3600 * 24;
        $date = date('Ymd', $time);
        $count = $model->where(['date' => $date])->count();
        if ($count > 0) {
            logWrite("已经生成过数据");
            exit();
        }
        $dayMeta = $model->buildMetaByTime($time);
        if (empty($dayMeta)) {
            logWrite("无数据");
            exit();
        }
        $results[] = $model->addAll($dayMeta);
        $this->apiResponse($results);
    }

    /**
     * 统计数据
     * 每天0点统计一次
     * 如果是本月最后一天，则统计一次月数据
     * User: hdc
     * Date: 2020-08-27 16:01:33
     * Update: 2020-08-27 16:01:33
     * Version: 1.00
     */
    public function buildMeta()
    {
        ini_set('memory_limit', '1024M');
        $mallModel = D('Mall');
        $dayModel = D('OperationalMetaDay');
        $monthModel = D('OperationalMetaMonth');

        // 生成今日数据(0点运行 则减去24小时可以保证是统计昨日数据)
        $mallList = $mallModel->field('mall_id,create_time')->select();
        $results = [];
        $time = NOW_TIME - 3600 * 24;
        $dayMeta = $dayModel->buildMetaByTime($time, $mallList);
        $results[] = $dayModel->addAll($dayMeta);
        // 判断今天是否是本月最后一天 如果是 则还要统计月数据
        $mdays = date('t', $time);
        $day = date('d', $time);
        if ($mdays === $day) {
            $monthMeta = $monthModel->buildMetaByTime($time, $mallList);
            $results[] = $monthModel->addAll($monthMeta);
        }
        $this->apiResponse($results);
    }
}
