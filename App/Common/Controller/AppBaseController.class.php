<?php

namespace Common\Controller;

use Think\Controller;

/**
 * App接口基类
 * Class AppBaseController
 * @package Common\Controller
 * User: hjun
 * Date: 2019-02-27 17:27:16
 * Update: 2019-02-27 17:27:09
 * Version: 1.00
 * company 启达联创(厦门)信息科技有限公司
 * Copyright  ©2018 www.wxzbc.com  All rights reserved
 */
class AppBaseController extends Controller\RestController
{

    protected $origin;
    // 允许的域名
    protected $allow_origin = [
        'http://www.sosoapi.com',
    ];

    // 请求参数
    protected $req = null;

    /**
     * 初始化
     * BaseController constructor.
     */
    public function __construct()
    {
        parent::__construct();

        // 请求身份认证
        $this->auth();

        $this->req = $this->getReqParam();
        logWrite("请求头1:" . jsonEncode($_SERVER));
        logWrite("请求头2:" . jsonEncode(apache_request_headers()));
        logWrite("请求参数:" . jsonEncode($this->req));
        $body = file_get_contents('php://input');
        logWrite("请求body:{$body}");
    }

    /**
     * 身份认证
     * User: hjun
     * Date: 2018-03-31 23:16:21
     * Update: 2018-03-31 23:16:21
     * Version: 1.00
     */
    protected function auth()
    {
        // 跨域访问以及session的保持
        if (isset($_SERVER['HTTP_ORIGIN'])) {
            $this->origin = $_SERVER['HTTP_ORIGIN'];
            if (in_array($this->origin, $this->allow_origin)) {
                header("Access-Control-Allow-Headers:x-requested-with,content-type,Authorization");
                header('Access-Control-Allow-Credentials: true'); // 控制是否开启与Ajax的Cookie提交方式'
                header('Access-Control-Allow-Origin:' . $this->origin);
            }
        }
        if (REQUEST_METHOD === 'OPTIONS') {
            $this->apiResponse(getReturn(CODE_SUCCESS));
        }
    }

    /**
     * 获取当前请求参数
     * @return array ['code'=>200, 'msg'=>'', 'data'=>null]
     * User: hjun
     * Date: 2018-04-01 01:42:55
     * Update: 2018-04-01 01:42:55
     * Version: 1.00
     */
    protected function getReqParam()
    {
        if (isset($this->req)) {
            return $this->req;
        }
        $get = I('get.');
        $post = I('post.');
        $req = array_merge($get, $post);
        $body = I('put.');
        return array_merge($req, $body);
    }

    /**
     * 响应函数。默认使用JSON
     * @param $data
     * @param string $type
     * @param int $code HTTP状态
     * @param int $json_option json编码选项
     * Author: hj
     * Desc:
     * Date: 2017-11-23 19:28:36
     * Update: 2017-11-23 19:28:36
     * Version: 1.0
     */
    protected function apiResponse($data, $type = 'json', $code = 200, $json_option = 256)
    {
        $this->sendHttpStatus($code);
        if ('json' == $type) {
            // 返回JSON数据格式到客户端 包含状态信息
            $data = json_encode($data, $json_option);
        } elseif ('xml' == $type) {
            // 返回xml格式数据
            $data = xml_encode($data);
        } elseif ('php' == $type) {
            $data = serialize($data);
        }// 默认直接输出
        $this->setContentType($type);
        exit($data);
    }
}
