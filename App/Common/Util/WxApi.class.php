<?php

namespace Common\Util;

class WxApi extends Base
{
    const ERROR_INVALID_CODE = 40029;
    const ERROR_INVALID_CODE_USED = 400163;

    private $mallId;
    private $appId;
    private $appSecret;
    private $config;

    // 用户授权后的信息 包括openid 和 access_token
    private $userGrant;

    public function __construct($mallId = 0)
    {
        $this->mallId = $mallId;
        $config = D('WxConfig')->getWxConfigInfo($this->mallId);
        if (!$this->isConfigActive($config)) {
            $this->error('园区暂未配置公众号信息,无法提供服务');
        }
        $this->appId = $config['appid'];
        $this->appSecret = $config['appsecret'];
        $this->config = $config;
    }

    /**
     * 判断配置是否有效
     * @param $config
     * @return boolean
     * User: hjun
     * Date: 2018-05-17 09:17:07
     * Update: 2018-05-17 09:17:07
     * Version: 1.00
     */
    public function isConfigActive($config)
    {
        return !empty($config['appid']) && !empty($config['appsecret']);
    }

    /**
     * 是否是无效的code
     * @param $result
     * @return boolean
     * User: hjun
     * Date: 2018-05-17 09:48:47
     * Update: 2018-05-17 09:48:47
     * Version: 1.00
     */
    public function isInvalidCode($result)
    {
        return $result['code'] === self::ERROR_INVALID_CODE || $result['code'] === self::ERROR_INVALID_CODE_USED;
    }

    /**
     * 获取用户授权信息
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2018-05-17 10:02:41
     * Update: 2018-05-17 10:02:41
     * Version: 1.00
     */
    public function getUserGrantInfo()
    {
        function get($appid, $appsecret)
        {
            if (!isset($_GET['code'])) {
                $thisurl = urlencode(getCurPageURL());
                $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $appid .
                    '&redirect_uri=' . $thisurl . '&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect&connect_redirect=1';
                jump($url, 1);
            } else {
                $code = $_GET['code'];
            }
            $get_token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $appid .
                '&secret=' . $appsecret . '&code=' . $code . '&grant_type=authorization_code';
            $tokenData = httpRequest($get_token_url);
            $tokenData = json_decode($tokenData, 1);
            if (empty($tokenData['openid'])) {
                return getReturn($tokenData['errcode'], $tokenData['errmsg']);
            }
            return getReturn(CODE_SUCCESS, 'success', $tokenData);
        }

        $appid = $this->appId;
        $appsecret = $this->appSecret;
        // 尝试3次获取
        for ($i = 0; $i < 3; $i++) {
            $result = get($appid, $appsecret);
            if (isSuccess($result)) {
                $this->userGrant = $result['data'];
                return $result['data'];
            } elseif ($this->isInvalidCode($result)) {
                unset($_GET['code']);
            }
        }
        $this->error($result['msg']);
    }

    /**
     * 获取openid
     * @return string
     * User: hjun
     * Date: 2018-05-17 09:25:49
     * Update: 2018-05-17 09:25:49
     * Version: 1.00
     */
    public function getOpenId()
    {
        if (isset($this->userGrant)) {
            return $this->userGrant['openid'];
        }
        $this->getUserGrantInfo();
        return $this->userGrant['openid'];
    }

    /**
     * 获取网页授权的access_token
     * @return string
     * User: hjun
     * Date: 2018-05-17 10:05:48
     * Update: 2018-05-17 10:05:48
     * Version: 1.00
     */
    public function getGrantAccessToken()
    {
        if (isset($this->userGrant['access_token'])) {
            return $this->userGrant['access_token'];
        }
        $this->getUserGrantInfo();
        return $this->userGrant['openid'];
    }

    /**
     * 获取用户基本信息
     * @return array
     * User: hjun
     * Date: 2018-05-17 10:00:59
     * Update: 2018-05-17 10:00:59
     * Version: 1.00
     */
    public function getUserBaseInfo()
    {
        $openId = $this->getOpenId();
        $accessToken = $this->getGrantAccessToken();
        $url = "https://api.weixin.qq.com/sns/userinfo?access_token=" . $accessToken . "&openid=" . $openId . "&lang=zh_CN";
        $usermsg = json_decode(httpRequest($url), true);
        if (!empty($usermsg['errcode'])) {
            $this->error($usermsg['errmsg']);
        }
        return $usermsg;
    }

    /**
     * 获取授权access_token
     * @return string
     * User: hjun
     * Date: 2019-11-12 22:50:21
     * Update: 2019-11-12 22:50:21
     * Version: 1.00
     */
    public function getAccessToken()
    {
        $timeOut = $this->config['accesstoken_timeout'];
        $accessToken = $this->config['accesstoken'];
        if (!empty($accessToken) && $timeOut > time()) {
            return $accessToken;
        }
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$this->appId}&secret={$this->appSecret}";
        $result = jsonDecodeToArr(httpRequest($url));
        if (empty($result['access_token'])) {
            return $accessToken;
        }
        $data = [];
        $data['accesstoken'] = $result['access_token'];
        $data['accesstoken_timeout'] = NOW_TIME + 7000;
        /*防止多个园区使用同一微信公众号，通过appid 刷新accesstoken*/
        $where = array();
        $where['appid'] = $this->appId;
        D('WxConfig')->where($where)->save($data);
        $this->config['accesstoken'] = $data['accesstoken'];
        $this->config['accesstoken_timeout'] = $data['accesstoken_timeout'];
        return $data['accesstoken'];
    }

    /**
     * 发送通用模版消息到我自己的微信上
     * @param string $msg
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2019-11-12 23:00:30
     * Update: 2019-11-12 23:00:30
     * Version: 1.00
     */
    public function sendCommonTemplateMsg($msg = '')
    {
        if (empty($msg)) {
            return getReturn(CODE_ERROR, 'require msg');
        }
        $accessToken = $this->getAccessToken();
        $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token={$accessToken}";
        $data = [];
        $data['touser'] = 'od8av5wgzRRTV4NfnJD5DfAOLPO8';
        $data['template_id'] = 'pn-vhoFVYaCu9L0US2u9wwvMHw9Me5EEbs86ZMKp3AU';
        $content = [];
        $content['content'] = [];
        $content['content']['value'] = $msg;
        $content['content']['color'] = '#173177';
        $data['data'] = $content;
        $header = [];
        $header[] = "Content-type:application/json;charset=utf-8";
        $result = jsonDecodeToArr(httpRequest($url, 'POST', jsonEncode($data), $header));
        if ($result['errcode'] === 0) {
            return getReturn(CODE_SUCCESS, '', $result);
        }
        return getReturn(CODE_ERROR, $result['errmsg'], $result);
    }

    /**
     * 获取JS-SDK配置
     * User: Ydr
     * Date: 2020/6/5
     * Time: 16:35
     */
    public function getJsSdkConfig()
    {
        $timeOut = $this->config['ticket_timeout'];
        $jsTicket = $this->config['ticket'];
        if (!empty($jsTicket) && $timeOut > time()) {

        } else {
            $accessToken = $this->getAccessToken();
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={$accessToken}&type=jsapi";
            $result = jsonDecodeToArr(httpRequest($url, 'get'));
            if ($result['errcode'] === 0) {
                $jsTicket = $result['ticket'];
                $data = [];
                $data['ticket'] = $result['ticket'];
                $data['ticket_timeout'] = NOW_TIME + 7000;
                /*防止多个商城使用同一微信公众号，通过appid 刷新ticket*/
                $where = array();
                $where['appid'] = $this->appId;
                D('WxConfig')->where($where)->save($data);
            }
        }
        $requestUrl = URL($_SERVER['REQUEST_URI']);
        $nonceStr = get_randomstr(32);
        $timeStamp = NOW_TIME;
        $signature = sha1('jsapi_ticket=' . $jsTicket . '&noncestr=' . $nonceStr . '&timestamp=' . $timeStamp . '&url=' . $requestUrl);
        $params = [];
        $params['appId'] = $this->appId;
        $params['timeStamp'] = NOW_TIME;
        $params['nonceStr'] = $nonceStr;
        $params['signature'] = $signature;
        return getReturn(CODE_SUCCESS, 'success', $params);
    }
}