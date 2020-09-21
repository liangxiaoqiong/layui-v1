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
 * 广告
 * @param integer $id 广告id
 * @param boolean $flag 是否js方式输出(0|1), 默认html
 * @return string
 */
function get_abc($id, $flag = 0)
{

    $id = intval($id);
    if (empty($id)) {
        return '';
    }
    $setting = '';
    $abc = M('abc')->find($id);
    if ($abc) {
        $where = array('aid' => $id,
            'status' => 1,
            'starttime' => array('lt', time()),
            'endtime' => array('gt', time()),
        );
        $detail = M('abcDetail')->where($where)->order('sort')->limit($abc['num'])->select();
        if (!$detail) {
            $detail = array();
        }

        $setting = $abc['setting'];
        $pattern = '/<loop>(.*?)<\/loop>/is';
        preg_match_all($pattern, $setting, $mat);

        if (!empty($mat[1])) {
            $rep = array();
            foreach ($mat[1] as $k => $v) {
                $rep[$k] = '';
                foreach ($detail as $k2 => $v2) {
                    $search = array('{$id}', '{$title}', '{$content}', '{$url}', '{$sort}',
                        '{$width}', '{$height}', '{$autoindex}', '{$autoindex+1}', '{$autoindex+2}');
                    $replace = array($v2['id'], $v2['title'], $v2['content'], $v2['url'], $v2['sort'],
                        $abc['width'], $abc['height'], $k2, $k2 + 1, $k2 + 2);

                    $rep[$k] .= str_replace($search, $replace, $v);
                }
            }
            $setting = str_replace($mat[0], $rep, $setting);
        }

    }

    //js输出
    if ($flag) {
        $setting = 'document.write("' . str_replace(array('"', "\r\n"), array('\"', ''), $setting) . '");';
    }
    return $setting;
}

/**
 * 联盟广告
 * @param integer $id 广告id
 * @param boolean $flag 是否js方式输出(0|1), 默认html
 * @return string
 */
function get_union($id, $flag = 0)
{

    $id = intval($id);
    if (empty($id)) {
        return '';
    }
    $setting = '';
    $union = M('union')->find($id);
    if ($union) {
        if (!$union['status']) {
            $result = '广告被禁用';
        } else {
            $result = $union['code'];
        }

    } else {
        $result = '广告不存在';
    }


    return $result;
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

//获取评论用户昵称
function get_nickname($userid = 0)
{
    if ($userid > 0) {
        $map['id'] = $userid;
        $rs = D('MemberView')->nofield('password,encrypt')->where($map)->find();
        if ($rs && $rs['nickname']) {
            $nickname = $rs['nickname'];
        } elseif ($rs && $rs['username']) {
            $nickname = $rs['username'];
        } else {
            $nickname = '未知';
        }
    } else {
        $nickname = '游客';
    }
    return $nickname;
}

//获取作者用户昵称
function get_authorname($userid = 0)
{
    if ($userid > 0) {
        $map['id'] = $userid;
        $rs = D('MemberView')->nofield('password,encrypt')->where($map)->find();
        if ($rs && $rs['nickname']) {
            $nickname = $rs['nickname'];
        } elseif ($rs && $rs['username']) {
            $nickname = $rs['username'];
        } else {
            $nickname = '未知';
        }
    } else {
        $nickname = '管理员';
    }
    return $nickname;
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

//获取该用户的信息
function get_userinfo($uid)
{
    $uid = intval($uid);
    $res = '';
    $user = D('MemberView')->nofield('password,encrypt')->find($uid);
    if (empty($user)) {
        $user['score'] = 0;
        $user['groupname'] = '超级管理员';
    }
    $user['forum_num'] = M('forum')->where(array("userid" => $uid, "status" => 1))->count();  //用户发布的论坛主题数量
    $user['article_num'] = M('article')->where(array("userid" => $uid, "status" => 1))->count();  //用户发布的文章数量
    $user['topic_num'] = M('topic')->where(array("userid" => $uid, "status" => 1))->count();  //用户发布的话题数量
    $user['comment_num'] = M('comment')->where("userid=$uid")->count();  //用户文章评论数量
    $user['forum_replynum'] = M('forum_reply')->where("userid=$uid")->count();  //用户论坛回复数量
    if ($user) {
        $res = $user;
    }
    return $res;
}

function get_comment($id = 0, $mid = 0)
{
    $count = 0;
    if ($id > 0 && $mid > 0) {
        $map['postid'] = $id;
        $map['modelid'] = $mid;
        $count = M('comment')->where($map)->count();
    }
    return $count;
}

function get_comlist($mid = 0, $num = 10)
{
    $list = array();
    if ($mid > 0) {
        $map['modelid'] = $mid;
        $list = D('CommentView')->where($map)->order('id desc')->limit($num)->select();
    } else {
        $list = D('CommentView')->order('id desc')->limit($num)->select();
    }
    return $list;
}

function get_comment_info($id = 0, $mid = 0)
{
    //$content = '';
    $list = array();
    if ($id > 0 && $mid > 0) {
        $map['postid'] = $id;
        $map['modelid'] = $mid;
        $list = D('CommentView')->where($map)->order('id desc')->find();
        /*if($list){
            $content = $list['content'];
        }*/

    }

    return $list;
}

function get_arcticle($id = 0, $mid = 0)
{
    $content = array();
    if ($mid && $id) {
        $tablename = M('model')->where(array('id' => $mid))->getField('tablename');
        if ($tablename) {
            $where['id'] = $id;
            $content = D2('ArcView', $tablename)->nofield('content,pictureurls,description')->where($where)->find();
            if ($content) {
                //当前url
                $_jumpflag = ($content['flag'] & B_JUMP) == B_JUMP ? true : false;
                $content['url'] = get_content_url($content['id'], $content['cid'], $content['ename'], $_jumpflag, $content['jumpurl']);
                $content['username'] = get_username($content['userid']);
            }
        }
    }
    return $content;
}

function get_picinfo($str = '')
{
    $content = array();
    if ($str) {
        $where['title'] = array('LIKE', '%' . $str . '%');
        $content = D2('ArcView', 'picture')->nofield('content,pictureurls,description')->where($where)->find();
        if ($content) {
            //当前url
            $_jumpflag = ($content['flag'] & B_JUMP) == B_JUMP ? true : false;
            $content['url'] = get_content_url($content['id'], $content['cid'], $content['ename'], $_jumpflag, $content['jumpurl']);
        }
    }
    return $content;
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
 * 根据周期, 将租赁时间分段 返回一个数组,每个元素包含开始时间和结束时间
 * @param int $startTime 开始时间
 * @param int $endTime 结束时间
 * @param int $period 周期月数
 * @param int $initTime 初始日期
 * @return array 返回的结构
 *     [
 *       'months' => 时间段总共的月份数
 *       'days' => 余出的天数
 *       'last_segments' => [ // 按照一个月为周期分段,最后一段的日期 主要用于计算金额
 *         'start_time' => '',
 *         'end_time' => ''
 *       ],
 *       'segments' => [ // 按照传入的周期分段之后的各个时间段
 *         [
 *           'start_time' => '',
 *           'end_time' => ''
 *         ]
 *       ]
 *     ]
 * User: hjun
 * Date: 2018-04-23 00:46:41
 * Update: 2018-04-23 00:46:41p
 * Version: 1.00
 */
function getSegmentDateByPeriod($startTime = 0, $endTime = 0, $period = 1, $initTime = null)
{
    $startTime = strtotime(date('Y-m-d', $startTime));
    $endTime = strtotime(date('Y-m-d', $endTime));
    // 循环进行分段 这里都默认1个月为周期 分完之后再根据period进行合并 直到结束时间为止
    $i = 1;
    $list = [];
    $days = 0;
    do {
        $item = [];
        // 开始时间为上一个时间段的结束时间加1天
        $item['start_time'] = $i == 1 ? $startTime : $list[$i - 2]['end_time'] + 3600 * 24;
        $item['start_time_str'] = date('Y-m-d', $item['start_time']);
        // 结束时间为下一个时间段的开始时间减1天
        $item['end_time'] = (getNextPeriodDate($startTime, $i * 1, $initTime) - 3600 * 24);
        if ($item['end_time'] > $endTime) {
            $item['end_time'] = $endTime;
            $i--;
            $days = getDaysByStartAndEnd($item['start_time'], $item['end_time']);
        }
        $item['end_time_str'] = date('Y-m-d', $item['end_time']);
        $list[] = $item;
        $i++;
    } while ($item['end_time'] < $endTime);
    $data = [];
    $data['months'] = ($i - 1) * 1;
    $data['days'] = $days;
    $data['last_segments'] = $list[count($list) - 1];
    // 如果周期大于1月 要循环将时间段按周期合并
    if ($period > 1) {
        $total = $days > 0 ? $data['months'] + 1 : $data['months'];
        $count = ceil($total / $period);
        $newList = [];
        // 最后一个分段的索引
        $lastIndex = count($list) - 1;
        for ($i = 0; $i < $count; $i++) {
            $item = [];
            $startIndex = $i * $period;
            $endIndex = $startIndex + $period - 1;
            $endIndex = $endIndex > $lastIndex ? $lastIndex : $endIndex;
            $item['start_time'] = $list[$startIndex]['start_time'];
            $item['start_time_str'] = $list[$startIndex]['start_time_str'];
            $item['end_time'] = $list[$endIndex]['end_time'];
            $item['end_time_str'] = $list[$endIndex]['end_time_str'];
            $newList[] = $item;
        }
        $list = $newList;
    }
    $data['segments'] = $list;
    return $data;
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
 * 获取合同分段的总费用
 * @param array $segment 合同分段数据
 * @param double $avgFee 平均每月的费用
 * @param int $initTime 初始日期
 * @param string $type 计算类型 month-按月计算；day-按天计算($avgFee认为是每天金额)；
 * @return array 返回结构中 total => 总金额, diff => 日期差
 * User: hjun
 * Date: 2018-04-23 10:18:15
 * Update: 2018-04-23 10:18:15
 * Version: 1.00
 */
function getContractSegmentTotalFee($segment = [], $avgFee = 0.00, $initTime = null, $type = 'month')
{
    $avgFee = abs($avgFee);
    $diff = getSegmentDateByPeriod($segment['start_time'], $segment['end_time'], 1, $initTime);
    switch ($type) {
        case 'day':
            $days = getDaysByStartAndEnd($segment['start_time'], $segment['end_time']);
            $totalRental = $days * $avgFee;
            break;
        default:
            if ($diff['days'] > 0) {
                // 如果有余出的天数 根据最后的时间段 计算金额
                $totalRental = $avgFee * $diff['months'];
                $lastSegment = $diff['last_segments'];
                $totalRental += getTotalFeeByStartAndEnd($lastSegment['start_time'], $lastSegment['end_time'], $avgFee);
            } else {
                $totalRental = $avgFee * $diff['months'];
            }
            break;
    }

    return ['total' => $totalRental, 'diff' => $diff];
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
 * 获取某个账单的收租日期
 * @param array $bill 账单数据
 *     主要需要的数据为:
 *       start_time 账单的开始时间
 * @param array $data 合同数据
 *     主要需要的数据为：
 *       collect_rental_type收租方式 advanced_days提前天数 fixed_pay_date固定日期
 *       start_time 合同的开始时间
 * @return int
 * User: hjun
 * Date: 2018-04-23 01:23:18
 * Update: 2018-04-23 01:23:18
 * Version: 1.00
 */
function getBillOughtPayTime($bill = [], $data = [])
{
    $data['collect_rental_type'] = 0;
    $data['advanced_days'] = 0;
    switch ((int)$data['collect_rental_type']) {
        case \Common\Model\ContractModel::COLLECT_TYPE_ADVANCED:
            $time = strtotime("-{$data['advanced_days']} day", $bill['start_time']);
            $time = $time < $data['start_time'] ? $data['start_time'] : $time;
            break;
        case \Common\Model\ContractModel::COLLECT_TYPE_FIX:
            $str = date('Y-m-d', $bill['start_time']);
            list($year, $month, $day) = explode('-', $str);
            $oughtYear = $year;
            $oughtMonth = $month;
            $oughtDay = $data['fixed_pay_date'];
            if ($data['fixed_pay_date'] >= $day) {
                $oughtMonth = $month - 1;
                if ($oughtMonth <= 0) {
                    $oughtMonth = 12;
                    $oughtYear--;
                }
            }
            $time = strtotime("{$oughtYear}-{$oughtMonth}-{$oughtDay}");
            $time = $time < $data['start_time'] ? $data['start_time'] : $time;
            break;
        default:
            $time = 0;
            break;
    }
    return $time;
}

/**
 * 获取账单的某个项目在时间段内的总金额
 * @param int $index 当前是第几个账单
 * @param array $timeSegmentData 当前的时间分段数据
 *     主要数据如下:
 *       - ['days'=>, 'months'=>, 'segments'=>, 'last_segments'=>]
 * @param array $bill 账单数据
 * @param array $contractSegment 当前时间分段所在的合同分段信息
 * @param int $avgFee 项目的平均每个月的费用
 * @return double
 * User: hjun
 * Date: 2018-04-23 03:41:09
 * Update: 2018-04-23 03:41:09
 * Version: 1.00
 */
function getBillItemTotalFee($index = 0, $timeSegmentData = [], $bill = [], $contractSegment = [], $avgFee = 0)
{
    $billNum = count($timeSegmentData['segments']);
    if (($timeSegmentData['days'] <= 0 && $timeSegmentData['months'] % $contractSegment['pay_period'] == 0) ||
        $index != $billNum - 1) {
        // 如果时间分段之后,计算出来的时长没有余数,则项目的总费用就是平均*周期费
        // 如果账单不是最后一个账单,总费用也是平均*周期费
        $totalRental = $avgFee * $contractSegment['pay_period'];
    } else {
        // 如果是最后一个账单
        $months = $timeSegmentData['months'] % $contractSegment['pay_period'];
        $totalRental = $avgFee * $months;
        // 如果天数有余数 要做计算
        if ($timeSegmentData['days'] > 0) {
            $lastSegment = $timeSegmentData['last_segments'];
            $totalRental += getTotalFeeByStartAndEnd($lastSegment['start_time'], $lastSegment['end_time'], $avgFee);
        }
    }
    return $totalRental;
}

/**
 * 获取账单的总金额以及费用项目
 * @param int $index 时间分段中的的第几个账单
 *     知道是第几个账单,就可以正确的判断时间分段的时长
 *       - 如果时间分段为['1.28-2.27', '2.28-3.27', '3.28-4.27']
 *         第二个分段的时间为2.28-3.27,很显然,在时间分段中该时段的时长为1个月,但是如果单独计算,时长为28天
 *         因此可以通过$index直接得出不是最后一个分段的账单时长都为1个月
 * @param array $timeSegmentData 当前的时间分段数据
 *     主要数据如下:
 *       - ['days'=>, 'months'=>, 'segments'=>, 'last_segments'=>]
 * @param array $bill 账单数据
 *     主要需要的数据为:
 *       - start_time账单的开始时间
 * @param array $contractSegment 当前账单所在的合同分段的信息
 *     主要需要的数据为:
 *       - month_rental月租金
 * @param array $data 合同数据
 *     主要需要的数据为:
 *       - start_time合同开始时间 deposit押金 charging_info杂费
 * @return array
 * User: hjun
 * Date: 2018-04-23 01:46:34
 * Update: 2018-04-23 01:46:34
 * Version: 1.00
 */
function getBillTotalFeeAndFeeItems($index = 0, $timeSegmentData = [], $bill = [], $contractSegment = [], $data = [])
{
    $feeItems = [];
    // 押金 第一笔账单要计算押金
    $deposit = 0;
    if ($bill['start_time'] == $data['start_time']) {
        $deposit = $data['deposit'];
        $feeItems[] = [
            'item_id' => YA_JIN,
            'item_name' => '房间押金',
            'fee_type' => FEE_INCOME,
            'fee' => $data['deposit']
        ];
    }

    // 计算总租金
    $monthRental = $contractSegment['month_rental'];
    $totalRental = getBillItemTotalFee($index, $timeSegmentData, $bill, $contractSegment, $monthRental);
    $totalRental = rentalToRound($totalRental);
    $feeItems[] = [
        'item_id' => ZU_JIN,
        'item_name' => '房间租金',
        'fee_type' => FEE_INCOME,
        'fee' => $totalRental
    ];
    // 计算总管理费
    $monthProperty = $contractSegment['month_property'];
    $totalProperty = getBillItemTotalFee($index, $timeSegmentData, $bill, $contractSegment, $monthProperty);
    $totalProperty = propertyToRound($totalProperty);
    $feeItems[] = [
        'item_id' => PROPERTY_FEE,
        'item_name' => '物业管理费',
        'fee_type' => FEE_INCOME,
        'fee' => $totalProperty
    ];

    // 计算杂费 按月收费的才计算
    $chargingFee = 0;
    $chargingInfo = json_decode($data['charging_info'], true);
    foreach ($chargingInfo as $charge) {
        switch ((int)$charge['charge']) {
            case 0:
                // 按月收费
                $fee = $charge['fee'];
                break;
            case 1:
                // 按平方每月收费
                $room = D('Room')->getRoom($bill['factory_id'], $bill['room_id']);
                $fee = $room['room_area'] * $charge['fee'];
                break;
            default:
                $fee = 0;
                break;
        }
        $itemFee = getBillItemTotalFee($index, $timeSegmentData, $bill, $contractSegment, $fee);
        $chargingFee += $itemFee;
        $feeItems[] = [
            'item_id' => $charge['item_id'],
            'item_name' => $charge['item_name'],
            'fee_type' => FEE_INCOME,
            'fee' => $itemFee
        ];
    }

    $data = [];
    $data['total_fee'] = round($deposit + $totalRental + $totalProperty + $chargingFee, 2);
    $data['fee_items'] = $feeItems;
    return $data;
}

/**
 * 根据合同的数据生成所有账单
 *
 * 生成规则:
 * 1. 每个分段按照每个分段设置的支付周期生成相应周期的账单,分段周期不足支付周期时,按分段周期生成账单
 * 2. 每个账单的收租日期为账单开始日期提前的设置的收租日,例如：账单周期为2018.01.15 ~ 2018.02.14,固定收租日为15日,则收租日期为2017.12.15
 * 3. 每个账单的金额
 *    第一笔账单 => (月租金 + 杂费) * 支付周期 + 押金
 *    之后的每笔账单 => 租金 + 杂费
 * @param int $factoryId
 * @param int $contractId 合同ID
 * @param array $data 合同数据
 *     主要需要的数据为
 *       - 支付周期$data['pay_period'],分段信息$data['segments_info'],杂费信息$data['charging_info']
 *       - 收租方式$data['collect_rental_type'] $data['advanced_days'] $data['fixed_pay_date']
 * @param int $action 操作类型 0-签约 1-未收租修改 2-已收租修改 3-续租
 * @return array 所有账单的二维数组
 * User: hjun
 * Date: 2018-04-20 10:27:51
 * Update: 2018-04-20 10:27:51
 * Version: 1.00
 */
function buildBill($factoryId = 0, $contractId = 0, $data = [], $action = \Common\Model\ContractModel::ACTION_ADD)
{
    return buildBills($factoryId, $contractId, $data, $action);
}

/**
 * 根据账单生成索引
 * @param int $firstBillId
 * @param array $billList
 * @param string $key
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-05-22 16:58:17
 * Update: 2018-05-22 16:58:17
 * Version: 1.00
 */
function buildChargingIndex($firstBillId = 0, $billList = [], $key = 'bill_id')
{
    $list = [];
    foreach ($billList as $bill) {
        $charges = json_decode($bill['fee_items'], 1);
        if (!empty($charges)) {
            $item = [];
            $item[$key] = isset($bill['bill_id']) ? $bill['bill_id'] : $firstBillId++;
            $item['factory_id'] = isset($bill['factory_id']) ? $bill['factory_id'] : 0;
            foreach ($charges as $charge) {
                $item['item_id'] = $charge['item_id'];
                $item['item_name'] = $charge['item_name'];
                $list[] = $item;
            }
        }
    }
    return $list;
}

/**
 * 根据账单列表生成账单和收费项的索引
 * @param int $firstBillId 第一个账单ID
 * @param array $billList 账单列表
 * @return array
 * User: hjun
 * Date: 2018-04-23 04:43:27
 * Update: 2018-04-23 04:43:27
 * Version: 1.00
 */
function buildBillChargingIndex($firstBillId = 0, $billList = [])
{
    return buildChargingIndex($firstBillId, $billList);
}

/**
 * 根据账单列表生成账单和收费项的索引
 * @param int $firstBillId 第一个账单ID
 * @param array $billList 账单列表
 * @return array
 * User: hjun
 * Date: 2018-04-23 04:43:27
 * Update: 2018-04-23 04:43:27
 * Version: 1.00
 */
function buildPublicBillChargingIndex($firstBillId = 0, $billList = [])
{
    return buildChargingIndex($firstBillId, $billList, 'public_bill_id');
}

/**
 * 获取存入房间表的合同快照
 * @param array $data 插入合同表表的对象
 *     主要需要的数据：
 *       'customer_name', 'customer_mobile', 'reminder_mobile', 'start_time', 'end_time'
 * @param array $billList 账单列表
 * @return array
 * User: hjun
 * Date: 2018-04-20 10:31:27
 * Update: 2018-04-20 10:31:27
 * Version: 1.00
 */
function getContractSnapShoot($data = [], $billList = [])
{
    $shoot = [];
    // 租客名称 租客手机 提醒手机号 合同开始时间 合同结束时间
    $fields = ['customer_name', 'customer_mobile', 'customer_mobile_2', 'reminder_mobile', 'contract_id', 'contract_status', 'process_status'];
    mergeArray($shoot, $data, $fields);
    $shoot['contract_start_time'] = $data['start_time'];
    $shoot['contract_end_time'] = $data['end_time'];
    if (!empty($billList)) {
        $minTime = NOW_TIME;
        foreach ($billList as $bill) {
            if ($bill['ought_pay_time'] < $minTime) {
                $minTime = $bill['ought_pay_time'];
            }
        }
        $shoot['next_rental_time'] = $minTime; // 下次收租日
    }
    return $shoot;
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
 * 判断是否是商城组的管理员
 * @param array $admin
 * @return boolean
 * User: hjun
 * Date: 2018-04-28 09:22:41
 * Update: 2018-04-28 09:22:41
 * Version: 1.00
 */
function isMallGroupAdmin($admin = [])
{
    return $admin['usertype'] == MALL_SUPER_ADMIN;
}

/**
 * 获取商城组管理员选择进入的工厂ID
 * @return int
 * User: hjun
 * Date: 2018-04-28 09:23:54
 * Update: 2018-04-28 09:23:54
 * Version: 1.00
 */
function getGroupAdminSelectMallId()
{
    $sessionId = session_id();
    $mallId = S("checked/{$sessionId}");
    return empty($mallId) ? 0 : $mallId;
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
 * 获取合并信息房间的查询field语句
 * @param string $alias 房间表的别名
 * @param string $mainAlias 主房间表的别名
 * @param string $childAlias 子房间表的别名
 * @return string {房间名},{房间面积},{出租状态}@{房间名},{房间面积},{出租状态}
 * User: hjun
 * Date: 2019-04-12 13:06:09
 * Update: 2019-04-12 13:06:09
 * Version: 1.00
 */
function getMergeInfoField($alias = 'a', $mainAlias = 'd', $childAlias = 'c')
{
    $alias = empty($alias) ? '' : "{$alias}.";
    $roomSuffix = ROOM_SUFFIX;
    $mainAlias = empty($mainAlias) ? 'd' : $mainAlias;
    $childAlias = empty($childAlias) ? 'c' : $childAlias;
    $separator = '|';
    $mergeInfo = "CASE
           WHEN {$alias}is_merge = 1 AND {$alias}merge_pid = 0
               THEN (select GROUP_CONCAT(CONCAT({$childAlias}.room_name, '{$roomSuffix}', '{$separator}', {$childAlias}.room_area, '{$separator}', {$childAlias}.rent_status, '{$separator}', {$childAlias}.facility_name) SEPARATOR '@')
                     from wjd_room {$childAlias}
                     WHERE {$childAlias}.merge_pid = {$alias}room_id
                       AND {$childAlias}.is_delete = 0)
           WHEN {$alias}is_merge = 1 AND {$alias}merge_pid > 0
               THEN ((select GROUP_CONCAT(CONCAT({$mainAlias}.room_name, '{$roomSuffix}', '{$separator}', {$mainAlias}.room_area, '{$separator}', {$mainAlias}.rent_status, '{$separator}', {$mainAlias}.facility_name) SEPARATOR '@')
                      from wjd_room {$mainAlias}
                      WHERE {$mainAlias}.room_id = {$alias}merge_pid
                        AND {$mainAlias}.is_delete = 0))
           ELSE '' END                                                                      room_merge_info";
    return $mergeInfo;
}

/**
 * 获取会员的租房信息
 * @param int $factoryId
 * @param string $memberAlias
 * @param string $contractAlias
 * @return string {楼宇名称},{房间名称},{租客名称}@{楼宇名称},{房间名称},{租客名称}
 * User: hjun
 * Date: 2019-04-16 00:51:50
 * Update: 2019-04-16 00:51:50
 * Version: 1.00
 */
function getMemberRentInfoField($factoryId = 0, $memberAlias = 'a', $contractAlias = 'b')
{
    $memberAlias = empty($memberAlias) ? '' : "{$memberAlias}.";
    $contractAlias = empty($contractAlias) ? 'b' : $contractAlias;
    $info = "CASE
           WHEN {$memberAlias}mobile != ''
               THEN
               (select IFNULL(GROUP_CONCAT(CONCAT({$contractAlias}.building_name, ',', {$contractAlias}.room_name, ',', {$contractAlias}.customer_name) SEPARATOR '@'), '')
                from wjd_contract {$contractAlias}
                WHERE {$contractAlias}.is_delete = 0
                  AND {$contractAlias}.factory_id = {$factoryId}
                  AND {$contractAlias}.contract_status = 1
                  AND {$contractAlias}.customer_mobile = {$memberAlias}mobile)
           ELSE '' END                            rent_info";
    return $info;
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
 * 获取费用JSON
 * @param $feeItems
 * @param boolean $isEviction 是否是退租
 * @return string
 * User: hjun
 * Date: 2018-05-10 15:07:25
 * Update: 2018-05-10 15:07:25
 * Version: 1.00
 */
function getFeeItemsByRequest($feeItems, $isEviction = false)
{
    $items = [];
    foreach ($feeItems as $item) {
        $item['fee'] = abs($item['fee']);
        // 退租时去除掉抄表费用的标志
        if ($isEviction) {
            unset($item['is_meter_type']);
        }
        if (isMeterTypeByItemId($item['item_id'])) {
            $item['time'] = str_to_time($item['time']);
            $item['last_time'] = str_to_time($item['last_time']);
        }
        $items[] = $item;
    }
    if (empty($items)) {
        return '';
    }
    return json_encode($items, JSON_UNESCAPED_UNICODE);
}

/**
 * 获取费用的总和
 * @param array $items
 * @return double
 * User: hjun
 * Date: 2018-05-10 15:03:45
 * Update: 2018-05-10 15:03:45
 * Version: 1.00
 */
function getTotalFeeByItems($items = [])
{
    $total = 0;
    foreach ($items as $item) {
        $item['fee'] = abs($item['fee']);
        if (!empty($item['fee'])) {
            if ($item['fee_type'] == FEE_COST) {
                $total -= ($item['fee']);
            } else {
                $total += ($item['fee']);
            }
        }
    }
    return round($total, 2);
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
 * 根据账单的杂费数组 获取 流水列表
 * @param array $feeItems 费用数据
 * @param array $item 一些固定的数据
 * @param string $transPrefix 编号的前缀
 * @param string $transId 编号
 * @param array $request 其他参数 费用或服务费
 * @param string $documentNoPrefix 单据编号前缀
 * @param int $documentNoSuffix 单据编号后缀
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-05-13 15:45:29
 * Update: 2018-05-13 15:45:29
 * Version: 1.00
 */
function getTradesByFeeItems($feeItems = [], $item = [], $transPrefix = '', $transId = null, $request = [], $documentNoPrefix = '', $documentNoSuffix = 1)
{
    $data = [];
    foreach ($feeItems as $k => $fee) {
        $feeDocumentNoSuffix = $documentNoSuffix + $k;
        $feeDocumentNoSuffix = str_pad($feeDocumentNoSuffix, 4, 0, STR_PAD_LEFT);
        $item['document_no'] = $documentNoPrefix . $feeDocumentNoSuffix;
        $item['transaction_id'] = isset($transId) ? $transId : $transPrefix . \Org\Util\TPString::randString(6, 1);
        $item['item_id'] = $fee['item_id'];
        $item['item_name'] = $fee['item_name'];
        $item['flow_type'] = $fee['fee_type'];
        if (isset($request['fee'])) {
            $fee['fee'] = $request['fee'];
        }
        $item['fee'] = $fee['fee_type'] == FEE_COST ? -1 * abs($fee['fee']) : abs($fee['fee']);
        if (isset($request['service_fee'])) {
            $item['service_fee'] = $request['service_fee'];
        } else {
            $item['service_fee'] = 0;
        }
        $data[] = $item;
    }
    return $data;
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
 * 判断费用项目是否是抄表费用
 * @param int $itemId
 * @return boolean
 * User: hjun
 * Date: 2019-09-27 14:42:20
 * Update: 2019-09-27 14:42:20
 * Version: 1.00
 */
function isMeterTypeByItemId($itemId = 0)
{
    return in_array($itemId, [METER_FEE_WATER, METER_FEE_POWER, METER_FEE_POWER_2]);
}

/**
 * 根据费用ID获取对应的抄表类型
 * @param int $itemId
 * @return int
 * User: hjun
 * Date: 2019-10-16 10:40:50
 * Update: 2019-10-16 10:40:50
 * Version: 1.00
 */
function getMeterTypeByItemId($itemId = METER_FEE_POWER)
{
    switch ($itemId) {
        case METER_FEE_POWER:
        case METER_FEE_POWER_2:
            $type = 2;
            break;
        default:
            $type = 1;
            break;
    }
    return $type;
}

/**
 * 检查费用信息
 * @param array $feeItems
 * @return array
 * User: hjun
 * Date: 2018-05-13 16:55:37
 * Update: 2018-05-13 16:55:37
 * Version: 1.00
 */
function checkFeeItems($feeItems = [])
{
    if (empty($feeItems)) {
        return getReturn(CODE_ERROR, '请设置账单的费用信息');
    }
    $first = $feeItems[0];
    if (isMeterTypeByItemId($first['item_id'])) {
        $schema = getDefaultData("json/contract/fee_items_meter_type_{$first['item_id']}_schema");
    } else {
        $schema = getDefaultData('json/contract/fee_items_schema');
    }
    $validate = new \JsonSchema\Validator();
    $validate->check($feeItems, $schema);
    if (!$validate->isValid()) {
        $errors = $validate->getErrors();
        $message = "{$errors[0]['property']}:{$errors[0]['message']}";
        return getReturn(CODE_ERROR, $message);
    }
    return getReturn(CODE_SUCCESS);
}

/**
 * 根据itemId获取抄表默认名称
 * @param int $itemId
 * @return int
 * User: hjun
 * Date: 2019-09-26 11:31:32
 * Update: 2019-09-26 11:31:32
 * Version: 1.00
 */
function getMeterNameByItemId($itemId = 0)
{
    switch ($itemId) {
        case METER_FEE_POWER:
            $result = '普通电表';
            break;
        case METER_FEE_POWER_2:
            $result = '复费率电表';
            break;
        default:
            $result = '水表';
            break;
    }
    return $result;
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
 * 检查续租的分段
 * @param array $segments
 * @return boolean
 * User: hjun
 * Date: 2018-05-15 09:12:58
 * Update: 2018-05-15 09:12:58
 * Version: 1.00
 */
function checkReletSegmentsNum($segments = [])
{
    $num = 0;
    foreach ($segments as $segment) {
        if ($segment['relet'] == 1) {
            $num++;
        }
    }
    return $num > 0;
}

/**
 * 获取账单的总金额以及费用项目
 * @param int $index 时间分段中的的第几个账单
 *     知道是第几个账单,就可以正确的判断时间分段的时长
 *       - 如果时间分段为['1.28-2.27', '2.28-3.27', '3.28-4.27']
 *         第二个分段的时间为2.28-3.27,很显然,在时间分段中该时段的时长为1个月,但是如果单独计算,时长为28天
 *         因此可以通过$index直接得出不是最后一个分段的账单时长都为1个月
 * @param array $timeSegmentData 当前的时间分段数据
 *     主要数据如下:
 *       - ['days'=>, 'months'=>, 'segments'=>, 'last_segments'=>]
 * @param array $bill 账单数据
 *     主要需要的数据为:
 *       - start_time账单的开始时间
 * @param array $contractSegment 当前账单所在的合同分段的信息
 *     主要需要的数据为:
 *       - month_rental月租金
 * @param array $data 合同数据
 *     主要需要的数据为:
 *       - start_time合同开始时间 deposit押金 charging_info杂费
 * @return array
 * User: hjun
 * Date: 2018-04-23 01:46:34
 * Update: 2018-04-23 01:46:34
 * Version: 1.00
 */
function getReletBillTotalFeeAndFeeItems($index = 0, $timeSegmentData = [], $bill = [], $contractSegment = [], $data = [], $startTime)
{
    $feeItems = [];
    // 押金 第一笔账单要计算押金 还要计算旧押金
    $deposit = 0;
    if ($bill['start_time'] == $startTime) {
        $deposit = $data['deposit'] - $data['old_deposit'];
        $feeItems[] = [
            'item_id' => YA_JIN,
            'item_name' => '房间押金',
            'fee_type' => FEE_INCOME,
            'fee' => $data['deposit']
        ];
        $feeItems[] = [
            'item_id' => YA_JIN,
            'item_name' => '原房间押金',
            'fee_type' => FEE_COST,
            'fee' => $data['old_deposit']
        ];
    }

    // 计算总租金
    $monthRental = $contractSegment['month_rental'];
    $totalRental = getBillItemTotalFee($index, $timeSegmentData, $bill, $contractSegment, $monthRental);
    $feeItems[] = [
        'item_id' => ZU_JIN,
        'item_name' => '房间租金',
        'fee_type' => FEE_INCOME,
        'fee' => $totalRental
    ];
    // 计算总管理费
    $monthProperty = $contractSegment['month_property'];
    $totalProperty = getBillItemTotalFee($index, $timeSegmentData, $bill, $contractSegment, $monthProperty);
    $totalProperty = propertyToRound($totalProperty);
    $feeItems[] = [
        'item_id' => PROPERTY_FEE,
        'item_name' => '物业管理费',
        'fee_type' => FEE_INCOME,
        'fee' => $totalProperty
    ];

    // 计算杂费
    $chargingFee = 0;
    $chargingInfo = json_decode($data['charging_info'], true);
    foreach ($chargingInfo as $charge) {
        switch ((int)$charge['charge']) {
            case 0:
                // 按月收费
                $fee = $charge['fee'];
                break;
            case 1:
                // 按平方每月收费
                $room = D('Room')->getRoom($bill['factory_id'], $bill['room_id']);
                $fee = $room['room_area'] * $charge['fee'];
                break;
            default:
                $fee = 0;
                break;
        }
        $itemFee = getBillItemTotalFee($index, $timeSegmentData, $bill, $contractSegment, $fee);
        $chargingFee += $itemFee;
        $feeItems[] = [
            'item_id' => $charge['item_id'],
            'item_name' => $charge['item_name'],
            'fee_type' => FEE_INCOME,
            'fee' => $itemFee
        ];
    }

    $data = [];
    $data['total_fee'] = round($deposit + $totalRental + $totalProperty + $chargingFee, 2);
    $data['fee_items'] = $feeItems;
    return $data;
}

/**
 * 获取支付类型名称
 * @param $type
 * @return string
 * User: hjun
 * Date: 2018-05-16 11:16:54
 * Update: 2018-05-16 11:16:54
 * Version: 1.00
 */
function getPayTypeName($type)
{
    $billModel = D('Bill');
    switch ((int)$type) {
        case $billModel::PAY_TYPE_WX:
            $name = '微信';
            break;
        case $billModel::PAY_TYPE_ALI:
            $name = '支付宝';
            break;
        case $billModel::PAY_TYPE_BANK:
            $name = '银行';
            break;
        case $billModel::PAY_TYPE_SYSTEM:
            $name = '系统标记';
            break;
        case $billModel::PAY_TYPE_THIRD:
            $name = '第三方自动缴费';
            break;
        case $billModel::PAY_TYPE_CASH:
            $name = '现金';
            break;
        case $billModel::PAY_TYPE_ONLINE_BANK:
            $name = '银联在线支付';
            break;
        case $billModel::PAY_TYPE_REDUCE:
            $name = '减免';
            break;
        default:
            $name = '';
            break;
    }
    return $name;
}

/**
 * 获取账单类型名称
 * @param $type
 * @return string
 * User: hjun
 * Date: 2018-05-15 14:22:24
 * Update: 2018-05-15 14:22:24
 * Version: 1.00
 */
function getBillTypeName($type)
{
    $model = D('Bill');
    switch ((int)$type) {
        case $model::TYPE_CONTRACT:
            $name = '租客合同';
            break;
        case $model::TYPE_PUBLIC:
            $name = '房间公摊';
            break;
        case $model::TYPE_METER:
            $name = '电表充值';
            break;
        case $model::TYPE_PARKING:
            $name = '停车续费';
            break;
        case $model::TYPE_EVICTION:
            $name = '退租结算';
            break;
        default:
            $name = '';
            break;
    }
    return $name;
}

/**
 * 获取流水方向名称
 * @param $type
 * @return string
 * User: hjun
 * Date: 2018-05-16 14:54:58
 * Update: 2018-05-16 14:54:58
 * Version: 1.00
 */
function getFlowTypeName($type)
{
    switch ((int)$type) {
        case FEE_INCOME:
            $name = '收入';
            break;
        case FEE_COST:
            $name = '支出';
            break;
        default:
            $name = '';
            break;
    }
    return $name;
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
 * 获取导出的右侧数据
 * @param $rightData
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-05-18 15:13:32
 * Update: 2018-05-18 15:13:32
 * Version: 1.00
 */
function getExportRightData($rightData)
{
    $list = [];
    foreach ($rightData as $floor) {
        foreach ($floor['rooms'] as $room) {
            $list[] = $room;
        }
    }
    return $list;
}

/**
 * 获取发送账单的目标
 * @param array $sendObj [1, 2]  1-短信  2-微信
 * @return int 0 -短信微信都发送 1-只发微信 2-只发短信
 * User: hjun
 * Date: 2018-05-18 15:13:40
 * Update: 2018-05-18 15:13:40
 * Version: 1.00
 */
function getSendMethod($sendObj = [])
{
    if (in_array(1, $sendObj) && in_array(2, $sendObj)) {
        $method = 0;
    } elseif (in_array(1, $sendObj) && !in_array(2, $sendObj)) {
        $method = 2;
    } else {
        $method = 1;
    }
    return $method;
}

/**
 * 获取支付状态名称
 * @param $status
 * @return string
 * User: hjun
 * Date: 2018-05-18 15:41:46
 * Update: 2018-05-18 15:41:46
 * Version: 1.00
 */
function getPayStatusName($status)
{
    if ($status == \Common\Model\BillModel::STATUS_PAYED) {
        $name = '已支付';
    } else {
        $name = '未支付';
    }
    return $name;
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
 * 获取实际作用到的房间ID数组
 * @param array $roomList
 * @param array $roomIds
 * @return array
 * User: hjun
 * Date: 2018-05-22 15:36:09
 * Update: 2018-05-22 15:36:09
 * Version: 1.00
 */
function getActualRoomIds($roomList = [], $roomIds = [])
{
    $roomList = getActualRoomList($roomList, $roomIds);
    $actualRoomIds = [];
    foreach ($roomList as $room) {
        $actualRoomIds[] = $room['room_id'];
    }
    return empty($actualRoomIds) ? [] : $actualRoomIds;
}

/**
 * 获取实际作用到的房间列表
 * @param array $roomList
 * @param array $roomIds
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-05-22 16:22:01
 * Update: 2018-05-22 16:22:01
 * Version: 1.00
 */
function getActualRoomList($roomList = [], $roomIds = [])
{
    $actualRoomList = [];
    $roomModel = D('Room');
    foreach ($roomList as $room) {
        // 已租并且已选
        if ($roomModel->isRented($room) && in_array($room['room_id'], $roomIds)) {
            $actualRoomList[] = $room;
        }
    }
    return empty($actualRoomList) ? [] : $actualRoomList;
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
 * 将房间列表按照楼层分组
 * @param array $roomList
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-05-23 16:03:18
 * Update: 2018-05-23 16:03:18
 * Version: 1.00
 */
function groupRoomListByFloorId($roomList = [])
{
    return groupListByKey($roomList, 'floor_id', 'rooms');
}

/**
 * 将楼层按照楼宇分组
 * @param array $floorList
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-05-23 16:03:30
 * Update: 2018-05-23 16:03:30
 * Version: 1.00
 */
function groupFloorListByBuildingId($floorList = [])
{
    return groupListByKey($floorList, 'building_id', 'floors');
}

function calculateRoomPBFee($itemFee, $type = 0, $roomNum, $roomArea, $totalArea)
{
    if (empty($roomNum) || empty($totalArea)) {
        return 0;
    }
    if ($type == 0) {
        return round(($roomArea / $totalArea) * $itemFee, 2);
    } elseif ($type == 1) {
        return round($itemFee / $roomNum, 2);
    }
    return 0;
}

/**
 * 计算各楼层的公摊费
 * @param array $roomList
 * @param array $request
 * @return array
 * User: hjun
 * Date: 2018-05-23 16:07:10
 * Update: 2018-05-23 16:07:10
 * Version: 1.00
 */
function calculateFloorData($roomList = [], $request = [])
{
    // 获取已选房间、公摊方式、总面积、已选数量
    $selectedRooms = [];
    foreach ($roomList as $room) {
        if (in_array($room['room_id'], $request['room_ids'])) {
            $selectedRooms[] = $room;
        }
    }
    $publicType = $request['public_type'];
    $roomNum = count($selectedRooms);
    $totalArea = 0;
    foreach ($selectedRooms as $room) {
        $totalArea += $room['room_merge_area'];
    }
    // 计算每间房间的公摊额
    // 0-按面积比例 1-按平均
    // 公式：0=> (当前房间面积 / 选取总面积) * 总公摊
    // 公式：1=> 总公摊 / 已选房间数
    $roomFee = [];
    foreach ($selectedRooms as $room) {
        foreach ($request['charge_items'] as $feeItem) {
            $roomFee[$room['room_id']][$feeItem['item_id']] = calculateRoomPBFee($feeItem['fee'], $publicType, $roomNum, $room['room_merge_area'], $totalArea);
        }
    }
    // 统计应收
    $roomStatus = [];
    foreach ($roomList as $room) {
        $roomStatus[$room['room_id']] = $room;
    }
    $shouldTotal = [];
    $roomModel = D('Room');
    foreach ($roomFee as $roomId => $items) {
        $room = $roomStatus[$roomId];
        if ($roomModel->isRented($room)) {
            foreach ($items as $itemId => $fee) {
                $shouldTotal[$itemId] += $fee;
            }
        }
    }
    $data['should'] = $shouldTotal;
    $data['room'] = $roomFee;
    return $data;
    // 统计各个楼层系数 和 各个房间状态
    $coefficient = [];
    $roomStatus = [];
    foreach ($roomList as $room) {
        $coefficient[$room['floor_id']] = $room['public_coefficient'];
        $roomStatus[$room['room_id']] = $room;
    }

    // 计算总公摊系数
    $totalCoefficient = 0;
    foreach ($coefficient as $val) {
        $totalCoefficient += $val;
    }

    // 将房间按照楼层分组
    $floorList = groupRoomListByFloorId($roomList);
    // 计算层公摊额
    $floorFee = [];
    foreach ($request['charge_items'] as $charge) {
        foreach ($floorList as $floor) {
            $floorFee[$floor['floor_id']][$charge['item_id']] = ($charge['fee'] * ($coefficient[$floor['floor_id']] / $totalCoefficient));
        }
    }

    // 计算层平均公摊
    $floorAvgFee = [];
    foreach ($request['charge_items'] as $charge) {
        foreach ($floorList as $floor) {
            $denominator = 0;
            foreach ($floor['rooms'] as $room) {
                if (in_array($room['room_id'], $request['room_ids'])) {
                    $denominator += $room['room_area'] * $room['actual_days'];
                }
            }
            $floorAvgFee[$floor['floor_id']][$charge['item_id']] = empty($denominator) ? 0 : $floorFee[$floor['floor_id']][$charge['item_id']] / $denominator;
        }
    }

    // 计算房间
    $roomFee = [];
    foreach ($roomList as $room) {
        foreach ($request['charge_items'] as $charge) {
            $roomFee[$room['room_id']][$charge['item_id']] = round($floorAvgFee[$room['floor_id']][$charge['item_id']] * $room['room_area'] * $room['actual_days'], 2);
        }
    }

    // 统计应收 去除未出租的
    $shouldTotal = [];
    $roomModel = D('Room');
    foreach ($roomFee as $roomId => $items) {
        $room = $roomStatus[$roomId];
        if ($roomModel->isRented($room)) {
            foreach ($items as $itemId => $fee) {
                $shouldTotal[$itemId] += $fee;
            }
        }
    }

    $data['avg'] = $floorAvgFee;
    $data['floor'] = $floorFee;
    $data['room'] = $roomFee;
    $data['should'] = $shouldTotal;
    return $data;
}

/**
 * 生成公摊账单
 * @param int $publicBillId
 * @param array $roomList
 * @param array $request
 * @return array
 * User: hjun
 * Date: 2018-05-22 14:22:46
 * Update: 2018-05-22 14:22:46
 * Version: 1.00
 */
function buildPublicBill($publicBillId = 0, $roomList = [], $request = [])
{
    $feeData = calculateFloorData($roomList, $request);
    $roomFee = $feeData['room'];

    // 筛选房间 已选并且已租的房间生成账单
    $roomList = getActualRoomList($roomList, $request['room_ids']);

    // 计算
    $data = [];
    $keys = [
        'factory_id', 'factory_name', 'building_id', 'building_name',
        'floor_id', 'floor_name', 'room_id', 'room_name', 'contract_id',
        'actual_days', 'lessor_id', 'lessor_name',
        'factory_child_id', 'factory_child_name',
    ];
    foreach ($roomList as $room) {
        $item = [];
        mergeArray($item, $room, $keys);
        $item['bill_sn'] = getRandSnByPrefix("PBG{$room['factory_id']}B{$publicBillId}");
        $item['public_bill_id'] = $publicBillId;
        $item['bill_type'] = \Common\Model\BillModel::TYPE_PUBLIC;
        $item['is_public'] = 1;
        $item['start_time'] = str_to_time($request['start_time']);
        $item['end_time'] = str_to_time($request['end_time']);
        $item['create_time'] = NOW_TIME;
        $item['ought_pay_time'] = str_to_time($request['ought_pay_time']);
        foreach ($request['charge_items'] as $charge) {
            $feeItems = [];
            $fee = [];
            $fee['item_id'] = $charge['item_id'];
            $fee['item_name'] = $charge['item_name'];
            $fee['fee_type'] = $roomFee[$room['room_id']][$charge['item_id']] > 0 ? FEE_INCOME : FEE_COST;
            $fee['fee'] = abs($roomFee[$room['room_id']][$charge['item_id']]);
            $feeItems[] = $fee;
            $item['fee_items'] = json_encode($feeItems, JSON_UNESCAPED_UNICODE);
            $item['item_id'] = $fee['item_id'];
            $item['fee_type'] = $fee['fee_type'];
            $item['payee'] = $request['payee'] == 1 ? 1 : 0;
            $item['total_fee'] = getTotalFeeByItems($feeItems);
            $item['wait_pay_fee'] = abs($item['total_fee']);
            $data[] = $item;
        }
    }

    return $data;
}

/**
 * 获取费用的名称
 * @param array $items
 * @return string
 * User: hjun
 * Date: 2018-05-10 15:03:45
 * Update: 2018-05-10 15:03:45
 * Version: 1.00
 */
function getFeeItemsStr($items = [])
{
    $str = [];
    foreach ($items as $item) {
        if (!empty($item['item_name'])) {
            $str[] = $item['item_name'];
        }
    }
    return implode(',', $str);
}

/**
 * 获取管理员账号类型
 * @param $type
 * @return string
 * User: hjun
 * Date: 2018-05-24 18:38:08
 * Update: 2018-05-24 18:38:08
 * Version: 1.00
 */
function getAdminTypeName($type)
{
    $userTypeName = [
        FACTORY_ADMIN => '工厂后台账号',
        SUPER_CHILD_ADMIN => '总后台员工账号',
        SUPER_ADMIN => '总后台账号'
    ];
    return $userTypeName[$type];
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

/**
 * 获取第一缴费周期和金额
 * @param $billList
 * @return array (start_time end_time first_fee)
 * User: hjun
 * Date: 2018-07-26 12:03:57
 * Update: 2018-07-26 12:03:57
 * Version: 1.00
 */
function getFirstBillFeeAndPeriod($billList)
{
    $firstBill = [];
    foreach ($billList as $bill) {
        $items = json_decode($bill['fee_items'], true);
        $fee = [];
        foreach ($items as $item) {
            $fee[$item['item_id']] = $item;
        }
        if ($fee[ZU_JIN]['fee'] > 0) {
            $firstBill = $bill;
            $firstBill['first_fee'] = $fee[ZU_JIN]['fee'] + $fee[PROPERTY_FEE]['fee'];
            break;
        }
    }
    return $firstBill;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//region ////////////////////////////////////////合同签约、编辑、续租操作相关逻辑代码//////////////////////////////////////////

/**
 * 获取第一笔物业账单
 * @param array $bills
 * @return array
 * User: hjun
 * Date: 2018-09-03 15:53:28
 * Update: 2018-09-03 15:53:28
 * Version: 1.00
 */
function getFirstPropertyBill($bills = [])
{
    // 找到第一个有物业费的账单
    foreach ($bills as $bill) {
        $feeItem = jsonDecodeToArr($bill['fee_items']);
        if (count($feeItem) === 1 && $feeItem[0]['item_id'] == PROPERTY_FEE && $feeItem[0]['fee'] > 0) {
            return $bill;
        }
    }
    return [];
}

/**
 * 获取第一笔租金账单
 * @param array $bills
 * @return array
 * User: hjun
 * Date: 2018-09-03 15:56:45
 * Update: 2018-09-03 15:56:45
 * Version: 1.00
 */
function getFirstRentBill($bills = [])
{
    if (count($bills) === 1) {
        return $bills[0];
    }
    foreach ($bills as $key => $bill) {
        $feeItem = jsonDecodeToArr($bill['fee_items']);
        // 保留第一笔账单
        if (!isset($firstItems)) {
            $firstItems = $feeItem;
        }
        foreach ($feeItem as $item) {
            // 如果第一笔账单有租金 则直接返回即可
            if ($key === 0 && $item['item_id'] == ZU_JIN && $item['fee'] > 0) {
                return $bill;
            }

            // 如果第一笔没有租金 则找到第一笔有租金的 把租金费用合并到首期费用
            if ($item['item_id'] == ZU_JIN && $item['fee'] > 0) {
                foreach ($firstItems as &$firstItem) {
                    if ($firstItem['item_id'] == ZU_JIN) {
                        $firstItem['fee'] = $item['fee'];
                        break;
                    }
                }
                $bill['fee_items'] = jsonEncode($firstItems);
                return $bill;
            }
        }
    }
    return [];
}

/**
 * 获取总额
 * @param array $firstBills
 * @return double
 * User: hjun
 * Date: 2018-09-03 17:02:03
 * Update: 2018-09-03 17:02:03
 * Version: 1.00
 */
function getFirstTotal($firstBills = [])
{
    $total = 0;
    foreach ($firstBills as $bill) {
        if (!empty($bill)) {
            $feeItems = jsonDecodeToArr($bill['fee_items']);
            foreach ($feeItems as $item) {
                if ($item['fee_type'] == FEE_INCOME) {
                    $total += $item['fee'];
                } elseif ($item['fee_type'] == FEE_COST) {
                    $total -= $item['fee'];
                }
            }
        }
    }
    return $total;
}

/**
 * 获取首期缴费项目描述
 * @param array $firstBills
 * @return string
 * User: hjun
 * Date: 2018-09-03 17:18:15
 * Update: 2018-09-03 17:18:15
 * Version: 1.00
 */
function getFirstFeeItemsDesc($firstBills = [])
{
    $diffField = getDiffSegmentTypeFieldsData();
    $desc = [
        YA_JIN => '',
    ];
    foreach ($diffField as $value) {
        $desc[$value['item_id']] = '';
    }
    foreach ($firstBills as $bill) {
        if (!empty($bill)) {
            $feeItems = jsonDecodeToArr($bill['fee_items']);
            // 合并相同的费用
            $items = [];
            foreach ($feeItems as $item) { //
                if (!isset($items[$item['item_id']])) {
                    $items[$item['item_id']] = $item;
                } else {
                    if ($item['fee_type'] == FEE_COST) {
                        $items[$item['item_id']]['fee'] -= $item['fee'];
                    } elseif ($item['fee_type'] == FEE_INCOME) {
                        $items[$item['item_id']]['fee'] += $item['fee'];
                    }
                }
            }
            foreach ($items as $item) {
                if ($item['item_id'] == YA_JIN) {
                    $desc[YA_JIN] = "履约保证金￥{$item['fee']}元";
                } elseif (in_array($item['item_id'], [YA_JIN_PROPERTY, YA_JIN_SERVICE, YA_JIN_MAINTAIN])) {
                    $name = str_replace('押金', '保证金', $item['item_name']);
                    $desc[] = "{$name}￥{$item['fee']}元";
                } elseif ($item['item_id'] == ZU_JIN) {
                    $desc[ZU_JIN] = "租金￥{$item['fee']}元";
                } elseif ($item['item_id'] == PROPERTY_FEE) {
                    $desc[PROPERTY_FEE] = "物业管理费￥{$item['fee']}元";
                } else {
                    $desc[] = "{$item['item_name']}￥{$item['fee']}元";
                }
            }
        }
    }
    foreach ($desc as $key => $value) {
        if (empty($value)) {
            unset($desc[$key]);
        }
    }
    return empty($desc) ? '' : implode('，', $desc);
}

/**
 * 获取第一缴费周期的文字描述
 * @param array $contract
 * @param $action
 * @param string $payee 收款方 ''-全部；0-出租方；1-服务方
 * @return string
 * User: hjun
 * Date: 2018-09-03 15:04:00
 * Update: 2018-09-03 15:04:00
 * Version: 1.00
 */
function getFirstBillDesc($contract = [], $action, $payee = '')
{
    $diffField = getDiffSegmentTypeFieldsData();
    $bills = buildBills($contract['factory_id'], $contract['contract_id'], $contract, $action, ['build_payee' => $payee]);
    // 获取首期收费的账单
    $firstBills = [];
    foreach ($bills as $bill) {
        if ($bill['is_first'] == 1) {
            $firstBills[] = $bill;
        }
    }
    // 查找一下是否存在分段的账单，不存在说明首期是免金额，就得找出第一个有金额的值，作为首期收费金额
    foreach ($diffField as $value) {
        $hasBill = false;
        foreach ($firstBills as $bill) {
            if ($bill['item_id'] == $value['item_id']) {
                $hasBill = true;
                break;
            }
        }
        if (!$hasBill) {
            foreach ($bills as $bill) {
                if ($bill['item_id'] == $value['item_id']) {
                    array_unshift($firstBills, $bill);
                    break;
                }
            }
        }
    }
    $total = getFirstTotal($firstBills);
    $allItemsDesc = getFirstFeeItemsDesc($firstBills);
    $model = D('ContractTpl');
    $chineseTotal = $model->toChineseNumber($total);
    $desc = '合计人民币{$TOTAL}￥' . $total . '元（其中{$FEE_ITEMS}）';
    $desc = str_replace('{$TOTAL}', $chineseTotal, $desc);
    $desc = str_replace('{$FEE_ITEMS}', $allItemsDesc, $desc);
    return $desc;
}

/**
 * 时间格式化
 * @param $format
 * @param $time
 * @return string
 * User: hjun
 * Date: 2018-08-31 21:56:49
 * Update: 2018-08-31 21:56:49
 * Version: 1.00
 */
function formatTime($format, $time)
{
    if (empty($time)) {
        return '';
    }
    return date($format, $time);
}

/**
 * 检查分段的时间连续性 以及 金额的正确性
 * @param array $segments
 * @param string $segmentType 分段类型
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-08-21 22:42:32
 * Update: 2018-08-21 22:42:32
 * Version: 1.00
 */
function checkSegmentsTimeAndValue($segments = [], $segmentType = SEGMENT_TYPE_RENT)
{
    $segmentTypeField = getDiffSegmentTypeFieldsData();
    $name = $segmentTypeField[$segmentType]['name'];
    $valueField = $segmentTypeField[$segmentType]['value'];
    if (!empty($segments)) {
        $model = M('');
        foreach ($segments as $key => $segment) {
            $segmentName = $name . ($key + 1);
            // 检查分段的开始时间和结束时间
            $start = strtotime(date('Y-m-d', str_to_time($segment['start_time'])));
            if ($start <= 0) return getReturn(CODE_ERROR, "请选择{$segmentName}的开始时间");
            $end = strtotime(date('Y-m-d', str_to_time($segment['end_time'])));
            if ($end <= 0) return getReturn(CODE_ERROR, "请选择{$segmentName}的结束时间");
            if ($start > $end) return getReturn(CODE_ERROR, "{$segmentName}的时间范围错误");
            // 如果分段大于1 则其开始时间必须是上一段的结束时间+1天
            if ($key > 0) {
                $shouldStart = str_to_time($segments[$key - 1]['end_time']) + 24 * 3600;
                if ($start != $shouldStart) {
                    return getReturn(CODE_ERROR, "{$segmentName}的开始时间必须与上一分段连续");
                }
            }

            // 检查金额
            if (!$model->check($segment[$valueField], 'double', 'regex')) {
                return getReturn(CODE_ERROR, "{$segmentName}的金额格式不正确");
            }
        }
    }
    return getReturn(CODE_SUCCESS, 'success');
}

/**
 * 检查续租时的分段开始时间是否与合同连续
 * @param array $segments
 * @param int $factoryId
 * @param int $contractId
 * @return boolean
 * User: hjun
 * Date: 2018-08-21 23:07:46
 * Update: 2018-08-21 23:07:46
 * Version: 1.00
 */
function checkReletSegmentsStartTime($segments = [], $factoryId = 0, $contractId = 0)
{
    // 检查第一个分段的开始时间是否是合同的结束时间+1天
    if (!empty($segments)) {
        $contract = D('Contract')->getContract($factoryId, $contractId);
        $shouldStart = $contract['end_time'] + 24 * 3600;
        if ($shouldStart != str_to_time($segments[0]['start_time'])) {
            return false;
        }
    }
    return true;
}

/**
 * 检查时间字符串是否正确
 * @param string $time
 * @return boolean
 * User: hjun
 * Date: 2018-08-22 10:41:43
 * Update: 2018-08-22 10:41:43
 * Version: 1.00
 */
function checkTimeString($time = '')
{
    return !(strtotime($time) === false);
}

/**
 * 判断杂费是否设置了起止时间
 * @param array $charge
 * @param boolean $strToTime
 * @return boolean
 * User: hjun
 * Date: 2018-11-16 10:52:49
 * Update: 2018-11-16 10:52:49
 * Version: 1.00
 */
function isChargeSetTime($charge = [], $strToTime = true)
{
    if ($charge['charge'] == 0 || $charge['charge'] == 1) {
        $startTime = $charge['start_time'];
        $endTime = $charge['end_time'];
        if ($strToTime) {
            $startTime = str_to_time($charge['start_time']);
            $endTime = str_to_time($charge['end_time']);
        }
        if ($startTime > 0 || $endTime > 0) {
            return true;
        }
    }
    return false;
}

/**
 * 检查杂费信息
 * @param array $chargeData
 * @param array $segments
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-08-22 10:49:48
 * Update: 2018-08-22 10:49:48
 * Version: 1.00
 */
function checkCharging($chargeData = [], $segments = [])
{
    if (!empty($chargeData)) {
        $model = M('');
        if (!is_array($segments)) {
            $segments = jsonDecodeToArr($segments);
        }
        $minTime = str_to_time($segments[0]['start_time']);
        $maxTime = str_to_time($segments[count($segments) - 1]['end_time']);
        foreach ($chargeData as $key => $charge) {
            // 检查金额    不能为负数
            if ($charge['fee'] < 0 || !$model->check($charge['fee'], 'double', 'regex')) {
                return getReturn(CODE_ERROR, "其他费用：{$charge['item_name']}的金额格式不正确");
            }
            // 检查起止时间
            if (isChargeSetTime($charge)) {
                $startTime = str_to_time($charge['start_time']);
                $endTime = str_to_time($charge['end_time']);
                if (empty($startTime)) {
                    return getReturn(CODE_ERROR, "其他费用：请设置{$charge['item_name']}的开始时间");
                }
                if (empty($endTime)) {
                    return getReturn(CODE_ERROR, "其他费用：请设置{$charge['item_name']}的结束时间");
                }
                if ($startTime > $endTime) {
                    return getReturn(CODE_ERROR, "其他费用：{$charge['item_name']}的时间范围错误");
                }
                if ($startTime < $minTime) {
                    return getReturn(CODE_ERROR, "其他费用：{$charge['item_name']}的开始时间不能小于合同的开始时间");
                }
                if ($endTime > $maxTime) {
                    return getReturn(CODE_ERROR, "其他费用：{$charge['item_name']}的结束时间不能大于合同的结束时间");
                }
            }
        }
    }
    return getReturn(CODE_SUCCESS, 'success');
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
 * 生成分段的JSON
 * @param array $segments 分段数据
 * @param string $type 分段类型
 * @param array $request 参数,包含 room_area, rent_type, pay_type, pay_period
 * @return array
 * User: hjun
 * Date: 2018-08-22 22:10:52
 * Update: 2018-08-22 22:10:52
 * Version: 1.00
 */
function buildSegments($segments = [], $type = SEGMENT_TYPE_RENT, $request = [])
{
    $data = [];
    if (!empty($segments)) {
        $field = getDiffSegmentTypeFieldsData();
        $typeField = $field[$type]['type'];
        $valueField = $field[$type]['value'];
        $monthField = $field[$type]['month'];
        $totalField = $field[$type]['total'];
        $roundFunction = $field[$type]['round_function'];
        $method = $field[$type]['method'];
        $payTypeField = $field[$type]['pay_type'];
        $payPeriodField = $field[$type]['pay_period'];
        $type = $request[$typeField];
        $roomArea = $request['room_area'];
        $roomModel = D('Room');
        $contractModel = D('Contract');
        foreach ($segments as $segment) {
            $item = [];
            $item['start_time'] = str_to_time($segment['start_time']); // 开始时间
            $item['end_time'] = str_to_time($segment['end_time']); // 结束时间
            $item[$valueField] = $segment[$valueField]; // 收费值
            $item[$typeField] = $type; // 收费方式 0-按面积 1-按固定
            $item['room_area'] = $roomArea; // 房间面积
            $item['pay_type'] = $request[$payTypeField]; // 支付方式
            $item['pay_period'] = $contractModel->getPayPeriod($request[$payPeriodField], $item['pay_type']); // 支付周期
            // 计算每月的费用
            $monthMoney = $roomModel->$method($item[$typeField], $item[$valueField], $item['room_area']);
            // 计算分段时长以及总费用
            $dateType = 'month';
            $unitMoney = $monthMoney;
            if ($type == \Common\Model\RoomModel::RENT_TYPE_AREA_DAY) {
                $dateType = 'day';
                $unitMoney = $item[$valueField] * $item['room_area'];
            }
            $diff = getContractSegmentTotalFee($item, $unitMoney, null, $dateType);
            $item[$monthField] = $monthMoney;
            $item[$totalField] = $roundFunction($diff['total']);
            $item['total_time'] = "{$diff['diff']['months']}个月{$diff['diff']['days']}天";
            $item['create_time'] = NOW_TIME; // 分段生成时间
            $item['remark'] = empty($segment['remark']) ? '' : $segment['remark'];
            // 是否独立账单
            $item['alone_bill_ctrl'] = $segment['alone_bill_ctrl'] > 0 ? 1 : 0;
            $data[] = $item;
        }
    }
    return $data;
}

/**
 * 生成杂费数据
 * @param array $chargeData
 * @return array
 * User: hjun
 * Date: 2018-08-22 23:56:54
 * Update: 2018-08-22 23:56:54
 * Version: 1.00
 */
function buildCharging($chargeData = [])
{
    $data = [];
    if (!empty($chargeData)) {
        foreach ($chargeData as $key => $charge) {
            $i = [];
            $i['item_id'] = $charge['item_id'];
            $i['item_name'] = $charge['item_name'];
            $i['charge'] = $charge['charge'] > 0 ? $charge['charge'] : 0;
            $i['fee'] = abs($charge['fee']);
            $i['start_time'] = str_to_time($charge['start_time']);
            $i['end_time'] = str_to_time($charge['end_time']);
            $data[] = $i;
        }
    }
    return $data;
}

/**
 * 判断是否是生产环境
 * @return boolean
 * User: hjun
 * Date: 2018-11-02 10:28:37
 * Update: 2018-11-02 10:28:37
 * Version: 1.00
 */
function isProductionMode()
{
    return in_array(MODE, ['common', 'dev']);
}

/**
 * 判断是否是在本地环境
 * @return boolean
 * User: hjun
 * Date: 2019-02-28 12:09:17
 * Update: 2019-02-28 12:09:17
 * Version: 1.00
 */
function isHomeMode()
{
    return in_array(MODE, ['home_dev', 'home_common']);
}

/**
 * 判断签名开关
 * @return boolean
 * User: hjun
 * Date: 2019-02-28 14:46:55
 * Update: 2019-02-28 14:46:55
 * Version: 1.00
 */
function isSignOpen()
{
    return defined('SIGN_OPEN') ? SIGN_OPEN : true;
}

/**
 * 判断是否APP后台
 * @return boolean
 * User: hjun
 * Date: 2019-09-10 10:32:30
 * Update: 2019-09-10 10:32:30
 * Version: 1.00
 */
function isAppManageModule()
{
    return strtolower(MODULE_NAME) == 'appmanage';
}

/**
 * 判断是否有拟稿的权限
 * @return boolean
 * User: hjun
 * Date: 2019-01-03 15:08:22
 * Update: 2019-01-03 15:08:22
 * Version: 1.00
 */
function canDraftContract()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'draftContract');
}

/**
 * 判断是否有提交审核的权限
 * @return boolean
 * User: hjun
 * Date: 2019-09-18 10:40:45
 * Update: 2019-09-18 10:40:45
 * Version: 1.00
 */
function canSubmitContract()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'submitContract');
}

/**
 * 判断是否有核对的权限
 * @return boolean
 * User: hjun
 * Date: 2019-01-03 15:08:38
 * Update: 2019-01-03 15:08:38
 * Version: 1.00
 */
function canAuditContract()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'auditContract');
}

/**
 * 判断是否有批准的权限
 * @return boolean
 * User: hjun
 * Date: 2019-01-03 15:08:49
 * Update: 2019-01-03 15:08:49
 * Version: 1.00
 */
function canConfirmContract()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'confirmContract');
}

/**
 * 判断是否有退回修改的权限
 * @return boolean
 * User: hjun
 * Date: 2019-01-03 15:09:01
 * Update: 2019-01-03 15:09:01
 * Version: 1.00
 */
function canRejectContract()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'rejectContract');
}

/**
 * 判断是否有签约批注的权限
 * @return boolean
 * User: hjun
 * Date: 2019-09-16 10:25:32
 * Update: 2019-09-16 10:25:32
 * Version: 1.00
 */
function canAnnotationContract()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'addSignAnnotationLog');
}

/**
 * 判断能否申请退租
 * @return boolean
 * User: hjun
 * Date: 2019-09-16 14:43:40
 * Update: 2019-09-16 14:43:40
 * Version: 1.00
 */
function canApplyEviction()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'applicationEviction');
}

/**
 * 判断能否撤销退租
 * @return boolean
 * User: hjun
 * Date: 2019-09-16 14:44:35
 * Update: 2019-09-16 14:44:35
 * Version: 1.00
 */
function canRevokeEviction()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'revokeEviction');
}

/**
 * 判断能否批注退租
 * @return boolean
 * User: hjun
 * Date: 2019-09-16 14:49:15
 * Update: 2019-09-16 14:49:15
 * Version: 1.00
 */
function canAnnotationEviction()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'addEvictionAnnotationLog');
}

/**
 * 判断能否核对退租
 * @return boolean
 * User: hjun
 * Date: 2019-09-16 14:44:54
 * Update: 2019-09-16 14:44:54
 * Version: 1.00
 */
function canAuditEviction()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'auditEviction');
}

/**
 * 判断能否批准退租
 * @return boolean
 * User: hjun
 * Date: 2019-09-16 14:45:27
 * Update: 2019-09-16 14:45:27
 * Version: 1.00
 */
function canConfirmEviction()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'confirmEviction');
}

/**
 * 判断能否退回退租
 * @return boolean
 * User: hjun
 * Date: 2019-09-16 14:46:00
 * Update: 2019-09-16 14:46:00
 * Version: 1.00
 */
function canRejectEviction()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'rejectEviction');
}

/**
 * 判断能否获取合同审批列表
 * @return boolean
 * User: hjun
 * Date: 2019-09-17 12:27:22
 * Update: 2019-09-17 12:27:22
 * Version: 1.00
 */
function canSignProcess()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'querySignProcessList');
}

/**
 * 判断能否获取退租审批列表
 * @return boolean
 * User: hjun
 * Date: 2019-09-17 12:27:22
 * Update: 2019-09-17 12:27:22
 * Version: 1.00
 */
function canEvictionProcess()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Contract', 'evictionList');
}

/**
 * 获取首期分段和剩余分段
 * @param array $segments
 * @param int $firstEndTime
 * @return array ['first'=>[], 'rest' => []]
 * @deprecated 没什么用了
 * User: hjun
 * Date: 2018-08-23 17:35:35
 * Update: 2018-08-23 17:35:35
 * Version: 1.00
 */
function getFirstAndRestSegmentsByFirstEndTime($segments = [], $firstEndTime = 0)
{
    $newSegments = sliceSegmentsByTime($segments, $firstEndTime);
    $group = groupSegmentsByTime($newSegments, $firstEndTime);
    return ['first' => $group[0], 'rest' => $group[1]];
}

/**
 * 获取从开始时间到结束时间之间
 * 以$period为周期的结束时间数组
 * @param int $startTime 开始时间
 * @param int $endTime 结束时间
 * @param int $period 月份数
 * @param array $segments 分段数据 主要判断独立账单的分段
 * @return array
 * User: hjun
 * Date: 2018-08-25 10:53:11
 * Update: 2018-08-25 10:53:11
 * Version: 1.00
 */
function getPeriodEndTimes($startTime = 0, $endTime = 0, $period = 1, $segments = [])
{
    $period = empty($period) ? 1 : $period;
    $times = [];
    $i = 1;
    // 独立分段的切割时间找出来
    $aloneTimes = [];
    foreach ($segments as $segment) {
        if ($segment['alone_bill_ctrl'] == 1) {
            $aloneTimes[] = $segment['start_time'] - 3600 * 24;
            $aloneTimes[] = $segment['end_time'];
        }
    }
    $aloneKey = 0;
    do {
        // 结束时间为下一个时间段的开始时间减1天
        $end = (getNextPeriodDate($startTime, $i * $period) - 3600 * 24);
        if ($end > $endTime) {
            $end = $endTime;
        }
        $i++;
        // 有独立分段 且
        // (已计算的时间不包含本次需要使用的独立分割时间 且 当前计算出的时间超过了独立分割的时间) 或 (当前时间刚好是独立分割时间)
        if (!empty($aloneTimes) && isset($aloneTimes[$aloneKey]) && ($end >= $aloneTimes[$aloneKey])) {
            if ($aloneTimes[$aloneKey] >= $startTime && !in_array($aloneTimes[$aloneKey], $times)) {
                $times[] = $aloneTimes[$aloneKey];
            }
            $aloneKey++;
            $end = $aloneTimes[$aloneKey++];
            // 注意：独立分段后 周期从该时间重新计算
            $i = 1;
            $startTime = $end + 3600 * 24;
        }
        $times[] = $end;
    } while ($end < $endTime);
    return $times;
}

/**
 * 根据时间将分段分成新的分段
 * @param array $segments
 * @param int $cutTime
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-08-23 16:34:46
 * Update: 2018-08-23 16:34:46
 * Version: 1.00
 */
function sliceSegmentsByTime($segments = [], $cutTime = 0)
{
    // 截止日期大于等于第一个分段的开始时间才要做分割
    if ($cutTime >= $segments[0]['start_time']) {
        $newSegments = [];
        // 循环分段做分割
        foreach ($segments as $segment) {
            // 如果截止时间是分段的结束时间 则直接返回原分段即可
            if ($cutTime == $segment['end_time']) {
                return $segments;
            }
            // 如果分割在分段中 则当前分段分割成两段
            if ($cutTime >= $segment['start_time'] && $cutTime < $segment['end_time']) {
                // 第一段
                $one = $segment;
                $one['end_time'] = $cutTime;
                $newSegments[] = $one;
                // 第二段
                $two = $segment;
                $two['start_time'] = $cutTime + 3600 * 24;
                $newSegments[] = $two;
                continue;
            }
            $newSegments[] = $segment;
        }
        return $newSegments;
    }
    return $segments;
}

/**
 * 将分段根据时间分成两组
 * @param array $segments
 * @param int $time
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-08-25 17:13:51
 * Update: 2018-08-25 17:13:51
 * Version: 1.00
 */
function groupSegmentsByTime($segments = [], $time = 0)
{
    $one = [];
    $two = [];
    foreach ($segments as $segment) {
        if ($time >= $segment['end_time']) {
            $one[] = $segment;
        } else {
            $two[] = $segment;
        }
    }
    return [$one, $two];
}

/**
 * 获取所有用来分割的时间
 * @param array $segments
 * @param int $firstEndTime
 * @param int $period
 * @return array
 * User: hjun
 * Date: 2018-08-25 17:21:32
 * Update: 2018-08-25 17:21:32
 * Version: 1.00
 */
function getCutTimes($segments = [], $firstEndTime = 0, $period = 1)
{
    if (empty($firstEndTime)) {
        $start = $segments[0]['start_time'];
    } else {
        $start = $firstEndTime + 3600 * 24;
    }
    $end = $segments[count($segments) - 1]['end_time'];
    $cutTimes = getPeriodEndTimes($start, $end, $period, $segments);
    // 如果首期截止时间刚好是合同结束期或者超过合同结束期，则分割时间只需要合同结束期即可
    if (!empty($firstEndTime) && $start > $end) {
        return $cutTimes;
    }
    if (!empty($firstEndTime)) {
        array_unshift($cutTimes, $firstEndTime);
    }
    return $cutTimes;
}

/**
 * 将分段根据 首期截止日期 以及 周期 进行切割
 * @param array $segments
 * @param int $firstEndTime
 * @param int $period
 * @return array
 * User: hjun
 * Date: 2018-08-25 16:42:40
 * Update: 2018-08-25 16:42:40
 * Version: 1.00
 */
function sliceSegmentsWithFirstEndTimeAndPeriod($segments = [], $firstEndTime = 0, $period = 1)
{
    $cutTimes = getCutTimes($segments, $firstEndTime, $period);
    $newSegments = $segments;
    foreach ($cutTimes as $cutTime) {
        $newSegments = sliceSegmentsByTime($newSegments, $cutTime);
    }
    return $newSegments;
}

/**
 * 将分段根据 首期截止日期 以及 周期 进行切割后的分组
 * @param array $segments
 * @param int $firstEndTime
 * @param int $period
 * @return array
 * User: hjun
 * Date: 2018-08-25 17:30:18
 * Update: 2018-08-25 17:30:18
 * Version: 1.00
 */
function groupSegmentsWithFirstEndTimeAndPeriod($segments = [], $firstEndTime = 0, $period = 1)
{
    $segments = sliceSegmentsWithFirstEndTimeAndPeriod($segments, $firstEndTime, $period);
    $cutTimes = getCutTimes($segments, $firstEndTime, $period);
    $group = [];
    $two = $segments;
    foreach ($cutTimes as $cutTime) {
        $result = groupSegmentsByTime($two, $cutTime);
        $two = $result[1];
        $group[] = $result[0];
    }
    return $group;
}

/**
 * 获取续租的合同数据
 * @param array $contract
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2018-11-22 15:09:52
 * Update: 2018-11-22 15:09:52
 * Version: 1.00
 */
function getReleteContractData($contract = [])
{
    $segments = jsonDecodeToArr($contract['segments_info']);
    $segments = getReletSegments($segments);
    $property = jsonDecodeToArr($contract['property_info']);
    $property = getReletSegments($property);
    $contract['start_time'] = $segments[0]['start_time'];
    $contract['segments_info'] = jsonEncode($segments);
    $contract['property_info'] = jsonEncode($property);
    return $contract;
}

/**
 * 获取续租的分段
 * @param array $segments
 * @return array
 * User: hjun
 * Date: 2018-08-25 19:48:40
 * Update: 2018-08-25 19:48:40
 * Version: 1.00
 */
function getReletSegments($segments = [])
{
    $reletSegments = [];
    $reletTime = $segments[count($segments) - 1]['create_time'];
    foreach ($segments as $segment) {
        if ($segment['create_time'] == $reletTime) {
            $reletSegments[] = $segment;
        }
    }
    return $reletSegments;
}

/**
 * 设置杂费的平均费用
 * @param array $charging
 * @param int $roomArea
 * @param boolean $hasOnceFee 是否需要一次性费用
 * @return array
 * User: hjun
 * Date: 2018-08-25 20:50:59
 * Update: 2018-08-25 20:50:59
 * Version: 1.00
 */
function setMonthAvgFeeToChargingInfo($charging = [], $roomArea = 0, $hasOnceFee = false)
{
    $newCharging = [];
    foreach ($charging as &$charge) {
        if ($charge['charge'] == 0) {
            $charge['month_avg_fee'] = $charge['fee'];
            $newCharging[] = $charge;
        } elseif ($charge['charge'] == 1) {
            $charge['month_avg_fee'] = $charge['fee'] * $roomArea;
            $newCharging[] = $charge;
        } elseif ($hasOnceFee && $charge['charge'] == 2) {
            $charge['total_fee'] = $charge['fee'];
            $newCharging[] = $charge;
        }
    }
    return $newCharging;
}

/**
 * 有效的未收租的 账单类型查询条件
 * @return array
 * User: hjun
 * Date: 2019-01-08 15:12:53
 * Update: 2019-01-08 15:12:53
 * Version: 1.00
 */
function getActiveNoPayBillQueryCondition()
{
    return [['neq', \Common\Model\BillModel::TYPE_METER], ['neq', \Common\Model\BillModel::TYPE_PARKING], 'and'];
}

/**
 * 无效的未收租的 账单类型筛选条件
 * @return array
 * User: hjun
 * Date: 2019-01-08 15:15:15
 * Update: 2019-01-08 15:15:15
 * Version: 1.00
 */
function getInvalidNoPayBillQueryCondition()
{
    return [['eq', \Common\Model\BillModel::TYPE_METER], ['eq', \Common\Model\BillModel::TYPE_PARKING], 'or'];
}

/**
 * 获取发送账单提醒的模板类型
 * @param array $bill
 * @return int
 * User: hjun
 * Date: 2019-01-08 15:27:42
 * Update: 2019-01-08 15:27:42
 * Version: 1.00
 */
function getSendMsgTypeByBill($bill = [])
{
    // 发送模板类型 ： 0-租客合同 1-租房公摊 2-电表充值 3-车位充值 4-门锁 5-服务管理 6-账单逾期断电提醒
    $billModel = D('Bill');
    if ($bill['bill_type'] != $billModel::TYPE_PUBLIC &&
        $bill['bill_type'] != $billModel::TYPE_METER &&
        $bill['bill_type'] != $billModel::TYPE_PARKING) {
        // 不是1 2 3类型的全部都归为租客合同类型
        $type = 0;
    } else {
        $type = $bill['bill_type'];
    }
    return $type;
}

/**
 * 获取系统内置的费用项目
 * @return array
 * User: hjun
 * Date: 2019-06-04 10:24:50
 * Update: 2019-06-04 10:24:50
 * Version: 1.00
 */
function getSystemItems()
{
    $FACTORY_CONFIG = C('FACTORY_CONFIG');
    return [
        ['item_id' => ZU_JIN, 'item_name' => '租金'],
        ['item_id' => YA_JIN, 'item_name' => '押金'],
        ['item_id' => PROPERTY_FEE, 'item_name' => '物业管理费'],
        ['item_id' => YA_JIN_PROPERTY, 'item_name' => '物业押金'],
        ['item_id' => ZU_JIN_SERVICE, 'item_name' => $FACTORY_CONFIG['service_name']],
        ['item_id' => YA_JIN_SERVICE, 'item_name' => "{$FACTORY_CONFIG['service_name']}押金"],
        ['item_id' => ZU_JIN_MAINTAIN, 'item_name' => $FACTORY_CONFIG['maintain_name']],
        ['item_id' => YA_JIN_MAINTAIN, 'item_name' => "{$FACTORY_CONFIG['maintain_name']}押金"],
        ['item_id' => POWER_METER, 'item_name' => '充值电费'],
        ['item_id' => METER_FEE_WATER, 'item_name' => '抄表水费'],
        ['item_id' => METER_FEE_POWER, 'item_name' => '抄表电费'],
        ['item_id' => METER_FEE_POWER_2, 'item_name' => '抄表复费率电费'],
    ];
}

/**
 * 获取添加账单时默认的费用项目
 * @return array
 * User: hjun
 * Date: 2019-06-04 10:24:50
 * Update: 2019-06-04 10:24:50
 * Version: 1.00
 */
function getAddBillDefaultItems()
{
    $FACTORY_CONFIG = C('FACTORY_CONFIG');
    return [
        ['item_id' => ZU_JIN, 'item_name' => '租金'],
        ['item_id' => YA_JIN, 'item_name' => '押金'],
        ['item_id' => PROPERTY_FEE, 'item_name' => '物业管理费'],
        ['item_id' => YA_JIN_PROPERTY, 'item_name' => '物业押金'],
        ['item_id' => ZU_JIN_SERVICE, 'item_name' => $FACTORY_CONFIG['service_name']],
        ['item_id' => YA_JIN_SERVICE, 'item_name' => "{$FACTORY_CONFIG['service_name']}押金"],
        ['item_id' => ZU_JIN_MAINTAIN, 'item_name' => $FACTORY_CONFIG['maintain_name']],
        ['item_id' => YA_JIN_MAINTAIN, 'item_name' => "{$FACTORY_CONFIG['maintain_name']}押金"],
    ];
}

/**
 * 获取不同类型的分段的字段数据
 * @return array
 * User: hjun
 * Date: 2018-08-25 21:04:05
 * Update: 2018-08-25 21:04:05
 * Version: 1.00
 */
function getDiffSegmentTypeFieldsData()
{
    $FACTORY_CONFIG = C('FACTORY_CONFIG');
    return [
        SEGMENT_TYPE_RENT => [
            'item_id' => ZU_JIN, // 费用ID
            'tpl_title' => '房屋租金',
            'tpl_name' => '房屋',
            'tpl_money_name' => '租金',
            'tpl_unit_money_name' => '租金', // 单价名称
            'is_charge' => 1,
            'tpl_charge_name' => '出租方其他费用信息',
            'name' => '租金分段',
            'type' => 'rent_type',
            'payee' => 'payee_rent',
            'value' => 'rent_value',
            'month' => 'month_rental',
            'total' => 'total_rental',
            'pay_type' => 'pay_type',
            'pay_period' => 'pay_period',
            'method' => 'calculateMonthRental',
            'round_function' => 'rentalToRound',
            'segments_field' => 'segments_info',
            'first_end_time' => 'rent_first_end_time',
            'month_avg_fee' => 'month_rental',
            'fee_type' => [ZU_JIN],
            'item_name' => '房间租金', // 费用名称
            'deposit_id' => YA_JIN, // 押金费用ID
            'deposit_name' => '房间押金', // 押金费用名称
            'tpl_deposit_name' => '履约保证金', // 模版里押金费用名称
            'deposit_field' => 'deposit', // 押金费用字段
            'deposit_num_field' => 'deposit_num', // 押金方式字段
            'charging_field' => 'charging_info', // 杂费字段
        ],
        SEGMENT_TYPE_PROPERTY => [
            'item_id' => PROPERTY_FEE, // 费用ID
            'tpl_title' => '物业费',
            'tpl_name' => '物业',
            'tpl_money_name' => '物业费',
            'tpl_unit_money_name' => '物业费', // 单价名称
            'is_charge' => 1,
            'tpl_charge_name' => '服务方其他费用信息',
            'name' => '物业分段',
            'type' => 'property_type',
            'payee' => 'payee_property',
            'charge_payee' => 1, // 杂费收款方固定为服务方
            'value' => 'property_value',
            'month' => 'month_property',
            'total' => 'total_property',
            'pay_type' => 'pay_type_property',
            'pay_period' => 'pay_period_property',
            'method' => 'calculateMonthProperty',
            'round_function' => 'propertyToRound',
            'segments_field' => 'property_info',
            'first_end_time' => 'property_first_end_time',
            'month_avg_fee' => 'month_property',
            'fee_type' => [PROPERTY_FEE],
            'item_name' => '物业管理费', // 费用名称
            'deposit_id' => YA_JIN_PROPERTY, // 押金费用ID
            'deposit_name' => '物业押金', // 押金费用名称
            'tpl_deposit_name' => '物业保证金', // 模版里押金费用名称
            'deposit_field' => 'deposit_property', // 押金费用字段
            'deposit_num_field' => 'deposit_num_property', // 押金方式字段
            'charging_field' => 'charging_info_property', // 杂费字段
        ],
        SEGMENT_TYPE_SERVICE => [
            'item_id' => ZU_JIN_SERVICE,
            'tpl_title' => $FACTORY_CONFIG['service_name'],
            'tpl_name' => $FACTORY_CONFIG['service_name'],
            'tpl_money_name' => $FACTORY_CONFIG['service_name'],
            'tpl_unit_money_name' => '', // 单价名称
            'is_charge' => 0,
            'tpl_charge_name' => '',
            'name' => "{$FACTORY_CONFIG['service_name']}分段",
            'type' => 'service_type',
            'payee' => 'payee_service',
            'value' => 'service_value',
            'month' => 'month_service',
            'total' => 'total_service',
            'pay_type' => 'pay_type_service',
            'pay_period' => 'pay_period_service',
            'method' => 'calculateMonthProperty',
            'round_function' => 'propertyToRound',
            'segments_field' => 'service_info',
            'first_end_time' => 'service_first_end_time',
            'month_avg_fee' => 'month_service',
            'fee_type' => [ZU_JIN_SERVICE],
            'item_name' => $FACTORY_CONFIG['service_name'], // 费用名称
            'deposit_id' => YA_JIN_SERVICE, // 押金费用ID
            'deposit_name' => "{$FACTORY_CONFIG['service_name']}押金", // 押金费用名称
            'tpl_deposit_name' => "{$FACTORY_CONFIG['service_name']}保证金", // 模版里押金费用名称
            'deposit_field' => 'deposit_service', // 押金费用字段
            'deposit_num_field' => 'deposit_num_service', // 押金方式字段
            'charging_field' => 'charging_info_service', // 杂费字段
        ],
        SEGMENT_TYPE_MAINTAIN => [
            'item_id' => ZU_JIN_MAINTAIN, // 费用ID
            'tpl_title' => $FACTORY_CONFIG['maintain_name'],
            'tpl_name' => $FACTORY_CONFIG['maintain_name'],
            'tpl_money_name' => $FACTORY_CONFIG['maintain_name'],
            'tpl_unit_money_name' => '', // 单价名称
            'is_charge' => 0,
            'tpl_charge_name' => '',
            'name' => "{$FACTORY_CONFIG['maintain_name']}分段",
            'type' => 'maintain_type',
            'payee' => 'payee_maintain',
            'value' => 'maintain_value',
            'month' => 'month_maintain',
            'total' => 'total_maintain',
            'pay_type' => 'pay_type_maintain',
            'pay_period' => 'pay_period_maintain',
            'method' => 'calculateMonthProperty',
            'round_function' => 'propertyToRound',
            'segments_field' => 'maintain_info',
            'first_end_time' => 'maintain_first_end_time',
            'month_avg_fee' => 'month_maintain',
            'fee_type' => [ZU_JIN_MAINTAIN],
            'item_name' => $FACTORY_CONFIG['maintain_name'], // 费用名称
            'deposit_id' => YA_JIN_MAINTAIN, // 押金费用ID
            'deposit_name' => "{$FACTORY_CONFIG['maintain_name']}押金", // 押金费用名称
            'tpl_deposit_name' => "{$FACTORY_CONFIG['maintain_name']}保证金", // 模版里押金费用名称
            'deposit_field' => 'deposit_maintain', // 押金费用字段
            'deposit_num_field' => 'deposit_num_maintain', // 押金方式字段
            'charging_field' => 'charging_info_maintain', // 杂费字段
        ],
    ];
}

/**
 * 获取需要支付的费用项目数据
 * @param string $segmentType 分段类型
 * @param array $contract 合同数据
 * @param int $action 合同的操作类型
 * @param boolean $hasDeposit 是否需要押金
 * @param boolean $hasOnceFee 是否需要一次性费用
 * @return array
 * User: hjun
 * Date: 2018-08-25 22:51:33
 * Update: 2018-08-25 22:51:33
 * Version: 1.00
 */
function getNeedToPaySundryFees($segmentType = SEGMENT_TYPE_RENT, $contract = [], $action = \Common\Model\ContractModel::ACTION_ADD, $hasDeposit = false, $hasOnceFee = false)
{
    // 初始化杂费信息
    $diffField = getDiffSegmentTypeFieldsData();
    $sundryFees = setMonthAvgFeeToChargingInfo(jsonDecodeToArr($contract[$diffField[$segmentType]['charging_field']]), $contract['room_area'], $hasOnceFee);
    // 需要增加房间租金(或其他费用)
    array_unshift($sundryFees, [
        'item_id' => $diffField[$segmentType]['item_id'],
        'item_name' => $diffField[$segmentType]['item_name'],
    ]);
    // 如果需要押金
    if ($hasDeposit) {
        // 如果是续租 则先增加原押金
        if ($action === \Common\Model\ContractModel::ACTION_RELET) {
            $contract['old_deposit'] = D('Contract')->autoOldDeposit($contract['contract_id'], $segmentType);
            array_unshift($sundryFees, [
                'item_id' => $diffField[$segmentType]['deposit_id'],
                'item_name' => "原{$diffField[$segmentType]['deposit_name']}", //'原房间押金',
                'fee_type' => FEE_COST,
                'total_fee' => abs($contract['old_deposit'])
            ]);
        }
        array_unshift($sundryFees, [
            'item_id' => $diffField[$segmentType]['deposit_id'],
            'item_name' => $diffField[$segmentType]['deposit_name'],
            'total_fee' => abs($contract[$diffField[$segmentType]['deposit_field']])
        ]);
    }
    return $sundryFees;
}

/**
 * 获取分组（一个分组即为一个账单,分组里包含了不同时间段,不同时间段的每月费用不一样）的总额和费用信息
 * @param array $sundryFees 需要支付的费用项目
 *              item_id, item_name, fee_type, month_avg_fee, total_fee
 * @param array $groupSegment
 * @param string $segmentType 分段类型 rent 租金 property 物业
 * @param int $initTime 初始日期
 * @return array
 * User: hjun
 * Date: 2018-08-25 22:02:56
 * Update: 2018-08-25 22:02:56
 * Version: 1.00
 */
function getGroupSegmentTotalFeeAndFeeItems($sundryFees = [], $groupSegment = [], $segmentType = SEGMENT_TYPE_RENT, $initTime = null)
{
    $fieldData = getDiffSegmentTypeFieldsData();
    $totalFee = 0;
    $feeItems = [];
    foreach ($sundryFees as $sundryFee) {
        // 默认是收入
        $feeType = isset($sundryFee['fee_type']) ? $sundryFee['fee_type'] : FEE_INCOME;
        // 默认使用费用项里的总额 如果没有总额 则进行计算
        $total = abs($sundryFee['total_fee']);
        if (!isset($sundryFee['total_fee'])) {
            $total = 0;
            // 默认使用费用项里的每月金额 如果没有就获取分段里的金额
            $avgFee = $sundryFee['month_avg_fee'];
            foreach ($groupSegment as $key => $segment) {
                $useInitTime = $key === 0 ? $initTime : null;
                $type = 'month';
                if (!isset($sundryFee['month_avg_fee'])) {
                    $avgFee = $segment[$fieldData[$segmentType]['month_avg_fee']];
                }
                // 如果是杂费, 并且设置了起止时间, 金额的计算方式不同
                if (isset($sundryFee['charge']) && isChargeSetTime($sundryFee, false)) {
                    $startTime = $sundryFee['start_time'];
                    $endTime = $sundryFee['end_time'];
                    // 如果不在账单周期中 则跳过
                    if ($segment['start_time'] > $endTime) {
                        continue;
                    }
                    if ($segment['start_time'] > $startTime) {
                        $startTime = $segment['start_time'];
                    }
                    if ($segment['end_time'] < $endTime) {
                        $endTime = $segment['end_time'];
                    }
                    $feeSegment = [
                        'start_time' => $startTime,
                        'end_time' => $endTime
                    ];
                    $total += getContractSegmentTotalFee($feeSegment, $avgFee, $useInitTime, $type)['total'];
                } else {
                    // 如果是按平方每日收费 金额取每日金额
                    if ($segment[$fieldData[$segmentType]['type']] == \Common\Model\RoomModel::RENT_TYPE_AREA_DAY) {
                        $avgFee = $segment[$fieldData[$segmentType]['value']] * $segment['room_area'];
                        $type = 'day';
                    }
                    $total += getContractSegmentTotalFee($segment, $avgFee, $useInitTime, $type)['total'];
                }
            }
        }
        // 租金的金额要调整为整数
        $total = rentalToRound($total);
        $feeItems[] = [
            'item_id' => $sundryFee['item_id'],
            'item_name' => $sundryFee['item_name'],
            'fee_type' => $feeType,
            // 合计的金额都取到元, 方便合同算清
            'fee' => $total,
        ];
        if ($feeType == FEE_COST) {
            $totalFee -= $total;
        } else {
            $totalFee += $total;
        }
    }
    return ['total' => round($totalFee, 2), 'fee_items' => $feeItems];
}

/**
 * 生成账单
 * @param int $factoryId
 * @param int $contractId
 * @param array $contract 合同数据
 * @param int $action
 * @param array $request 当action为修改分段金额时  需要该参数 包含 segment_type segment_index
 * @return array
 * User: hjun
 * Date: 2018-08-23 15:27:36
 * Update: 2018-08-23 15:27:36
 * Version: 1.00
 */
function buildBills($factoryId = 0, $contractId = 0, $contract = [], $action = \Common\Model\ContractModel::ACTION_ADD, $request = [])
{
    $bills = [];
    // 账单基本信息 都是一致的
    $item = [];
    $item['contract_id'] = $contractId;
    $item['bill_type'] = \Common\Model\BillModel::TYPE_CONTRACT;
    $item['contract_status'] = \Common\Model\ContractModel::STATUS_ACTIVE;
    $fields = [
        'factory_id', 'factory_name', 'building_id', 'building_name', 'floor_id',
        'floor_name', 'room_id', 'room_name', 'lessor_id', 'lessor_name',
        'factory_child_id', 'factory_child_name',
    ];
    mergeArray($item, $contract, $fields);
    $item['create_time'] = NOW_TIME;

    // 要处理两个类型的分段 使用循环 这里定义一些相应的字段名称
    $prepareSegments = getDiffSegmentTypeFieldsData();
    foreach ($prepareSegments as $segmentType => $fields) {
        // 如果是修改分段金额 分段类型不同直接跳过不处理
        if ($action === \Common\Model\ContractModel::ACTION_MODIFY_SEGMENT_VALUE &&
            $segmentType != $request['segment_type']) {
            continue;
        }
        // 分段    如果是续租的话，只需要取续租时的分段
        $segments = jsonDecodeToArr($contract[$fields['segments_field']]);
        if (is_array($contract[$fields['segments_field']])) {
            $segments = $contract[$fields['segments_field']];
        }
        // 如果没设置分段 跳过
        if (empty($segments)) {
            continue;
        }
        if ($action === \Common\Model\ContractModel::ACTION_RELET) {
            $segments = getReletSegments($segments);
        }

        // 计算每个分段的天租金
        foreach ($segments as $key => $segment) {
            $segment['segment_index'] = $key;
            $segment['day_rental'] = $segment[$fields['total']] / getDaysByStartAndEnd($segment['start_time'], $segment['end_time']);
            $segments[$key] = $segment;
        }

        // 根据首期截止时间以及支付周期将分段进行分组    一个账单为一组，一组中可能含有多个时间段（每个时间段的金额不同）
        $groupSegments = groupSegmentsWithFirstEndTimeAndPeriod($segments, $contract[$fields['first_end_time']], $segments[0]['pay_period']);
        // 找到周期的初始时间。如果有首期截止时间，则初始时间为第二笔账单的开始时间，否则即为第一笔账单的开始时间
        $initTime = empty($contract[$fields['first_end_time']]) ? $groupSegments[0][0]['start_time'] : $groupSegments[1][0]['start_time'];
        foreach ($groupSegments as $index => $groupSegment) {
            if (empty($groupSegment)) {
                continue;
            }
            // 如果是修改分段金额
            if ($action === \Common\Model\ContractModel::ACTION_MODIFY_SEGMENT_VALUE) {
                // 1. 不是该分段产生的账单直接跳过
                $item['segment_index'] = [];
                foreach ($groupSegment as $segment) {
                    $item['segment_index'][] = $segment['segment_index'];
                }
                if (!in_array($request['segment_index'], $item['segment_index'])) {
                    continue;
                }
            }
            $item['start_time'] = $groupSegment[0]['start_time'];
            $item['end_time'] = $groupSegment[count($groupSegment) - 1]['end_time'];
            $item['ought_pay_time'] = getBillOughtPayTime($item, $contract);
            // 首期收费账单标记
            $item['is_first'] = $index == 0 ? 1 : 0;
            // 计算每项费用的总额     ( ( 租金/物业费/服务费/维护费/ | 押金 ) & 每项费用对应的杂费 )
            if ($index === 0) {
                // 是第一个账单 则需要押金、一次性费用
                $sundryFees = getNeedToPaySundryFees($segmentType, $contract, $action, true, true);
            } else {
                $sundryFees = getNeedToPaySundryFees($segmentType, $contract, $action);
            }
            // 账单更改为一个费用一条记录
            foreach ($sundryFees as $sundryFee) {
                $feeInfo = getGroupSegmentTotalFeeAndFeeItems([$sundryFee], $groupSegment, $segmentType, $initTime);
                if ($feeInfo['total'] == 0) {
                    continue;
                }
                $item['bill_sn'] = getRandSnByPrefix(date('Ymd', $groupSegment[0]['start_time']) . "G{$factoryId}C{$contractId}T");
                $item['item_id'] = $sundryFee['item_id'];
                $item['total_fee'] = $feeInfo['total'];
                $item['wait_pay_fee'] = abs($item['total_fee']);
                $item['fee_items'] = jsonEncode($feeInfo['fee_items']);
                $item['payee'] = $contract[$fields['payee']];
                // 如果是杂费 收款方则看配置
                if ($item['item_id'] > 0 && isset($fields['charge_payee'])) {
                    $item['payee'] = $fields['charge_payee'];
                }
                // 如果请求中指定了只生成相应收款方 则判断收款方
                if (isset($request['build_payee'])) {
                    if ($request['build_payee'] === 0 && $item['payee'] != 0) {
                        continue;
                    } elseif ($request['build_payee'] === 1 && $item['payee'] != 1) {
                        continue;
                    }
                }
                $item['fee_type'] = $feeInfo['fee_items'][0]['fee_type'];
                $bills[] = $item;
            }
        }
    }
    return $bills;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// endregion////////////////////////////////////////合同签约、编辑、续租操作相关逻辑代码//////////////////////////////////////////


// region 房间合并
/**
 * 获取IN查询条件
 * @param array $arr
 * @return mixed
 * User: hjun
 * Date: 2018-08-15 17:15:56
 * Update: 2018-08-15 17:15:56
 * Version: 1.00
 */
function getInSearchWhereByArr($arr = [])
{
    if (empty($arr)) {
        return ['exp', 'IS NULL'];
    } elseif (count($arr) === 1) {
        return $arr[0];
    } else {
        return ['in', implode(',', $arr)];
    }
}

/**
 * 获取子工厂查询条件
 * @param array $admin
 * @param array $request
 * @return array
 * User: hjun
 * Date: 2019-09-20 16:46:42
 * Update: 2019-09-20 16:46:42
 * Version: 1.00
 */
function getFactoryChildSearchWhere($admin = [], $request = [])
{
    if (!empty($request['factory_child_id'])) {
        return $request['factory_child_id'];
    }
    if (empty($admin)) {
        return [];
    }
    if (isFactoryAdmin($admin)) {
        return [];
    }
    $ids = empty($admin['factory_child_id']) ? [] : explode(',', $admin['factory_child_id']);
    return getInSearchWhereByArr($ids);
}

// endregion


/**
 * 获取抄表费用的选项
 * @param int $factoryId
 * @return array
 * User: hjun
 * Date: 2019-01-06 18:36:23
 * Update: 2019-01-06 18:36:23
 * Version: 1.00
 */
function getMeterChoices($factoryId = 0)
{
    return [
        ['item_id' => METER_FEE_WATER, 'item_name' => '水表', 'runit' => '吨', 'unit' => '元/吨',],
        ['item_id' => METER_FEE_POWER, 'item_name' => '普通电表', 'runit' => '度', 'unit' => '元/度',],
        ['item_id' => METER_FEE_POWER_2, 'item_name' => '复费率电表', 'runit' => '度', 'unit' => '元/度',],
    ];
}

/**
 * 获取租金方式可选项
 * @return array
 * User: hjun
 * Date: 2019-11-26 17:28:59
 * Update: 2019-11-26 17:28:59
 * Version: 1.00
 */
function getRentTypeOptions()
{
    return [
        \Common\Model\RoomModel::RENT_TYPE_AREA_MONTH, \Common\Model\RoomModel::RENT_TYPE_FIX,
        \Common\Model\RoomModel::RENT_TYPE_AREA_DAY,
    ];
}

/**
 * 获取租金方式名称
 * @param int $type 收租方式
 * @param int $textType 文字类型 0-租金；1-其他费用；
 * @return string
 * User: hjun
 * Date: 2019-11-26 17:28:59
 * Update: 2019-11-26 17:28:59
 * Version: 1.00
 */
function getRentTypeName($type = 0, $textType = 0)
{
    $text = $textType == 0 ? '租' : '费';
    switch ($type) {
        case \Common\Model\RoomModel::RENT_TYPE_FIX:
            $result = "按固定额收{$text}";
            break;
        case \Common\Model\RoomModel::RENT_TYPE_AREA_DAY:
            $result = "按平方每日收{$text}";
            break;
        default:
            $result = "按平方每月收{$text}";
            break;
    }
    return $result;
}

/**
 * 获取租金收费方式选择项
 * @return array
 * User: hjun
 * Date: 2019-05-25 15:26:39
 * Update: 2019-05-25 15:26:39
 * Version: 1.00
 */
function getRentCollects()
{
    return [
        ['id' => 0, 'name' => '按平方每月收租', 'unit' => '元/平方/月'],
        ['id' => 1, 'name' => '按固定额收月租', 'unit' => '元/月'],
        ['id' => 2, 'name' => '按平方每日收租', 'unit' => '元/平方/日'],
    ];
}

/**
 * 获取租金收费方式选择项
 * @return array
 * User: hjun
 * Date: 2019-05-25 15:26:39
 * Update: 2019-05-25 15:26:39
 * Version: 1.00
 */
function getPropertyCollects()
{
    return [
        ['id' => 0, 'name' => '按平方每月收费', 'unit' => '元/平方/月'],
        ['id' => 1, 'name' => '按固定额收费', 'unit' => '元/月'],
        ['id' => 2, 'name' => '按平方每日收费', 'unit' => '元/平方/日'],
    ];
}

/**
 * 获取收款方选项数据
 * @return array
 * User: hjun
 * Date: 2019-05-29 11:58:40
 * Update: 2019-05-29 11:58:40
 * Version: 1.00
 */
function getPayeeSelectList()
{
    return [
        ['id' => 0, 'name' => '服务方',],
        ['id' => 1, 'name' => '出租方',],
    ];
}

/**
 * 获取支付方式列表
 * @return array
 * User: hjun
 * Date: 2019-05-30 16:26:10
 * Update: 2019-05-30 16:26:10
 * Version: 1.00
 */
function getPayTypeList()
{
    return [
        ['id' => 0, 'name' => '月付',],
        ['id' => 1, 'name' => '季付',],
        ['id' => 2, 'name' => '半年付',],
        ['id' => 3, 'name' => '年付',],
        ['id' => 4, 'name' => '其他',],
    ];
}

/**
 * 获取收租方式
 * @return array
 * User: hjun
 * Date: 2019-12-12 12:01:59
 * Update: 2019-12-12 12:01:59
 * Version: 1.00
 */
function getCollectTypeList()
{
    // 0-微信;1-支付宝;2-银行;3-系统标记支付;
    //4-第三方应用自动缴费;5-现金;6-在线银联支付;
    //7-减免费用;
    $result = [];
    $result[] = ['id' => 0, 'name' => '微信'];
    $result[] = ['id' => 1, 'name' => '支付宝'];
    $result[] = ['id' => 2, 'name' => '银行'];
    $result[] = ['id' => 5, 'name' => '现金'];
    $result[] = ['id' => 7, 'name' => '减免费用'];
    return $result;
}

/**
 * 获取账单类型的文字
 * @param int $billType
 * @return string
 * User: hjun
 * Date: 2019-05-30 14:24:01
 * Update: 2019-05-30 14:24:01
 * Version: 1.00
 */
function getBillTypeText($billType = \Common\Model\BillModel::TYPE_CONTRACT)
{
    switch ($billType) {
        case \Common\Model\BillModel::TYPE_PUBLIC:
            $result = '公摊账单';
            break;
        case \Common\Model\BillModel::TYPE_METER:
            $result = '电表充值';
            break;
        case \Common\Model\BillModel::TYPE_PARKING:
            $result = '停车充值';
            break;
        case \Common\Model\BillModel::TYPE_EVICTION:
            $result = '退租结算';
            break;
        case \Common\Model\BillModel::TYPE_ADD:
            $result = '杂费账单';
            break;
        case \Common\Model\BillModel::TYPE_READING_METER_WATER:
            $result = '抄表水费';
            break;
        case \Common\Model\BillModel::TYPE_READING_METER_POWER:
            $result = '抄表电费';
            break;
        default:
            $result = '租客账单';
            break;
    }
    return $result;
}

/**
 * 获取杂费的收费方式
 * @return array
 * User: hjun
 * Date: 2019-05-29 21:24:22
 * Update: 2019-05-29 21:24:22
 * Version: 1.00
 */
function getChargeTypesList()
{
    return [
        ['id' => 0, 'name' => '固定额月收费',],
        ['id' => 1, 'name' => '按平方月收费',],
        ['id' => 2, 'name' => '一次性收费',],
    ];
}

/**
 * 获取逾期账单的查询条件
 * @param array $system_info 系统设置
 * @param string $billAlias bill表别名,带.
 * @return array
 * User: hjun
 * Date: 2019-05-29 22:14:54
 * Update: 2019-05-29 22:14:54
 * Version: 1.00
 */
function getOverdueBillQueryWhere($system_info = [], $billAlias = '')
{
    $where["{$billAlias}is_delete"] = NOT_DELETED;
    $where["{$billAlias}contract_status"] = \Common\Model\ContractModel::STATUS_ACTIVE;
    $where["{$billAlias}pay_status"] = \Common\Model\BillModel::STATUS_NOT_PAYED;
    $where["{$billAlias}total_fee"] = ['gt', 0];
    $where["{$billAlias}ought_pay_time"] = array('elt', (NOW_TIME - $system_info['auto_blackout_day'] * 24 * 3600) - ($system_info['auto_blackout_time'] * 3600));
    return $where;
}

/**
 * 选项数据转成id 和 name
 * @param array $selectData
 * User: hjun
 * Date: 2019-05-25 17:44:32
 * Update: 2019-05-25 17:44:32
 * Version: 1.00
 */
function selectDataToIDNAME(&$selectData = [])
{
    foreach ($selectData as $key => $value) {
        switch ($key) {
            case 'facility':
            case 'charge':
            case 'query_charge_list':
            case 'contract_tpl':
            case 'building':
            case 'lessor_list':
            case 'meter_choices':
            case 'floor_list':
            case 'area_code_list':
            case 'contract_label':
            case 'room_group':
            case 'factory_child':
            case 'collect_account':
                $idKey = null;
                $nameKey = null;
                foreach ($value[0] as $k => $item) {
                    if (!isset($idKey)) {
                        if ($k != 'id' && strpos($k, 'id') !== false) {
                            $idKey = $k;
                        }
                    }
                    if (!isset($nameKey)) {
                        if (($k != 'name' && strpos($k, 'name') !== false) ||
                            strpos($k, 'num') !== false) {
                            $nameKey = $k;
                        }
                    }
                    if (isset($idKey) && isset($nameKey)) {
                        break;
                    }
                }
                if (isset($idKey) && isset($nameKey)) {
                    foreach ($value as $k => $item) {
                        $id = $item[$idKey];
                        $name = $item[$nameKey];
                        unset($item[$idKey], $item[$nameKey]);
                        $item['id'] = $id;
                        $item['name'] = $name;
                        $value[$k] = $item;
                    }
                }
                break;
            default:
                break;
        }
        $selectData[$key] = $value;
    }
}

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
 * 设置分段是否可以修改租金
 * @param array $segments
 * @param array $bills
 * @param string $segmentType
 * @return array
 * User: hjun
 * Date: 2019-05-22 16:22:12
 * Update: 2019-05-22 16:22:12
 * Version: 1.00
 */
function setSegmentCanModify($segments = [], $bills = [], $segmentType = SEGMENT_TYPE_RENT)
{
    $segmentData = getDiffSegmentTypeFieldsData();
    $billModel = D('Bill');
    $feeTypes = $segmentData[$segmentType]['fee_type'];
    // 1. 获取已经收租的+合同账单+是由该分段产生的账单
    $doneBills = [];
    foreach ($bills as $bill) {
        if ($billModel->isPay($bill) && $bill['bill_type'] == $billModel::TYPE_CONTRACT) {
            $feeItems = $bill['fee_items'];
            if (is_string($feeItems)) {
                $feeItems = jsonDecodeToArr($bill['fee_items']);
            }
            foreach ($feeItems as $feeItem) {
                // 费用类型是属于改分段产生的
                if (in_array($feeItem['item_id'], $feeTypes)) {
                    $doneBills[] = $bill;
                    break;
                }
            }
        }
    }
    // 2. 判断每个分段周期内，是否存在有已收租的账单
    foreach ($segments as $key => $segment) {
        // 2.1 初始都可编辑
        $segment['can_modify'] = 1;
        // 2.2 寻找出不可编辑的情况
        foreach ($doneBills as $doneBill) {
            // 如果已经找到不可编辑的情况了 则跳出循环
            if ($segment['can_modify'] == 0) {
                break;
            }
            if ($doneBill['start_time'] >= $segment['start_time'] && $doneBill['end_time'] <= $segment['end_time']) {
                $segment['can_modify'] = 0;
            } elseif ($doneBill['start_time'] <= $segment['start_time'] && $doneBill['end_time'] >= $segment['start_time']) {
                $segment['can_modify'] = 0;
            } elseif ($doneBill['start_time'] <= $segment['end_time'] && $doneBill['end_time'] >= $segment['end_time']) {
                $segment['can_modify'] = 0;
            }
        }
        $segments[$key] = $segment;
    }
    return $segments;
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
 * 修改分段金额 生成对应的分段JSON
 * @param array $request
 * @return string
 * User: hjun
 * Date: 2019-05-23 16:47:16
 * Update: 2019-05-23 16:47:16
 * Version: 1.00
 */
function buildSegmentJsonByValue($request = [])
{
    $model = D('Contract');
    $contract = $model->getContract($model->getFactoryId(), $request['contract_id']);
    $segmentType = $request['segment_type'];
    $index = $request['segment_index'];
    $value = $request['segment_value'];
    $diffSegmentData = getDiffSegmentTypeFieldsData();
    $segments = jsonDecodeToArr($contract[$diffSegmentData[$segmentType]['segments_field']]);
    $segments[$index][$diffSegmentData[$segmentType]['value']] = $value;
    $newSegments = buildSegments($segments, $segmentType, $contract);
    $fields = [
        'rent_value', 'month_rental', 'total_rental'
    ];
    mergeArray($segments[$index], $newSegments[$index], $fields);
    return jsonEncode($segments);
}

/**
 * 获取并检查系统房源分组
 * @param int $factoryId
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2019-09-18 18:34:57
 * Update: 2019-09-18 18:34:57
 * Version: 1.00
 */
function getAndCheckSystemRoomGroup($factoryId = 0)
{
    // 兼容APP未传参数 默认使用系统分组
    $where = [];
    $where['is_system'] = 1;
    $where['factory_id'] = $factoryId;
    $where['is_delete'] = NOT_DELETED;
    $systemGroup = D('RoomGroup')->field('group_id')->where($where)->find();
    if (empty($systemGroup)) {
        return getReturn(CODE_ERROR, '未设置默认分组,请联系管理员');
    }
    return getReturn(CODE_SUCCESS, '', $systemGroup);
}

/**
 * 生成房间与分组的关联数据
 * @param string $groupId
 * @param int $factoryId
 * @param int $roomId
 * @param int $totalRoomNum
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hjun
 * Date: 2019-09-18 18:39:32
 * Update: 2019-09-18 18:39:32
 * Version: 1.00
 */
function buildRoomGroupRelationData($groupId = '', $factoryId = 0, $roomId = 0, $totalRoomNum = 0)
{
    $dataList = [];
    $groupIds = explode(',', $groupId);
    $item = [];
    $item['factory_id'] = $factoryId;
    for ($i = 0; $i < $totalRoomNum; $i++) {
        $item['room_id'] = $roomId++;
        foreach ($groupIds as $groupId) {
            $item['group_id'] = $groupId;
            $dataList[] = $item;
        }
    }
    return $dataList;
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
 * 获取API接口的权限码
 * @param string $code
 * @return string
 * User: hjun
 * Date: 2019-07-01 15:07:20
 * Update: 2019-07-01 15:07:20
 * Version: 1.00
 */
function getApiAuthCode($code = '')
{
    $table = [];
    // 账单
    $table["BILL@QUERY"] = "BILL@INDEX"; // 应收
    $table["BILL@QUERY2"] = "BILL@INDEX2"; // 已收
    $table["BILL@GETDATA"] = true;
    $table["BILL@ADD"] = "BILL@ADDBILL"; // 添加
    $table["BILL@MODIFY"] = "BILL@UPDATEBILL"; // 修改
    $table["BILL@DELETE"] = "BILL@DELBILL"; // 删除
    $table["BILL@COLLECT"] = "BILL@COLLECTBILL"; // 收租
    $table["BILL@BATCHCOLLECT"] = "BILL@BATCHCOLLECTBILL"; // 批量收租
    $table["BILL@SEND"] = "BILL@SENDBILLMESSAGE"; // 发送
    // 楼宇
    $table["BUILDING@QUERY"] = "BUILDING@INDEX"; // 列表
    $table["BUILDING@GETDATA"] = true;
    $table["BUILDING@ADD"] = "BUILDING@ADDBUILDING"; // 添加
    $table["BUILDING@MODIFY"] = "BUILDING@UPDATEBUILDING"; // 修改
    $table["BUILDING@DELETE"] = "BUILDING@DELBUILDING"; // 删除
    // 杂费
    $table["CHARGE@QUERY"] = "CHARGE@CHARGELIST"; // 列表
    $table["CHARGE@GETDATA"] = true;
    $table["CHARGE@ADD"] = "CHARGE@EDITCHARGEINFO"; // 添加
    $table["CHARGE@MODIFY"] = "CHARGE@EDITCHARGEINFO"; // 修改
    $table["CHARGE@DELETE"] = "CHARGE@EDITCHARGEINFO"; // 删除
    // 合同
    $table["CONTRACT@QUERY"] = "CONTRACT@INDEX"; // 列表
    $table["CONTRACT@GETDATA"] = true;
    $table["CONTRACT@GETCONTRACTACTIONDATA"] = true;
    $table["CONTRACT@DRAFT"] = "CONTRACT@DRAFTCONTRACT"; // 拟稿
    $table["CONTRACT@AUDIT"] = "CONTRACT@AUDITCONTRACT"; // 核对
    $table["CONTRACT@CONFIRM"] = "CONTRACT@CONFIRMCONTRACT"; // 批准
    $table["CONTRACT@REJECT"] = "CONTRACT@REJECTCONTRACT"; // 退回修改
    $table["CONTRACT@MODIFY"] = "CONTRACT@DRAFTCONTRACT"; // 批准后修改
    $table["CONTRACT@DELETE"] = "CONTRACT@DELCONTRACT"; // 删除
    $table["CONTRACT@RELET"] = "CONTRACT@RELET"; // 续租
    $table["CONTRACT@EVICTION"] = "CONTRACT@EVICTIONCONTRACT"; // 退租
    $table["CONTRACT@MODIFYSEGMENTVALUE"] = "CONTRACT@MODIFYSEGMENTVALUE"; // 修改分段金额
    $table["CONTRACT@QUERYEVICTIONPROCESSLIST"] = "CONTRACT@EVICTIONLIST"; // 退租审批列表
    // 设施
    $table["FACILITY@QUERY"] = "FACILITY@FACILITYLIST"; // 列表
    $table["FACILITY@GETDATA"] = true;
    $table["FACILITY@ADD"] = "FACILITY@EDITFACILITYINFO"; // 添加
    $table["FACILITY@MODIFY"] = "FACILITY@EDITFACILITYINFO"; // 修改
    $table["FACILITY@DELETE"] = "FACILITY@EDITFACILITYINFO"; // 删除
    // 楼层
    $table["FLOOR@GETDATA"] = true;
    $table["FLOOR@ADD"] = "FLOOR@ADDFLOOR"; // 添加
    $table["FLOOR@MODIFY"] = "FLOOR@UPDATEFLOOR"; // 修改
    $table["FLOOR@DELETE"] = "FLOOR@DELFLOOR"; // 删除
    // 出租方
    $table["LESSOR@QUERY"] = "LESSOR@INDEX"; // 列表
    $table["LESSOR@GETDATA"] = true;
    $table["LESSOR@ADD"] = "LESSOR@ADD"; // 添加
    $table["LESSOR@MODIFY"] = "LESSOR@EDIT"; // 修改
    $table["LESSOR@DELETE"] = "LESSOR@DEL"; // 删除
    // 个人
    $table["LOGIN@MODIFYPWD"] = "PERSONAL@PWD"; // 修改密码
    // 会员
    $table["MEMBER@QUERY"] = "MEMBER@INDEX"; // 列表
    $table["MEMBER@GETDATA"] = true;
    // 电表
    $table["POWERMETER@QUERY"] = "POWERMETER@INDEX"; // 列表
    $table["POWERMETER@GETDATA"] = true;
    $table["POWERMETER@REFRESH"] = "POWERMETER@REFRESHPOWERMETER"; // 刷新电表
    $table["POWERMETER@CTRL"] = "POWERMETER@EDITPOWERMETER"; // 控制电表
    $table["POWERMETER@SEND"] = "POWERMETER@SENDPOWERMSG"; // 发送提醒
    $table["POWERMETER@ADD"] = "POWERMETER@EDITPOWERMETER"; // 添加
    $table["POWERMETER@MODIFY"] = "POWERMETER@EDITPOWERMETER"; // 修改
    $table["POWERMETER@DELETE"] = "POWERMETER@EDITPOWERMETER"; // 删除
    // 员工
    $table["RBAC@QUERY"] = "RBAC@INDEX"; // 列表
    $table["RBAC@GETDATA"] = "RBAC@INFO"; // 获取信息
    $table["RBAC@ADD"] = "RBAC@ADDUSER"; // 添加
    $table["RBAC@MODIFY"] = "RBAC@EDITUSER"; // 修改
    $table["RBAC@DELETE"] = "RBAC@DELUSER"; // 删除
    // 房间
    $table["ROOM@QUERY"] = true; // 列表
    $table["ROOM@GETDETAIL"] = "ROOM@GETROOMDETAIL"; // 详情
    $table["ROOM@ADD"] = "ROOM@ADDROOM"; // 添加房间
    $table["ROOM@MODIFY"] = "ROOM@UPDATEROOM"; // 修改房间
    $table["ROOM@DELETE"] = "ROOM@DELROOM"; // 删除房间
    $table["ROOM@MERGE"] = "ROOM@MERGEROOM"; // 合并
    $table["ROOM@CANCELMERGE"] = "ROOM@CANCELMERGE"; // 取消合并
    // 报表
    $table["STATEMENT@GETDATA"] = "STATEMENT@INDEX"; // 日报表
    $table["STATEMENT@GETDATAMONTH"] = "STATEMENT@MONTH"; // 月报表
    // 明细
    $table["TRADE@QUERY"] = "TRADE@INDEX"; // 列表
    $table["TRADE@DELTRADE"] = "TRADE@DELTRADE"; // 删除流水
    return isset($table[$code]) ? $table[$code] : $code;
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
 * 将模版内容里的变量词替换成真实值
 * @param string $tplContent
 * @param array $data
 * @return string
 * User: hjun
 * Date: 2019-08-13 10:36:43
 * Update: 2019-08-13 10:36:43
 * Version: 1.00
 */
function tplReplace($tplContent = '', $data = [])
{
    foreach ($data as $key => $da) {
        //表格单独替换
        if ($key == 'TAX_UNIT_SHOW') {
            $begin = strpos($tplContent, '<table width="100%" class="TAX_UNIT_SHOW_BEGIN">');
            if ($begin !== false) {
                $end = strpos($tplContent, '</table>', $begin);
                $tableHtml = substr($tplContent, $begin, ($end - $begin + (strlen('</table>'))));
                $tplContent = str_replace($tableHtml, $da, $tplContent);
            }
        }
        if (strpos($tplContent, '<a disabled="" class="tpl-variable-word" style="padding: 0px 15px; color: rgb(112, 124, 210); line-height: 30px; font-weight: bold; display: inline-block; position: relative; cursor: not-allowed; pointer-events: none; background-color: rgb(240, 242, 255);" contenteditable="false">{' . $key . '}</a>') !== false) {
            $tplContent = str_replace('<a disabled="" class="tpl-variable-word" style="padding: 0px 15px; color: rgb(112, 124, 210); line-height: 30px; font-weight: bold; display: inline-block; position: relative; cursor: not-allowed; pointer-events: none; background-color: rgb(240, 242, 255);" contenteditable="false">{' . $key . '}</a>', $da, $tplContent);
        }

        if (strpos($tplContent, '<span class="tpl-variable-word" contenteditable="false">{' . $key . '}</span>') !== false) {
            $tplContent = str_replace('<span class="tpl-variable-word" contenteditable="false">{' . $key . '}</span>', $da, $tplContent);
        }

        if (strpos($tplContent, '<a class="tpl-variable-word" contenteditable="false" style="pointer-events :none;cursor: not-allowed;line-height: 30px;background-color: #f0f2ff;color: #707cd2;font-weight: bold;padding:0 15px;display: inline-block;position: relative" disabled="">{' . $key . '}</a>') !== false) {
            $tplContent = str_replace('<a class="tpl-variable-word" contenteditable="false" style="pointer-events :none;cursor: not-allowed;line-height: 30px;background-color: #f0f2ff;color: #707cd2;font-weight: bold;padding:0 15px;display: inline-block;position: relative" disabled="">{' . $key . '}</a>', $da, $tplContent);
        }

        if (strpos($tplContent, '<a class="tpl-variable-word" contenteditable="false" disabled="">{' . $key . '}</a>') !== false) {
            $tplContent = str_replace('<a class="tpl-variable-word" contenteditable="false" disabled="">{' . $key . '}</a>', $da, $tplContent);
        }

        if (strpos($tplContent, '{' . $key . '}') !== false) {
            $tplContent = str_replace('{' . $key . '}', $da, $tplContent);
        }
    }
    return $tplContent;
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
 * 判断是否是主账号
 * @param array $admin
 * @return boolean
 * User: hjun
 * Date: 2019-09-20 16:42:56
 * Update: 2019-09-20 16:42:56
 * Version: 1.00
 */
function isMallAdmin($admin = [])
{
    return $admin['mall_admin'] == 1;
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

/**
 * [
 *  [
 *    room_id,
 *    building_id,
 *    floor_id,
 *  ]
 * ]
 * @param array $data 数据库查出来的二维数组
 * @param string $pk 当前子级数据的主键; 一开始楼宇是父级，所以默认值是building_id
 * @param string $pidName 父级字段; 因为楼宇没有上一级 所以默认值空
 * @param mixed $pid 父级字段的值; 因为楼宇没有上一级 所以默认值空
 * @param string $childName 存储当期子级的子级的字段名; 楼宇的子级是楼层 所以默认值为floors
 * @return array
 * User: hjun
 * Date: 2019-09-19 11:57:10
 * Update: 2019-09-19 11:57:10
 * Version: 1.00
 */
function getChild($data = [], $pk = 'building_id', $pidName = '', $pid = null, $childName = 'floors')
{
    $child = [];
    // 1. 筛选出不重复 并且 属于指定父级 的子级数据
    foreach ($data as $key => $value) {
        // 当前数据没有主键 则跳过即可
        if (empty($value[$pk])) {
            continue;
        }
        if ($value[$pidName] == $pid) { // 指定父级
            if (!isset($child[$value[$pk]])) { // 不重复
                $child[$value[$pk]] = $value;
            }
        }
    }
    $child = array_values($child); // 把数组的键值去掉
    // 2. 产生子级数据
    switch ($pk) {
        case 'building_id':
            // 当前如果是楼宇 则子级就是楼层
            $nextPk = 'floor_id';
            $nextChildName = 'rooms';
            break;
        case 'floor_id':
            // 当前如果是楼层 则子级就是房间
            $nextPk = 'room_id';
            $nextChildName = '';
            break;
        default:
            // 其余不需要子级 直接返回
            return $child;
            break;
    }
    foreach ($child as $key => $value) {
        $value[$childName] = getChild($data, $nextPk, $pk, $value[$pk], $nextChildName);
        $child[$key] = $value;
    }
    return $child;
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

function noPaybillQuery($billTrade)
{
    $where = [];
    $isPayee = $billTrade['lessor_id'] <= 0;
    if ($isPayee) {
        $where['factory_id'] = $billTrade['factory_id'];
    }
    $where['lessor_id'] = $billTrade['lessor_id'];
    $accessTokenData = M("access_token")->where($where)->find();
    if ($isPayee) {
        $lessorData = D('Factory')->getSystemConfigInfo($billTrade['factory_id']);
    } else {
        $lessorData = M("lessor")->where(array('lessor_id' => $billTrade['lessor_id']))->find();
    }
    if (empty($accessTokenData)) {

        $AccessToken = getAccessToken($lessorData);
        if (!empty($AccessToken)) {
            $addData = array();
            $addData['lessor_id'] = $billTrade['lessor_id'];
            $addData['factory_id'] = $billTrade['factory_id'];
            $addData['AccessToken'] = $AccessToken;
            $addData['create_time'] = time();
            M("access_token")->add($addData);
            $accessTokenData = $addData;
        } else {
            return;
        }
    } else {

        $nowTime = time();
        if ($nowTime - $accessTokenData['create_time'] > 3400) {
            $AccessToken = getAccessToken($lessorData);

            if (!empty($AccessToken)) {
                $updateData = array();
                $updateData['AccessToken'] = $AccessToken;
                $updateData['create_time'] = time();
                M("access_token")->where($where)->save($updateData);
                $accessTokenData = $updateData;
            } else {
                return;
            }
        }
    }

    $requestTimestamp = date("Y-m-d H:i:s", time());
    $merOrderId = $billTrade['merorderid'];
    if (empty($merOrderId)) {
        $merOrderId = $billTrade['merOrderId'];
    }
    $instMid = "YUEDANDEFAULT";
    $mid = $lessorData['unionpay_mid'];
    $tid = $lessorData['unionpay_tid'];
    $AccessToken = $accessTokenData['AccessToken'];
    $headers = array("Content-Type:application/json", "Authorization:OPEN-ACCESS-TOKEN AccessToken=" . $AccessToken);
    $url = C("QUERY_URL");

//    $url = "https://api-mop.chinaums.com/v1/netpay/query";
    $postData = array();
    $postData['requestTimestamp'] = $requestTimestamp;
    $postData['merOrderId'] = $merOrderId;
    $postData['instMid'] = $instMid;
    $postData['mid'] = $mid;
    $postData['tid'] = $tid;

    $resultData = httpRequest($url, "POST", json_encode($postData), $headers);
    logWrite('BillPay->noPaybillQuery：请求数据' . json_encode($postData) . "  结果" . $resultData);

    $returnBillData = json_decode($resultData, true);
    if ($returnBillData['status'] == "TRADE_SUCCESS") {
        $updateData = array();
        $updateData['order_state'] = 1;
        $updateData['query_content'] = $resultData;
        $updateData['create_time'] = time();
        M("bill_trade")->where(array('id' => $billTrade['id']))->save($updateData);

        $tradeData = $billTrade;
        $data = [];
        $data['bill_id'] = $tradeData['bill_id'];
        $data['account_id'] = $tradeData['account_id'];
        $data['trade_no'] = $merOrderId;
        $data['pay_type'] = \Common\Model\BillModel::PAY_TYPE_ONLINE_BANK;
        $data['pay_time'] = NOW_TIME;
        $data['actual_pay_time'] = NOW_TIME;
        // 设置支付金额 和 服务费  将分转成元
        $data['pay_fee'] = bcdiv($tradeData['money'], 100, 2);
        $serviceFee = bcsub($tradeData['actual_money'], $tradeData['money'], 2);
        $data['service_fee'] = bcdiv($serviceFee, 100, 2);
        $admin = [];
        $admin['username'] = $tradeData['current_name'];
        $result = D('Bill')->collectBill($tradeData['factory_id'], $data, $admin);
    }
}

function getAccessToken($lessorData)
{
    $headers = array("Content-Type:application/json");
    $url = C("ACCESS_URL");
//    $url = "https://api-mop.chinaums.com/v1/token/access";
    $actimestamp = date("YmdHis", time());
    $appid = $lessorData['unionpay_appid'];
    $nonce = rand(100000, 999999);
    $appKey = $lessorData['unionpay_appkey'];
    $str = $appid . $actimestamp . $nonce . $appKey;
    $sign = bin2hex(hash('sha256', $str, true));

    $postData = array();
    $postData['appId'] = $lessorData['unionpay_appid'];
    $postData['timestamp'] = $actimestamp;
    $postData['nonce'] = $nonce;
    $postData['signMethod'] = "SHA256";
    $postData['signature'] = $sign;
    $resultData = httpRequest($url, "POST", json_encode($postData), $headers);
    logWrite('BillPay->getAccessToken：请求数据' . json_encode($postData) . "  结果" . $resultData);
    $returnAccessTokenData = json_decode($resultData, true);
    if ($returnAccessTokenData['errCode'] == '0000') {
        return $returnAccessTokenData['accessToken'];
    }
    return '';
}

/**
 * 获取导出的所有项
 * @param string $source
 * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
 * User: hdc
 * Date: 2020-02-14 14:11:06
 * Update: 2020-02-14 14:11:06
 * Version: 1.00
 */
function getFieldArray($source = '')
{
    $field = [];
    switch ($source) {
        case 'trade_query':
            $field = [
                ['value' => 'index', 'name' => '序号'],
                ['value' => 'member_name', 'name' => '会员账号'],
                ['value' => 'member_nickname', 'name' => '昵称'],
                ['value' => 'trade_project_str', 'name' => '项目'],
                ['value' => 'flow_type_str', 'name' => '类型'],
                ['value' => 'money', 'name' => '金额'],
                ['value' => 'remark', 'name' => '备注'],
                ['value' => 'create_time_str', 'name' => '时间'],
            ];
            break;
        case 'performance_query':
            $field = [
                ['value' => 'index', 'name' => '序号'],
                ['value' => 'member_name', 'name' => '会员账号'],
                ['value' => 'member_nickname', 'name' => '昵称'],
                ['value' => 'trade_project_str', 'name' => '项目'],
                ['value' => 'flow_type_str', 'name' => '类型'],
                ['value' => 'money', 'name' => '金额'],
                ['value' => 'remark', 'name' => '备注'],
                ['value' => 'create_time_str', 'name' => '时间'],
            ];
            break;
        case 'withdraw_query':
            $field = [
                ['value' => 'index', 'name' => '序号'],
                ['value' => 'withdraw_sn', 'name' => '提现编号'],
                ['value' => 'member_name', 'name' => '会员账号'],
                ['value' => 'bank_name', 'name' => '银行名称'],
                ['value' => 'cardholder', 'name' => '户名'],
                ['value' => 'card_no', 'name' => '卡号'],
                ['value' => 'withdraw_money', 'name' => '提现金额含手续费'],
                ['value' => 'hand_fee', 'name' => '手续费'],
                ['value' => 'withdraw_status', 'name' => '状态'],
                ['value' => 'audit_time_str', 'name' => '审核时间'],
                ['value' => 'audit_remark', 'name' => '备注'],
                ['value' => 'create_time_str', 'name' => '申请时间'],
            ];
            break;
        case 'order_query':
            $field = [
                ['value' => 'order_sn', 'name' => '订单编号'],
                ['value' => 'member_name', 'name' => '参团会员'],
                ['value' => 'member_nickname', 'name' => '参团会员'],
                ['value' => 'goods_id', 'name' => '参团商品'],
                ['value' => 'goods_price', 'name' => '商品价格'],
                ['value' => 'total_amount', 'name' => '数量'],
                ['value' => 'total_money', 'name' => '总金额(元)'],
                ['value' => 'receipt_name', 'name' => '收货人'],
                ['value' => 'receipt_mobile', 'name' => '联系电话'],
                ['value' => 'receipt_address', 'name' => '收货地址'],
                ['value' => 'delivery_type_str', 'name' => '配送方式'],
                ['value' => 'order_status', 'name' => '订单状态'],
                ['value' => 'place_order_time_str', 'name' => '下单时间'],
                ['value' => 'buyer_message', 'name' => '订单留言'],
                ['value' => 'shipment_no', 'name' => '快递单号'],
                ['value' => 'delivery_remark', 'name' => '发货备注'],
            ];
            break;
        case 'fund_reconciliation':
            $field = [
                ['value' => 'range', 'name' => '时间'],
                ['value' => 'member_name', 'name' => '会员账号'],
                ['value' => 'member_nickname', 'name' => '昵称'],
                ['value' => 'share_money_income', 'name' => '豆豆收入'],
                ['value' => 'share_money_expense', 'name' => '豆豆提现'],
                ['value' => 'pop_money_income', 'name' => '余额收入'],
                ['value' => 'pop_money_expense', 'name' => '余额提现'],
                ['value' => 'pop_money_handle_fee_expense', 'name' => '提现手续费(余额)'],
                ['value' => 'cash_money_income_for_share', 'name' => '豆豆入账'],
                ['value' => 'cash_money_income_for_pop', 'name' => '余额入账'],
                ['value' => 'cash_money_income_for_recharge', 'name' => '充值入账'],
                ['value' => 'cash_money_expense_for_win', 'name' => '参团消费'],
                ['value' => 'order_refund', 'name' => '参团退款'],
                ['value' => 'total_withdraw', 'name' => '提现出账'],
                ['value' => 'cash_money_withdrawing', 'name' => '提现待审'],
                ['value' => 'cash_money_withdraw', 'name' => '提现已审'],
                ['value' => 'cash_money_withdraw_return', 'name' => '提现退回'],
                ['value' => 'total_cash_money', 'name' => '现金钱包'],
            ];
            break;
        case 'statement':
            $field = [
                ['value' => 'date_string', 'name' => '时间'],
                ['value' => 'new_member_num', 'name' => '新增会员(人)'],
                ['value' => 'share_income', 'name' => '豆豆收入'],
                ['value' => 'share_expense', 'name' => '豆豆提现'],
                ['value' => 'pop_income', 'name' => '余额收入'],
                ['value' => 'pop_expense', 'name' => '余额提现'],
                ['value' => 'pop_handle_fee_expense', 'name' => '提现手续费(余额)'],
                ['value' => 'cash_recharge_num', 'name' => '充值笔数'],
                ['value' => 'cash_income_for_recharge', 'name' => '充值金额'],
                ['value' => 'cash_income_for_share', 'name' => '豆豆转入'],
                ['value' => 'cash_income_for_pop', 'name' => '余额转入'],
                ['value' => 'order_refund', 'name' => '订单退款'],
                ['value' => 'total_win_money', 'name' => '总成单额'],
                ['value' => 'total_withdraw_money', 'name' => '提现金额'],
                ['value' => 'total_cash_money', 'name' => '现金钱包'],
                ['value' => 'fifty_group_num', 'name' => '开团次数(50)'],
                ['value' => 'fifty_group_finish_num', 'name' => '成团次数(50)'],
                ['value' => 'fifty_win_num', 'name' => '成单数量(50)'],
                ['value' => 'fifty_win_money', 'name' => '成单额(50)'],
                ['value' => 'thousand_group_num', 'name' => '开团次数(1000)'],
                ['value' => 'thousand_group_finish_num', 'name' => '成团次数(1000)'],
                ['value' => 'thousand_win_num', 'name' => '成单数量(1000)'],
                ['value' => 'thousand_win_money', 'name' => '成单额(1000)'],
            ];
            break;
    }
    return $field;
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
 * 判断是否可以拟稿
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canDraftOrder()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'draftOrder');
}

/**
 * 判断是否可以提交订单
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canSubmitOrder()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'submitOrder');
}

/**
 * 判断是否可以发货
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canShipOrder()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'orderShip');
}

/**
 * 判断是否可以收货
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canReceiptOrder()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'orderReceipt');
}

/**
 * 判断是否可以取消订单
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canCancelOrder()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'orderCancel');
}

/**
 * 判断是否删除订单
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canDeleteOrder()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'deleteOrder');
}

/**
 * 判断是否可以追加日志
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canAppendLog()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'appendLog');
}

/**
 * 判断是否可以导出订单
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canDownloadOrder()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'downloadOrder');
}

/**
 * 判断是否可以收款
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canCollectBill()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Bill', 'confirmCollect');
}

/**
 * 判断是否可以开票
 * @return boolean
 * User: hdc
 * Date: 2020-02-14 11:39:22
 * Update: 2020-02-14 11:39:22
 * Version: 1.00
 */
function canConfirmInvoice()
{
    return \Org\Util\Rbac::AccessDecision('Manage', 'Order', 'confirmInvoice');
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