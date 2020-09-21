<?php

namespace Mobile\Controller;

class TagController extends MobileCommonController
{
    //方法：index
    public function index()
    {
        $tagname = I('tagname', '', 'htmlspecialchars,trim'); //标签
        /*if ($tagname == '') {
            $this->error('非法操作');
        }*/
		//$tablename = 'article';
		//$tablename = 'soft';
        if (!empty($tagname)) {

            /*$where = array('tag' => array('LIKE', '%' . $tagname . '%'));
			$where['status'] = 1;*/
			$where = "tag LIKE '%$tagname%' OR title LIKE '%$tagname%' AND status=1";
			$fields = 'id,title,keywords,litpic,description,publishtime,click,cid,flag,jumpurl,tag';
			$prefix = C('DB_PREFIX'); 
			
            //$count = D2('ArcView', $tablename)->where($where)->count();
			$Model = M('')->field($fields)->table($prefix.'article')->where($where)
			->union("SELECT $fields FROM ".$prefix."picture WHERE $where",true)
			->union("SELECT $fields FROM ".$prefix."soft WHERE $where",true)
			->union("SELECT $fields FROM ".$prefix."special WHERE $where",true);
			$count = count($Model->select());

            //设置显示的页数
            $thisPage           = new \Common\Lib\Page($count, 10);
            $thisPage->rollPage = 5;
			$thisPage->setConfig('first',"首页");
			$thisPage->setConfig('last',"末页");
			$thisPage->setConfig('prev',"&lt;");
			$thisPage->setConfig('next',"&gt;");
            $thisPage->setConfig('theme', ' %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
            $limit = $thisPage->firstRow . ',' . $thisPage->listRows;
            $page  = $thisPage->show();

            //$vlist = D2('ArcView', $tablename)->nofield('content')->where($where)->order('id desc')->limit($limit)->select();
			$ModelView = M('')->field($fields)->table($prefix.'article')->where($where)
			->union("SELECT $fields FROM ".$prefix."picture WHERE $where",true)
			->union("SELECT $fields FROM ".$prefix."soft WHERE $where",true)
			->union("SELECT $fields FROM ".$prefix."special WHERE $where ORDER BY id desc LIMIT $limit",true);
			$vlist = $ModelView->select();
        } else {
            $page  = '';
            $vlist = array();
        }
        if (empty($vlist)) {
            $vlist = array();
        }
        foreach ($vlist as $k => $v) {
            if (isset($v['flag'])) {
                $_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
                $_jumpurl  = $v['jumpurl'];
            } else {
                $_jumpflag = false;
                $_jumpurl  = '';
            }
			$type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);
			$vlist[$k]['ename'] = $type['ename'];
			$vlist[$k]['catename'] = $type['name'];
			$vlist[$k]['modelid'] = $type['modelid'];
			$vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $type['ename'], $_jumpflag, $_jumpurl);
			$vlist[$k]['curl'] = get_url($type);
			$vlist[$k]['comment'] = get_comment($v['id'],$type['modelid']);
        }

        if (empty($tagname)) {
            $title = '标签库';
        } else {
            $title = $tagname . '_标签库';
        }

        $this->assign('title', $title);
        $this->assign('tagname', $tagname);
        $this->assign('vlist', $vlist);
        $this->assign('page', $page);
		$this->assign('count', $count);
        $this->display();

    }
	
	public function lists(){
		$map['tag_status'] = 1;
		$tags = M('tag')->where($map)->order('tag_id DESC')->limit(1500)->select();
		$title = '标签库';
		$this->assign('title', $title);
		$this->assign('tags', $tags);
        $this->display();
	}

}
