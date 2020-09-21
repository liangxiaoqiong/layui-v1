<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

use Think\Db;

class RoomGroupMetaPatchTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 将以往房源统计数据补上
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-05-31 16:57:17
     * Update: 2019-05-31 16:57:17
     * Version: 1.00
     */
    public function testRoomGroupMetaData()
    {
        ini_set('memory_limit', '1024M');
        set_time_limit(0);
        $roomGroupMetaModel = D('RoomGroupMeta');
        $roomGroupMetaDetailModel = D('RoomGroupMetaDetail');
        $gardenModel = D('Garden');
        $gardenList = $gardenModel->field('garden_id,create_time')->select();
        $metaData = [];
        $detailData = [];
        $minTime = $gardenModel->min('create_time');
        $time = [];
        $nowMonth = strtotime(date('Y-m', NOW_TIME));
        while ($minTime < $nowMonth) {
            $date = date('Y-m', $minTime);
            $date .= '-01';
            $time[] = strtotime($date);
            $minTime = strtotime("+1 month", $minTime);
        }
        foreach ($time as $value) {
            $monthMeta = $roomGroupMetaModel->buildMetaByTime($value, $gardenList);
            $metaData = array_merge($metaData, $monthMeta);
            $monthMetaDetail = $roomGroupMetaModel->buildMetaDetailByTime($value);
            $detailData = array_merge($detailData, $monthMetaDetail);
        }
        $results[] = $roomGroupMetaModel->addAll($metaData);
        $results[] = $roomGroupMetaDetailModel->addAll($detailData);
        $this->assertEquals('', $roomGroupMetaModel->getDbError() . $roomGroupMetaModel->getError());
    }
}
