<?php
/**
 * 福租租1.10版本升级补丁
 */

namespace Common\PHPUnit\UpdatePatch;

class UpdateTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 抄表费用增加一张表记录， 需要把合同里的旧数据移植到表里
     * User: hjun
     * Date: 2019-09-25 10:06:46
     * Update: 2019-09-25 10:06:46
     * Version: 1.00
     */
    public function test1()
    {
        $contractModel = D('Contract');
        $meterFessModel = M('contract_meter_fees');
        $contractModel->startTrans();
        try {
            $field = [
                'garden_id', 'garden_child_id', 'contract_id',
                'meter_fees',
            ];
            $where = [];
            $where['meter_fees'] = ['neq', ''];
            // 1次处理1000条，分批处理
            $page = 1;
            $limit = 1000;
            $total = $contractModel->where($where)->count();
            if (empty($total)) {
                $this->assertTrue(true);
                return true;
            }
            // 先把数据都清空
            $meterFessModel->where('1=1')->delete();
            $totalPage = ceil($total / $limit);
            do {
                $list = $contractModel->field($field)->where($where)->page($page)->limit($limit)->select();
                $dataList = [];
                foreach ($list as $key => $value) {
                    $meterFees = jsonDecodeToArr($value['meter_fees']);
                    unset($value['meter_fees']);
                    foreach ($meterFees as $meterFee) {
                        switch ($meterFee['item_id']) {
                            case METER_FEE_POWER:
                                $value['name'] = '普通电表';
                                $value['type'] = 2;
                                break;
                            case METER_FEE_POWER_2:
                                $value['name'] = '复费率电表';
                                $value['type'] = 2;
                                break;
                            default:
                                $value['name'] = '水表';
                                $value['type'] = 1;
                                break;
                        }
                        $value = array_merge($value, $meterFee);
                        $dataList[] = $value;
                    }
                }
                $result = $meterFessModel->addAll($dataList);
                if (false === $result) {
                    $this->assertEquals('', $meterFessModel->getDbError() . $meterFessModel->getError());
                    $contractModel->rollback();
                    return false;
                }
                $page++;
            } while ($page <= $totalPage);
            $contractModel->commit();
            $this->assertTrue(true);
        } catch (\Exception $e) {
            $contractModel->rollback();
            $this->assertEquals('', $e->getMessage());
        }
    }

    /**
     * 合同表补充name等字段
     * User: hjun
     * Date: 2019-09-26 15:09:08
     * Update: 2019-09-26 15:09:08
     * Version: 1.00
     */
    public function test2()
    {
        $contractModel = D('Contract');
        $contractModel->startTrans();
        try {
            $field = [
                'contract_id', 'meter_fees',
            ];
            $where = [];
            $where['meter_fees'] = [['neq', ''], ['notlike', "%\"name\"%"], 'and'];
            // 1次处理1000条，分批处理
            $page = 1;
            $limit = 1000;
            $total = $contractModel->where($where)->count();
            if (empty($total)) {
                $this->assertTrue(true);
                return true;
            }
            $totalPage = ceil($total / $limit);
            do {
                $list = $contractModel->field($field)->where($where)->page($page)->limit($limit)->select();
                foreach ($list as $key => $value) {
                    $meterFees = jsonDecodeToArr($value['meter_fees']);
                    foreach ($meterFees as $k => $meterFee) {
                        if (!isset($meterFee['name'])) {
                            $meterFee['name'] = getMeterNameByItemId($meterFee['item_id']);
                        }
                        $meterFees[$k] = $meterFee;
                    }
                    $value['meter_fees'] = jsonEncode($meterFees);
                    $list[$key] = $value;
                }
                $sql = buildSaveAllSQL('wjd_contract', $list, 'contract_id');
                $result = $contractModel->execute($sql);
                if (false === $result) {
                    $this->assertEquals('', $contractModel->getDbError() . $contractModel->getError());
                    $contractModel->rollback();
                    return false;
                }
                $page++;
            } while ($page <= $totalPage);
            $contractModel->commit();
            $this->assertTrue(true);
        } catch (\Exception $e) {
            $contractModel->rollback();
            $this->assertEquals('', $e->getMessage());
        }
    }

    /**
     * 迁移成功后 抄表账单的fee_items字段把ID补充进去
     * @depends test1
     * User: hjun
     * Date: 2019-09-25 10:07:16
     * Update: 2019-09-25 10:07:16
     * Version: 1.00
     */
    public function test3()
    {

        $billModel = D('Bill');
        $meterFessModel = M('contract_meter_fees');
        $billModel->startTrans();
        try {
            $field = [
                'a.bill_id', 'a.fee_items', 'b.id',
            ];
            $join = [
                "__CONTRACT_METER_FEES__ b ON a.contract_id = b.contract_id AND a.item_id = b.item_id",
            ];
            $where = [];
            $where['a.bill_type'] = ['in', [$billModel::TYPE_READING_METER_WATER, $billModel::TYPE_READING_METER_POWER]];
            // 1次处理1000条，分批处理
            $page = 1;
            $limit = 1000;
            $total = $billModel->alias('a')->join($join)->where($where)->count();
            if (empty($total)) {
                $this->assertTrue(true);
                return true;
            }
            $totalPage = ceil($total / $limit);
            do {
                $list = $billModel->alias('a')->field($field)->join($join)->where($where)->page($page)->limit($limit)->select();
                foreach ($list as $key => $value) {
                    $feeItems = jsonDecodeToArr($value['fee_items']);
                    $feeItems[0]['id'] = $value['id'];
                    $value['fee_items'] = jsonEncode($feeItems);
                    $value['read_meter_id'] = $value['id'];
                    unset($value['id']);
                    $list[$key] = $value;
                }
                $sql = buildSaveAllSQL('wjd_bill', $list, 'bill_id');
                $result = $billModel->execute($sql);
                if (false === $result) {
                    $this->assertEquals('', $meterFessModel->getDbError() . $meterFessModel->getError());
                    $billModel->rollback();
                    return false;
                }
                $page++;
            } while ($page <= $totalPage);
            $billModel->commit();
            $this->assertTrue(true);
        } catch (\Exception $e) {
            $billModel->rollback();
            $this->assertEquals('', $e->getMessage());
        }
    }
}