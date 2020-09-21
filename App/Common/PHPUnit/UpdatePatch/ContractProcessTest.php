<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/26
 * Time: 14:41
 */

namespace Common\PHPUnit\UpdatePatch;

class ContractProcessTest extends \Common\PHPUnit\BaseTest
{
    public function testProcess()
    {
        $field = [
            'contract_id', 'garden_id',
        ];
        $where = [];
        $where['is_delete'] = 0;
        $where['contract_status'] = 2;
        $list = D('Contract')->field($field)->where($where)->select();
        foreach ($list as $key => $value) {
            $value['action_type'] = 0;
            $value['create_time'] = NOW_TIME;
            $list[$key] = $value;
        }
        D('ContractProcess')->addAll($list);
    }
}