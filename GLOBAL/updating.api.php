<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/6/9
 * Time: 19:58
 */

date_default_timezone_set('Asia/Shanghai');
header("Content-type:application/json;charset=utf-8");
$data = [];
$data['code'] = 302;
$data['msg'] = "很抱歉,系统升级中,预计完成时间" . date('H:00', time() + 3600 * 2);
$data['data'] = [];
exit(json_encode($data, 256));