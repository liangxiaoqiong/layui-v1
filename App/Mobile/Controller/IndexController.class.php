<?php

namespace Mobile\Controller;

class IndexController extends MobileCommonController
{
    //方法：index
    public function index()
    {
		$where = "status=1";
		$fields = 'id,title,keywords,litpic,description,publishtime,click,cid,flag,jumpurl,tag,userid';
		$prefix = C('DB_PREFIX');
		$limit = 12;
		
		$ModelView = M('')->field($fields)->table($prefix.'article')->where($where)
		->union("SELECT $fields FROM ".$prefix."picture WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."music WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."video WHERE $where ORDER BY publishtime desc LIMIT $limit",true);
		$vlist = $ModelView->select();
		
		if($vlist){
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
		}
		//dump($vlist);
		//exit;
		$this->assign('vlist', $vlist);
        $this->assign('title', C('CFG_WEBNAME'));
        $this->display();

    }
}
?>