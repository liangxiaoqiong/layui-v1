<?php

return array(
    //'配置项'=>'配置值'

    // hjun 2018-03-19 16:05:43 数据库配置
    'DB_TYPE' => 'mysql',
    'DB_HOST' => '123.207.98.106',
    'DB_PORT' => '3306',
    'DB_USER' => 'admin',
    'DB_PWD' => '9ewFk02t5QfXA8W2',
    'DB_NAME' => 'tgmall_db',
    'DB_PREFIX' => 'wjd_',
    'DB_CHARSET' => 'utf8',

    /*Redis设置*/
    'DATA_CACHE_PREFIX' => 'TG_',//缓存前缀
    'REDIS_HOST' => '123.207.98.106', //redis服务器ip，多台用逗号隔开；读写分离开启时，第一台负责写，其它[随机]负责读；
    'REDIS_PORT' => '6379',//端口号
    'DATA_CACHE_TIMEOUT' => '300',//超时时间
    'REDIS_PERSISTENT' => false,//是否长连接 false=短连接
    'REDIS_AUTH' => 'xunxin8988998',//AUTH认证密码

    /*SQL日志*/
    'DB_DEBUG' => true,
    'LOG_LEVEL' => 'EMERG,ALERT,CRIT,ERR,WARN,NOTIC,INFO,DEBUG,SQL',  // 允许记录的日志级别

    'DB_CACHE_ON' => true,
   'PAY_URL' => 'http://58.247.0.18:29015/v1/netpay/webpay/pay',
    'QUERY_URL' => 'http://58.247.0.18:29015/v1/netpay/query',
    'ACCESS_URL' =>'http://58.247.0.18:29015/v1/token/access',
//    'PAY_URL' => 'https://api-mop.chinaums.com/v1/netpay/webpay/pay',
    'CHINA_PAY_URL' => 'https://qra.95516.com/pay/gateway',

);
