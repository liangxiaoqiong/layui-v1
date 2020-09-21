<?php

namespace Api\Controller;


use Common\Model\GroupModel;

class SendMsgController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        header("Content-Type: text/html; charset=UTF-8");
        set_time_limit(3500);
    }

    public function test()
    {
        $params = [];
        $params['mall_id'] = 6;
        $params['type'] = 1;
        $params['order_id'] = 19;
        $params['send_method'] = 1;
        D('Message')->sendMessage($params);
    }

    public function index()
    {
        logWrite("轮询发消息");
        $isRunning = F('sendMsgTaskState');
        if ($isRunning == 1) {
            logWrite("正在执行中");
            exit("正在执行中...");
        }
        F('sendMsgTaskState', 1);
        $mallModel = M('mall');
        $groupModel = M('group');
        $messageModel = D('Message');
        $w = array();
        $w['mall_status'] = 1;
        $w['is_delete'] = 0;
        $mall_ids = $mallModel->where($w)->getField('mall_id', true);
        logWrite("SQL:" . $mallModel->_sql());
        logWrite("结果:" . jsonEncode($mall_ids));
        foreach ($mall_ids as $mall_id) {
            $groupWhere = [];
            $groupWhere['a.is_delete'] = NOT_DELETED;
            $groupWhere['a.group_status'] = ['in', [GroupModel::GROUP_COMPLETE, GroupModel::GROUP_FAIL]];
            $groupWhere['a.mall_id'] = $mall_id;
            $groupWhere['a.is_settle'] = 1;
            $groupWhere['a.is_remind'] = 0;
            $join = [
                '__GROUP_RECORD__ b on b.group_key_id = a.group_key_id'
            ];
            $field = ['b.record_id', 'a.group_key_id'];
            $records = $groupModel->alias('a')->join($join)->where($groupWhere)->field($field)->select();
            if (!empty($records)) {
                foreach ($records as $record) {
                    $params = [];
                    $params['type'] = 0;
                    $params['send_method'] = 1;
                    $params['mall_id'] = $mall_id;
                    $params['record_id'] = $record['record_id'];
                    $messageModel->sendMessage($params);
                }
            }
            if (!empty($records)) {
                $groupKeyIds = array_column($records, 'group_key_id');
                $groupKeyIds = array_flip($groupKeyIds);
                $groupKeyIds = array_flip($groupKeyIds);
                $groupKeyIds = array_values($groupKeyIds);
                $groupModel->where(['group_key_id' => ['in', $groupKeyIds]])->save(['is_remind' => 1]);
            }
        }
        logWrite("轮询发消息结束");
        F('sendMsgTaskState', 0);
        echo '执行完成';
    }
}     
