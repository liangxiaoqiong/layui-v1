<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class MenuTest extends \Common\PHPUnit\BaseTest
{
    /**
     * 保存节点权限
     * User: hjun
     * Date: 2019-09-20 22:41:20
     * Update: 2019-09-20 22:41:20
     * Version: 1.00
     */
    public function testSaveDevMenu()
    {
        $allNode = M('menu')->select();
        F('allMenu', $allNode);
    }

    public function testUpdateNode()
    {
        $allNode = F('allMenu');
        if (empty($allNode)) {
            $this->assertTrue(false);
            return false;
        }
        $menuModel = M('menu');
        $result = $menuModel->where('1=1')->delete();
        if (false === $result) {
            $this->assertTrue(false);
            return false;
        }
        // 增加菜单
        $nodeId = $menuModel->addAll($allNode);
        if (false === $nodeId) {
            $menuModel->rollback();
            return false;
        }
        $this->assertTrue(true);
    }
}