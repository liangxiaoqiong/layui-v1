<?php

// 检测PHP环境
if (version_compare(PHP_VERSION, '5.3.0', '<')) {
    die('require PHP > 5.3.0 !');
}
// 访问域名时，跳转到管理后台
if ($_SERVER['REQUEST_URI'] == '/') {
    header("Location: http://".$_SERVER['HTTP_HOST']."/admin.php");
    exit;
}

require 'GLOBAL/global.php';

define('BIND_MODULE', 'Wap');
defined('APP_PATH') or define('APP_PATH', "./App/");

//if(is_file($_SERVER['DOCUMENT_ROOT'].'/360safe/360webscan.php')){
//    require_once($_SERVER['DOCUMENT_ROOT'].'/360safe/360webscan.php');
//}

require THINK_PATH . 'ThinkPHP.php'; //加载ThinkPHP框架
