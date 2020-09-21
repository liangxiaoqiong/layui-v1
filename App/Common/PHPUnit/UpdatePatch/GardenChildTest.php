<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class GardenChildTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 涉及到的表，都补充子园区ID以及名称
     * User: hjun
     * Date: 2019-09-20 11:37:29
     * Update: 2019-09-20 11:37:29
     * Version: 1.00
     */
    public function testAddGardenChildId()
    {
        // 查询出楼宇列表
        $buildingModel = D('Building');
        $field = [
            'a.building_id', 'a.garden_child_id',
            'b.garden_child_name',
        ];
        $join = [
            "__GARDEN_CHILD__ b ON a.garden_child_id = b.garden_child_id"
        ];
        $list = $buildingModel->alias('a')->field($field)->join($join)->select();
        // 补充子园区
        // wjd_bill wjd_contract wjd_floor wjd_public_bill wjd_room wjd_trade_detail
        $tables = [
            'wjd_building',
            'wjd_bill',
            'wjd_contract',
            'wjd_floor',
            'wjd_public_bill',
            'wjd_room',
            'wjd_trade_detail',
        ];
        foreach ($tables as $table) {
            $dataList = $list;
            switch ($table) {
                case 'wjd_floor':
                case 'wjd_public_bill':
                    $dataList = array_map(function ($item) {
                        unset($item['garden_child_name']);
                        return $item;
                    }, $dataList);
                    break;
                default:
                    break;
            }
            $sql = buildSaveAllSQL($table, $dataList, 'building_id');
            $result = $buildingModel->execute($sql);
            if (false === $result) {
                $this->assertTrue(false);
            }
        }

        // 查询房间、楼宇、子园区
        $roomModel = D('Room');
        $field = [
            'a.room_id', 'a.building_id', 'a.garden_child_id',
        ];
        $list = $roomModel->alias('a')->field($field)->select();
        // 补充楼宇以及子园区
        // wjd_customer wjd_door_lock wjd_parking_car wjd_power_meter wjd_service_apply
        $tables = [
            'wjd_customer',
            'wjd_door_lock',
            'wjd_parking_car',
            'wjd_power_meter',
            'wjd_service_apply',
        ];
        foreach ($tables as $table) {
            $dataList = $list;
            $sql = buildSaveAllSQL($table, $dataList, 'room_id');
            $result = $roomModel->execute($sql);
            if (false === $result) {
                $this->assertTrue(false);
            }
        }
    }
}