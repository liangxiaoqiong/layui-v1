<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/6/9
 * Time: 15:00
 */


// 是否是XDebug模式 本地调试时设置为true时可以抑制警告等提示
$isXDebug = true;
if ($isXDebug) {
    error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
}

// 是否正在升级中， 系统需要长时间升级时设置为true
$isUpdating = false;
if ($isUpdating) {
    // 如果是接口 要返回JSON格式的提示
    if (strpos($_SERVER['HTTP_HOST'], 'api') !== false) {
        require 'updating.api.php';
    } else {
        require 'updating.php';
    }
}

// hjun 2018-03-19 16:04:28 定义应用模式 用于加载不同的配置文件 不定义默认为common
// common               => 正式环境
// dev                  => 测试环境
// home_dev             => 本地测试环境
// home_common          => 本地正式环境
define('MODE', 'home_common');

/*===========================================测试用常量定义============================================================*/
// 测试常量 定义了open_id 和 member_id 就不需要微信授权。 不需要直接注释
define('MEMBER_OPEN_ID', 'oFWGkt1oocHS8vLugjt49341SSAA');
define('MEMBER_ID', 58);

// 本地的SSL
define('OPENSSL_CONF', 'C:\app\phpStudy\PHPTutorial\Apache\conf\openssl.cnf');

// 接口签名验证
define('SIGN_OPEN', false);
// 签名有效期
define('SIGN_TIME', 300);

// 充值 回调数据 测试用
define('RECHARGE_DEBUG', false);
define('RECHARGE_JSON', '{"appid":"wx5c5043760abdfd35","attach":"1@0220010103@2","bank_type":"SPDB_CREDIT","cash_fee":"5000","fee_type":"CNY","gid":"1","is_subscribe":"Y","mch_id":"1508804371","nonce_str":"v60fubqhmydw0jkau8kmirbpejsq8qjl","openid":"oIG0wwOleIzZmIv4SuqlXQX_LB_c","out_trade_no":"p155195106910337","result_code":"SUCCESS","return_code":"SUCCESS","sign":"91B5CD3AB8B98DFD15D3DA7F5E56D037","time_end":"20190307113848","total_fee":"1","trade_type":"JSAPI","transaction_id":"4200000262201903071138914658"}');

// 特殊充值的会员ID，可以充值小金额测试
define('RECHARGE_MEMBER_ID', '3,22,128');

// 供电系统是否开启
define('METER_SYSTEM_OPEN', false);
/*===========================================测试用常量定义============================================================*/

define('APP_DEBUG', true);

// 静态资源文件的版本号。代码升级后自动+0.01
define('EXTRA_VERSION', '4.06');

define('THINK_PATH', realpath(__DIR__ . '/../Include/') . '/');
define('APP_PATH', realpath(__DIR__ . '/../App/') . '/');
