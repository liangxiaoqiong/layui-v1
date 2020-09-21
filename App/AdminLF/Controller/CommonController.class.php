<?php
/**
 * 管理员信息基类
 * Class CommonController
 * @package AdminLF\Controller
 * User: hjun
 * Date: 2018-03-27 20:22:33
 * Update: 2018-03-27 20:22:33
 * Version: 1.00
 * company 启达联创(厦门)信息科技有限公司
 * Copyright  ©2018 www.wxzbc.com  All rights reserved
 */
namespace AdminLF\Controller;

use Think\Controller;

class CommonController extends BaseController
{
    /*
     * 当前管理员信息
     * [
     *   'id' // 管理员ID
     *   'username' // 管理员账号
     *   'roleid' // 管理员角色ID
     *   'logintime' // 上次登录时间 格式：2018-03-26 02:49:07
     *   'usertype' // 管理员类型 9-超级管理员 0-工厂管理员
     *   'loginip' // 上次登录IP
     *   'loginnum' // 登录次数
     *   'mall_id' // 所属商城ID
     *   'mall_admin' // 是否是商城的管理账号
     *   'mall_name' // 商城名称
     *   'manager_name' // 负责人姓名
     *   'manager_mobile' // 负责人电话
     * ]
     */
    protected $admin = [];
    /*
     * 系统配置
     */
    protected $config = [];

    //_initialize自动运行方法，在每个方法前，系统会首先运动这个方法
    public function __construct()
    {
        parent::__construct();
        $adminInfo['mall_name'] = '测试后台';
        $adminInfo['username'] = '大美女';
        $this->assign('ADMIN', $adminInfo);
    }

}
