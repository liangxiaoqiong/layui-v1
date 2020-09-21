<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class BillItemsTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 将账单分离
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-05-31 16:57:17
     * Update: 2019-05-31 16:57:17
     * Version: 1.00
     */
    public function testBillItems()
    {
        $model = D('Bill');
        $bills = $model->select();
        $dataList = [];
        $updateList = [];
        foreach ($bills as $bill) {
            $feeItems = jsonDecodeToArr($bill['fee_items']);
            if (count($feeItems) === 1) {
                // 只有一个项目 则只需要补充 item_id 和 fee_type即可
                $item = [];
                $item['bill_id'] = $bill['bill_id'];
                $item['item_id'] = $feeItems[0]['item_id'];
                $item['fee_type'] = $feeItems[0]['fee_type'];
                $item['fee_items'] = $bill['fee_items'];
                $item['total_fee'] = $bill['total_fee'];
                $item['old_sn'] = $bill['bill_sn'];
                $updateList[] = $item;
            } else {
                $oldSn = $bill['bill_sn'];
                $prefix = explode('T', $oldSn);
                $prefix = $prefix[0];
                foreach ($feeItems as $index => $feeItem) {
                    if ($index === 0) {
                        // 第一个做更新
                        $item = [];
                        $item['bill_id'] = $bill['bill_id'];
                        $item['item_id'] = $feeItem['item_id'];
                        $item['fee_type'] = $feeItem['fee_type'];
                        $item['fee_items'] = jsonEncode([$feeItem]);
                        $item['total_fee'] = getTotalFeeByItems([$feeItem]);
                        $item['old_sn'] = $bill['bill_sn'];
                        $updateList[] = $item;
                    } else {
                        $item = $bill;
                        unset($item['bill_id']);
                        // 其余做新增
                        if ($bill['pay_status'] == 1) {
                            // 已收 编号不变
                            $item['bill_sn'] = $bill['bill_sn'];
                        } else {
                            // 未收，编号用新的
                            $item['bill_sn'] = getRandSnByPrefix("{$prefix}T");
                        }
                        $item['old_sn'] = $oldSn;
                        $item['item_id'] = $feeItem['item_id'];
                        $item['item_id'] = $feeItem['item_id'];
                        $item['fee_type'] = $feeItem['fee_type'];
                        $item['fee_items'] = jsonEncode([$feeItem]);
                        $item['total_fee'] = getTotalFeeByItems([$feeItem]);
                        $dataList[] = $item;
                    }
                }
            }
        }
        // 检查
        foreach ($updateList as $value) {
            $feeItems = jsonDecodeToArr($value['fee_items']);
            if (count($feeItems) > 1) {
                exit(jsonEncode($value));
            }
            if ($value['item_id'] != $feeItems[0]['item_id']) {
                exit(jsonEncode($value));
            }
            if ($value['fee_type'] != $feeItems[0]['fee_type']) {
                exit(jsonEncode($value));
            }
            if ($value['total_fee'] != getTotalFeeByItems($feeItems)) {
                exit(jsonEncode($value));
            }
        }
        $payList = [];
        foreach ($dataList as $value) {
            $feeItems = jsonDecodeToArr($value['fee_items']);
            if (count($feeItems) > 1) {
                exit(jsonEncode($value));
            }
            if ($value['item_id'] != $feeItems[0]['item_id']) {
                exit(jsonEncode($value));
            }
            if ($value['fee_type'] != $feeItems[0]['fee_type']) {
                exit(jsonEncode($value));
            }
            if ($value['total_fee'] != getTotalFeeByItems($feeItems)) {
                exit(jsonEncode($value));
            }
            $prefix = explode('T', $value['bill_sn'])[0];
            $oldPrefix = explode('T', $value['old_sn'])[0];
            if ($prefix != $oldPrefix) {
                exit(jsonEncode($value));
            }
            if ($value['pay_status'] == 1) {
                $payList[] = $value;
            }
        }

        $u = 0; // updateList 索引
        $d = 0; // dataList 索引
        foreach ($bills as $index => $bill) {
            $feeItems = jsonDecodeToArr($bill['fee_items']);
            $length = count($feeItems);
            if ($length === 1) {
                if ($bill['bill_sn'] != $updateList[$u]['old_sn']) {
                    exit(($u) . 'u');
                }
                $u++;
            } else {
                foreach ($feeItems as $ind => $feeItem) {
                    if ($ind === 0) {
                        if ($bill['bill_sn'] != $updateList[$u]['old_sn']) {
                            exit(($u) . 'u2');
                        }
                        $u++;
                    } else {
                        if ($bill['bill_sn'] != $dataList[$d]['old_sn']) {
                            exit(($d) . 'd1');
                        }
                        $d++;
                    }
                }
            }
        }
        // 过滤字段
        foreach ($updateList as $key => $value) {
            $updateList[$key] = $model->_facade($value);
        }
        $updateSql = buildSaveAllSQL('wjd_bill', $updateList, 'bill_id');
        $model->startTrans();
        try {
            $result1 = $model->addAll($dataList);
            if (false === $result1) {
                $model->rollback();
                exit($model->getDbError());
            }
            $result2 = $model->execute($updateSql);
            if (false === $result2) {
                $model->rollback();
                exit($model->getDbError());
            }
            $model->commit();
            exit(count($bills) . ' - ' . count($dataList) . ' - ' . count($updateList) . " - {$result1} - {$result2}");
        } catch (\Exception $e) {
            $model->rollback();
            exit($e->getMessage());
        }
    }
}