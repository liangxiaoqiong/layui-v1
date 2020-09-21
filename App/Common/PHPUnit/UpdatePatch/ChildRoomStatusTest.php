<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class ChildRoomStatusTest extends BaseTest
{
    public function testChildRoomStatus()
    {
        $model = D('Room');
        $where = [];
        $where['is_merge'] = 1;
        $where['rent_status'] = 1;
        $list = $model->field('room_id,rent_status,contract_start_time,contract_end_time')->where($where)->select();
        foreach ($list as $room) {
            $where = [];
            $where['merge_pid'] = $room['room_id'];
            $data = [];
            $data['rent_status'] = $room['rent_status'];
            $data['contract_start_time'] = $room['contract_start_time'];
            $data['contract_end_time'] = $room['contract_end_time'];
            $model->where($where)->save($data);
        }
    }

    public function testUpdateFacilityName()
    {
        $roomModel = D('Room');
        $field = 'room_id,room_facility,facility_name';
        $where = [];
        $where['facility_name'] = ['neq', ''];
        $where['is_delete'] = 0;
        $roomList = $roomModel->field($field)->where($where)->select();

        $contractModel = D('Contract');
        $field = 'a.contract_id,a.facility_name,b.room_facility';
        $where = [];
        $where['a.facility_name'] = [['neq', ''], ['exp', '= b.facility_name'], 'and'];
        $where['a.is_delete'] = 0;
        $contractList = $contractModel
            ->alias('a')
            ->field($field)
            ->join([
                'LEFT JOIN __ROOM__ b ON a.room_id = b.room_id'
            ])
            ->where($where)
            ->select();

        if (!empty($roomList)) {
            foreach ($roomList as $room) {
                $facilityId = jsonDecodeToArr($room['room_facility']);
                $facilityName = jsonDecodeToArr($room['facility_name']);
                $facility = [];
                foreach ($facilityName as $key => $name) {
                    $facility[] = [
                        'facility_id' => $facilityId[$key],
                        'facility_name' => $name,
                        'runit' => '',
                        'unit_price' => '',
                        'num' => '',
                    ];
                }
                $where = [];
                $where['room_id'] = $room['room_id'];
                $data = [];
                $data['facility_name'] = jsonEncode($facility);
                $roomModel->where($where)->save($data);
            }
        }


        if (!empty($contractList)) {
            foreach ($contractList as $contract) {
                $facilityId = jsonDecodeToArr($contract['room_facility']);
                $facilityName = jsonDecodeToArr($contract['facility_name']);
                $facility = [];
                foreach ($facilityName as $key => $name) {
                    $facility[] = [
                        'facility_id' => $facilityId[$key],
                        'facility_name' => $name,
                        'runit' => '',
                        'unit_price' => '',
                        'num' => '',
                    ];
                }
                $where = [];
                $where['contract_id'] = $contract['contract_id'];
                $data = [];
                $data['facility_name'] = jsonEncode($facility);
                $contractModel->where($where)->save($data);
            }
        }
    }
}