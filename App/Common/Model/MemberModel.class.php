<?php

namespace Common\Model;

/**
 * 会员
 * Class MemberModel
 * @package AdminLF\Model
 * User: hjun
 * Date: 2018-03-29 23:10:58
 * Update: 2018-03-29 23:10:58
 * Version: 1.00
 * company 启达联创(厦门)信息科技有限公司
 * Copyright  ©2018 www.wxzbc.com  All rights reserved
 */
class MemberModel extends BaseModel
{
    /**
     * 获取列表的筛选条件
     * @param array $request
     * @return array
     * User: hjun
     * Date: 2019-08-20 12:03:43
     * Update: 2019-08-20 12:03:43
     * Version: 1.00
     */
    public function getQueryWhere($request = [])
    {
        $where = [];
        $where['mall_id'] = $this->getMallId();
        //团队
        if (!empty($request['view'])) {
            if ($request['view'] == 'team') {
                $where['promote_people_num'] = ['gt', 0];
            }
        }
        //一级推荐人id
        if (!empty($request['first_recommend'])) {
            $where['first_recommend_member_id'] = $request['first_recommend'];
        }
        //二级推荐人id
        if (!empty($request['second_recommend'])) {
            $where['second_recommend_member_id'] = $request['second_recommend'];
        }
        // 账号
        if (!empty($request['username'])) {
            $where['username'] = $request['username'];
        }
        // 姓名
        if (!empty($request['nick_name'])) {
            $where['nick_name'] = ['like', "%{$request['nick_name']}%"];
        }
        //注册时间范围
        $regtimeWhere = getRangeWhere($request, 'regtime_min', 'regtime_max')['data'];
        if (!empty($regtimeWhere)) {
            $where['regtime'] = $regtimeWhere;
        }
        // 推广人数范围
        if (!empty($request['promote_min']) && !empty($request['promote_max'])) {
            $where['promote_people_num'] = ['between', [$request['promote_min'], $request['promote_max']]];
        }
        if (empty($request['promote_min']) && !empty($request['promote_max'])) {
            $where['promote_people_num'] = ['elt', $request['promote_max']];
        }
        if (!empty($request['promote_min']) && empty($request['promote_max'])) {
            $where['promote_people_num'] = ['egt', $request['promote_min']];
        }
        return $where;
    }

    /**
     * 查询列表
     * @param array $request
     * @return array
     * User: hjun
     * Date: 2019-08-20 12:05:58
     * Update: 2019-08-20 12:05:58
     * Version: 1.00
     */
    public function queryMemberList($request = [])
    {
        $field = [
            'id', 'mall_id', 'username',
            'nick_name', 'share_money', 'can_transfer_share_money', 'pop_money', 'cash_money',
            'regtime', 'promote_people_num', 'promote_performance_num'
        ];
        if ($request['source'] == 'wx') {
            $field = ['id', 'mall_id', 'username', 'nick_name', 'face'];
        }
        $where = $this->getQueryWhere($request);
        $order = 'id asc';
        $options = [];
        $options['field'] = $field;
        $options['where'] = $where;
        $options['page'] = empty($request['page']) ? 1 : $request['page'];
        $options['limit'] = empty($request['limit']) ? 20 : $request['limit'];
        $options['order'] = $order;
        if (isset($request['order'])) {
            $options['order'] = $request['order'];
        }
        $total = $this->getCount($options);
        $meta = $this->getTotalMeta($this->getMallId(), $request);
        if (empty($total)) {
            $list = [];
        } else {
            $list = $this->queryList($options);
            foreach ($list as $key => $value) {
                $value['index'] = $key + 1;
                $value['member_string'] = "({$value['username']}){$value['nick_name']}";
                $value['regtime'] = date('Y-m-d H:i:s', $value['regtime']);
//                $meta['total_cash'] += $value['cash_money'];
//                $meta['total_can_trans_money'] += $value['can_transfer_share_money'];
//                $meta['total_share_money'] += $value['share_money'];
//                $meta['total_pop_money'] += $value['pop_money'];
                $list[$key] = $value;
            }
        }

        $data = [];
        $data['total'] = $total;
        $data['list'] = $list;
        $data['meta'] = $meta;
        return $data;
    }

    /**
     * 查看会员详情
     * @param array $request
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: modify
     * Date: 2020-06-16 20:45:54
     * Update: 2020-06-16 20:45:54
     * Version: 1.00
     */
    public function getMemberInfo($request = [])
    {
        $info = $this->getMember($request['id']);
        $data = [];
        $data['id'] = $info['id'];
        $data['username'] = $info['username'];
        $data['mobile'] = $info['mobile'];
        $data['face'] = $info['face'];
        $data['nick_name'] = $info['nick_name'];
        $data['first_recommend_member_id'] = $info['first_recommend_member_id'];
        $data['first_recommend_member_name'] = $info['first_recommend_member_name'];
        $data['first_recommend_member_nickname'] = $info['first_recommend_member_nickname'];
        $data['remark'] = $info['remark'];
        $data['regtime'] = date('Y-m-d H:i:s', $info['regtime']);
        return $data;
    }

    /**
     * 修改会员信息
     * @param array $request
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2020-06-16 21:06:29
     * Update: 2020-06-16 21:06:29
     * Version: 1.00
     */
    public function modifyMemberInfo($request = [])
    {
        $memberInfo = $this->getMember($request['id']);
        if (empty($memberInfo)) {
            return getReturn(CODE_ERROR, '无会员信息');
        }
        if (!empty($request['first_recommend_member_name'])) {
            $recommendInfo = $this->getMemberByUsername($this->getMallId(), $request['first_recommend_member_name']);
            if (empty($recommendInfo)) {
                return getReturn(CODE_ERROR, '无推荐人信息');
            }
        }
        $this->startTrans();
        $data = [];
        $data['mobile'] = $request['mobile'];
        $data['nick_name'] = $request['nick_name'];
        $data['face'] = $request['face'];
        if ($request['first_recommend_member_name'] != $memberInfo['first_recommend_member_name']) {
            if (!empty($recommendInfo)) {
                $data['first_recommend_member_id'] = $recommendInfo['id'];
                $data['first_recommend_member_name'] = $recommendInfo['username'];
                $data['first_recommend_member_nickname'] = $recommendInfo['nick_name'];
                $secondInfo = $this->getMember($recommendInfo['first_recommend_member_id']);
                if (!empty($secondInfo)) {
                    $data['second_recommend_member_id'] = $secondInfo['id'];
                    $data['second_recommend_member_name'] = $secondInfo['username'];
                    $data['second_recommend_member_nickname'] = $secondInfo['nick_name'];
                } else {
                    $data['second_recommend_member_id'] = 0;
                    $data['second_recommend_member_name'] = '';
                    $data['second_recommend_member_nickname'] = '';
                }
            } else {
                $data['first_recommend_member_id'] = 0;
                $data['first_recommend_member_name'] = '';
                $data['first_recommend_member_nickname'] = '';
                $data['second_recommend_member_id'] = 0;
                $data['second_recommend_member_name'] = '';
                $data['second_recommend_member_nickname'] = '';
            }
        }
        $data['remark'] = $request['remark'];
        $results[] = $this->where(['id' => $request['id']])->save($data);
        if ($request['first_recommend_member_name'] != $memberInfo['first_recommend_member_name']) {
            if (!empty($recommendInfo)) {
                $secondData['second_recommend_member_id'] = $recommendInfo['id'];
                $secondData['second_recommend_member_name'] = $recommendInfo['username'];
                $secondData['second_recommend_member_nickname'] = $recommendInfo['nick_name'];
            } else {
                $secondData['second_recommend_member_id'] = 0;
                $secondData['second_recommend_member_name'] = '';
                $secondData['second_recommend_member_nickname'] = '';
            }
            $results[] = $this->where(['first_recommend_member_id' => $request['id']])->save($secondData);
            $incNum = $this->where(['first_recommend_member_id' => $request['id']])->count();
            if (!empty($recommendInfo)) {
                if ($incNum > 0) {
                    if ($memberInfo['second_recommend_member_id'] != $recommendInfo['id']) {
                        $incNum += 1;
                    }
                } else {
                    if ($memberInfo['second_recommend_member_id'] != $recommendInfo['id']) {
                        $incNum = 1;
                    } else {
                        $incNum = 0;
                    }
                }
                if ($incNum > 0) {
                    $results[] = $this->where(['id' => $recommendInfo['id']])->setInc('promote_people_num', $incNum);
                }
            }
            if (!empty($secondInfo)) {
                $results[] = $this->where(['id' => $secondInfo['id']])->setInc('promote_people_num', 1);
            }
            if ($memberInfo['first_recommend_member_id'] > 0) {
                $decNum = $this->where(['first_recommend_member_id' => $request['id']])->count();
                $decNum = empty($decNum) ? 1 : ($decNum + 1);
                $results[] = $this->where(['id' => $memberInfo['first_recommend_member_id']])->setDec('promote_people_num', $decNum);
            }
            if ($memberInfo['second_recommend_member_id'] > 0 && !empty($recommendInfo)) {
                if ($memberInfo['second_recommend_member_id'] != $recommendInfo['id']) {
                    $results[] = $this->where(['id' => $memberInfo['second_recommend_member_id']])->setDec('promote_people_num', 1);
                }
            }
        }
        if ($memberInfo['nick_name'] != $request['nick_name']) {
            $options = [];
            $options['id_key'] = 'member_id';
            $options['id'] = $request['id'];
            $options['name_key'] = 'member_nickname';
            $options['name'] = $request['nick_name'];
            $options['tables'] = ['group_record', 'order', 'performance', 'trade_detail', 'withdraw'];
            $results[] = syncUpdateName($options);
        }
        if (in_array(false, $results, true)) {
            $this->rollback();
            return getReturn(CODE_ERROR);
        }
        $this->commit();
        return getReturn(CODE_SUCCESS, '修改成功');
    }

    /**
     * 根据账号获取用户信息
     * @param int $mallId
     * @param string $username
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2018-05-17 10:41:19
     * Update: 2018-05-17 10:41:19
     * Version: 1.00
     */
    public function getMemberByUsername($mallId = 0, $username = '')
    {
        $where = [];
        $where['mall_id'] = $mallId;
        $where['username'] = $username;
        return $this->queryRow([
            'field' => true,
            'where' => $where,
        ]);
    }

    /**
     * 获取会员信息
     * @param int $memberId
     * @return array
     * User: hjun
     * Date: 2018-05-04 14:27:51
     * Update: 2018-05-04 14:27:51
     * Version: 1.00
     */
    public function getMember($memberId = 0)
    {
        $where = [];
        $where['id'] = $memberId;
        return $this->queryRow([
            'field' => true,
            'where' => $where
        ]);
    }

    /**
     * 根据openid获取用户信息
     * @param string $openId
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2018-05-17 10:41:19
     * Update: 2018-05-17 10:41:19
     * Version: 1.00
     */
    public function getMemberByOpenId($openId = '')
    {
        $where = [];
        $where['wx_openid'] = $openId;
        return $this->queryRow([
            'field' => true,
            'where' => $where,
        ]);
    }

    /**
     * 获取会员手机号
     * @param int $memberId
     * @return string
     * User: hjun
     * Date: 2018-05-04 14:28:16
     * Update: 2018-05-04 14:28:16
     * Version: 1.00
     */
    public function getMobileById($memberId = 0)
    {
        $info = $this->getMember($memberId);
        return empty($info['mobile']) ? '' : $info['mobile'];
    }

    /**
     * 微信自动注册
     * @param array $userInfo
     * @param int $fId 推荐人id
     * @param int $mallId
     * @return mixed
     * User: hjun
     * Date: 2018-05-17 10:10:22
     * Update: 2018-05-17 10:10:22
     * Version: 1.00
     */
    public function registerByWx($userInfo = [], $fId = 0, $mallId = 0)
    {
        $mallInfo = D('Mall')->getMallInfo($mallId);
        $username = intval(time()) - intval(1420041600);
        $username = "vx-" . $username . rand(1000, 9999);
        $password = md5($userInfo['openid']);
        $passwordData = get_password($password);
        $addData = array();
        $addData['username'] = $username;
        $addData['wx_openid'] = $userInfo['openid'];
        $addData['password'] = $passwordData['password'];
        $addData['encrypt'] = $passwordData['encrypt'];
        $addData['regtime'] = time();
        $addData['nick_name'] = $userInfo['nickname'];
        $addData['sex'] = $userInfo['sex'];
        $addData['face'] = $userInfo['headimgurl'];
        $addData['total_lottery_num'] = $mallInfo['lottery_num'];
        $addData['last_lottery_num'] = $mallInfo['lottery_num'];
        $addData['mall_id'] = $mallId;
        //查找推荐人
        $fMember = $this->where(['id' => $fId])->find();
        if (!empty($fMember)) {
            $addData['first_recommend_member_id'] = $fMember['id'];
            $addData['first_recommend_member_name'] = $fMember['username'];
            $addData['first_recommend_member_nickname'] = $fMember['nick_name'];
            $sMember = $this->where(['id' => $fMember['first_recommend_member_id']])->find();
            if (!empty($sMember)) {
                $addData['second_recommend_member_id'] = $sMember['id'];
                $addData['second_recommend_member_name'] = $sMember['username'];
                $addData['second_recommend_member_nickname'] = $sMember['nick_name'];
            }
        }

        $this->startTrans();
        $results = [];
        $results[] = $this->add($addData);
        $id = $results[0];
        $condition_array = array();
        $condition_array['id'] = $id;
        $username = "vx-" . $id;
        $results[] = $this->where($condition_array)->save(array('username' => $username));
        if (!empty($fMember)) {
            $results[] = $this->where(['id' => $fMember['id']])->setInc('promote_people_num', 1);
        }
        if (!empty($sMember)) {
            $results[] = $this->where(['id' => $sMember['id']])->setInc('promote_people_num', 1);
        }
        if (in_array(false, $results, true)) {
            $this->rollback();
            return false;
        }
        $this->commit();
        return $id;
    }

    /**
     * 用户抽奖
     * @param int $mallId
     * @param int $memberId
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-20 15:10:15
     * Update: 2020-06-20 15:10:15
     * Version: 1.00
     */
    public function memberLottery($mallId = 0, $memberId = 0)
    {
        $member = $this->getMember($memberId);
        $tradeModel = D('TradeDetail');
        if (empty($member)) {
            return getReturn(CODE_ERROR, '无用户信息');
        }
        if ($member['last_lottery_num'] == 0) {
            return getReturn(CODE_ERROR, '抽奖次数已用完');
        }
        $mallInfo = D('Mall')->getMallInfo($mallId);
        $shareMoney = $this->randomFloat($mallInfo['lottery_money_min'], $mallInfo['lottery_money_max']);
        $shareMoney = round($shareMoney, 2);
        $data = [];
        $data['share_money'] = $member['share_money'] + $shareMoney;
        $data['total_share_money'] = $member['total_share_money'] + $shareMoney;
        $data['last_lottery_num'] = $member['last_lottery_num'] - 1;
        //添加流水
        $params = [];
        $params['mall_id'] = $mallId;
        $params['trade_no'] = '';
        $params['member_id'] = $memberId;
        $params['member_name'] = $member['username'];
        $params['member_nickname'] = $member['nick_name'];
        $params['trade_project'] = TradeDetailModel::NEW_MEMBER_REWARD;
        $params['funds_type'] = TradeDetailModel::SHARE_MONEY;
        $params['flow_type'] = TradeDetailModel::INFLOW;
        $params['money'] = $shareMoney;
        $params['result_money'] = $data['share_money'];
        $trade = $tradeModel->buildTradeData($params);
        $this->startTrans();
        $results = [];
        $results[] = $this->where(['id' => $memberId])->save($data);
        $results[] = $tradeModel->add($trade);
        if (in_array(false, $results, true)) {
            $this->rollback();
            return getReturn(CODE_ERROR);
        }
        $this->commit();
        $returnData = [];
        $returnData['share_money'] = $shareMoney;
        $returnData['last_lottery_num'] = $data['last_lottery_num'];
        return getReturn(CODE_SUCCESS, 'success', $returnData);
    }

    /**
     * 产生浮点型随机数
     * @param int $min
     * @param int $max
     * @return float
     * User: hjun
     * Date: 2020-06-20 15:23:38
     * Update: 2020-06-20 15:23:38
     * Version: 1.00
     */
    public function randomFloat($min = 0, $max = 1)
    {
        return $min + mt_rand() / mt_getrandmax() * ($max - $min);
    }

    /**
     * 余额转出
     * @param int $memberId
     * @param array $request
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-22 14:44:04
     * Update: 2020-06-22 14:44:04
     * Version: 1.00
     */
    public function popMoneyRollOut($memberId = 0, $request = [])
    {
        $mallId = $this->getMallId();
        $tradeModel = D('TradeDetail');
        $trade = [];
        $member = $this->getMember($memberId);
        if (empty($member)) {
            return getReturn(CODE_ERROR, '无会员信息');
        }
        if ($member['pop_money'] < $request['money']) {
            return getReturn(CODE_ERROR, '转出的金额不能超过当前余额');
        }
        if ($request['money'] < 10) {
            return getReturn(CODE_ERROR, '转出的金额不能低于10元');
        }
        $checkFunds = $tradeModel->validateMemberBalanceRecord($member, TradeDetailModel::POP_MONEY);
        if ($checkFunds === false) {
            return getReturn(CODE_ERROR, $tradeModel->getError());
        }$rollOutFee = round(($request['money'] * 0.98), 2);
        $handleFee = round(($request['money'] * 0.02), 2);
        $memberData = [];
        $memberData['pop_money'] = $member['pop_money'] - $request['money'];
        $memberData['cash_money'] = $member['cash_money'] + $rollOutFee;
        $rollOutSn = $this->getPopMoneySn($mallId);
        //除去手续费剩余的余额
        $rollOutResultPopMoney = $member['pop_money'] - $rollOutFee;
        //除去手续费剩余的余额在除去手续费剩余的余额
        $handleFeeResultPopMoney = $rollOutResultPopMoney - $handleFee;
        // 生成资金流水记录
        //转出流水
        $params = [];
        $params['mall_id'] = $mallId;
        $params['trade_no'] = $rollOutSn;
        $params['member_id'] = $memberId;
        $params['member_name'] = $member['username'];
        $params['member_nickname'] = $member['nick_name'];
        $params['trade_project'] = TradeDetailModel::ROLL_OUT;
        $params['funds_type'] = TradeDetailModel::POP_MONEY;
        $params['flow_type'] = TradeDetailModel::OUTFLOW;
        $params['money'] = $rollOutFee;
        $params['result_money'] = $rollOutResultPopMoney;
        $tradeData = $tradeModel->buildTradeData($params);
        $trade[] = $tradeData;
        //手续费流水
        $params['money'] = $handleFee;
        $params['trade_project'] = TradeDetailModel::TRANSFER_HANDLE_FEE;
        $params['funds_type'] = TradeDetailModel::POP_MONEY;
        $params['flow_type'] = TradeDetailModel::OUTFLOW;
        $params['result_money'] = $handleFeeResultPopMoney;
        $tradeData = $tradeModel->buildTradeData($params);
        $trade[] = $tradeData;
        //现金钱包流水
        $params['money'] = $rollOutFee;
        $params['trade_project'] = TradeDetailModel::POP_MONEY_TRANSFER;
        $params['funds_type'] = TradeDetailModel::CASH_MONEY;
        $params['flow_type'] = TradeDetailModel::INFLOW;
        $params['result_money'] = $memberData['cash_money'];
        $tradeData = $tradeModel->buildTradeData($params);
        $trade[] = $tradeData;
        $this->startTrans();
        $results[] = $this->where(['id' => $memberId])->save($memberData);
        $results[] = $tradeModel->addAll($trade);
        if (in_array(false, $results, true)) {
            $this->rollback();
            return getReturn(CODE_ERROR);
        }
        $this->commit();
        return getReturn(CODE_SUCCESS, "已成功转出{$request['money']}元到现金钱包中！");
    }

    /**
     * 获取人气红包转出编号
     * @param int $mallId
     * @return string
     * User: hjun
     * Date: 2020-06-22 14:37:05
     * Update: 2020-06-22 14:37:05
     * Version: 1.00
     */
    public function getPopMoneySn($mallId = 0)
    {
        $where = [];
        $where['is_delete'] = NOT_DELETED;
        $where['mall_id'] = $mallId;
        $where['trade_project'] = TradeDetailModel::ROLL_OUT;
        $where['funds_type'] = TradeDetailModel::POP_MONEY;
        $count = D('TradeDetail')->where($where)->count();
        $sn = $count + 1;
        $sn = str_pad($sn, 7, 0, STR_PAD_LEFT);
        return 'RQZR' . $sn;
    }

    /**
     * 豆豆转出
     * @param int $memberId
     * @param array $request
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-22 14:44:04
     * Update: 2020-06-22 14:44:04
     * Version: 1.00
     */
    public function shareMoneyRollOut($memberId = 0, $request = [])
    {
        $mallId = $this->getMallId();
        $tradeModel = D('TradeDetail');
        $trade = [];
        $member = $this->getMember($memberId);
        if (empty($member)) {
            return getReturn(CODE_ERROR, '无会员信息');
        }
        if ($member['share_money'] < $request['money']) {
            return getReturn(CODE_ERROR, '不能超过当前最大豆豆值');
        }
        if ($request['money'] <= 0) {
            return getReturn(CODE_ERROR, '请输入转出金额');
        }
        if ($member['can_transfer_share_money'] < $request['money']) {
            return getReturn(CODE_ERROR, '不能超过可转额度');
        }
        $checkFunds = $tradeModel->validateMemberBalanceRecord($member, TradeDetailModel::SHARE_MONEY);
        if ($checkFunds === false) {
            return getReturn(CODE_ERROR, $tradeModel->getError());
        }
        $memberData = [];
        $memberData['share_money'] = $member['share_money'] - $request['money'];
        $memberData['can_transfer_share_money'] = $member['can_transfer_share_money'] - $request['money'];
        $memberData['cash_money'] = $member['cash_money'] + $request['money'];
        $rollOutSn = $this->getShareMoneySn($mallId);
        // 生成资金流水记录
        $params = [];
        $params['mall_id'] = $mallId;
        $params['trade_no'] = $rollOutSn;
        $params['member_id'] = $memberId;
        $params['member_name'] = $member['username'];
        $params['member_nickname'] = $member['nick_name'];
        $params['trade_project'] = TradeDetailModel::ROLL_OUT;
        $params['funds_type'] = TradeDetailModel::SHARE_MONEY;
        $params['flow_type'] = TradeDetailModel::OUTFLOW;
        $params['money'] = $request['money'];
        $params['result_money'] = $memberData['share_money'];
        $tradeData = $tradeModel->buildTradeData($params);
        $trade[] = $tradeData;
        $params['trade_project'] = TradeDetailModel::SHARE_MONEY_TRANSFER;
        $params['funds_type'] = TradeDetailModel::CASH_MONEY;
        $params['flow_type'] = TradeDetailModel::INFLOW;
        $params['result_money'] = $memberData['cash_money'];
        $tradeData = $tradeModel->buildTradeData($params);
        $trade[] = $tradeData;
        $this->startTrans();
        $results[] = $this->where(['id' => $memberId])->save($memberData);
        $results[] = $tradeModel->addAll($trade);
        if (in_array(false, $results, true)) {
            $this->rollback();
            return getReturn(CODE_ERROR);
        }
        $this->commit();
        return getReturn(CODE_SUCCESS, "已成功转出{$request['money']}元到现金钱包中！");
    }

    /**
     * 获取分享红包转出编号
     * @param int $mallId
     * @return string
     * User: hjun
     * Date: 2020-06-22 14:37:05
     * Update: 2020-06-22 14:37:05
     * Version: 1.00
     */
    public function getShareMoneySn($mallId = 0)
    {
        $where = [];
        $where['is_delete'] = NOT_DELETED;
        $where['mall_id'] = $mallId;
        $where['trade_project'] = TradeDetailModel::ROLL_OUT;
        $where['funds_type'] = TradeDetailModel::SHARE_MONEY;
        $count = D('TradeDetail')->where($where)->count();
        $sn = $count + 1;
        $sn = str_pad($sn, 7, 0, STR_PAD_LEFT);
        return 'FXZR' . $sn;
    }

    /**
     * 用户修改昵称
     * @param int $memberId
     * @param array $request
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2020-06-23 15:03:36
     * Update: 2020-06-23 15:03:36
     * Version: 1.00
     */
    public function modifyNickname($memberId = 0, $request = [])
    {
        if (empty($request['nick_name'])) {
            return getReturn(CODE_ERROR, '昵称不能为空');
        }
        $member = $this->getMember($memberId);
        if (empty($member)) {
            return getReturn(CODE_ERROR, '无用户信息');
        }
        $this->startTrans();
        $results[] = $this->where(['id' => $memberId])->save(['nick_name' => $request['nick_name']]);
        $options = [];
        $options['id_key'] = 'member_id';
        $options['id'] = $memberId;
        $options['name_key'] = 'member_nickname';
        $options['name'] = $request['nick_name'];
        $options['tables'] = ['group_record', 'order', 'performance', 'trade_detail', 'withdraw'];
        $results[] = syncUpdateName($options);
        if (in_array(false, $results, true)) {
            $this->rollback();
            return getReturn(CODE_ERROR);
        }
        $this->commit();
        return getReturn(CODE_SUCCESS, '修改成功');
    }

    /**
     * 用户绑定手机号
     * @param int $memberId
     * @param array $request
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2020-06-23 15:03:36
     * Update: 2020-06-23 15:03:36
     * Version: 1.00
     */
    public function bindPhone($memberId = 0, $request = [])
    {
        if (empty($request['bind_mobile'])) {
            return getReturn(CODE_ERROR, '手机号码不能为空');
        }
        if (empty($request['code'])) {
            return getReturn(CODE_ERROR, '验证码不能为空');
        }
        $member = $this->getMember($memberId);
        if (empty($member)) {
            return getReturn(CODE_ERROR, '无用户信息');
        }
        $where = [];
        $where['tel'] = $request['bind_mobile'];
        $where['code'] = $request['code'];
        $identifyCodeData = M("identify_code")->where($where)->find();
        if (!empty($identifyCodeData) && (time() - $identifyCodeData['time']) < 180) {

        } else {
            return getReturn(CODE_ERROR, '验证码错误');
        }
        $this->startTrans();
        $results[] = $this->where(['id' => $memberId])->save(['mobile' => $request['bind_mobile']]);
        if (in_array(false, $results, true)) {
            $this->rollback();
            return getReturn(CODE_ERROR);
        }
        $this->commit();
        return getReturn(CODE_SUCCESS, '修改成功');
    }

    /**
     * 会员首页数据
     * @param int $mallId
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-23 16:07:06
     * Update: 2020-06-23 16:07:06
     * Version: 1.00
     */
    public function getMeta($mallId = 0)
    {
        $where = [];
        $where['mall_id'] = $mallId;
        $dayRange = getDayRange(NOW_TIME);
        $field = [
            "IFNULL(SUM(regtime BETWEEN {$dayRange['0']} and {$dayRange['1']}),0) today_register_num",
            "IFNULL(SUM(1),0) total_member_num",
            "IFNULL(SUM(share_money),0) total_share_money",
            "IFNULL(SUM(pop_money),0) total_pop_money",
            "IFNULL(SUM(cash_money),0) total_cash_money"
        ];
        $meta = $this->queryRow([
            'where' => $where,
            'field' => $field
        ]);
        return $meta;
    }

    /**
     * 获取个人团队推荐人数统计
     * @param int $mallId
     * @param int $memberId
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-29 21:32:47
     * Update: 2020-06-29 21:32:47
     * Version: 1.00
     */
    public function getPersonalTeamMeta($mallId = 0, $memberId = 0)
    {
        $where = [];
        $where['mall_id'] = $mallId;
        $field = [
            "IFNULL(SUM((first_recommend_member_id = {$memberId})),0) first_recommend_num",
            "IFNULL(SUM((second_recommend_member_id = $memberId)),0) second_recommend_num"
        ];
        $options = [];
        $options['where'] = $where;
        $options['field'] = $field;
        $result = $this->queryRow($options);
        return $result;
    }

    /**
     * 获取个人二维码
     * @param int $mallId
     * @param int $memberId
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-06-29 21:32:47
     * Update: 2020-06-29 21:32:47
     * Version: 1.00
     */
    public function getPersonalQrCode($mallId = 0, $memberId = 0)
    {
        if (MODE == 'home_dev' || MODE == 'dev') {
            $url = URL("/system/tgmall/index.php?s=/Group/groupIndex&mid={$mallId}&fid={$memberId}");
        } else {
            $url = URL("/index.php?s=/Group/groupIndex&mid={$mallId}&fid={$memberId}");
        }
        $imgStr = $this->getQRCode($url);
        return getReturn(CODE_SUCCESS, '', ['qr_code' => $imgStr]);
    }

    /**
     * 生成二维码
     * @param string $url
     * @return string ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-09-24 15:31:56
     * Update: 2019-09-24 15:31:56
     * Version: 1.00
     */
    public function getQRCode($url)
    {
        vendor('phpqrcode.phpqrcode');
        $level = 3;
        $size = 4;
        $errorCorrectionLevel = intval($level);//容错级别
        $matrixPointSize = intval($size);//生成图片大小
        //生成二维码图片
        ob_start();
        $object = new \QRcode();
        $object->png($url, false, $errorCorrectionLevel, $matrixPointSize, 2);
        $imgStr = 'data:image/png;base64,' . base64_encode(ob_get_contents());
        ob_end_clean();
        return $imgStr;
    }

    /**
     * 后台会员列表统计
     * @param int $mallId
     * @param array $request
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hdc
     * Date: 2020-07-14 10:06:09
     * Update: 2020-07-14 10:06:09
     * Version: 1.00
     */
    public function getTotalMeta($mallId = 0, $request = [])
    {
        $where = $this->getQueryWhere($request);
        $field = [
            "IFNULL(SUM(1),0) total_member_num",
            "IFNULL(SUM(can_transfer_share_money),0) total_can_trans_money",
            "IFNULL(SUM(share_money),0) total_share_money",
            "IFNULL(SUM(pop_money),0) total_pop_money",
            "IFNULL(SUM(cash_money),0) total_cash"
        ];
        $meta = $this->queryRow([
            'where' => $where,
            'field' => $field
        ]);
        return $meta;
    }
}
