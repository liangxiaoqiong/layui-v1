<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

use Think\Db;
use Think\Model;

class TradeDetailPatchTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 将trade_detail表补上手续费数据
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-05-31 16:57:17
     * Update: 2019-05-31 16:57:17
     * Version: 1.00
     */
    public function testHandelFeeData()
    {
        $tradeDetailModel = D('TradeDetail');
        $model = new Model();
        $updateData = [];
        $handleFeeData = [];
        $sql = "SELECT a.trade_id,a.trade_no,a.member_id,a.trade_project,a.funds_type,a.money pop_money,b.money cash_money,a.result_money,create_time,mall_id,member_name,member_nickname
from
(SELECT trade_id,trade_no,member_id,trade_project,funds_type,money,result_money,create_time,mall_id,member_name,member_nickname
 FROM `wjd_trade_detail` 
where funds_type=2 and trade_project=5) a
join
(SELECT trade_id,trade_no,member_id,trade_project,funds_type,money
 FROM `wjd_trade_detail` 
where funds_type=3 and trade_project=9) b
on a.trade_no = b.trade_no ORDER BY member_id DESC";
        $list = $model->query($sql);
        foreach ($list as $item) {
            if ($item['pop_money'] == $item['cash_money']) {
                continue;
            }
            $v = [];
            $v['trade_id'] = $item['trade_id'];
            $v['result_money'] = $item['result_money'] + round(($item['pop_money'] * 0.02), 2);
            $v['money'] = $item['cash_money'];
            $updateData[] = $v;
            $handleFee = [];
            $handleFee['mall_id'] = $item['mall_id'];
            $handleFee['trade_no'] = $item['trade_no'];
            $handleFee['member_id'] = $item['member_id'];
            $handleFee['member_name'] = $item['member_name'];
            $handleFee['member_nickname'] = $item['member_nickname'];
            $handleFee['trade_project'] = 14;
            $handleFee['funds_type'] = 2;
            $handleFee['flow_type'] = 1;
            $handleFee['money'] = $item['pop_money'] * 0.02;
            $handleFee['remark'] = "转出到现金钱包手续费，转出单号：{$item['trade_no']}";
            $handleFee['create_time'] = $item['create_time'];
            $handleFee['result_money'] = $item['result_money'];
            $handleFeeData[] = $handleFee;
        }
        $tradeDetailModel->startTrans();
        if (!empty($updateData)) {
            $updateSql = buildSaveAllSQL('wjd_trade_detail', $updateData, 'trade_id');
            $result[] = $tradeDetailModel->execute($updateSql);
        }
        if (!empty($handleFeeData)) {
            $result[] = $tradeDetailModel->addAll($handleFeeData);
        }
        if (in_array(false, $result, true)) {
            $tradeDetailModel->rollback();
            $this->assertEquals('', $tradeDetailModel->getDbError() . $tradeDetailModel->getError());
        }
        $tradeDetailModel->commit();
    }
}
