<?php
/**
 * 前端基类
 * Class BaseController
 * @package Wap\Controller
 * User: hjun
 * Date: 2018-03-29 23:04:55
 * Update: 2018-03-29 23:04:55
 * Version: 1.00
 * company 启达联创(厦门)信息科技有限公司
 * Copyright  ©2018 www.wxzbc.com  All rights reserved
 */

namespace Wap\Controller;

use Common\PHPUnit\Model\DbCacheTest;
use Common\Util\WxApi;

class BaseController extends \Common\Controller\BaseController
{
    protected $mall = [];
    protected $mall_id = 0;  //商城编号

    protected $fid = '';    //推荐人id
    protected $openid = '';
    protected $member_id = '';
    protected $mallMemberId = 0;
    protected $memberInfo = [];
    protected $mallMemberData = '';

    public function __construct()
    {
        parent::__construct();
        $this->initMall();
        $this->initWxJsConfig();
    }

    /**
     * 初始化分享内容
     * User: hdc
     * Date: 2020-06-19 19:35:18
     * Update: 2020-06-19 19:35:18
     * Version: 1.00
     */
    public function initShareInfo()
    {
        $info = D('Mall')->getMallInfo($this->mall_id);
        $this->assign('share_imgUrl', $info['logo']);
        $this->assign('share_title', $info['wx_share_title']);
        // hj 2017-09-26 00:45:06 去除字符串中的 \r\n \n\r 否则JS报错 强迫症
        $share_desc = $info['wx_share_content'];
        $share_desc = preg_replace('/\r\n/is', '', $share_desc);
        $share_desc = preg_replace('/\n\r/is', '', $share_desc);
        $this->assign('share_desc', $share_desc);
        $ctrl = CONTROLLER_NAME;
        $act = ACTION_NAME;
        $params = $_GET;
        // 把微信的参数删了
        unset($params['code'], $params['state']);
        if ($act == 'joinSuccess' || $act == 'getRecordDetail') {
            $record = D('GroupRecord')->getGroupRecord($this->mall_id, $params['record_id']);
            $ctrl = 'Group';
            if ($record['group_type'] == 1) {
                $act = 'fiftyGroupIndex';
            } else {
                $act = 'thousandGroupIndex';
            }
            $params = [];
            $params['mid'] = $this->mall_id;
        }
        $params['fid'] = $this->fid;
        $query = http_build_query($params);
        if (MODE == 'home_dev' || MODE == 'dev') {
            $share_link = URL("/system/tgmall/index.php?s=/{$ctrl}/{$act}&{$query}"); //默认初始化分享地址
        } else {
            $share_link = URL("/index.php?s=/{$ctrl}/{$act}&{$query}"); //默认初始化分享地址
        }
        $this->assign('share_link', $share_link);
        $share_action = strtolower(MODULE_NAME . '-' . CONTROLLER_NAME . '-' . ACTION_NAME);
        $this->assign('share_action', $share_action);
    }

    /**
     * 微信JS-SDK配置
     * User: Ydr
     * Date: 2020/6/5
     * Time: 16:35
     */
    public function initWxJsConfig()
    {
        $wxApi = new WxApi($this->mall_id);
        $result = $wxApi->getJsSdkConfig();
        if (isSuccess($result)) {
            $params = $result['data'];
            $this->assign('appId', $params['appId']);
            $this->assign('timeStamp', $params['timeStamp']);
            $this->assign('nonceStr', $params['nonceStr']);
            $this->assign('signature', $params['signature']);
        }
    }

    /**
     * 初始化商城
     * User: hjun
     * Date: 2019-06-28 12:19:50
     * Update: 2019-06-28 12:19:50
     * Version: 1.00
     */
    public function initMall()
    {
        $this->mall_id = $this->req['mid'];
        $this->fid = $this->req['fid'];
        if (empty($this->mall_id)) {
            $this->mall_id = session('mall_id');
        }

        $this->mall = D('Mall')->getActiveMall($this->mall_id);
        if (empty($this->mall)) {
            $this->error('暂无该商城');
        }

        $admin['mall_id'] = $this->mall_id;
        session('ADMIN', $admin);
        C('ADMIN', $admin);
        $this->assign("mid", $this->mall_id);
    }

    /**
     * 自动微信登录
     * User: hjun
     * Date: 2019-06-28 12:16:09
     * Update: 2019-06-28 12:16:09
     * Version: 1.00
     */
    public function autoWxLogin()
    {
        // hjun 测试环境为了方便在网页调试 不需要在微信中打开
        if (is_weixin() || MODE != 'common') {
            $this->openid = session("openid");
            $this->member_id = session('member_id');
            if (defined('MEMBER_OPEN_ID') && defined('MEMBER_ID')) {
                $this->openid = MEMBER_OPEN_ID;
                $this->member_id = MEMBER_ID;
            }
        } else {
            $this->error("请在微信上访问～_～");
        }

        // session中没有openid重新获取
        $wxApi = new WxApi($this->mall_id);
        if ($this->isMallIdChange() || empty($this->openid)) {
            $this->openid = $wxApi->getOpenId();
            session('openid', $this->openid);
        }

        // 没有账号自动注册 member_id存在session中 即使切换了商城,用的也是同一个账号 只是openid不同
        $this->memberInfo = D('Member')->getMember($this->member_id);
        if (empty($this->memberInfo)) {
            $this->memberInfo = D('Member')->getMemberByOpenId($this->openid);
            if (empty($this->memberInfo)) {
                $userInfo = $wxApi->getUserBaseInfo();
                $this->member_id = D('Member')->registerByWx($userInfo, $this->fid, $this->mall_id);
                $this->memberInfo = D('Member')->getMemberByOpenId($this->openid);
            } else {
                $this->member_id = $this->memberInfo['id'];
            }
            session('member_id', $this->member_id);
        } else {
            $this->member_id = $this->memberInfo['id'];
        }

        // 没有关注商城自动关注商城
        $this->mallMemberData = D('MallMember')->getInfo($this->mall_id, $this->member_id, $this->openid);
        if (empty($this->mallMemberData)) {
            $this->mallMemberId = D('MallMember')->subscribeMall($this->member_id, $this->mall_id, $this->openid);
            if (empty($this->mallMemberId)) {
                $this->error('系统繁忙,请稍候重试...');
            }
            $this->mallMemberData = D('MallMember')->getInfo($this->mall_id, $this->member_id);
        }

//        // 没有绑定号码要跳转到绑定号码页面
//        if (empty($this->memberInfo['mobile']) && !$this->isBindTelPage()) {
//            $redirectUrl = urlencode(getCurPageURL());
//            $url = URL(U('BindTel/bindPhone', ['gid' => $this->mall_id, 'back_url' => $redirectUrl]));
//            jump($url, 0);
//        }

        // 当前用户名称
        if (!empty($this->memberInfo['nick_name'])) {
            $this->memberInfo['current_name'] = $this->memberInfo['nick_name'];
        } else {
            $this->memberInfo['current_name'] = $this->memberInfo['username'];
        }
        //推荐人
        $member_id = $this->member_id;
        if ($this->fid != $member_id && !empty($member_id)) {
            session('share_member_id', $this->fid);
            $this->fid = $member_id;
        }
        $this->assign('fid', $this->fid);
        $this->assign('memberInfo', $this->memberInfo);
    }

    /**
     * 判断当前页面是否是绑定手机号页面
     * @return boolean
     * User: hjun
     * Date: 2018-05-17 11:11:44
     * Update: 2018-05-17 11:11:44
     * Version: 1.00
     */
    public function isBindTelPage()
    {
        $controller = CONTROLLER_NAME;
        return $controller === 'BindTel';
    }

    /**
     * 判断用户是否切换了商城
     * @return boolean
     * User: hjun
     * Date: 2018-05-17 11:35:29
     * Update: 2018-05-17 11:35:29
     * Version: 1.00
     */
    public function isMallIdChange()
    {
        $oldMid = session('mall_id');
        if ($this->mall_id != $oldMid) {
            session('mall_id', $this->mall_id);
            return true;
        }
        return false;
    }
}