<?php
/**
 * 后台基本框架页面
 * Class IndexController
 * @package AdminLF\Controller
 * User: hjun
 * Date: 2018-03-29 22:55:53
 * Update: 2018-03-29 22:55:53
 * Version: 1.00
 * company 启达联创(厦门)信息科技有限公司
 * Copyright  ©2018 www.wxzbc.com  All rights reserved
 */

namespace AdminLF\Controller;

use Common\Lib\Category;
use Common\Model\ContractModel;

class IndexController extends CommonController
{
    public function index()
    {
        $menu_list = Array(
            [
                'action'=>'',
                'id'=>'164',
            ]
        );
        $this->assign('menu', $menu_list);//顶部一级菜单，该项目未显示一级菜单
        $this->display();
    }
    public function getMenu($pid = 0)
    {
        $menu_list = getDefaultData('json/menu/admin_lf');//左侧二级菜单
        $menu_json = json_encode($menu_list);
        exit($menu_json);
    }
    public function test1()
    {
        $this->display('Test/test1');
    }

}
