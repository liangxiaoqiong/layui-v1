<?php

namespace Mobile\Controller;

use Think\Controller;

//公共验证控制器
class MobileCommonController extends BaseController
{

    // 空操作，404页面
    public function _empty()
    {
        header("HTTP/1.1 404 Not Found");
        header("Status: 404 Not Found");
        $this->display(get_mtpl('404.html'));
    }

    public function _initialize()
    {
        if (C('CFG_WEBSITE_CLOSE') == 1) {
            exit_msg(C('CFG_WEBSITE_CLOSE_INFO'));
        }
		//go_pc();
		$uid = intval(get_cookie('uid'));
		if ($uid > 0) {
			$user = D('MemberView')->nofield('password,encrypt')->find($uid);
			$this->assign('member', $user);
		}
		//热门标签
		$map['tag_status'] = 1;
		$tags = M('tag')->where($map)->order('tag_click DESC')->limit(16)->select();
		$this->assign('tags', $tags);
		
		$this->assign('uid', $uid);
    }

}
