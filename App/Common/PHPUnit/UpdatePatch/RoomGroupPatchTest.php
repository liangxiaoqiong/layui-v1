<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

use Think\Db;

class RoomGroupPatchTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 将以前的房间数据设置一个默认的房源分组和为每个园区添加一个默认分组
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-05-31 16:57:17
     * Update: 2019-05-31 16:57:17
     * Version: 1.00
     */
    public function testRoomGroupData()
    {
        $gardenModel = D('garden');
        $roomGroupModel = D('RoomGroup');
        $relationModel = D('RoomGroupRelation');

        $gardenModel->startTrans();
        try {
            $list = $gardenModel->field('garden_id')->select();
            $dataList = [];
            $item = [];
            $item['group_name'] = '未分组(系统)';
            $item['create_time'] = NOW_TIME;
            $item['is_system'] = 1;
            foreach ($list as $k => $v) {
                $item['garden_id'] = $v['garden_id'];
                $dataList[] = $item;
            }
            $result = $roomGroupModel->addAll($dataList);
            if (false === $result) {
                $gardenModel->rollback();
                exit($roomGroupModel->getDbError());
            }

            $field = 'a.garden_id,a.group_id,b.room_id';
            $insert_data = $roomGroupModel->alias('a')
                ->field($field)
                ->join('LEFT JOIN
	                wjd_room as b
                    on a.garden_id=b.garden_id and a.is_delete=0 and b.is_delete=0')->select();
            $result = $relationModel->addAll($insert_data);
            if (false === $result) {
                $gardenModel->rollback();
                exit($roomGroupModel->getDbError());
            }
            $gardenModel->commit();
        } catch (\Exception $e) {
            $gardenModel->rollback();
            exit(dump($e));
        }
    }
}
