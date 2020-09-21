<?php

namespace Common\PHPUnit\Contract;

use Common\Model\ContractModel;

class ContractTest extends BaseTest
{
    /**
     * @var ContractModel
     */
    private $model;

    public function setUp()
    {
        parent::setUp();
        date_default_timezone_set('Asia/Shanghai');
        $this->model = D('Contract');
        $this->model->setGardenId(74);
    }

    /**
     * 测试根据合同操作获取字段
     * User: hjun
     * Date: 2018-08-21 17:37:36
     * Update: 2018-08-21 17:37:36
     * Version: 1.00
     */
    public function testGetFields()
    {
        $model = $this->model;
        $baseFields = [
            'customer_name', 'customer_mobile', 'leader_name',
            'reminder_mobile', 'customer_address', 'customer_email',
            'customer_id_type', 'customer_id_number', 'customer_id_pictures',
            'contract_pictures', 'remark',
            'tpl_id', 'contract_content', 'content_url'
        ];
        $reletAndNoPayFields = [
            'room_area', 'rent_type', 'property_type',
            'segments_info', 'property_info',
            'deposit_num', 'deposit',
            'rent_first_end_time', 'property_first_end_time',
            'pay_type', 'pay_period',
            'collect_rental_type', 'advanced_days', 'fixed_pay_date',
            'land_usage', 'room_function', 'create_time',
            'charging_info',
            'month_rental', 'month_property', 'end_time',
            'contract_sn',
            'facility_name', 'room_desc',
        ];
        $reletFields = [];
        $noPayFields = [
            'start_time'
        ];

        $fields = $model->getFieldsByAction($model::ACTION_ADD);
        $this->assertEquals([], $fields);

        $fields = $model->getFieldsByAction($model::ACTION_NO_CONFIRM_UPDATE);
        $this->assertEquals(array_merge(array_merge($baseFields, $reletAndNoPayFields), $noPayFields), $fields);

        $fields = $model->getFieldsByAction($model::ACTION_RELET);
        $this->assertEquals(array_merge(array_merge($baseFields, $reletAndNoPayFields), $reletFields), $fields);

        $fields = $model->getFieldsByAction($model::ACTION_CONFIRMED_UPDATE);
        $this->assertEquals($baseFields, $fields);
    }


    public function canSignContractProvider()
    {
        return $this->getTestData('canSignContract');
    }

    /**
     * 测试判断房间是否可以出租的函数
     * @dataProvider canSignContractProvider
     * User: hjun
     * Date: 2018-08-22 16:23:32
     * Update: 2018-08-22 16:23:32
     * Version: 1.00
     */
    public function testCanSignContract($result, $roomId)
    {
        $this->assertEquals($result, $this->model->canSignContract($roomId));
    }

    public function checkSignSegmentsInfoProvider()
    {
        $datas = $this->getTestData('segments_info');
        return $datas;
    }

    /**
     *
     * @param string $error
     * @param array $segment
     * @dataProvider checkSignSegmentsInfoProvider
     * User: hjun
     * Date: 2018-08-22 16:55:45
     * Update: 2018-08-22 16:55:45
     * Version: 1.00
     */
    public function testCheckSignSegmentsInfo($error, $segment)
    {
        $result = $this->model->checkSignSegmentsInfo($segment);
        $this->assertEquals($error, $this->model->getSegmentsError());
        if (empty($error)) {
            $this->assertTrue($result);
        } else {
            $this->assertFalse($result);
        }
    }

    public function checkSignPropertyInfoProvider()
    {
        return $this->getTestData('property_info');
    }

    /**
     * 测试物业分段检测
     * @dataProvider checkSignPropertyInfoProvider
     * @param $error
     * @param $data
     * User: hjun
     * Date: 2018-08-22 17:33:09
     * Update: 2018-08-22 17:33:09
     * Version: 1.00
     */
    public function testCheckSignPropertyInfo($error, $data)
    {
        $result = $this->model->checkSignPropertyInfo($data['property'], $data['segments']);
        $this->assertEquals($error, $this->model->getPropertyError());
        if (empty($error)) {
            $this->assertTrue($result);
        } else {
            $this->assertFalse($result);
        }
    }


    public function checkChargingProvider()
    {
        return $this->getTestData('charging_info');
    }

    /**
     * 测试杂费检查
     * @dataProvider checkChargingProvider
     * @param $result
     * @param $error
     * @param $data
     * User: hjun
     * Date: 2018-08-22 17:13:14
     * Update: 2018-08-22 17:13:14
     * Version: 1.00
     */
    public function testCheckCharging($result, $error, $data)
    {
        $this->assertEquals($result, $this->model->checkCharging($data));
        $this->assertEquals($error, $this->model->getChargingError());
    }

    public function checkFirstEndTimeProvider()
    {
        return $this->getTestData('firstEndTime');
    }

    /**
     * 检查首期截止时间
     * @dataProvider checkFirstEndTimeProvider
     * @param $result
     * @param $data
     * User: hjun
     * Date: 2018-08-22 17:17:39
     * Update: 2018-08-22 17:17:39
     * Version: 1.00
     */
    public function testCheckFirstEndTime($result, $data)
    {
        $this->assertEquals($result, $this->model->checkFirstEndTime($data['end_time'], $data['segments']));
    }

    public function checkContractTplProvider()
    {
        return $this->getTestData('contractTpl');
    }

    /**
     * @dataProvider checkContractTplProvider
     * @param $result
     * @param $tplId
     * User: hjun
     * Date: 2018-08-22 17:48:25
     * Update: 2018-08-22 17:48:25
     * Version: 1.00
     */
    public function testCheckContractTplProvider($result, $tplId)
    {
        if ($result) {
            $this->assertTrue($this->model->checkContractTpl($tplId));
        } else {
            $this->assertFalse($this->model->checkContractTpl($tplId));
        }
    }

    public function buildSegmentsProvider()
    {
        return $this->getTestData('buildSegments');
    }

    /**
     * 测试生成租金分段
     * @dataProvider buildSegmentsProvider
     * @param $segments
     * @param $options
     * @param $result
     * User: hjun
     * Date: 2018-08-22 23:00:47
     * Update: 2018-08-22 23:00:47
     * Version: 1.00
     */
    public function testBuildSegments($segments, $options, $result)
    {
        $data = buildSegments($segments, 'rent', $options);
        foreach ($result as &$segment) {
            $segment['create_time'] = NOW_TIME;
        }
        $this->assertEquals($result, $data);
    }

    public function buildPropertyProvider()
    {
        return $this->getTestData('buildProperty');
    }

    /**
     * 测试生成物业分段
     * @dataProvider buildPropertyProvider
     * @param $segments
     * @param $options
     * @param $result
     * User: hjun
     * Date: 2018-08-22 23:00:47
     * Update: 2018-08-22 23:00:47
     * Version: 1.00
     */
    public function testBuildProperty($segments, $options, $result)
    {
        $data = buildSegments($segments, 'property', $options);
        foreach ($result as &$segment) {
            $segment['create_time'] = NOW_TIME;
        }
        $this->assertEquals($result, $data);
    }

    public function getNewSegmentsByFirstEndTimeProvider()
    {
        return $this->getTestData('getNewSegmentsByFirstEndTime');
    }

    /**
     * @dataProvider getNewSegmentsByFirstEndTimeProvider
     * @param array $segments
     * @param string $endTime
     * @param $newSegments
     * User: hjun
     * Date: 2018-08-23 16:35:47
     * Update: 2018-08-23 16:35:47
     * Version: 1.00
     */
    public function testGetNewSegmentsByFirstEndTime($segments = [], $endTime = '', $newSegments)
    {
        $endTime = strtotime($endTime);
        foreach ($segments as &$segment1) {
            $segment1['start_time'] = strtotime($segment1['start_time']);
            $segment1['end_time'] = strtotime($segment1['end_time']);
        }
        foreach ($newSegments as &$segment2) {
            $segment2['start_time'] = strtotime($segment2['start_time']);
            $segment2['end_time'] = strtotime($segment2['end_time']);
        }
        $result = sliceSegmentsByTime($segments, $endTime);
        $this->assertEquals($newSegments, $result);
    }

    public function getFirstAndRestSegmentsByFirstEndTimeProvider()
    {
        return $this->getTestData('testGetFirstAndRestSegmentsByFirstEndTime');
    }

    /**
     * @dataProvider getFirstAndRestSegmentsByFirstEndTimeProvider
     * @param array $segments
     * @param string $endTime
     * @param array $res
     * User: hjun
     * Date: 2018-08-24 09:54:22
     * Update: 2018-08-24 09:54:22
     * Version: 1.00
     */
    public function testGetFirstAndRestSegmentsByFirstEndTime($segments = [], $endTime = '', $res = [])
    {
        $endTime = strtotime($endTime);
        foreach ($segments as &$segment1) {
            $segment1['start_time'] = strtotime($segment1['start_time']);
            $segment1['end_time'] = strtotime($segment1['end_time']);
        }
        foreach ($res['first'] as &$segment2) {
            $segment2['start_time'] = strtotime($segment2['start_time']);
            $segment2['end_time'] = strtotime($segment2['end_time']);
        }
        foreach ($res['rest'] as &$segment2) {
            $segment2['start_time'] = strtotime($segment2['start_time']);
            $segment2['end_time'] = strtotime($segment2['end_time']);
        }
        $result = getFirstAndRestSegmentsByFirstEndTime($segments, $endTime);
        $this->assertEquals($res, $result);
    }

    public function getPeriodTimesProvider()
    {
        return $this->getTestData('testGetPeriodTimes');
    }

    /**
     * @dataProvider getPeriodTimesProvider
     * @param int $startTime
     * @param int $endTime
     * @param int $period
     * @param $result
     * User: hjun
     * Date: 2018-08-25 11:01:40
     * Update: 2018-08-25 11:01:40
     * Version: 1.00
     */
    public function testGetPeriodTimes($startTime = 0, $endTime = 0, $period = 1, $result)
    {
        $startTime = strtotime($startTime);
        $endTime = strtotime($endTime);
        foreach ($result as &$time) {
            $time = strtotime($time);
        }
        $times = getPeriodEndTimes($startTime, $endTime, $period);
        $this->assertEquals($result, $times);
    }

    public function sliceSegmentsWithFirstEndTimeAndPeriodProvider()
    {
        return $this->getTestData('testSliceSegmentsWithFirstEndTimeAndPeriod');
    }

    /**
     * @dataProvider sliceSegmentsWithFirstEndTimeAndPeriodProvider
     * @param array $segments
     * @param int $firstEndTime
     * @param int $period
     * @param array $result
     * User: hjun
     * Date: 2018-08-25 16:35:42
     * Update: 2018-08-25 16:35:42
     * Version: 1.00
     */
    public function testSliceSegmentsWithFirstEndTimeAndPeriod($segments = [], $firstEndTime = 0, $period = 1, $result = [])
    {
        foreach ($segments as &$segment) {
            $segment['start_time'] = strtotime($segment['start_time']);
            $segment['end_time'] = strtotime($segment['end_time']);
        }
        $firstEndTime = strtotime($firstEndTime);
        $newSegments = sliceSegmentsWithFirstEndTimeAndPeriod($segments, $firstEndTime, $period);
        foreach ($newSegments as &$segment) {
            $segment['start_time'] = date('Y-m-d', $segment['start_time']);
            $segment['end_time'] = date('Y-m-d', $segment['end_time']);
        }
        $this->assertEquals($result, $newSegments);
    }

    public function groupSegmentsWithFirstEndTimeAndPeriodProvider()
    {
        return $this->getTestData('testGroupSegmentsWithFirstEndTimeAndPeriod');
    }

    /**
     * @dataProvider groupSegmentsWithFirstEndTimeAndPeriodProvider
     * @param array $segments
     * @param int $firstEndTime
     * @param int $period
     * @param array $result
     * User: hjun
     * Date: 2018-08-25 17:34:30
     * Update: 2018-08-25 17:34:30
     * Version: 1.00
     */
    public function testGroupSegmentsWithFirstEndTimeAndPeriod($segments = [], $firstEndTime = 0, $period = 1, $result = [])
    {
        foreach ($segments as &$segment) {
            $segment['start_time'] = strtotime($segment['start_time']);
            $segment['end_time'] = strtotime($segment['end_time']);
        }
        foreach ($result as &$group) {
            foreach ($group as &$segment) {
                $segment['start_time'] = strtotime($segment['start_time']);
                $segment['end_time'] = strtotime($segment['end_time']);
            }
        }
        $firstEndTime = strtotime($firstEndTime);
        $groupSegments = groupSegmentsWithFirstEndTimeAndPeriod($segments, $firstEndTime, $period);
        $this->assertEquals($result, $groupSegments);
    }

    public function getGroupSegmentTotalFeeAndFeeItemsProvider()
    {
        return $this->getTestData('testGetGroupSegmentTotalFeeAndFeeItems');
    }

    /**
     * @dataProvider getGroupSegmentTotalFeeAndFeeItemsProvider
     * @param array $sundryFees
     * @param array $groupSegment
     * @param string $segmentType
     * @param array $result
     * User: hjun
     * Date: 2018-08-26 10:16:55
     * Update: 2018-08-26 10:16:55
     * Version: 1.00
     */
    public function testGetGroupSegmentTotalFeeAndFeeItems($sundryFees = [], $groupSegment = [], $segmentType = '', $result = [])
    {
        foreach ($groupSegment as &$segment) {
            $segment['start_time'] = strtotime($segment['start_time']);
            $segment['end_time'] = strtotime($segment['end_time']);
        }
        $feeInfo = getGroupSegmentTotalFeeAndFeeItems($sundryFees, $groupSegment, $segmentType);
        $this->assertEquals($result, $feeInfo);
    }

    public function testGetNextPeriodDate()
    {
        $result = getNextPeriodDate(strtotime('2018-08-05'), -12);
        $time = date('Y-m-d', $result);
        $this->assertEquals('2017-08-05', $time);

        $result = getNextPeriodDate(strtotime('2018-02-28'), -12);
        $time = date('Y-m-d', $result);
        $this->assertEquals('2017-02-28', $time);
    }

    public function buildContractDataProvider()
    {
        return $this->getTestData('testBuildContractData');
    }

    /**
     * @dataProvider buildContractDataProvider
     * @param int $action
     * @param array $request
     * User: hjun
     * Date: 2018-08-30 17:24:36
     * Update: 2018-08-30 17:24:36
     * Version: 1.00
     */
    public function testBuildContractData($action = ContractModel::ACTION_ADD, $request = [], $result)
    {
        $result = $this->model->buildContractData($action, $request);
        if (!isSuccess($result)) {
            $result['msg'] = $result['msg'] | $this->model->getSegmentsError() | $this->model->getPropertyError() | $this->model->getChargingError();
        }
        $contract = $result['data'];
        $billList = buildBill($contract['garden_id'], 1232131, $contract, $action);
    }

    public function getFirstPropertyBillProvider()
    {
        return $this->getTestData('testGetFirstPropertyBill');
    }

    /**
     * 获取第一笔物业费用
     * @dataProvider getFirstPropertyBillProvider
     * @param array $bills
     * @param array $result
     * User: hjun
     * Date: 2018-09-03 16:23:26
     * Update: 2018-09-03 16:23:26
     * Version: 1.00
     */
    public function testGetFirstPropertyBill($bills = [], $result = [])
    {
        foreach ($bills as &$bill) {
            $bill['fee_items'] = jsonEncode($bill['fee_items']);
        }
        $result['fee_items'] = jsonEncode($result['fee_items']);
        $first = getFirstPropertyBill($bills);
        $this->assertEquals($result, $first);
    }

    public function getFirstRentBillProvider()
    {
        return $this->getTestData('testGetFirstRentBill');
    }

    /**
     * 获取第一笔物业费用
     * @dataProvider getFirstRentBillProvider
     * @param array $bills
     * @param array $result
     * User: hjun
     * Date: 2018-09-03 16:23:26
     * Update: 2018-09-03 16:23:26
     * Version: 1.00
     */
    public function testGetFirstRentBill($bills = [], $result = [])
    {
        foreach ($bills as &$bill) {
            $bill['fee_items'] = jsonEncode($bill['fee_items']);
        }
        $result['fee_items'] = jsonEncode($result['fee_items']);
        $first = getFirstRentBill($bills);
        $this->assertEquals($result, $first);
    }
}