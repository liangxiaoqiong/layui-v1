<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class ReduceTest extends \Common\PHPUnit\BaseTest
{
    /**
     * trade_detail表补充账单的应收时间
     * User: hjun
     * Date: 2019-12-12 10:22:31
     * Update: 2019-12-12 10:22:31
     * Version: 1.00
     */
    public function test1()
    {
        $model = D('TradeDetail');
        $field = [
            'a.trade_id', 'b.ought_pay_time'
        ];
        $join = [
            "__BILL__ b ON a.bill_id = b.bill_id"
        ];
        $page = 1;
        $limit = 100;
        $options = [];
        $options['alias'] = 'a';
        $options['field'] = $field;
        $options['join'] = $join;
        $total = $model->getCount($options);
        if (empty($total)) {
            $this->assertTrue(true);
            return true;
        }
        $count = ceil($total / $limit);
        do {
            $options['page'] = $page;
            $options['limit'] = $limit;
            $updateList = $model->queryList($options);
            if (!empty($updateList)) {
                $sql = buildSaveAllSQL('wjd_trade_detail', $updateList, 'trade_id');
                $model->execute($sql);
            }
            $page++;
        } while ($page <= $count);
    }
}
