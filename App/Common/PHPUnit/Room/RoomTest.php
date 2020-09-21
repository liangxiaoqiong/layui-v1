<?php

namespace Common\PHPUnit\Contract;


use Common\Model\RoomModel;

class RoomTest extends \Common\PHPUnit\Room\BaseTest
{
    /**
     * @var RoomModel
     */
    private $model;

    public function setUp()
    {
        parent::setUp();
        date_default_timezone_set('Asia/Shanghai');
        $this->model = D('Room');
        $this->model->setGardenId(74);
        $data = [];
        $data['is_merge'] = RoomModel::MERGE_NO;
        $data['merge_pid'] = 0;
        $this->model->where('garden_id = 74')->save($data);
    }

    public function checkMergeIdsProvider()
    {
        return $this->getTestData('testCheckMergeIds');
    }

    /**
     * @dataProvider checkMergeIdsProvider
     * @param $mainId
     * @param $roomIds
     * @param $result
     * @param $error
     * User: hjun
     * Date: 2018-09-05 16:47:08
     * Update: 2018-09-05 16:47:08
     * Version: 1.00
     */
    public function testCheckMergeIds($mainId, $roomIds, $result, $error)
    {
        $actual = $this->model->checkMergeIds($mainId, $roomIds);
        $this->assertEquals($result, $actual);
        $this->assertEquals($error, $this->model->getMergeError());
    }
}