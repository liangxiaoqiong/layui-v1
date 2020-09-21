<?php
return array(
    //'配置项'=>'配置值'
    'TMPL_PARSE_STRING' => array(
        '__PUBLIC__' => __ROOT__ . '/' . APP_PATH_NAME . '/' . MODULE_NAME . '/View/Public',
        '__DATA__' => __ROOT__ . '/Data',
        '__ADMIN__' => __ROOT__ . '/Data/admin',
        '__VUE__' => VUE,
        '__APP_UTIL__' => APP_UTIL,
    ),

    'URL_MODEL' => 3, //URL模式

    'DEFAULT_CONTROLLER' => 'Group', // 默认控制器名称
    'DEFAULT_ACTION' => 'groupIndex', // 默认操作名称
    'TMPL_ACTION_ERROR'     =>  './Tpl/exception.tpl', // 默认错误跳转对应的模板文件
    'TMPL_EXCEPTION_FILE'   =>  './Tpl/exception.tpl',// 异常页面的模板文件
);