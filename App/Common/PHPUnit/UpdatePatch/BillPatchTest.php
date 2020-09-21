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

class BillPatchTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 将bill表和tradeDetail表contract_id为0的补上
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-05-31 16:57:17
     * Update: 2019-05-31 16:57:17
     * Version: 1.00
     */
    public function testBillData()
    {
        // 1. 把主房间的合同ID查出来  这句sql我先在mysql测试过了，
        //  会存在某些账单仍然没有合同ID，因为主房间可能已经退租了
        $billModel = D('Bill');
        $field = [
            'a.bill_id',
            'c.contract_id'
        ];
        $join = [
            "__ROOM__ b ON a.room_id = b.room_id",
            "__ROOM__ c ON b.merge_pid = c.room_id"
        ];
        $where = [];
        $where['a.contract_id'] = 0;
        $options = [];
        $options['alias'] = 'a';
        $options['field'] = $field;
        $options['join'] = $join;
        $options['where'] = $where;
        $options['cache'] = false;
        $list = $billModel->queryList($options);
        if (empty($list)) {
            $this->assertTrue(true);
            return;
        }
        $sql = buildSaveAllSQL("wjd_bill", $list, 'bill_id');
        $result = $billModel->execute($sql);
        $this->assertEquals('', $billModel->getDbError() . $billModel->getError());

        // 2. 再次查询一遍，这次多联个合同表，即可查出主房间退租前的合同ID
        $billModel = D('Bill');
        $field = [
            'a.bill_id',
            'd.contract_id'
        ];
        $join = [
            "__ROOM__ b ON a.room_id = b.room_id",
            "__ROOM__ c ON b.merge_pid = c.room_id AND c.contract_id = 0",
            "__CONTRACT__ d ON c.room_id = d.room_id",
        ];
        $where = [];
        $where['a.contract_id'] = 0;
        $options = [];
        $options['alias'] = 'a';
        $options['field'] = $field;
        $options['join'] = $join;
        $options['where'] = $where;
        $options['cache'] = false;
        $list = $billModel->queryList($options);
        $sql = buildSaveAllSQL("wjd_bill", $list, 'bill_id');
        $result = $billModel->execute($sql);
        $this->assertEquals('', $billModel->getDbError() . $billModel->getError());

        // 3. tradeDetail表补合同ID直接查bill表即可，因为上面2步已经把bill表的合同ID补完了
        $tradeModel = D('TradeDetail');
        $field = [
            'a.trade_id',
            'b.contract_id',
        ];
        $join = [
            "__BILL__  b ON a.bill_id = b.bill_id"
        ];
        $where = [];
        $where['a.contract_id'] = 0;
        $options = [];
        $options['alias'] = 'a';
        $options['field'] = $field;
        $options['join'] = $join;
        $options['where'] = $where;
        $list = $tradeModel->queryList($options);
        $sql = buildSaveAllSQL('wjd_trade_detail', $list, 'trade_id');
        $tradeModel->execute($sql);
        $this->assertEquals('', $billModel->getDbError() . $billModel->getError());
    }
}
