<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

use Think\Db;
use Think\Model;

class FundReconciliationPatchTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 将trade_detail表补上手续费数据
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-05-31 16:57:17
     * Update: 2019-05-31 16:57:17
     * Version: 1.00
     */
    public function testFundReconciliationData()
    {
        $fundReconciliationModel = D('FundReconciliation');
        $mallModel = D('Mall');
        $mallList = $mallModel->where(['mall_status' => 1, 'is_delete' => 0])->order('create_time asc')->field(['create_time'])->find();
        $createTime = $mallList['create_time'];
        $beginTime = strtotime(date('Y-m-d', $createTime));
        $today = strtotime(date('Y-m-d'));
        $today = $today - 3600 * 24;
        $data = [];
        while ($beginTime < $today) {
            $dayMeta = $fundReconciliationModel->buildMetaByTime($beginTime);
            if (!empty($dayMeta)) {
                foreach ($dayMeta as $item) {
                    $data[] = $item;
                }
            }
            $beginTime += 3600 * 24;
        }
        $fundReconciliationModel->addAll($data);
        $this->assertEquals('', $fundReconciliationModel->getDbError() . $fundReconciliationModel->getError());
    }
}
