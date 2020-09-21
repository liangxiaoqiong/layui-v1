<?php

$mode = defined('MODE') ? MODE : 'common';
return array(
    'MODULE_ALLOW_LIST' => array('Home', 'Mobile'), //模块列表
    'MODULE_DENY_LIST' => array('Common', 'AdminLF'),
    'DEFAULT_MODULE' => 'Home', //默认分组

    'DB_PARAMS' => array(\PDO::ATTR_CASE => \PDO::CASE_NATURAL),

    //开启子域名配置，除默认分组，其他分组只能用子域名访问
    'APP_SUB_DOMAIN_DEPLOY' => 1,
    //子域名配置,格式：'子域名'=> array('分组名/[模块名]','var1=a&var2=b');
    'APP_SUB_DOMAIN_RULES' => array(
        //'admin' => array('AdminLF/'),
        'm' => array('Mobile/'),//对应域名为m.xxx.com
    ),

    //模板路径(简化模板目录)
    'TMPL_FILE_DEPR' => '/', // 控制器_方法.html, 控制器/方法.html[默认]
    //去掉伪静态后缀
    //'URL_HTML_SUFFIX' => '',
    'TMPL_STRIP_SPACE' => true, //是否去除模板文件里面的html空格与换行
    'TMPL_TEMPLATE_SUFFIX' => '.html', //模板后缀

    //显示页面调试信息
    'SHOW_PAGE_TRACE' => false,

    'URL_ROUTER_ON' => false, //开启路由

    //强制区分大小写
    'URL_CASE_INSENSITIVE' => false,

    'DEFAULT_FILTER' => 'trim,null2Empty', // 默认参数过滤方法 用于I函数...

    'SIGN_KEY' => 'WJD',

    /*杂项*/
    'DB_CACHE_MAP_TYPE' => 2, // 数据库缓存的映射的存储类型 0-使用数据库存 1-使用数组存 2-redis

    'AUTOLOAD_NAMESPACE' => array(
        'PhpOffice' => LIB_PATH . 'PhpOffice',
        'JsonSchema' => VENDOR_PATH . 'JsonSchema',
    ),

    // =======================================    根据环境的而不同配置不同的配置    =======================================
    'LOAD_EXT_CONFIG' => "config.{$mode}", // 加载扩展配置文件
);
