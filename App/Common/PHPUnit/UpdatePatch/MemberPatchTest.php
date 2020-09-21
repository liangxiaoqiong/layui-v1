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

class MemberPatchTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 将vx-139钱包纠正
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-05-31 16:57:17
     * Update: 2019-05-31 16:57:17
     * Version: 1.00
     */
    public function testCashMoneyData()
    {
        $tradeDetailModel = D('TradeDetail');
        $memberModel = D('Member');
        $model = new Model();
        $where = [];
        $where['member_id'] = 139;
        $where['is_delete'] = NOT_DELETED;
        $where['funds_type'] = 3;
        $where['trade_id'] = ['egt', 11363];
        $data = [];
        $list = $tradeDetailModel->where($where)->select();
        foreach ($list as $item) {
            $v = [];
            $v['trade_id'] = $item['trade_id'];
            $v['result_money'] = $item['result_money'] - 56;
            $data[] = $v;
        }
        $tradeDetailModel->startTrans();
        if (!empty($data)) {
            $updateSql = buildSaveAllSQL('wjd_trade_detail', $data, 'trade_id');
            $result[] = $tradeDetailModel->execute($updateSql);
        }
        $result[] = M('member')->where(['id' => 139])->setDec('cash_money', 56);
        if (in_array(false, $result, true)) {
            $tradeDetailModel->rollback();
            $this->assertEquals('', $tradeDetailModel->getDbError() . $tradeDetailModel->getError());
        }
        $tradeDetailModel->commit();
    }
}
