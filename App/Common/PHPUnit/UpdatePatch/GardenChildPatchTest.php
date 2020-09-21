<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class GardenChildPatchTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 为旧园区生成一个子园区，所有楼宇都是属于改子园区
     * User: hjun
     * Date: 2019-09-05 16:07:32
     * Update: 2019-09-05 16:07:32
     * Version: 1.00
     */
    public function testBuildGardenChild()
    {
        $buildingModel = D('Building');
        $childModel = D('GardenChild');
        // 1. 找出有楼宇的园区ID
        $field = ['garden_id'];
        $where = [];
        $where['is_delete'] = NOT_DELETED;
        $group = 'garden_id';
        $list = $buildingModel->field($field)->where($where)->group($group)->select();

        $buildingModel->startTrans();
        try {
            // 2. 为每个园区都新增一个默认子园区
            $dataList = [];
            $item = [];
            $item['garden_child_name'] = '默认园区';
            $item['create_time'] = NOW_TIME;
            $item['is_system'] = 1;
            foreach ($list as $value) {
                $gardenId = $value['garden_id'];
                $item['garden_id'] = $gardenId;
                $dataList[] = $item;
            }
            $firstId = $childModel->addAll($dataList);

            // 3. 把每个园区的楼宇都设置成属于对应的子园区
            $updateList = [];
            foreach ($list as $value) {
                $item = [];
                $item['garden_id'] = $value['garden_id'];
                $item['garden_child_id'] = $firstId++;
                $updateList[] = $item;
            }
            $sql = buildSaveAllSQL('wjd_building', $updateList, 'garden_id');
            $result = $buildingModel->execute($sql);
            if (false === $result) {
                $buildingModel->rollback();
                exit($buildingModel->getDbError());
            }
            $buildingModel->commit();
        } catch (\Exception $e) {
            $buildingModel->rollback();
            exit(dump($e));
        }
    }
}
