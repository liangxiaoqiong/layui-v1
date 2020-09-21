<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class AccessTest extends \Common\PHPUnit\BaseTest
{
    public function testCharge()
    {
        // 权限修改
        // 账单模版 新增 add delete; 修改 editChargeInfo => modify
        // 1. 找出Charge控制器  editChargeInfo 权限
        $nodeModel = M('Node');
        $accessModel = M('access');
        $nodeModel->startTrans();
        try {
            $where = [];
            $where['name'] = 'Charge';
            $where['level'] = 2;
            $ctrlNode = $nodeModel->where($where)->find();
            if (empty($ctrlNode)) {
                $nodeModel->rollback();
                return false;
            }
            $where = [];
            $where['pid'] = $ctrlNode['id'];
            $where['name'] = 'editChargeInfo';
            $actNode = $nodeModel->where($where)->find();
            if (empty($actNode)) {
                $nodeModel->rollback();
                return false;
            }
            // 编辑权限改名
            $result = $nodeModel->where(['id' => $actNode['id']])->save(['name' => 'modify']);
            if ($result === false) {
                $nodeModel->rollback();
                return false;
            }
            // 删除查看权限
            $where = [];
            $where['pid'] = $ctrlNode['id'];
            $where['name'] = 'chargeInfo';
            $result = $nodeModel->where($where)->delete();
            if ($result === false) {
                $nodeModel->rollback();
                return false;
            }
            // 新增 add 和 delete权限
            $dataList = [
                [
                    'name' => 'add',
                    'title' => '新增收费项',
                    'pid' => $ctrlNode['id'],
                    'level' => 3,
                    'status' => 1,
                ],
                [
                    'name' => 'delete',
                    'title' => '删除收费项',
                    'pid' => $ctrlNode['id'],
                    'level' => 3,
                    'status' => 1,
                ],
            ];
            $result = $nodeModel->addAll($dataList);
            if (false == $result) {
                $nodeModel->rollback();
                return false;
            }
            $addId = $result;
            $deleteId = $addId + 1;
            // 新增后为access表新增这两个权限 找出editBillTplInfo的角色 为这些角色新增add和delete
            $where = [];
            $where['node_id'] = $actNode['id'];
            $roleIds = $accessModel->where($where)->getField('role_id', true);
            $dataList = [];
            if (!empty($roleIds)) {
                foreach ($roleIds as $roleId) {
                    $item = [];
                    $item['role_id'] = $roleId;
                    $item['level'] = 3;
                    $item['node_id'] = $addId;
                    $dataList[] = $item;
                    $item['node_id'] = $deleteId;
                    $dataList[] = $item;
                }
                $result = $accessModel->addAll($dataList);
                if (false === $result) {
                    $nodeModel->rollback();
                    return false;
                }
            }
            $nodeModel->commit();
        } catch (\Exception $e) {
            $nodeModel->rollback();
        }
    }

    /**
     * 保存节点权限
     * User: hjun
     * Date: 2019-09-20 22:41:20
     * Update: 2019-09-20 22:41:20
     * Version: 1.00
     */
    public function testSaveDevNode()
    {
        $allNode = M('node')->select();
        F('allNode', $allNode);
    }

    protected function groupByKey($allNode = [])
    {
        $temp = $allNode;
        $allNode = [];
        foreach ($temp as $value) {
            if (!isset($allNode["{$value['name']}{$value['pid']}"])) {
                $allNode["{$value['name']}{$value['pid']}"] = $value;
            }
        }
        return $allNode;
    }

    public function testUpdateNode()
    {
        $allNode = F('allNode');
        if (empty($allNode)) {
            $this->assertTrue(false);
            return false;
        }
        $nodeModel = M('node');
        $allNode = $this->groupByKey($allNode);
        $allKey = array_keys($allNode);
        $oldNode = $nodeModel->select();
        $oldNode = $this->groupByKey($oldNode);
        $oldKey = array_keys($oldNode);
        $insertKey = array_diff($allKey, $oldKey);
        if (empty($insertKey)) {
            $this->assertTrue(true);
            return true;
        }
        $addNodes = [];
        foreach ($insertKey as $value) {
            $item = $allNode[$value];
            $addNodes[] = $item;
        }
        $nodeModel->startTrans();
        // 增加新增的权限
        $nodeId = $nodeModel->addAll($addNodes);
        if (false === $nodeId) {
            $nodeModel->rollback();
            return false;
        }
        // 给主账号添加新增的权限
        $accessModel = M('access');
        $roleId = M('role')->where(['name' => '普通园区管理员'])->getField('id');
        $access = [];
        foreach ($addNodes as $value) {
            $item = [];
            $item['role_id'] = $roleId;
            $item['node_id'] = $value['id'];
            $item['level'] = $value['level'];
            $access[] = $item;
        }
        $result = $accessModel->addAll($access);
        if (false === $result) {
            $nodeModel->rollback();
            return false;
        }
        $nodeModel->commit();
        $this->assertTrue(true);
    }
}