<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class BillCollectTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 账单的待支付金额 和 未支付金额都补上
     * User: hjun
     * Date: 2019-11-08 16:17:10
     * Update: 2019-11-08 16:17:10
     * Version: 1.00
     */
    public function test1()
    {
        // 设置已支付金额
        $billModel = D('Bill');
        $where = [];
        $where['pay_status'] = 1;
        $data = [];
        $data['payed_fee'] = ['exp', 'ABS(total_fee)'];
        $data['has_pay'] = 1;
        $result = $billModel->where($where)->save($data);
        $this->assertEquals('', $billModel->getDbError() . $billModel->getError());
        // 设置未支付的金额
        $where = [];
        $where['pay_status'] = 0;
        $data = [];
        $data['wait_pay_fee'] = ['exp', 'ABS(total_fee)'];
        $result = $billModel->where($where)->save($data);
        $this->assertEquals('', $billModel->getDbError() . $billModel->getError());
    }

    /**
     * 已经产生的在线支付账单做下处理
     * User: hjun
     * Date: 2019-11-10 14:22:30
     * Update: 2019-11-10 14:22:30
     * Version: 1.00
     */
    public function test2()
    {
        // 查出已经支付的
        $tradeModel = D('BillTrade');
        $field = [
            'a.merOrderId trade_no', 'a.create_time pay_time', 'a.current_name operator_name',
            'b.bill_id', 'b.total_fee', 'b.has_pay', 'b.wait_pay_fee',
            'SUM(a.money) payed_fee',
        ];
        $join = [
            '__BILL__ b ON a.bill_id = b.bill_id',
        ];
        $where = [];
        $where['a.order_state'] = 1;
        $where['b.pay_status'] = 0;
        $group = 'a.bill_id';
        $options = [];
        $options['alias'] = 'a';
        $options['field'] = $field;
        $options['join'] = $join;
        $options['where'] = $where;
        $options['group'] = $group;
        $options['cache'] = false;
        $list = $tradeModel->queryList($options);
    }
}
