系统的入口文件的一些公共配置
例如MODE常量的定义,调试模式的开启关闭等

【测试常量说明】
// 测试常量 定义了open_id 和 member_id 就不需要微信授权
define('MEMBER_OPEN_ID', 'oFWGkt1oocHS8vLugjt49341SSAA');
define('MEMBER_ID', 58);

// 本地的SSL
define('OPENSSL_CONF', 'C:\app\phpStudy\PHPTutorial\Apache\conf\openssl.cnf');

// 接口签名验证 以及 签名失效时间
define('SIGN_OPEN', false);
define('SIGN_TIME', 300);

// 充值 回调数据
define('RECHARGE_DEBUG', false);
define('RECHARGE_JSON', '{"appid":"wx5c5043760abdfd35","attach":"1@0220010103@2","bank_type":"SPDB_CREDIT","cash_fee":"5000","fee_type":"CNY","gid":"1","is_subscribe":"Y","mch_id":"1508804371","nonce_str":"v60fubqhmydw0jkau8kmirbpejsq8qjl","openid":"oIG0wwOleIzZmIv4SuqlXQX_LB_c","out_trade_no":"p155195106910337","result_code":"SUCCESS","return_code":"SUCCESS","sign":"91B5CD3AB8B98DFD15D3DA7F5E56D037","time_end":"20190307113848","total_fee":"1","trade_type":"JSAPI","transaction_id":"4200000262201903071138914658"}');

// 特殊充值ID，可以充值小金额测试
define('RECHARGE_MEMBER_ID', '3,22,128');

// 供电系统是否开启
define('METER_SYSTEM_OPEN', false);