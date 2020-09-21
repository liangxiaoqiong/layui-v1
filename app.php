<?php

if (version_compare(PHP_VERSION, '5.3.0', '<')) {
    die('require PHP > 5.3.0 !');
}

require 'GLOBAL/global.php';

define('BIND_MODULE', 'AppManage');
defined('APP_PATH') or define('APP_PATH', "./App/");
require THINK_PATH . 'ThinkPHP.php';
