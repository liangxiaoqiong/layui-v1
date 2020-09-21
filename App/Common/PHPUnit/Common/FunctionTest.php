<?php

namespace Common\PHPUnit\Model;

use Common\Model\BillModel;
use Common\Model\ContractModel;
use Common\PHPUnit\BaseTest;
use Common\Util\JwtUtil;
use Think\Log;
use Org\Util\Rbac;

class FunctionTest extends BaseTest
{
    public function provider()
    {
        return [['provider1']];
    }

    public function testProducerFirst()
    {
        $this->assertTrue(true);
        return 'first';
    }

    public function testProducerSecond()
    {
        $this->assertTrue(true);
        return 'second';
    }

    /**
     * @depends      testProducerFirst
     * @depends      testProducerSecond
     * @dataProvider provider
     */
    public function testConsumer()
    {
        $this->assertEquals(
            ['provider1', 'first', 'second'],
            func_get_args()
        );
    }

    public function testRoomGetMeta()
    {
        $model = D('Room');
        $meta = $model->getMeta(74);
        $this->assertArrayHasKey('empty_room_num', $meta);
    }

    public function testRegex()
    {
        $price = '2014-31-21';
        $model = M('');
        $rule = '//';
        $result = $model->regex($price, $rule);
    }

    public function testJsonSchema()
    {
        session('ADMIN.garden_id', 83);
        $bill = D('Bill')->find(4303);
        $data = D('BillTpl')->getTplParamsValue($bill);
        $feeItems = [];
        $item = [];
        $item['item_id'] = '123';
        $item['item_name'] = '123';
        $item['fee_type'] = '1';
        $item['fee'] = '123';
        $item['is_meter_type'] = '1';
        $item['unit_price'] = '1';
        $item['unit'] = '1';
        $item['runit'] = '1';
        $item['time'] = '2018-02-01';
        $item['current'] = '0';
        $item['last_time'] = '2018-02-01';
        $item['last_current'] = '0';
        $feeItems[] = $item;
        $schema = getDefaultData('json/contract/fee_items_meter_type_schema');
        $validate = new \JsonSchema\Validator();
        $validate->check($feeItems, $schema);
        if (!$validate->isValid()) {
            $errors = $validate->getErrors();
            $message = "{$errors[0]['property']}:{$errors[0]['message']}";
            return getReturn(CODE_ERROR, $message);
        }
        return getReturn(CODE_SUCCESS);
    }

    public function testBuildMeta()
    {
        session('ADMIN.garden_id', 83);
        $data = D('OperationalMetaDay')->buildMetaByTime();
    }

    public function testProcedure()
    {
        $model = M('');
        $timeRange = getDayRange();
        $result = $model->query("CALL get_room_meta({$timeRange[0]}, {$timeRange[1]})");
    }

    public function testMeta()
    {
        $gardenModel = D('Garden');
        $dayModel = D('OperationalMetaDay');
        $monthModel = D('OperationalMetaMonth');

        $minTime = NOW_TIME;
        $gardenList = $gardenModel->field('garden_id,create_time')->select();
        foreach ($gardenList as $garden) {
            if ($garden['create_time'] < $minTime) {
                $minTime = $garden['create_time'];
            }
        }

        $dayTables = [];
        $monthTables = [];
        do {
            $day = $dayModel->buildMetaByTime($minTime, $gardenList);
            $minTime += 3600 * 24;
            $range = getDayRange($minTime);
            foreach ($day as $value) {
                $dayTables[] = $value;
            }
            // 判断今天是否是本月最后一天 如果是 则还要统计月数据
            $mdays = date('t', $minTime);
            $day = date('d', $minTime);
            if ($mdays === $day) {
                $month = $monthModel->buildMetaByTime($minTime, $gardenList);
                foreach ($month as $value) {
                    $monthTables[] = $value;
                }
            }
        } while ($range[1] < NOW_TIME);
        if (!empty($dayTables)) {
//            $dayModel->addAll($dayTables);
        }
        if (!empty($monthTables)) {
//            $monthModel->addAll($monthTables);
        }
        return;
    }

    public function testMetaUpdate()
    {
        ini_set('memory_limit', '1024M');
        $date = [21, 22, 23, 24, 25, 26, 27, 28];
        foreach ($date as $day) {
            $meta = F("meta_backup/201903/{$day}", '', ROOT_PATH);
            $room = $meta['room'];
        }
    }

    public function testRoom()
    {
        $contract = D('Contract');
        $room = D('Room');
        $field = [
            'a.contract_id',
            'a.contract_status',
            'a.process_status',
            'a.room_id',
            'b.room_id',
            'b.rent_status',
        ];
        $field = implode(',', $field);
        $join = [
            '__ROOM__ b ON a.room_id = b.room_id'
        ];
        $where = [];
        $where['a.is_delete'] = 0;
        $where['a.contract_status'] = 2;
        $where['b.contract_id'] = 0;
        $where['b.merge_pid'] = 0;
        $options = [];
        $options['alias'] = 'a';
        $options['field'] = $field;
        $options['join'] = $join;
        $options['where'] = $where;
        $options['cache'] = false;
        $list = $contract->queryList($options);
        foreach ($list as $value) {
            if (!$room->isRented($value)) {
                $data = [];
                $data['contract_id'] = $value['contract_id'];
                $data['contract_status'] = $value['contract_status'];
                $data['process_status'] = $value['process_status'];
                $where = [];
                $where['room_id'] = $value['room_id'];
                $room->where($where)->save($data);
            }
        }
    }

    public function testGetAccess()
    {
        $result = getTotalFeeByStartAndEnd(strtotime('2019-03-30'), strtotime('2019-03-30'), 100);

        $result = getDayRange();
        $result = Rbac::getAccessList(99);
    }

    public function testTpl()
    {
        $result = D('ContractTpl')->getContractTplParams();
    }

    public function testPackage()
    {
        $result = D('Package')->getData(['package_id' => 1]);
    }

    public function testGetToken()
    {
        $token = JwtUtil::getInstance()->encode(103);
    }

    public function testAloneBill()
    {
        $contract = D('Contract')->find(616);
        $bills = buildBills($contract['garden_id'], $contract['contract_id'], $contract, ContractModel::ACTION_CONFIRM);
        foreach ($bills as $key => $value) {
            $value['start_time_text'] = date('Y-m-d', $value['start_time']);
            $value['end_time_text'] = date('Y-m-d', $value['end_time']);
            $bills[$key] = $value;
        }
        $a = 1;
    }
}