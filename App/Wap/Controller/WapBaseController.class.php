<?php
/**
 * 前端登录基类
 * Class WapBaseController
 * @package Wap\Controller
 * User: lwz
 * Date: 2018-03-27 20:22:33
 * Update: 2018-03-27 20:22:33
 * Version: 1.00
 * company 启达联创(厦门)信息科技有限公司
 * Copyright  ©2018 www.wxzbc.com  All rights reserved   
 */
namespace Wap\Controller;

class WapBaseController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->autoWxLogin();
        $this->initShareInfo();
    }
}