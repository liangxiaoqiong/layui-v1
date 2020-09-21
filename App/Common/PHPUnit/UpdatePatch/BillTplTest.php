<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class BillTplTest extends \Common\PHPUnit\BaseTest
{
    public function testNode()
    {
        // 权限修改
        // 账单模版 新增 add delete; 修改 editBillTplInfo => modify; 删除 billTplInfo
        // 1. 找出BillTpl控制器  editBillTplInfo billTplInfo 权限
        $nodeModel = M('Node');
        $accessModel = M('access');
        $nodeModel->startTrans();
        try {
            $where = [];
            $where['name'] = 'BillTpl';
            $where['level'] = 2;
            $billTplCtrl = $nodeModel->where($where)->find();
            if (empty($billTplCtrl)) {
                $this->assertTrue(false);
                $nodeModel->rollback();
                return false;
            }
            $where = [];
            $where['pid'] = $billTplCtrl['id'];
            $where['name'] = 'editBillTplInfo';
            $editAct = $nodeModel->where($where)->find();
            if (empty($editAct)) {
                $nodeModel->rollback();
                $this->assertTrue(false);
                return false;
            }
            // 编辑权限改名
            $result = $nodeModel->where(['id' => $editAct['id']])->save(['name' => 'modify']);
            if ($result === false) {
                $nodeModel->rollback();
                $this->assertTrue(false);
                return false;
            }
            // 删除查看权限
            $where = [];
            $where['pid'] = $billTplCtrl['id'];
            $where['name'] = 'billTplInfo';
            $result = $nodeModel->where($where)->delete();
            if ($result === false) {
                $nodeModel->rollback();
                return false;
            }
            // 新增 add 和 delete权限
            $dataList = [
                [
                    'name' => 'add',
                    'title' => '新增模版',
                    'pid' => $billTplCtrl['id'],
                    'level' => 3,
                    'status' => 1,
                ],
                [
                    'name' => 'delete',
                    'title' => '删除模版',
                    'pid' => $billTplCtrl['id'],
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
            $where['node_id'] = $editAct['id'];
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
}