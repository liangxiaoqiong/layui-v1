# -----------------------------------------------------------
# Description:备份的数据表[结构] my_abc,my_abc_detail,my_access,my_active,my_admin,my_announce,my_area,my_article,my_attachment,my_attachmentindex,my_authorize,my_block,my_category,my_category_access,my_collect,my_collects,my_comment,my_config,my_copyfrom,my_digg,my_forum,my_forum_reply,my_guestbook,my_itemgroup,my_iteminfo,my_link,my_member,my_member_slog,my_memberdetail,my_membergroup,my_menu,my_meta,my_model,my_music,my_node,my_oauth_user,my_orderaction,my_orderdetail,my_orderinfo,my_pay,my_pay_month,my_picture,my_product,my_property,my_property_value,my_role,my_role_user,my_search,my_soft,my_special,my_tag,my_temp,my_topic,my_union,my_video
# Description:备份的数据表[数据] my_abc,my_abc_detail,my_access,my_active,my_admin,my_announce,my_area,my_article,my_attachment,my_attachmentindex,my_authorize,my_block,my_category,my_category_access,my_collect,my_collects,my_comment,my_config,my_copyfrom,my_digg,my_forum,my_forum_reply,my_guestbook,my_itemgroup,my_iteminfo,my_link,my_member,my_member_slog,my_memberdetail,my_membergroup,my_menu,my_meta,my_model,my_music,my_node,my_oauth_user,my_orderaction,my_orderdetail,my_orderinfo,my_pay,my_pay_month,my_picture,my_product,my_property,my_property_value,my_role,my_role_user,my_search,my_soft,my_special,my_tag,my_temp,my_topic,my_union,my_video
# Time: 2017-11-15 21:08:34
# -----------------------------------------------------------
# SQLFile Label：#1
# -----------------------------------------------------------


# 表的结构 my_abc 
DROP TABLE IF EXISTS `my_abc`;
CREATE TABLE `my_abc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `remark` varchar(50) DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `num` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '调用数',
  `items` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ;

# 表的结构 my_abc_detail 
DROP TABLE IF EXISTS `my_abc_detail`;
CREATE TABLE `my_abc_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(5) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ;

# 表的结构 my_access 
DROP TABLE IF EXISTS `my_access`;
CREATE TABLE `my_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_active 
DROP TABLE IF EXISTS `my_active`;
CREATE TABLE `my_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `code` varchar(11) NOT NULL DEFAULT '' COMMENT '激活码',
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ;

# 表的结构 my_admin 
DROP TABLE IF EXISTS `my_admin`;
CREATE TABLE `my_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `realname` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `usertype` tinyint(4) NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(30) NOT NULL COMMENT '登录IP',
  `loginnum` int(10) NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表' ;

# 表的结构 my_announce 
DROP TABLE IF EXISTS `my_announce`;
CREATE TABLE `my_announce` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

# 表的结构 my_area 
DROP TABLE IF EXISTS `my_area`;
CREATE TABLE `my_area` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `sname` varchar(10) NOT NULL DEFAULT '' COMMENT '简称',
  `ename` varchar(50) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_article 
DROP TABLE IF EXISTS `my_article`;
CREATE TABLE `my_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(250) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  `video` text,
  `order_content` int(10) DEFAULT '1',
  `downlink` text,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ;

# 表的结构 my_attachment 
DROP TABLE IF EXISTS `my_attachment`;
CREATE TABLE `my_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '原文件名',
  `filepath` varchar(200) NOT NULL DEFAULT '',
  `filetype` smallint(6) NOT NULL DEFAULT '1',
  `filesize` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `haslitpic` tinyint(1) NOT NULL DEFAULT '1',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 ;

# 表的结构 my_attachmentindex 
DROP TABLE IF EXISTS `my_attachmentindex`;
CREATE TABLE `my_attachmentindex` (
  `attid` int(10) unsigned NOT NULL DEFAULT '0',
  `arcid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(20) NOT NULL DEFAULT '',
  KEY `attid` (`attid`),
  KEY `arcid` (`arcid`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_authorize 
DROP TABLE IF EXISTS `my_authorize`;
CREATE TABLE `my_authorize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passoword` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `addtime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ;

# 表的结构 my_block 
DROP TABLE IF EXISTS `my_block`;
CREATE TABLE `my_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '说明',
  `content` text COMMENT '内容',
  `blocktype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_category 
DROP TABLE IF EXISTS `my_category`;
CREATE TABLE `my_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目分类名称',
  `ename` varchar(200) NOT NULL DEFAULT '' COMMENT '别名',
  `catpic` varchar(150) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属模型',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别',
  `link` varchar(200) DEFAULT '',
  `target` varchar(30) DEFAULT '',
  `seotitle` varchar(50) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '关键字',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '显示',
  `sort` smallint(6) NOT NULL DEFAULT '100' COMMENT '排序',
  `property` varchar(50) DEFAULT '',
  `uid` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='栏目分类表' ;

# 表的结构 my_category_access 
DROP TABLE IF EXISTS `my_category_access`;
CREATE TABLE `my_category_access` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  KEY `catid` (`catid`),
  KEY `roleid` (`roleid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_collect 
DROP TABLE IF EXISTS `my_collect`;
CREATE TABLE `my_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `site` varchar(50) NOT NULL,
  `listurl` varchar(100) NOT NULL DEFAULT '',
  `listpreg` varchar(250) DEFAULT '',
  `listapreg` varchar(250) DEFAULT '',
  `titlepreg` varchar(250) DEFAULT NULL,
  `keypreg` varchar(250) DEFAULT '',
  `descrippreg` varchar(250) DEFAULT '',
  `contentpreg` varchar(250) DEFAULT '',
  `contentpage` varchar(250) DEFAULT '',
  `cppreg` varchar(250) DEFAULT '',
  `picpreg` varchar(250) DEFAULT '',
  `piclistpreg` varchar(250) DEFAULT '',
  `downpreg` varchar(250) DEFAULT '',
  `count` int(10) unsigned DEFAULT '0',
  `listpage` varchar(250) DEFAULT '',
  `posttime` int(10) DEFAULT '0',
  `page` varchar(50) DEFAULT '',
  `ext` char(10) DEFAULT '',
  `firstpage` int(10) DEFAULT '1',
  `lastpage` int(10) DEFAULT '1',
  `type` smallint(2) DEFAULT '0',
  `codetype` smallint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ;

# 表的结构 my_collects 
DROP TABLE IF EXISTS `my_collects`;
CREATE TABLE `my_collects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `cid` smallint(6) NOT NULL DEFAULT '0',
  `mid` tinyint(2) DEFAULT '0',
  `addtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ;

# 表的结构 my_comment 
DROP TABLE IF EXISTS `my_comment`;
CREATE TABLE `my_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  KEY `modelid` (`modelid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 表的结构 my_config 
DROP TABLE IF EXISTS `my_config`;
CREATE TABLE `my_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '说明',
  `tvalue` varchar(150) NOT NULL DEFAULT '' COMMENT '参数类型',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分组',
  `value` text,
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `typeid` (`typeid`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 ;

# 表的结构 my_copyfrom 
DROP TABLE IF EXISTS `my_copyfrom`;
CREATE TABLE `my_copyfrom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(30) NOT NULL DEFAULT '',
  `siteurl` varchar(200) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_digg 
DROP TABLE IF EXISTS `my_digg`;
CREATE TABLE `my_digg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL,
  `mid` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `good` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '赞数',
  `bad` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '批数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_forum 
DROP TABLE IF EXISTS `my_forum`;
CREATE TABLE `my_forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(250) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  `order_content` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_forum_reply 
DROP TABLE IF EXISTS `my_forum_reply`;
CREATE TABLE `my_forum_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `support` int(10) DEFAULT '0',
  `against` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  KEY `modelid` (`modelid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_guestbook 
DROP TABLE IF EXISTS `my_guestbook`;
CREATE TABLE `my_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(30) DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `homepage` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `replytime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `content` text,
  `reply` text,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

# 表的结构 my_itemgroup 
DROP TABLE IF EXISTS `my_itemgroup`;
CREATE TABLE `my_itemgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `remark` varchar(20) DEFAULT '',
  `status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ;

# 表的结构 my_iteminfo 
DROP TABLE IF EXISTS `my_iteminfo`;
CREATE TABLE `my_iteminfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `group` varchar(20) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ;

# 表的结构 my_link 
DROP TABLE IF EXISTS `my_link`;
CREATE TABLE `my_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `ischeck` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页|内页',
  `posttime` int(10) unsigned NOT NULL,
  `sort` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ;

# 表的结构 my_member 
DROP TABLE IF EXISTS `my_member`;
CREATE TABLE `my_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `username` varchar(20) DEFAULT '',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `face` varchar(60) NOT NULL DEFAULT '' COMMENT '头像',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned DEFAULT '0',
  `loginip` varchar(20) DEFAULT '',
  `loginnum` mediumint(8) unsigned DEFAULT '0',
  `groupid` smallint(6) unsigned DEFAULT '0',
  `message` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `islock` tinyint(1) DEFAULT '0',
  `signed` text,
  `fromtype` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ;

# 表的结构 my_member_slog 
DROP TABLE IF EXISTS `my_member_slog`;
CREATE TABLE `my_member_slog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '积分加减类型：0 不变，1 增加，2 减少',
  `title` varchar(200) DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `scoreinfo` varchar(20) NOT NULL DEFAULT '',
  `addtime` int(10) NOT NULL,
  `descrip` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ;

# 表的结构 my_memberdetail 
DROP TABLE IF EXISTS `my_memberdetail`;
CREATE TABLE `my_memberdetail` (
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(30) DEFAULT '',
  `realname` varchar(30) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1980-01-01',
  `province` int(10) unsigned NOT NULL DEFAULT '0',
  `area` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(12) NOT NULL DEFAULT '',
  `tel` varchar(15) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `animal` int(10) unsigned NOT NULL DEFAULT '0',
  `star` int(10) unsigned NOT NULL DEFAULT '0',
  `blood` int(10) unsigned NOT NULL DEFAULT '0',
  `marital` int(10) unsigned NOT NULL DEFAULT '0',
  `education` int(10) unsigned NOT NULL DEFAULT '0',
  `vocation` int(10) unsigned NOT NULL DEFAULT '0',
  `income` int(10) unsigned NOT NULL DEFAULT '0',
  `maxim` varchar(100) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `job` varchar(50) DEFAULT '',
  `signature` varchar(255) DEFAULT '',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_membergroup 
DROP TABLE IF EXISTS `my_membergroup`;
CREATE TABLE `my_membergroup` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `rank` int(10) NOT NULL DEFAULT '0',
  `rankend` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `sort` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;

# 表的结构 my_menu 
DROP TABLE IF EXISTS `my_menu`;
CREATE TABLE `my_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(20) DEFAULT '',
  `parameter` varchar(100) DEFAULT '',
  `quick` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '显示',
  `sort` smallint(6) NOT NULL DEFAULT '100',
  `icon` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 ;

# 表的结构 my_meta 
DROP TABLE IF EXISTS `my_meta`;
CREATE TABLE `my_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'key',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ;

# 表的结构 my_model 
DROP TABLE IF EXISTS `my_model`;
CREATE TABLE `my_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `tablename` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ;

# 表的结构 my_music 
DROP TABLE IF EXISTS `my_music`;
CREATE TABLE `my_music` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(250) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  `video` text,
  `order_content` int(10) DEFAULT '1',
  `downlink` text,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

# 表的结构 my_node 
DROP TABLE IF EXISTS `my_node`;
CREATE TABLE `my_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 ;

# 表的结构 my_oauth_user 
DROP TABLE IF EXISTS `my_oauth_user`;
CREATE TABLE `my_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `oauth_from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` int(10) NOT NULL COMMENT '绑定时间',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `user_status` tinyint(2) NOT NULL DEFAULT '1',
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表' ;

# 表的结构 my_orderaction 
DROP TABLE IF EXISTS `my_orderaction`;
CREATE TABLE `my_orderaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `orderid` varchar(30) NOT NULL,
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `distribution_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `aid` int(10) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  `publishtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_orderdetail 
DROP TABLE IF EXISTS `my_orderdetail`;
CREATE TABLE `my_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(30) DEFAULT NULL COMMENT '订单ID',
  `productid` int(11) DEFAULT NULL,
  `userid` int(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `num` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_orderinfo 
DROP TABLE IF EXISTS `my_orderinfo`;
CREATE TABLE `my_orderinfo` (
  `orderid` varchar(30) NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `payid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `expressprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '邮费/运费',
  `prdouctprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '产品总价格',
  `totalprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总价格',
  `consignee` varchar(30) DEFAULT NULL COMMENT '收件人',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zip` int(10) NOT NULL DEFAULT '0',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `distribution_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `ip` char(15) NOT NULL DEFAULT '',
  `stime` int(10) NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `distribution_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  PRIMARY KEY (`orderid`),
  KEY `stime` (`stime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_pay 
DROP TABLE IF EXISTS `my_pay`;
CREATE TABLE `my_pay` (
  `out_trade_no` varchar(100) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL,
  `symbol` tinyint(1) DEFAULT '0',
  `points` int(8) NOT NULL,
  `huobi` int(8) NOT NULL DEFAULT '0' COMMENT '火币',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`out_trade_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_pay_month 
DROP TABLE IF EXISTS `my_pay_month`;
CREATE TABLE `my_pay_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `month` int(5) NOT NULL,
  `money` decimal(10,1) NOT NULL,
  `is_show` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_picture 
DROP TABLE IF EXISTS `my_picture`;
CREATE TABLE `my_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `author` varchar(30) DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `copyfrom` varchar(250) NOT NULL DEFAULT '' COMMENT '来源',
  `template` varchar(30) NOT NULL DEFAULT '' COMMENT '模板',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  `prop_value` varchar(500) DEFAULT '',
  `order_content` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_product 
DROP TABLE IF EXISTS `my_product`;
CREATE TABLE `my_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `brand` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌',
  `units` varchar(50) NOT NULL DEFAULT '' COMMENT '单位',
  `specification` varchar(50) NOT NULL DEFAULT '' COMMENT '规格',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `order_content` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_property 
DROP TABLE IF EXISTS `my_property`;
CREATE TABLE `my_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `units` char(10) DEFAULT NULL,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  `field` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='分类属性' ;

# 表的结构 my_property_value 
DROP TABLE IF EXISTS `my_property_value`;
CREATE TABLE `my_property_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prop_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vname` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`prop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分类属性' ;

# 表的结构 my_role 
DROP TABLE IF EXISTS `my_role`;
CREATE TABLE `my_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

# 表的结构 my_role_user 
DROP TABLE IF EXISTS `my_role_user`;
CREATE TABLE `my_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_search 
DROP TABLE IF EXISTS `my_search`;
CREATE TABLE `my_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(20) NOT NULL,
  `sort` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `num` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `userid` int(10) NOT NULL DEFAULT '0',
  `ipaddr` varchar(50) DEFAULT '',
  `referer` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `tag_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

# 表的结构 my_soft 
DROP TABLE IF EXISTS `my_soft`;
CREATE TABLE `my_soft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictureurls` text,
  `content` text COMMENT '内容',
  `updatelog` text COMMENT '更新日志',
  `downlink` text COMMENT '下载地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '版本号',
  `softtype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '软件类型',
  `copytype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权形式',
  `language` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语言',
  `os` varchar(100) NOT NULL DEFAULT '' COMMENT '运行环境',
  `filesize` varchar(10) NOT NULL DEFAULT '' COMMENT '文件大小',
  `officialurl` varchar(100) NOT NULL DEFAULT '' COMMENT '官方网站',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `tag` varchar(80) DEFAULT '',
  `demo` varchar(200) DEFAULT '',
  `downnum` int(10) DEFAULT '0',
  `scores` mediumint(8) DEFAULT '0',
  `prop_value` varchar(500) DEFAULT '',
  `order_content` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_special 
DROP TABLE IF EXISTS `my_special`;
CREATE TABLE `my_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `tip` varchar(500) DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `filename` varchar(60) DEFAULT '',
  `template` varchar(60) NOT NULL DEFAULT '',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `prop_value` varchar(500) DEFAULT '',
  `tag` varchar(500) DEFAULT '',
  `order_content` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_tag 
DROP TABLE IF EXISTS `my_tag`;
CREATE TABLE `my_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(30) DEFAULT '',
  `typeid` int(11) NOT NULL DEFAULT '0',
  `tag_name` varchar(20) NOT NULL DEFAULT '',
  `tag_sort` int(10) NOT NULL DEFAULT '1',
  `tag_status` tinyint(1) NOT NULL DEFAULT '1',
  `tag_click` int(10) NOT NULL DEFAULT '0',
  `posttime` int(10) NOT NULL DEFAULT '0',
  `num` int(10) DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  KEY `tag_status` (`tag_status`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ;

# 表的结构 my_temp 
DROP TABLE IF EXISTS `my_temp`;
CREATE TABLE `my_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `author` varchar(30) DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `copyfrom` varchar(250) NOT NULL DEFAULT '' COMMENT '来源',
  `template` varchar(30) NOT NULL DEFAULT '' COMMENT '模板',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ;

# 表的结构 my_topic 
DROP TABLE IF EXISTS `my_topic`;
CREATE TABLE `my_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(250) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  `order_content` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_union 
DROP TABLE IF EXISTS `my_union`;
CREATE TABLE `my_union` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` text NOT NULL,
  `publishtime` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ;

# 表的结构 my_video 
DROP TABLE IF EXISTS `my_video`;
CREATE TABLE `my_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(250) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  `video` text,
  `order_content` int(10) DEFAULT '1',
  `downlink` text,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ;



# 转存表中的数据：my_abc 
INSERT INTO `my_abc` VALUES ('1','PC首页轮播图','首页','722','257','<loop><li><a href=\"{$url}\"><img src=\"{$content}\" width=\"{$width}\" height=\"{$height}\" /></a></li></loop>','2','5','3');
INSERT INTO `my_abc` VALUES ('2','手机端轮播图','首页','0','0','<loop><a href=\"{$url}\"><img src=\"{$content}\" /></a></loop>','2','1','5');
INSERT INTO `my_abc` VALUES ('3','手机端微信二维码','内页','0','0','<loop><a href=\"{$url}\"><img src=\"{$content}\" /></a></loop>','2','1','1');
INSERT INTO `my_abc` VALUES ('4','PC其他页面轮播图','内页','0','0','<loop><a href=\"{$url}\"><img src=\"{$content}\" /></a></loop>','2','5','5');


# 转存表中的数据：my_abc_detail 
INSERT INTO `my_abc_detail` VALUES ('3','图片一','/uploads/abc1/20170203/589458cc82510.jpg','#','1475817845','1546233840','1','1','1');
INSERT INTO `my_abc_detail` VALUES ('4','图片二','/uploads/abc1/20170203/589458f9a61a6.jpg','#','1475817945','1543641900','1','1','1');
INSERT INTO `my_abc_detail` VALUES ('12','内页图片一','/uploads/abc1/20170203/589485098c443.jpg','#','1486120996','1522408980','4','1','1');
INSERT INTO `my_abc_detail` VALUES ('5','图片三','/uploads/abc1/20170203/589459377f2bf.jpg','#','1475819517','1543557060','1','1','1');
INSERT INTO `my_abc_detail` VALUES ('6','图片1','/uploads/abc1/20170116/587cbe4723e24.jpg','#','1484570088','1487248488','2','1','1');
INSERT INTO `my_abc_detail` VALUES ('7','图片2','/uploads/abc1/20170116/587cbe55cfb85.jpg','#','1484570191','1487248591','2','1','1');
INSERT INTO `my_abc_detail` VALUES ('8','图片3','/uploads/abc1/20170116/587cbe691fb84.jpg','#','1484570206','1487248606','2','1','1');
INSERT INTO `my_abc_detail` VALUES ('9','图片4','/uploads/abc1/20170116/587cbe7c6b6dc.jpg','#','1484570228','1487248628','2','1','1');
INSERT INTO `my_abc_detail` VALUES ('10','图片5','/uploads/abc1/20170116/587cbe9434d44.jpg','#','1484570253','1487248653','2','1','1');
INSERT INTO `my_abc_detail` VALUES ('11','公众号二维码','/uploads/abc1/20170116/587cc3755f6b5.jpg','','1484571491','1487249891','3','1','1');
INSERT INTO `my_abc_detail` VALUES ('13','内页图片二','/uploads/abc1/20170203/5894894e81e4d.jpg','#','1486121039','1522408980','4','1','1');
INSERT INTO `my_abc_detail` VALUES ('14','内页图片三','/uploads/abc1/20170203/589468bbd42ec.jpg','#','1486121135','1522495500','4','1','1');
INSERT INTO `my_abc_detail` VALUES ('15','内页图片四','/uploads/abc1/20170203/589468d0db8e7.jpg','#','1486121157','1522495500','4','1','1');
INSERT INTO `my_abc_detail` VALUES ('16','内页图片五','/uploads/abc1/20170203/589468eaebca2.jpg','#','1486121184','1522495560','4','1','1');


# 转存表中的数据：my_access 
INSERT INTO `my_access` VALUES ('1','62','3','');
INSERT INTO `my_access` VALUES ('1','61','3','');
INSERT INTO `my_access` VALUES ('1','60','3','');
INSERT INTO `my_access` VALUES ('1','59','2','');
INSERT INTO `my_access` VALUES ('1','54','3','');
INSERT INTO `my_access` VALUES ('1','53','3','');
INSERT INTO `my_access` VALUES ('1','52','3','');
INSERT INTO `my_access` VALUES ('1','51','2','');
INSERT INTO `my_access` VALUES ('1','50','3','');
INSERT INTO `my_access` VALUES ('1','49','3','');
INSERT INTO `my_access` VALUES ('1','48','3','');
INSERT INTO `my_access` VALUES ('1','47','3','');
INSERT INTO `my_access` VALUES ('1','46','2','');
INSERT INTO `my_access` VALUES ('1','45','3','');
INSERT INTO `my_access` VALUES ('1','44','3','');
INSERT INTO `my_access` VALUES ('1','43','3','');
INSERT INTO `my_access` VALUES ('1','42','3','');
INSERT INTO `my_access` VALUES ('1','41','2','');
INSERT INTO `my_access` VALUES ('1','40','3','');
INSERT INTO `my_access` VALUES ('1','39','3','');
INSERT INTO `my_access` VALUES ('1','38','3','');
INSERT INTO `my_access` VALUES ('1','37','3','');
INSERT INTO `my_access` VALUES ('1','36','2','');
INSERT INTO `my_access` VALUES ('1','35','3','');
INSERT INTO `my_access` VALUES ('1','34','3','');
INSERT INTO `my_access` VALUES ('1','33','3','');
INSERT INTO `my_access` VALUES ('1','32','3','');
INSERT INTO `my_access` VALUES ('1','31','2','');
INSERT INTO `my_access` VALUES ('1','30','3','');
INSERT INTO `my_access` VALUES ('1','29','3','');
INSERT INTO `my_access` VALUES ('1','28','3','');
INSERT INTO `my_access` VALUES ('1','27','3','');
INSERT INTO `my_access` VALUES ('1','26','3','');
INSERT INTO `my_access` VALUES ('1','25','2','');
INSERT INTO `my_access` VALUES ('1','24','3','');
INSERT INTO `my_access` VALUES ('1','23','3','');
INSERT INTO `my_access` VALUES ('1','22','3','');
INSERT INTO `my_access` VALUES ('1','21','3','');
INSERT INTO `my_access` VALUES ('1','20','3','');
INSERT INTO `my_access` VALUES ('1','19','2','');
INSERT INTO `my_access` VALUES ('1','100','3','');
INSERT INTO `my_access` VALUES ('1','55','3','');
INSERT INTO `my_access` VALUES ('1','18','3','');
INSERT INTO `my_access` VALUES ('1','17','2','');
INSERT INTO `my_access` VALUES ('1','12','3','');
INSERT INTO `my_access` VALUES ('1','11','3','');
INSERT INTO `my_access` VALUES ('1','10','3','');
INSERT INTO `my_access` VALUES ('1','9','3','');
INSERT INTO `my_access` VALUES ('1','8','3','');
INSERT INTO `my_access` VALUES ('1','6','3','');
INSERT INTO `my_access` VALUES ('1','5','3','');
INSERT INTO `my_access` VALUES ('1','4','3','');
INSERT INTO `my_access` VALUES ('1','3','3','');
INSERT INTO `my_access` VALUES ('1','2','2','');


# 转存表中的数据：my_active 
INSERT INTO `my_active` VALUES ('1','1','0','AbTXDUKtIPy','1472908893','','0');
INSERT INTO `my_active` VALUES ('2','2','0','pQvARhdJdyy','1474776333','','0');
INSERT INTO `my_active` VALUES ('3','3','0','XDjnGY86zQP','1474805042','','0');
INSERT INTO `my_active` VALUES ('4','1','0','2w3uZv1VgsI','1475416620','','0');
INSERT INTO `my_active` VALUES ('5','4','0','rnVq9Hrb4uk','1475662951','','0');
INSERT INTO `my_active` VALUES ('6','5','0','4B1tmW26s3p','1475752822','','0');
INSERT INTO `my_active` VALUES ('7','6','0','DwCaGpRwW1q','1475753686','','0');
INSERT INTO `my_active` VALUES ('8','7','0','N4p3VdqleaL','1475840149','','0');
INSERT INTO `my_active` VALUES ('9','8','0','5vjZKLdDWm1','1475891350','','0');
INSERT INTO `my_active` VALUES ('10','9','0','6vec1fmfA87','1476079472','','0');
INSERT INTO `my_active` VALUES ('11','10','0','mbsw7Qex6Fi','1476131695','','0');
INSERT INTO `my_active` VALUES ('12','11','0','v27f67lQZar','1476158474','','0');
INSERT INTO `my_active` VALUES ('13','12','0','g4DD1gcVv8s','1476292537','','0');
INSERT INTO `my_active` VALUES ('14','13','0','F7p6V54YJQL','1476419268','','0');
INSERT INTO `my_active` VALUES ('15','14','0','YquWbVXAMmV','1476511823','','0');
INSERT INTO `my_active` VALUES ('16','15','0','NhRKDU8wd6l','1476515692','','0');
INSERT INTO `my_active` VALUES ('17','16','0','48WqfNhlHWN','1476537703','','0');
INSERT INTO `my_active` VALUES ('18','17','0','uWwdkBsjJ92','1476670405','','0');
INSERT INTO `my_active` VALUES ('19','18','0','ERlVJm5dgr3','1476841993','','0');
INSERT INTO `my_active` VALUES ('20','19','0','FuraQVTl3KI','1476842552','','0');
INSERT INTO `my_active` VALUES ('21','20','0','PBXRlk6wMDU','1476936847','','0');
INSERT INTO `my_active` VALUES ('22','21','0','4kUQ9cVzSaY','1477020616','','0');
INSERT INTO `my_active` VALUES ('23','22','0','DAhn46FdmIr','1477036593','','0');
INSERT INTO `my_active` VALUES ('24','23','0','vy44sJKjk4Y','1482585404','','0');
INSERT INTO `my_active` VALUES ('25','24','0','DB8ss2JCD1m','1485960055','','0');
INSERT INTO `my_active` VALUES ('26','25','0','hWd8YgLjRmd','1486270600','','0');
INSERT INTO `my_active` VALUES ('27','26','0','tCTFFu1sGaL','1486270801','','0');


# 转存表中的数据：my_admin 
INSERT INTO `my_admin` VALUES ('1','admin','b4f59dd4dc87d2560f2c715ad4cc10e4','tbiIRH','','','9','1510751112','0.0.0.0','340','0');
INSERT INTO `my_admin` VALUES ('2','admin1','2dbe268102f482bad5297ff8db9c2322','xeFJuZ','张三','','0','1497879352','0.0.0.0','1','0');


# 转存表中的数据：my_announce 
INSERT INTO `my_announce` VALUES ('2','公告一','<p>公告一公告一公告一公告一公告一公告一公告一公告一公告一公告一</p>','1501826839','1533103620','1','1501826891');


# 转存表中的数据：my_area 
INSERT INTO `my_area` VALUES ('1','北京市','北京','beijing','0','0');
INSERT INTO `my_area` VALUES ('2','上海市','上海','','0','0');
INSERT INTO `my_area` VALUES ('3','天津市','天津','','0','0');
INSERT INTO `my_area` VALUES ('4','重庆市','重庆','','0','0');
INSERT INTO `my_area` VALUES ('5','广东省','广东','','0','0');
INSERT INTO `my_area` VALUES ('6','福建省','福建','','0','0');
INSERT INTO `my_area` VALUES ('7','浙江省','浙江','','0','0');
INSERT INTO `my_area` VALUES ('8','江苏省','江苏','','0','0');
INSERT INTO `my_area` VALUES ('9','山东省','山东','','0','0');
INSERT INTO `my_area` VALUES ('10','辽宁省','辽宁','','0','0');
INSERT INTO `my_area` VALUES ('11','江西省','江西','','0','0');
INSERT INTO `my_area` VALUES ('12','四川省','四川','','0','0');
INSERT INTO `my_area` VALUES ('13','陕西省','陕西','','0','0');
INSERT INTO `my_area` VALUES ('14','湖北省','湖北','','0','0');
INSERT INTO `my_area` VALUES ('15','河南省','河南','','0','0');
INSERT INTO `my_area` VALUES ('16','河北省','河北','','0','0');
INSERT INTO `my_area` VALUES ('17','山西省','山西','','0','0');
INSERT INTO `my_area` VALUES ('18','内蒙古','内蒙古','','0','0');
INSERT INTO `my_area` VALUES ('19','吉林省','吉林','','0','0');
INSERT INTO `my_area` VALUES ('20','黑龙江','黑龙江','','0','0');
INSERT INTO `my_area` VALUES ('21','安徽省','安徽','','0','0');
INSERT INTO `my_area` VALUES ('22','湖南省','湖南','','0','0');
INSERT INTO `my_area` VALUES ('23','广西','广西','','0','0');
INSERT INTO `my_area` VALUES ('24','海南省','海南','','0','0');
INSERT INTO `my_area` VALUES ('25','云南省','云南','','0','0');
INSERT INTO `my_area` VALUES ('26','贵州省','贵州','','0','0');
INSERT INTO `my_area` VALUES ('27','西藏','西藏','','0','0');
INSERT INTO `my_area` VALUES ('28','甘肃省','甘肃','','0','0');
INSERT INTO `my_area` VALUES ('29','宁夏区','宁夏区','','0','0');
INSERT INTO `my_area` VALUES ('30','青海省','青海','','0','0');
INSERT INTO `my_area` VALUES ('31','新疆','新疆','','0','0');
INSERT INTO `my_area` VALUES ('32','香港','香港','','0','0');
INSERT INTO `my_area` VALUES ('33','澳门','澳门','','0','0');
INSERT INTO `my_area` VALUES ('34','台湾省','台湾','','0','0');
INSERT INTO `my_area` VALUES ('60','海外','海外','','0','0');
INSERT INTO `my_area` VALUES ('101','东城区','东城区','','1','0');
INSERT INTO `my_area` VALUES ('102','西城区','西城区','','1','0');
INSERT INTO `my_area` VALUES ('103','崇文区','崇文区','','1','0');
INSERT INTO `my_area` VALUES ('104','宣武区','宣武区','','1','0');
INSERT INTO `my_area` VALUES ('105','朝阳区','朝阳区','','1','0');
INSERT INTO `my_area` VALUES ('106','海淀区','海淀区','','1','0');
INSERT INTO `my_area` VALUES ('107','丰台区','丰台区','','1','0');
INSERT INTO `my_area` VALUES ('108','石景山区','石景山区','','1','0');
INSERT INTO `my_area` VALUES ('109','门头沟区','门头沟区','','1','0');
INSERT INTO `my_area` VALUES ('110','房山区','房山区','','1','0');
INSERT INTO `my_area` VALUES ('111','通州区','通区','','1','0');
INSERT INTO `my_area` VALUES ('112','顺义区','顺义区','','1','0');
INSERT INTO `my_area` VALUES ('113','昌平区','昌平区','','1','0');
INSERT INTO `my_area` VALUES ('114','大兴区','大兴区','','1','0');
INSERT INTO `my_area` VALUES ('115','平谷县','平谷县','','1','0');
INSERT INTO `my_area` VALUES ('116','怀柔县','怀柔县','','1','0');
INSERT INTO `my_area` VALUES ('117','密云县','密云县','','1','0');
INSERT INTO `my_area` VALUES ('118','延庆县','延庆县','','1','0');
INSERT INTO `my_area` VALUES ('201','黄浦区','黄浦区','','2','0');
INSERT INTO `my_area` VALUES ('202','卢湾区','卢湾区','','2','0');
INSERT INTO `my_area` VALUES ('203','徐汇区','徐汇区','','2','0');
INSERT INTO `my_area` VALUES ('204','长宁区','长宁区','','2','0');
INSERT INTO `my_area` VALUES ('205','静安区','静安区','','2','0');
INSERT INTO `my_area` VALUES ('206','普陀区','普陀区','','2','0');
INSERT INTO `my_area` VALUES ('207','闸北区','闸北区','','2','0');
INSERT INTO `my_area` VALUES ('208','虹口区','虹口区','','2','0');
INSERT INTO `my_area` VALUES ('209','杨浦区','杨浦区','','2','0');
INSERT INTO `my_area` VALUES ('210','宝山区','宝山区','','2','0');
INSERT INTO `my_area` VALUES ('211','闵行区','闵行区','','2','0');
INSERT INTO `my_area` VALUES ('212','嘉定区','嘉定区','','2','0');
INSERT INTO `my_area` VALUES ('213','浦东新区','浦东新区','','2','0');
INSERT INTO `my_area` VALUES ('214','松江区','松江区','','2','0');
INSERT INTO `my_area` VALUES ('215','金山区','金山区','','2','0');
INSERT INTO `my_area` VALUES ('216','青浦区','青浦区','','2','0');
INSERT INTO `my_area` VALUES ('217','南汇区','南汇区','','2','0');
INSERT INTO `my_area` VALUES ('218','奉贤区','奉贤区','','2','0');
INSERT INTO `my_area` VALUES ('219','崇明县','崇明县','','2','0');
INSERT INTO `my_area` VALUES ('301','和平区','和平区','','3','0');
INSERT INTO `my_area` VALUES ('302','河东区','河东区','','3','0');
INSERT INTO `my_area` VALUES ('303','河西区','河西区','','3','0');
INSERT INTO `my_area` VALUES ('304','南开区','南开区','','3','0');
INSERT INTO `my_area` VALUES ('305','河北区','河北区','','3','0');
INSERT INTO `my_area` VALUES ('306','红桥区','红桥区','','3','0');
INSERT INTO `my_area` VALUES ('307','塘沽区','塘沽区','','3','0');
INSERT INTO `my_area` VALUES ('308','汉沽区','汉沽区','','3','0');
INSERT INTO `my_area` VALUES ('309','大港区','大港区','','3','0');
INSERT INTO `my_area` VALUES ('310','东丽区','东丽区','','3','0');
INSERT INTO `my_area` VALUES ('311','西青区','西青区','','3','0');
INSERT INTO `my_area` VALUES ('312','北辰区','北辰区','','3','0');
INSERT INTO `my_area` VALUES ('313','津南区','津南区','','3','0');
INSERT INTO `my_area` VALUES ('314','武清区','武清区','','3','0');
INSERT INTO `my_area` VALUES ('315','宝坻区','宝坻区','','3','0');
INSERT INTO `my_area` VALUES ('316','静海县','静海县','','3','0');
INSERT INTO `my_area` VALUES ('317','宁河县','宁河县','','3','0');
INSERT INTO `my_area` VALUES ('318','蓟县','蓟县','','3','0');
INSERT INTO `my_area` VALUES ('401','渝中区','渝中区','','4','0');
INSERT INTO `my_area` VALUES ('402','大渡口区','大渡口区','','4','0');
INSERT INTO `my_area` VALUES ('403','江北区','江北区','','4','0');
INSERT INTO `my_area` VALUES ('404','沙坪坝区','沙坪坝区','','4','0');
INSERT INTO `my_area` VALUES ('405','九龙坡区','九龙坡区','','4','0');
INSERT INTO `my_area` VALUES ('406','南岸区','南岸区','','4','0');
INSERT INTO `my_area` VALUES ('407','北碚区','北碚区','','4','0');
INSERT INTO `my_area` VALUES ('408','万盛区','万盛区','','4','0');
INSERT INTO `my_area` VALUES ('409','双桥区','双桥区','','4','0');
INSERT INTO `my_area` VALUES ('410','渝北区','渝北区','','4','0');
INSERT INTO `my_area` VALUES ('411','巴南区','巴南区','','4','0');
INSERT INTO `my_area` VALUES ('412','万州区','万区','','4','0');
INSERT INTO `my_area` VALUES ('413','涪陵区','涪陵区','','4','0');
INSERT INTO `my_area` VALUES ('414','黔江区','黔江区','','4','0');
INSERT INTO `my_area` VALUES ('415','永川市','永川','','4','0');
INSERT INTO `my_area` VALUES ('416','合川市','合川','','4','0');
INSERT INTO `my_area` VALUES ('417','江津市','江津','','4','0');
INSERT INTO `my_area` VALUES ('418','南川市','南川','','4','0');
INSERT INTO `my_area` VALUES ('419','长寿县','长寿县','','4','0');
INSERT INTO `my_area` VALUES ('420','綦江县','綦江县','','4','0');
INSERT INTO `my_area` VALUES ('421','潼南县','潼南县','','4','0');
INSERT INTO `my_area` VALUES ('422','荣昌县','荣昌县','','4','0');
INSERT INTO `my_area` VALUES ('423','璧山县','璧山县','','4','0');
INSERT INTO `my_area` VALUES ('424','大足县','大足县','','4','0');
INSERT INTO `my_area` VALUES ('425','铜梁县','铜梁县','','4','0');
INSERT INTO `my_area` VALUES ('426','梁平县','梁平县','','4','0');
INSERT INTO `my_area` VALUES ('427','城口县','城口县','','4','0');
INSERT INTO `my_area` VALUES ('428','垫江县','垫江县','','4','0');
INSERT INTO `my_area` VALUES ('429','武隆县','武隆县','','4','0');
INSERT INTO `my_area` VALUES ('430','丰都县','丰都县','','4','0');
INSERT INTO `my_area` VALUES ('431','奉节县','奉节县','','4','0');
INSERT INTO `my_area` VALUES ('432','开县','开县','','4','0');
INSERT INTO `my_area` VALUES ('433','云阳县','云阳县','','4','0');
INSERT INTO `my_area` VALUES ('434','忠县','忠县','','4','0');
INSERT INTO `my_area` VALUES ('435','巫溪县','巫溪县','','4','0');
INSERT INTO `my_area` VALUES ('436','巫山县','巫山县','','4','0');
INSERT INTO `my_area` VALUES ('437','石柱县','石柱县','','4','0');
INSERT INTO `my_area` VALUES ('438','秀山县','秀山县','','4','0');
INSERT INTO `my_area` VALUES ('439','酉阳县','酉阳县','','4','0');
INSERT INTO `my_area` VALUES ('440','彭水县','彭水县','','4','0');
INSERT INTO `my_area` VALUES ('501','广州市','广州','','5','0');
INSERT INTO `my_area` VALUES ('502','深圳市','深圳','','5','0');
INSERT INTO `my_area` VALUES ('503','珠海市','珠海','','5','0');
INSERT INTO `my_area` VALUES ('504','汕头市','汕头','','5','0');
INSERT INTO `my_area` VALUES ('505','韶关市','韶关','','5','0');
INSERT INTO `my_area` VALUES ('506','河源市','河源','','5','0');
INSERT INTO `my_area` VALUES ('507','梅州市','梅州','','5','0');
INSERT INTO `my_area` VALUES ('508','惠州市','惠州','','5','0');
INSERT INTO `my_area` VALUES ('509','汕尾市','汕尾','','5','0');
INSERT INTO `my_area` VALUES ('510','东莞市','东莞','','5','0');
INSERT INTO `my_area` VALUES ('511','中山市','中山','','5','0');
INSERT INTO `my_area` VALUES ('512','江门市','江门','','5','0');
INSERT INTO `my_area` VALUES ('513','佛山市','佛山','','5','0');
INSERT INTO `my_area` VALUES ('514','阳江市','阳江','','5','0');
INSERT INTO `my_area` VALUES ('515','湛江市','湛江','','5','0');
INSERT INTO `my_area` VALUES ('516','茂名市','茂名','','5','0');
INSERT INTO `my_area` VALUES ('517','肇庆市','肇庆','','5','0');
INSERT INTO `my_area` VALUES ('518','清远市','清远','','5','0');
INSERT INTO `my_area` VALUES ('519','潮州市','潮州','','5','0');
INSERT INTO `my_area` VALUES ('520','揭阳市','揭阳','','5','0');
INSERT INTO `my_area` VALUES ('521','云浮市','云浮','','5','0');
INSERT INTO `my_area` VALUES ('601','福州市','福州','','6','0');
INSERT INTO `my_area` VALUES ('602','厦门市','厦门','','6','0');
INSERT INTO `my_area` VALUES ('603','三明市','三明','','6','0');
INSERT INTO `my_area` VALUES ('604','莆田市','莆田','','6','0');
INSERT INTO `my_area` VALUES ('605','泉州市','泉州','','6','0');
INSERT INTO `my_area` VALUES ('606','漳州市','漳州','','6','0');
INSERT INTO `my_area` VALUES ('607','南平市','南平','','6','0');
INSERT INTO `my_area` VALUES ('608','龙岩市','龙岩','','6','0');
INSERT INTO `my_area` VALUES ('609','宁德市','宁德','','6','0');
INSERT INTO `my_area` VALUES ('701','杭州市','杭州','','7','0');
INSERT INTO `my_area` VALUES ('702','宁波市','宁波','','7','0');
INSERT INTO `my_area` VALUES ('703','温州市','温州','','7','0');
INSERT INTO `my_area` VALUES ('704','嘉兴市','嘉兴','','7','0');
INSERT INTO `my_area` VALUES ('705','湖州市','湖州','','7','0');
INSERT INTO `my_area` VALUES ('706','绍兴市','绍兴','','7','0');
INSERT INTO `my_area` VALUES ('707','金华市','金华','','7','0');
INSERT INTO `my_area` VALUES ('708','衢州市','衢州','','7','0');
INSERT INTO `my_area` VALUES ('709','舟山市','舟山','','7','0');
INSERT INTO `my_area` VALUES ('710','台州市','台州','','7','0');
INSERT INTO `my_area` VALUES ('711','丽水市','丽水','','7','0');
INSERT INTO `my_area` VALUES ('801','南京市','南京','','8','0');
INSERT INTO `my_area` VALUES ('802','徐州市','徐州','','8','0');
INSERT INTO `my_area` VALUES ('803','连云港市','连云港','','8','0');
INSERT INTO `my_area` VALUES ('804','淮安市','淮安','','8','0');
INSERT INTO `my_area` VALUES ('805','宿迁市','宿迁','','8','0');
INSERT INTO `my_area` VALUES ('806','盐城市','盐城','','8','0');
INSERT INTO `my_area` VALUES ('807','扬州市','扬州','','8','0');
INSERT INTO `my_area` VALUES ('808','泰州市','泰州','','8','0');
INSERT INTO `my_area` VALUES ('809','南通市','南通','','8','0');
INSERT INTO `my_area` VALUES ('810','镇江市','镇江','','8','0');
INSERT INTO `my_area` VALUES ('811','常州市','常州','','8','0');
INSERT INTO `my_area` VALUES ('812','无锡市','无锡','','8','0');
INSERT INTO `my_area` VALUES ('813','苏州市','苏州','','8','0');
INSERT INTO `my_area` VALUES ('901','济南市','济南','','9','0');
INSERT INTO `my_area` VALUES ('902','青岛市','青岛','','9','0');
INSERT INTO `my_area` VALUES ('903','淄博市','淄博','','9','0');
INSERT INTO `my_area` VALUES ('904','枣庄市','枣庄','','9','0');
INSERT INTO `my_area` VALUES ('905','东营市','东营','','9','0');
INSERT INTO `my_area` VALUES ('906','潍坊市','潍坊','','9','0');
INSERT INTO `my_area` VALUES ('907','烟台市','烟台','','9','0');
INSERT INTO `my_area` VALUES ('908','威海市','威海','','9','0');
INSERT INTO `my_area` VALUES ('909','济宁市','济宁','','9','0');
INSERT INTO `my_area` VALUES ('910','泰安市','泰安','','9','0');
INSERT INTO `my_area` VALUES ('911','日照市','日照','','9','0');
INSERT INTO `my_area` VALUES ('912','莱芜市','莱芜','','9','0');
INSERT INTO `my_area` VALUES ('913','德州市','德州','','9','0');
INSERT INTO `my_area` VALUES ('914','临沂市','临沂','','9','0');
INSERT INTO `my_area` VALUES ('915','聊城市','聊城','','9','0');
INSERT INTO `my_area` VALUES ('916','滨州市','滨州','','9','0');
INSERT INTO `my_area` VALUES ('917','菏泽市','菏泽','','9','0');
INSERT INTO `my_area` VALUES ('1001','沈阳市','沈阳','','10','0');
INSERT INTO `my_area` VALUES ('1002','大连市','大连','','10','0');
INSERT INTO `my_area` VALUES ('1003','鞍山市','鞍山','','10','0');
INSERT INTO `my_area` VALUES ('1004','抚顺市','抚顺','','10','0');
INSERT INTO `my_area` VALUES ('1005','本溪市','本溪','','10','0');
INSERT INTO `my_area` VALUES ('1006','丹东市','丹东','','10','0');
INSERT INTO `my_area` VALUES ('1007','锦州市','锦州','','10','0');
INSERT INTO `my_area` VALUES ('1008','葫芦岛市','葫芦岛','','10','0');
INSERT INTO `my_area` VALUES ('1009','营口市','营口','','10','0');
INSERT INTO `my_area` VALUES ('1010','盘锦市','盘锦','','10','0');
INSERT INTO `my_area` VALUES ('1011','阜新市','阜新','','10','0');
INSERT INTO `my_area` VALUES ('1012','辽阳市','辽阳','','10','0');
INSERT INTO `my_area` VALUES ('1013','铁岭市','铁岭','','10','0');
INSERT INTO `my_area` VALUES ('1014','朝阳市','朝阳','','10','0');
INSERT INTO `my_area` VALUES ('1101','南昌市','南昌','','11','0');
INSERT INTO `my_area` VALUES ('1102','景德镇市','景德镇','','11','0');
INSERT INTO `my_area` VALUES ('1103','萍乡市','萍乡','','11','0');
INSERT INTO `my_area` VALUES ('1104','新余市','新余','','11','0');
INSERT INTO `my_area` VALUES ('1105','九江市','九江','','11','0');
INSERT INTO `my_area` VALUES ('1106','鹰潭市','鹰潭','','11','0');
INSERT INTO `my_area` VALUES ('1107','赣州市','赣州','','11','0');
INSERT INTO `my_area` VALUES ('1108','吉安市','吉安','','11','0');
INSERT INTO `my_area` VALUES ('1109','宜春市','宜春','','11','0');
INSERT INTO `my_area` VALUES ('1110','抚州市','抚州','','11','0');
INSERT INTO `my_area` VALUES ('1111','上饶市','上饶','','11','0');
INSERT INTO `my_area` VALUES ('1201','成都市','成都','','12','0');
INSERT INTO `my_area` VALUES ('1202','自贡市','自贡','','12','0');
INSERT INTO `my_area` VALUES ('1203','攀枝花市','攀枝花','','12','0');
INSERT INTO `my_area` VALUES ('1204','泸州市','泸州','','12','0');
INSERT INTO `my_area` VALUES ('1205','德阳市','德阳','','12','0');
INSERT INTO `my_area` VALUES ('1206','绵阳市','绵阳','','12','0');
INSERT INTO `my_area` VALUES ('1207','广元市','广元','','12','0');
INSERT INTO `my_area` VALUES ('1208','遂宁市','遂宁','','12','0');
INSERT INTO `my_area` VALUES ('1209','内江市','内江','','12','0');
INSERT INTO `my_area` VALUES ('1210','乐山市','乐山','','12','0');
INSERT INTO `my_area` VALUES ('1211','南充市','南充','','12','0');
INSERT INTO `my_area` VALUES ('1212','宜宾市','宜宾','','12','0');
INSERT INTO `my_area` VALUES ('1213','广安市','广安','','12','0');
INSERT INTO `my_area` VALUES ('1214','达州市','达州','','12','0');
INSERT INTO `my_area` VALUES ('1215','巴中市','巴中','','12','0');
INSERT INTO `my_area` VALUES ('1216','雅安市','雅安','','12','0');
INSERT INTO `my_area` VALUES ('1217','眉山市','眉山','','12','0');
INSERT INTO `my_area` VALUES ('1218','资阳市','资阳','','12','0');
INSERT INTO `my_area` VALUES ('1219','阿坝州','阿坝','','12','0');
INSERT INTO `my_area` VALUES ('1220','甘孜州','甘孜','','12','0');
INSERT INTO `my_area` VALUES ('1221','凉山州','凉山','','12','0');
INSERT INTO `my_area` VALUES ('3114','西安市','西安','','13','0');
INSERT INTO `my_area` VALUES ('1302','铜川市','铜川','','13','0');
INSERT INTO `my_area` VALUES ('1303','宝鸡市','宝鸡','','13','0');
INSERT INTO `my_area` VALUES ('1304','咸阳市','咸阳','','13','0');
INSERT INTO `my_area` VALUES ('1305','渭南市','渭南','','13','0');
INSERT INTO `my_area` VALUES ('1306','延安市','延安','','13','0');
INSERT INTO `my_area` VALUES ('1307','汉中市','汉中','','13','0');
INSERT INTO `my_area` VALUES ('1308','榆林市','榆林','','13','0');
INSERT INTO `my_area` VALUES ('1309','安康市','安康','','13','0');
INSERT INTO `my_area` VALUES ('1310','商洛地区','商洛地区','','13','0');
INSERT INTO `my_area` VALUES ('1401','武汉市','武汉','','14','0');
INSERT INTO `my_area` VALUES ('1402','黄石市','黄石','','14','0');
INSERT INTO `my_area` VALUES ('1403','襄樊市','襄樊','','14','0');
INSERT INTO `my_area` VALUES ('1404','十堰市','十堰','','14','0');
INSERT INTO `my_area` VALUES ('1405','荆州市','荆州','','14','0');
INSERT INTO `my_area` VALUES ('1406','宜昌市','宜昌','','14','0');
INSERT INTO `my_area` VALUES ('1407','荆门市','荆门','','14','0');
INSERT INTO `my_area` VALUES ('1408','鄂州市','鄂州','','14','0');
INSERT INTO `my_area` VALUES ('1409','孝感市','孝感','','14','0');
INSERT INTO `my_area` VALUES ('1410','黄冈市','黄冈','','14','0');
INSERT INTO `my_area` VALUES ('1411','咸宁市','咸宁','','14','0');
INSERT INTO `my_area` VALUES ('1412','随州市','随州','','14','0');
INSERT INTO `my_area` VALUES ('1413','仙桃市','仙桃','','14','0');
INSERT INTO `my_area` VALUES ('1414','天门市','天门','','14','0');
INSERT INTO `my_area` VALUES ('1415','潜江市','潜江','','14','0');
INSERT INTO `my_area` VALUES ('1416','神农架','神农架','','14','0');
INSERT INTO `my_area` VALUES ('1417','恩施州','恩施','','14','0');
INSERT INTO `my_area` VALUES ('1501','郑州市','郑州','','15','0');
INSERT INTO `my_area` VALUES ('1502','开封市','开封','','15','0');
INSERT INTO `my_area` VALUES ('1503','洛阳市','洛阳','','15','0');
INSERT INTO `my_area` VALUES ('1504','平顶山市','平顶山','','15','0');
INSERT INTO `my_area` VALUES ('1505','焦作市','焦作','','15','0');
INSERT INTO `my_area` VALUES ('1506','鹤壁市','鹤壁','','15','0');
INSERT INTO `my_area` VALUES ('1507','新乡市','新乡','','15','0');
INSERT INTO `my_area` VALUES ('1508','安阳市','安阳','','15','0');
INSERT INTO `my_area` VALUES ('1509','濮阳市','濮阳','','15','0');
INSERT INTO `my_area` VALUES ('1510','许昌市','许昌','','15','0');
INSERT INTO `my_area` VALUES ('1511','漯河市','漯河','','15','0');
INSERT INTO `my_area` VALUES ('1512','三门峡市','三门峡','','15','0');
INSERT INTO `my_area` VALUES ('1513','南阳市','南阳','','15','0');
INSERT INTO `my_area` VALUES ('1514','商丘市','商丘','','15','0');
INSERT INTO `my_area` VALUES ('1515','信阳市','信阳','','15','0');
INSERT INTO `my_area` VALUES ('1516','周口市','周口','','15','0');
INSERT INTO `my_area` VALUES ('1517','驻马店市','驻马店','','15','0');
INSERT INTO `my_area` VALUES ('1518','济源市','济源','','15','0');
INSERT INTO `my_area` VALUES ('1601','石家庄市','石家庄','','16','0');
INSERT INTO `my_area` VALUES ('1602','唐山市','唐山','','16','0');
INSERT INTO `my_area` VALUES ('1603','秦皇岛市','秦皇岛','','16','0');
INSERT INTO `my_area` VALUES ('1604','邯郸市','邯郸','','16','0');
INSERT INTO `my_area` VALUES ('1605','邢台市','邢台','','16','0');
INSERT INTO `my_area` VALUES ('1606','保定市','保定','','16','0');
INSERT INTO `my_area` VALUES ('1607','张家口市','张家口','','16','0');
INSERT INTO `my_area` VALUES ('1608','承德市','承德','','16','0');
INSERT INTO `my_area` VALUES ('1609','沧州市','沧州','','16','0');
INSERT INTO `my_area` VALUES ('1610','廊坊市','廊坊','','16','0');
INSERT INTO `my_area` VALUES ('1611','衡水市','衡水','','16','0');
INSERT INTO `my_area` VALUES ('1701','太原市','太原','','17','0');
INSERT INTO `my_area` VALUES ('1702','大同市','大同','','17','0');
INSERT INTO `my_area` VALUES ('1703','阳泉市','阳泉','','17','0');
INSERT INTO `my_area` VALUES ('1704','长治市','长治','','17','0');
INSERT INTO `my_area` VALUES ('1705','晋城市','晋城','','17','0');
INSERT INTO `my_area` VALUES ('1706','朔州市','朔州','','17','0');
INSERT INTO `my_area` VALUES ('1707','晋中市','晋中','','17','0');
INSERT INTO `my_area` VALUES ('1708','忻州市','忻州','','17','0');
INSERT INTO `my_area` VALUES ('1709','临汾市','临汾','','17','0');
INSERT INTO `my_area` VALUES ('1710','运城市','运城','','17','0');
INSERT INTO `my_area` VALUES ('1711','吕梁地区','吕梁地区','','17','0');
INSERT INTO `my_area` VALUES ('1801','呼和浩特','呼和浩特','','18','0');
INSERT INTO `my_area` VALUES ('1802','包头市','包头','','18','0');
INSERT INTO `my_area` VALUES ('1803','乌海市','乌海','','18','0');
INSERT INTO `my_area` VALUES ('1804','赤峰市','赤峰','','18','0');
INSERT INTO `my_area` VALUES ('1805','通辽市','通辽','','18','0');
INSERT INTO `my_area` VALUES ('1806','鄂尔多斯','鄂尔多斯','','18','0');
INSERT INTO `my_area` VALUES ('1807','乌兰察布','乌兰察布','','18','0');
INSERT INTO `my_area` VALUES ('1808','锡林郭勒','锡林郭勒','','18','0');
INSERT INTO `my_area` VALUES ('1809','呼伦贝尔','呼伦贝尔','','18','0');
INSERT INTO `my_area` VALUES ('1810','巴彦淖尔','巴彦淖尔','','18','0');
INSERT INTO `my_area` VALUES ('1811','阿拉善盟','阿拉善盟','','18','0');
INSERT INTO `my_area` VALUES ('1812','兴安盟','兴安盟','','18','0');
INSERT INTO `my_area` VALUES ('1901','长春市','长春','','19','0');
INSERT INTO `my_area` VALUES ('1902','吉林市','吉林','','19','0');
INSERT INTO `my_area` VALUES ('1903','四平市','四平','','19','0');
INSERT INTO `my_area` VALUES ('1904','辽源市','辽源','','19','0');
INSERT INTO `my_area` VALUES ('1905','通化市','通化','','19','0');
INSERT INTO `my_area` VALUES ('1906','白山市','白山','','19','0');
INSERT INTO `my_area` VALUES ('1907','松原市','松原','','19','0');
INSERT INTO `my_area` VALUES ('1908','白城市','白城','','19','0');
INSERT INTO `my_area` VALUES ('1909','延边州','延边','','19','0');
INSERT INTO `my_area` VALUES ('2001','哈尔滨市','哈尔滨','','20','0');
INSERT INTO `my_area` VALUES ('2002','齐齐哈尔','齐齐哈尔','','20','0');
INSERT INTO `my_area` VALUES ('2003','鹤岗市','鹤岗','','20','0');
INSERT INTO `my_area` VALUES ('2004','双鸭山市','双鸭山','','20','0');
INSERT INTO `my_area` VALUES ('2005','鸡西市','鸡西','','20','0');
INSERT INTO `my_area` VALUES ('2006','大庆市','大庆','','20','0');
INSERT INTO `my_area` VALUES ('2007','伊春市','伊春','','20','0');
INSERT INTO `my_area` VALUES ('2008','牡丹江市','牡丹江','','20','0');
INSERT INTO `my_area` VALUES ('2009','佳木斯市','佳木斯','','20','0');
INSERT INTO `my_area` VALUES ('2010','七台河市','七台河','','20','0');
INSERT INTO `my_area` VALUES ('2011','黑河市','黑河','','20','0');
INSERT INTO `my_area` VALUES ('2012','绥化市','绥化','','20','0');
INSERT INTO `my_area` VALUES ('2013','大兴安岭','大兴安岭','','20','0');
INSERT INTO `my_area` VALUES ('2101','合肥市','合肥','','21','0');
INSERT INTO `my_area` VALUES ('2102','芜湖市','芜湖','','21','0');
INSERT INTO `my_area` VALUES ('2103','蚌埠市','蚌埠','','21','0');
INSERT INTO `my_area` VALUES ('2104','淮南市','淮南','','21','0');
INSERT INTO `my_area` VALUES ('2105','马鞍山市','马鞍山','','21','0');
INSERT INTO `my_area` VALUES ('2106','淮北市','淮北','','21','0');
INSERT INTO `my_area` VALUES ('2107','铜陵市','铜陵','','21','0');
INSERT INTO `my_area` VALUES ('2108','安庆市','安庆','','21','0');
INSERT INTO `my_area` VALUES ('2109','黄山市','黄山','','21','0');
INSERT INTO `my_area` VALUES ('2110','滁州市','滁州','','21','0');
INSERT INTO `my_area` VALUES ('2111','阜阳市','阜阳','','21','0');
INSERT INTO `my_area` VALUES ('2112','宿州市','宿州','','21','0');
INSERT INTO `my_area` VALUES ('2113','巢湖市','巢湖','','21','0');
INSERT INTO `my_area` VALUES ('2114','六安市','六安','','21','0');
INSERT INTO `my_area` VALUES ('2115','亳州市','亳州','','21','0');
INSERT INTO `my_area` VALUES ('2116','宣城市','宣城','','21','0');
INSERT INTO `my_area` VALUES ('2117','池州市','池州','','21','0');
INSERT INTO `my_area` VALUES ('2201','长沙市','长沙','','22','0');
INSERT INTO `my_area` VALUES ('2202','株州市','株州','','22','0');
INSERT INTO `my_area` VALUES ('2203','湘潭市','湘潭','','22','0');
INSERT INTO `my_area` VALUES ('2204','衡阳市','衡阳','','22','0');
INSERT INTO `my_area` VALUES ('2205','邵阳市','邵阳','','22','0');
INSERT INTO `my_area` VALUES ('2206','岳阳市','岳阳','','22','0');
INSERT INTO `my_area` VALUES ('2207','常德市','常德','','22','0');
INSERT INTO `my_area` VALUES ('2208','张家界市','张家界','','22','0');
INSERT INTO `my_area` VALUES ('2209','益阳市','益阳','','22','0');
INSERT INTO `my_area` VALUES ('2210','郴州市','郴州','','22','0');
INSERT INTO `my_area` VALUES ('2211','永州市','永州','','22','0');
INSERT INTO `my_area` VALUES ('2212','怀化市','怀化','','22','0');
INSERT INTO `my_area` VALUES ('2213','娄底市','娄底','','22','0');
INSERT INTO `my_area` VALUES ('2214','湘西州','湘西','','22','0');
INSERT INTO `my_area` VALUES ('2301','南宁市','南宁','','23','0');
INSERT INTO `my_area` VALUES ('2302','柳州市','柳州','','23','0');
INSERT INTO `my_area` VALUES ('2303','桂林市','桂林','','23','0');
INSERT INTO `my_area` VALUES ('2304','梧州市','梧州','','23','0');
INSERT INTO `my_area` VALUES ('2305','北海市','北海','','23','0');
INSERT INTO `my_area` VALUES ('2306','防城港市','防城港','','23','0');
INSERT INTO `my_area` VALUES ('2307','钦州市','钦州','','23','0');
INSERT INTO `my_area` VALUES ('2308','贵港市','贵港','','23','0');
INSERT INTO `my_area` VALUES ('2309','玉林市','玉林','','23','0');
INSERT INTO `my_area` VALUES ('2310','南宁地区','南宁地区','','23','0');
INSERT INTO `my_area` VALUES ('2311','柳州地区','柳地区','','23','0');
INSERT INTO `my_area` VALUES ('2312','贺州地区','贺地区','','23','0');
INSERT INTO `my_area` VALUES ('2313','百色地区','百色地区','','23','0');
INSERT INTO `my_area` VALUES ('2314','河池地区','河池地区','','23','0');
INSERT INTO `my_area` VALUES ('2401','海口市','海口','','24','0');
INSERT INTO `my_area` VALUES ('2402','三亚市','三亚','','24','0');
INSERT INTO `my_area` VALUES ('2403','五指山市','五指山','','24','0');
INSERT INTO `my_area` VALUES ('2404','琼海市','琼海','','24','0');
INSERT INTO `my_area` VALUES ('2405','儋州市','儋州','','24','0');
INSERT INTO `my_area` VALUES ('2406','琼山市','琼山','','24','0');
INSERT INTO `my_area` VALUES ('2407','文昌市','文昌','','24','0');
INSERT INTO `my_area` VALUES ('2408','万宁市','万宁','','24','0');
INSERT INTO `my_area` VALUES ('2409','东方市','东方','','24','0');
INSERT INTO `my_area` VALUES ('2410','澄迈县','澄迈县','','24','0');
INSERT INTO `my_area` VALUES ('2411','定安县','定安县','','24','0');
INSERT INTO `my_area` VALUES ('2412','屯昌县','屯昌县','','24','0');
INSERT INTO `my_area` VALUES ('2413','临高县','临高县','','24','0');
INSERT INTO `my_area` VALUES ('2414','白沙县','白沙县','','24','0');
INSERT INTO `my_area` VALUES ('2415','昌江县','昌江县','','24','0');
INSERT INTO `my_area` VALUES ('2416','乐东县','乐东县','','24','0');
INSERT INTO `my_area` VALUES ('2417','陵水县','陵水县','','24','0');
INSERT INTO `my_area` VALUES ('2418','保亭县','保亭县','','24','0');
INSERT INTO `my_area` VALUES ('2419','琼中县','琼中县','','24','0');
INSERT INTO `my_area` VALUES ('2501','昆明市','昆明','','25','0');
INSERT INTO `my_area` VALUES ('2502','曲靖市','曲靖','','25','0');
INSERT INTO `my_area` VALUES ('2503','玉溪市','玉溪','','25','0');
INSERT INTO `my_area` VALUES ('2504','保山市','保山','','25','0');
INSERT INTO `my_area` VALUES ('2505','昭通市','昭通','','25','0');
INSERT INTO `my_area` VALUES ('2506',' 普洱市',' 普洱','','25','0');
INSERT INTO `my_area` VALUES ('2507','临沧市','临沧','','25','0');
INSERT INTO `my_area` VALUES ('2508','丽江市','丽江','','25','0');
INSERT INTO `my_area` VALUES ('2509','文山州','文山','','25','0');
INSERT INTO `my_area` VALUES ('2510','红河州','红河','','25','0');
INSERT INTO `my_area` VALUES ('2511','西双版纳','西双版纳','','25','0');
INSERT INTO `my_area` VALUES ('2512','楚雄州','楚雄','','25','0');
INSERT INTO `my_area` VALUES ('2513','大理州','大理','','25','0');
INSERT INTO `my_area` VALUES ('2514','德宏州','德宏','','25','0');
INSERT INTO `my_area` VALUES ('2515','怒江州','怒江','','25','0');
INSERT INTO `my_area` VALUES ('2516','迪庆州','迪庆','','25','0');
INSERT INTO `my_area` VALUES ('2601','贵阳市','贵阳','','26','0');
INSERT INTO `my_area` VALUES ('2602','六盘水市','六盘水','','26','0');
INSERT INTO `my_area` VALUES ('2603','遵义市','遵义','','26','0');
INSERT INTO `my_area` VALUES ('2604','安顺市','安顺','','26','0');
INSERT INTO `my_area` VALUES ('2605','铜仁地区','铜仁地区','','26','0');
INSERT INTO `my_area` VALUES ('2606','毕节地区','毕节地区','','26','0');
INSERT INTO `my_area` VALUES ('2607','黔西南州','黔西南','','26','0');
INSERT INTO `my_area` VALUES ('2608','黔东南州','黔东南','','26','0');
INSERT INTO `my_area` VALUES ('2609','黔南州','黔南','','26','0');
INSERT INTO `my_area` VALUES ('2701','拉萨市','拉萨','','27','0');
INSERT INTO `my_area` VALUES ('2702','那曲地区','那曲地区','','27','0');
INSERT INTO `my_area` VALUES ('2703','昌都地区','昌都地区','','27','0');
INSERT INTO `my_area` VALUES ('2704','山南地区','山南地区','','27','0');
INSERT INTO `my_area` VALUES ('2705','日喀则','日喀则','','27','0');
INSERT INTO `my_area` VALUES ('2706','阿里地区','阿里地区','','27','0');
INSERT INTO `my_area` VALUES ('2707','林芝地区','林芝地区','','27','0');
INSERT INTO `my_area` VALUES ('2801','兰州市','兰州','','28','0');
INSERT INTO `my_area` VALUES ('2802','金昌市','金昌','','28','0');
INSERT INTO `my_area` VALUES ('2803','白银市','白银','','28','0');
INSERT INTO `my_area` VALUES ('2804','天水市','天水','','28','0');
INSERT INTO `my_area` VALUES ('2805','嘉峪关市','嘉峪关','','28','0');
INSERT INTO `my_area` VALUES ('2806','武威市','武威','','28','0');
INSERT INTO `my_area` VALUES ('2807','定西地区','定西地区','','28','0');
INSERT INTO `my_area` VALUES ('2808','平凉地区','平凉地区','','28','0');
INSERT INTO `my_area` VALUES ('2809','庆阳地区','庆阳地区','','28','0');
INSERT INTO `my_area` VALUES ('2810','陇南地区','陇南地区','','28','0');
INSERT INTO `my_area` VALUES ('2811','张掖地区','张掖地区','','28','0');
INSERT INTO `my_area` VALUES ('2812','酒泉地区','酒泉地区','','28','0');
INSERT INTO `my_area` VALUES ('2813','甘南州','甘南','','28','0');
INSERT INTO `my_area` VALUES ('2814','临夏州','临夏','','28','0');
INSERT INTO `my_area` VALUES ('2901','银川市','银川','','29','0');
INSERT INTO `my_area` VALUES ('2902','石嘴山市','石嘴山','','29','0');
INSERT INTO `my_area` VALUES ('2903','吴忠市','吴忠','','29','0');
INSERT INTO `my_area` VALUES ('2904','固原市','固原','','29','0');
INSERT INTO `my_area` VALUES ('3001','西宁市','西宁','','30','0');
INSERT INTO `my_area` VALUES ('3002','海东地区','海东地区','','30','0');
INSERT INTO `my_area` VALUES ('3003','海北州','海北','','30','0');
INSERT INTO `my_area` VALUES ('3004','黄南州','黄南','','30','0');
INSERT INTO `my_area` VALUES ('3005','海南州','海南','','30','0');
INSERT INTO `my_area` VALUES ('3006','果洛州','果洛','','30','0');
INSERT INTO `my_area` VALUES ('3007','玉树州','玉树','','30','0');
INSERT INTO `my_area` VALUES ('3008','海西州','海西','','30','0');
INSERT INTO `my_area` VALUES ('3101','乌鲁木齐','乌鲁木齐','','31','0');
INSERT INTO `my_area` VALUES ('3102','克拉玛依','克拉玛依','','31','0');
INSERT INTO `my_area` VALUES ('3103','石河子市','石河子','','31','0');
INSERT INTO `my_area` VALUES ('3104','吐鲁番','吐鲁番','','31','0');
INSERT INTO `my_area` VALUES ('3105','哈密地区','哈密地区','','31','0');
INSERT INTO `my_area` VALUES ('3106','和田地区','和田地区','','31','0');
INSERT INTO `my_area` VALUES ('3107','阿克苏','阿克苏','','31','0');
INSERT INTO `my_area` VALUES ('3108','喀什地区','喀什地区','','31','0');
INSERT INTO `my_area` VALUES ('3109','克孜勒苏','克孜勒苏','','31','0');
INSERT INTO `my_area` VALUES ('3110','巴音郭楞','巴音郭楞','','31','0');
INSERT INTO `my_area` VALUES ('3111','昌吉州','昌吉','','31','0');
INSERT INTO `my_area` VALUES ('3112','博尔塔拉','博尔塔拉','','31','0');
INSERT INTO `my_area` VALUES ('3113','伊犁州','伊犁','','31','0');
INSERT INTO `my_area` VALUES ('3201','香港岛','香港岛','','32','0');
INSERT INTO `my_area` VALUES ('3202','九龙','九龙','','32','0');
INSERT INTO `my_area` VALUES ('3203','新界','新界','','32','0');
INSERT INTO `my_area` VALUES ('3301','澳门半岛','澳门半岛','','33','0');
INSERT INTO `my_area` VALUES ('3302','离岛','离岛','','33','0');
INSERT INTO `my_area` VALUES ('3401','台北市','台北','','34','0');
INSERT INTO `my_area` VALUES ('3402','高雄市','高雄','','34','0');
INSERT INTO `my_area` VALUES ('3403','台南市','台南','','34','0');
INSERT INTO `my_area` VALUES ('3404','台中市','台中','','34','0');
INSERT INTO `my_area` VALUES ('3405','金门县','金门县','','34','0');
INSERT INTO `my_area` VALUES ('3406','南投县','南投县','','34','0');
INSERT INTO `my_area` VALUES ('3407','基隆市','基隆','','34','0');
INSERT INTO `my_area` VALUES ('3408','新竹市','新竹','','34','0');
INSERT INTO `my_area` VALUES ('3409','嘉义市','嘉义','','34','0');
INSERT INTO `my_area` VALUES ('3410','新北市','新北','','34','0');
INSERT INTO `my_area` VALUES ('3411','宜兰县','宜兰县','','34','0');
INSERT INTO `my_area` VALUES ('3412','新竹县','新竹县','','34','0');
INSERT INTO `my_area` VALUES ('3413','桃园县','桃园县','','34','0');
INSERT INTO `my_area` VALUES ('3414','苗栗县','苗栗县','','34','0');
INSERT INTO `my_area` VALUES ('3415','彰化县','彰化县','','34','0');
INSERT INTO `my_area` VALUES ('3416','嘉义县','嘉义县','','34','0');
INSERT INTO `my_area` VALUES ('3417','云林县','云林县','','34','0');
INSERT INTO `my_area` VALUES ('3418','屏东县','屏东县','','34','0');
INSERT INTO `my_area` VALUES ('3419','台东县','台东县','','34','0');
INSERT INTO `my_area` VALUES ('3420','花莲县','花莲县','','34','0');
INSERT INTO `my_area` VALUES ('3421','澎湖县','澎湖县','','34','0');
INSERT INTO `my_area` VALUES ('6001','美国','美国','','60','0');
INSERT INTO `my_area` VALUES ('6002','英国','英国','','60','0');
INSERT INTO `my_area` VALUES ('6003','法国','法国','','60','0');
INSERT INTO `my_area` VALUES ('6004','俄罗斯','俄罗斯','','60','0');
INSERT INTO `my_area` VALUES ('6005','加拿大','加拿大','','60','0');
INSERT INTO `my_area` VALUES ('6006','巴西','巴西','','60','0');
INSERT INTO `my_area` VALUES ('6007','澳大利亚','澳大利亚','','60','0');
INSERT INTO `my_area` VALUES ('6008','印尼','印尼','','60','0');
INSERT INTO `my_area` VALUES ('6009','马来西亚','马来西亚','','60','0');
INSERT INTO `my_area` VALUES ('6010','新加坡','新加坡','','60','0');
INSERT INTO `my_area` VALUES ('6011','菲律宾','菲律宾','','60','0');
INSERT INTO `my_area` VALUES ('6012','越南','越南','','60','0');
INSERT INTO `my_area` VALUES ('6013','印度','印度','','60','0');
INSERT INTO `my_area` VALUES ('6014','日本','日本','','60','0');
INSERT INTO `my_area` VALUES ('6015','韩国','韩国','','60','0');
INSERT INTO `my_area` VALUES ('6016','泰国','泰国','','60','0');
INSERT INTO `my_area` VALUES ('6017','缅甸','缅甸','','60','0');
INSERT INTO `my_area` VALUES ('6018','其他','其他','','60','0');


# 转存表中的数据：my_article 
INSERT INTO `my_article` VALUES ('1','做最坏的打算做最好的准备','','','','管理员','','/uploads/img1/20170402/58e0710ce067f.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">做好最坏的打算也是在为自己制订目标，只不过这个目标带有破釜沉舟的味道，但破釜沉舟也是一种决心，是一种为达到成功做最后一搏的拼搏精神。所以，遇事不要太紧张，做好最坏的打算，那么事情就不会那么复杂了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">目前他是纽约的油商。“我被敲诈了！”他说，“我不相信会有这种事，简直是电影里的镜头！事情是这样的，我主管的石油公司里有些运油司机把应该给顾客的定量油偷偷克扣下来卖掉。一天，一个自称是政府调查员的人来找我，向我要红包，他说他掌握了我们运货员舞弊的证据。他威胁说，如果我不答应的话，他就把证据转交给地方检查官。这时我才知道公司存在这种非法的买卖。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“当然这与我个人没有什么关系，但我知道法律有规定，公司必须为自己职工的行为负责。而且，万一案子打到法院，上了报，这种坏名声就会毁了我的生意。我为自己的生意骄傲——那是父亲在24年前打下的基础。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“当时我急得生了病，整整三天三夜吃不下睡不着。我一直在这件事里打转转。我是该付那笔钱-5千美金——还是该对那个人说，你想怎么办就怎么办吧。我一直拿不定主意，每天都做恶梦。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“星期天晚上，我随手拿起一本《怎样不再忧虑》，这是我去听卡耐基公开讲演时拿到的。我读到威利·卡瑞尔的故事时看到这样一句话：‘面对最坏的情况。’于是我向自己问：‘如果我不给钱，那些勒索者把证据交给地检处的话，可能发生最坏情况是什么呢？’</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“答案是：‘毁了我的生意——仅此而已。我不会被抓起来，仅仅是我被这件事毁了。’于是，我对自己说：‘好了，生意即使毁了，但我在心理上可以承受这一点，接下去又会怎么样呢？’</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“嗯，生意毁掉之后，也许我得另找个工作。这也不难，我对石油行业很熟悉——几家大公司也许会雇用我……我开始感觉好过多了。三天三夜来的那种忧虑也开始逐渐消散。我的情绪基本稳定下来，当然也能开始思考了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“我清醒地看到了下一步一改善不利的处境。我思考解决办法的时候，一个崭新的计划展现在我的面前。如果我把整个情况告诉我的律师，他也许能找到一条我没有想到的新路，我过去一直没有想到这一点，这完全是因为我一直在担心而没有好好的思考。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">我立即打定主意——第二天一早就去见我的律师，接着我上了床，睡得安安稳稳。“第二天早上，我的律师让我去见地方检察官，把整个情况全部告诉他。我照他的话做了，当我说出原委后，出乎意料地听到地方检察官说，这种勒索已经连续几个月了，那个自称是‘政府官员’的人，其实是个警方的通缉犯。在我为无法决定是否该把5千美元交给那个职业罪犯而担心了三天三夜之后，听到他这番话，真是长长地松了口气。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“这次经历给我土了一堂终身难忘的一课。现在，每当我面临会使我忧虑的难题时，‘威利·卡瑞尔的老公式’就会派上用场。&quot;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">越是遇到让人焦虑的情况，就越不要焦虑，因为焦虑会让人更加不知所措。我们要做的就是做好最坏的打算，这样，我们就能找到最好的处理办法。</p><p><br/></p>','做好最坏的打算也是在为自己制订目标，只不过这个目标带有破釜沉舟的味道，但破釜沉舟也是一种决心，是一种为达到成功做最后一搏的拼搏精神。所以，遇事不要太紧张，做好最坏的打算，那么事情就不会那么复杂了。目前他是纽约的油商。“我被敲诈了！”他说，“','1491103801','1491104406','1','2','1','17','','1','0','1','0','0','最坏的打算','','1','');
INSERT INTO `my_article` VALUES ('2','对人生感悟的名言','','','','管理员','','/uploads/img1/20170402/58e0715600d13.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">对人生感悟的名言</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、不要说喜欢我，如果你还喜欢着很多人。不要说爱我，如果你同时爱着别人。不要和我说白头到老，如果你已经承诺别人。我只喜欢专一的，只爱懂得珍惜的，只固守真正值得坚持的誓言。见了谁都喜欢的喜欢，不是浪漫，是浪子。同时爱几个人爱的爱，不是爱，是发情。对很多人表白真心的人，不是多情，是花痴。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、不奋苦而求速效，只落得少日浮夸，老来窘隘而已。——郑板桥</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、决定一个人的一生，以及整个命运的，只是一瞬之间。——歌德</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、有人爱你的身体，有人爱你的思想，有人爱你的灵魂。你像颗闪耀的钻石，人们爱你的不同面，其实都是爱。所以别人爱你什么并不重要，重要的是他们愿付出什么代价。有些人愿付出金钱，有些愿付出浪漫，而有些愿付出一生。爱是种选择，不选最贵重，而选你最想要的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、我从来没有招惹你，你为什么要来招惹我？既然招惹了，为什么半途而废？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、你微笑地看着我，不说一句话。而我知道，为了这个，我已经等了很久了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、为了你，很多事我不一定会，但我在努力学。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、生气的时候，开口前先数到十，如果非常愤怒，先数到一百。——杰弗逊</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、任何事物，只要让你心情沉重，让你对自己有不好的感觉，阻碍你前行的，把它丢掉。(www.znl.la)任何事物，如果只是占有空间，对你的人生毫无正面贡献，把它丢掉。任何事物，要丢还是要留，你得花很长的时间权衡利弊，或是烦恼不知所错的，那把它丢掉。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、不要认为后面还有更好的，因为现在拥有的就是最好的；不要因为距离太远而放弃，爱情可以和你一起远行；不要因为对方不富裕而放弃，勤劳可以让你们富裕；不要因为父母反对而放弃，你会发现因为这个原因而放弃的爱情，将是你一生的悔恨。其实对于爱情，越单纯越幸福。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、有时候，不是对方不在乎你，而是你把对方看得太重。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、牵你的手，静静的教你一支舞。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、天下最悲哀的人莫过于，本身没有足以炫耀的优点，却又将其可怜的自卑感，以令人生厌的自大、自夸来掩饰。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、人之所以痛苦，在于追求错误的东西。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、当我对你越来越礼貌时，我们或许就越来越陌生了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、最可怕的敌人，就是没有坚强的信念。——罗曼·罗兰</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、在行进时，也时时有人退伍，有人落荒，有人颓唐，有人叛变，然而只要无碍于进行，则越到后来，这队伍也就越成为纯粹、精锐的队伍了。——鲁迅</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、感情久了，就不是爱了、而是依赖；失去那阵，那不是痛、而是不舍。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、认清这个世界，然后爱它。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、人应该掌控自己的欲望，而不是被欲望所掌控。追求舒适、追求享受是人的本能，但也要有所节制。欲望就像水一样，适当就好，多了就会泛滥成灾。我们之所以活得累，往往就是因为把欲望误认为需要，使自己疲于奔命，越陷越深。</p><p><br/></p>','对人生感悟的名言1、不要说喜欢我，如果你还喜欢着很多人。不要说爱我，如果你同时爱着别人。不要和我说白头到老，如果你已经承诺别人。我只喜欢专一的，只爱懂得珍惜的，只固守真正值得坚持的誓言。见了谁都喜欢的喜欢，不是浪漫，是浪子。同时爱几个人爱的','1491104067','1491104453','3','3','1','17','','1','0','1','0','0','人生感悟','','1','');
INSERT INTO `my_article` VALUES ('3','关于坚强的名人语录','','','','管理员','','/uploads/img1/20170402/58e071c78d904.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">关于坚强的名人语录</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、意志的出现不是对愿望的否定，而是把愿望合并和提升到一个更高的意识水平上。——罗洛·梅</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、有了坚定的意志，就等于给双脚添了一对翅膀。——乔·贝利本</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、疼痛的强度，同自然赋于人类的意志和刚度成正比。——武者小路实笃</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、生活就像海洋，只有意志坚强的人，才能到达彼岸。——马在思</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、如果我们想交朋友，就要先为别人做些事——那些需要花时间、体力、体贴、奉献才能做到的事。——卡耐基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、我们活着不能与草木同腐，不能醉生梦死，枉度人生，要有所做为!——方志敏</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、最可怕的敌人，就是没有坚强的信念。——罗曼·罗兰</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、自强像荣誉一样，是一个无滩的岛屿。——拿破仓</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、一个人作人做事必须诚实勤奋，即使是在没有人听见没有人看见的地方，也绝对不可作见不得人的坏事;尤其当你处于穷困潦倒失意的时候，仍旧要奋发上进，这样才是真正有作为的英雄好汉。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、谁有历经千辛万苦的意志，谁就能达到任何目的。——米南德</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、既然我已经踏上这条道路，那么，任何东西都不应妨碍我沿着这条路走下去。——康德</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、自强为天下健，志刚为大君之道。——清·康有为</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、意志目标不在自然中存在，而在生命中蕴藏。——武者小路实笃</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、强烈的信仰会赢取坚强的人，然后又使他们更坚强。——华特·贝基霍</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、成功的先决条件，是不变的信心，坚强的意志。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、君子赠人以言，庶人赠人以财。——荀况</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、立志不坚，终不济事。——朱熹</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、如烟往事俱忘却，心底无私天地宽。——陶铸</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、执着追求并从中得到最大快乐的人，才是成功者。——梭罗</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、失败是坚韧的最后考验。——俾斯麦</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">21、工夫和坚韧使桑叶变成绸缎。——英国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">22、思而后行，以免做出蠢事。因为草率的动作和言语，均是卑劣的特征。——毕达哥拉斯</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">23、如果你足够坚强，你就是史无前例的。——司科特·菲茨杰拉德</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">24、只要有坚强的意志力，就自然而然地会有能耐、机灵和知识。——陀思妥耶夫斯基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">25、自助者天助。——英国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">26、贤者能自反，则无往不善;不贤者不能自反，为人子则多怨，为人父则多暴。——袁采</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">27、有百折不挠的信念的所支持的人的意志，比那些似乎是无敌的物质力量有更强大的威力。——爱因斯坦</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">28、当幸运之神要赠给成功的冠冕之前，往往会用逆境严峻地考验你，看看你的耐力与勇气是否足够。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">29、原谅敌人要比原谅朋友容易。——狄尔治夫人</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">30、下手处是自强不息，成就处是至诚无息。——清·金缨</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">31、坚毅可以战胜强力。——非洲</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">32、眼前多少难甘事，自古男儿多自强。——唐·李咸用</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">33、穷且益坚，不坠青云之志。——王勃</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">34、自强不息，乃幸运之母。——德国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">35、一个崇高的目标，只要不渝地追求，就会居为壮举;在它纯洁的目光里，一切美德必将胜利。——华兹华斯</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">36、有志者事竟成。——佚名</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">37、无论是美女的歌声，还是鬣狗的狂吠，无论是鳄鱼的眼泪，还是恶狼的嚎叫，都不会使我动摇。——恰普曼</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">38、自责之外无胜人之术，自强之外无上人之术。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">39、公共的利益，人类的福利，可以使可憎的工作变为可贵，只有开明人士才能知道克服困难所需要的热忱。——佚名</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">40、顽强这就是作家技能的秘密。——杰克·伦敦</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">41、坚强者能在命运之风暴中奋斗。——英国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">42、时间会刺破青春表面的彩饰，会在美人的额上掘深沟浅槽;会吃掉稀世之珍!天生丽质，什么都逃不过他那横扫的镰刀。——莎士比亚</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">43、书不记，熟读可记;义不精，细思可精;惟有志不立，直是无著力处。——朱熹</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">44、生活的道路一旦选定，就要勇敢地走到底，决不回头。——左拉</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">45、三军可夺帅也，匹夫不可夺志也。——佚名</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">46、伟大人物最明显的标志，就是坚强的意志。——英国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">47、发现者，尤其是一个初出茅庐的年轻发现者，需要勇气才能无视他人的冷漠和怀疑，才能坚持自己发现的意志，并把研究继续下去。——贝弗里奇</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">48、你既然期望辉煌伟大的一生，那么就应该从今天起，(www.znl.la)以毫不动摇的决心和坚定不移的信念，凭自己的智慧和毅力，去创造你和人类的快乐。——佚名</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">49、一个人所能做的就是做出好榜样，要有勇气在风言风语的社会中坚定地高举伦理的信念。——爱因斯坦</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">50、不作什么决定的意志不是现实的意志;无性格的人从来不做出决定。——黑格尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">51、天行健，君子以自强不息。——周易</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">52、君子敬其在已者，而不慕其在天者，是以日进也。——荀子</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">53、功崇惟志，业广惟勤。——佚名</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">54、顽强能引导人们走向幸福。——土耳其</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">55、坚韧是意志的最好助手。——欧洲</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">56、胜利属于坚韧不拔的人。——英国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">57、能够岿然不动，坚持正见，度过难关的人是不多的。——雨果</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">58、哪怕是自己的一点小小的克制，也会使人变得强而有力。——高尔基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">59、永远没有人力可以击退一个坚决强毅的希望。——金斯莱</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">60、永远没有人力可以击退一个坚决强毅的希望。——金斯莱您得相信，有志者事竟成。古人告诫说：“天国是努力进入的”。只有当勉为其难地一步步向它走去的时候，才必须勉为其难地一步步走下去，才必须勉为其难地去达到它。——果戈理</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">61、醴泉无源芝草无根人贵自勉，流水不腐户枢不蠹民生在勤。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">62、要知道，能在困境中保持自强是多么令人崇敬啊！。——朗费罗</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">63、路是脚踏出来的，历史是人写出来的。人的每一步行动都在书写自己的历史。——吉鸿昌</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">64、谁有历经千辛万苦的意志，谁就能达到任何目的。——米南德本</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">65、在希望与失望的决斗中，如果你用勇气与坚决的双手紧握着，胜利必属于希望。——普里尼</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">66、立志用功如种树然，方其根芽，犹未有干;及其有干，尚未有枝;枝而后叶，叶而后花。——王守仁</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">67、一个人只有在闲暇中，气概才会像晴空一样舒畅，这时才能发现人性的真正灵魂;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">68、由于勇敢的坚韧，无可避免的祸患将会被征服。——欧洲</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">69、男儿立身须自强。——唐·李颀</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">70、意志若是屈从，不论程度如何，它都帮助了暴力。——但丁</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">71、强者容易坚强，正如弱者容易软弱。——爱默生</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">72、坚强的信念能赢得强者的心，并使他们变得更坚强。——白哲特</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">73、一个人只有在淡泊之中，内心才会像平静湖水一样，这时才能获得人生的真正乐趣。所以说：‘宁静淡泊，观心之道。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">74、努力向前，默默耕耘，机会和成功，必属于最坚忍的奋斗者。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">75、只要持续地努力，不懈地奋斗，就没有征服不了的东西。——塞内加</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">76、富贵不能淫，贫贱不能移，威武不能屈。——孟子</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">77、不害怕痛苦的人是坚强的，不害怕死亡的人更坚强。——迪亚娜夫人</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">78、不作什么决定的意志不是现实的意志;无性格的人从来不作出决定。——黑格尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">79、坚持意志伟大的事业需要始终不渝的精神。——伏尔泰</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">80、自信与自靠是坚强的柱石。——英国</p><p><br/></p>','关于坚强的名人语录1、意志的出现不是对愿望的否定，而是把愿望合并和提升到一个更高的意识水平上。——罗洛·梅2、有了坚定的意志，就等于给双脚添了一对翅膀。——乔·贝利本3、疼痛的强度，同自然赋于人类的意志和刚度成正比。——武者小路实笃4、生活','1491104174','1491104259','3','1','1','1','','1','0','1','0','0','坚强','','1','');
INSERT INTO `my_article` VALUES ('4','以诚待人的名人语录','','','','管理员','','/uploads/img1/20170402/58e07266df9f5.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">以诚待人的名人语录</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、越是善良的人，越察觉不出别人的居心不良。——法·米列</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、我每每看见人真是虚心谦卑的时候，我就不禁想到“压伤的芦苇它不折断，将残的灯火它不吹灭”这一教示。——《马太福音》</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、为而不矜，作而不恃。——皮日休</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、要让新结识的人喜欢你，愿意多了解你，诚恳老实是最可靠的办法，是你能够使出的“最大的力量”。——美·艾琳.卡瑟拉</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、太阳既不会夸大，也不会缩小，有什么就照出什么，是什么样子就照什么样子。——（苏）高尔基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、想摘玫瑰花的人必须注意刺。——波斯谚语</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、在一切道德品质之中，善良的本性在世界上是最需要的。——（英）罗素</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、你在个人生活或工作当中，可能由于诚实而丢掉某些你想要的东西。但是，在漫长的人生旅途中失掉一次应有的回报算不了什么。——（美）艾琳.卡瑟拉</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、慎虑无后患。——亨德尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、诚，乃信之本；无诚，何以言信？诚而有信，方为人生。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、诚实的人从不为自己的诚实而感到后悔。——英·托.富勒</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、一种美德的幼芽、蓓蕾，这是最宝贵的美德，是一切道德之母，这就是谦逊；有了这种美德我们会其乐无穷。——加尔多斯</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、诚实的人必须对自己守信，他的最后靠山就是真诚。——美·爱默生</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、诚实而无知，是软弱的，无用的；然而有知识而不诚实，却是危险的，可怕的。——英·约翰逊</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、真正有学识、有涵养的人，是不会刻意炫耀自己的。——大卫·汉生</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、诚信是沟通心灵的桥梁，善于欺骗的人，永远到不了桥的另一端。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、看不见河底就不要涉水而过。——英国谚语</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、没有诚实，何来尊严?</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、诚信是做人之根本，立业之基。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、诚信为本，学做真人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">21、推心置腹的谈话就是心灵的展示。——苏·温.卡维林</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">22、不诚则有累，诚则无累。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">23、诚实守信是面明镜，不诚实的人在他面前，都会露出真相。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">24、当一人言行不一致时，这就完全糟了，这会导向伪善。——俄·列宁</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">25、只有理性才能教导我们认识善恶，使我们喜善恨恶。良心尽管不依存于理性，但没有理性，良心就不能得到发展。——法·卢梭</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">26、一个人要表现最高的真诚，就必须做到无事不可对人言。——印度·泰戈尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">27、审慎行事的人，常得机遇之助。——厄里德斯</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">28、一个真认识自己的人，就没法不谦虚。——佚名</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">29、把爱拿走，我们的地球就变成一座坟墓。——白朗宁·英国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">30、固然我有某些优点，而我自己最重视的优点，却是我的谦虚。——孟德斯鸠</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">31、诚信是你价格不菲的鞋子，踏遍千山万水，质量也应永恒不变。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">32、诚信，让心灵无瑕，让友谊长存，让世界美好!</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">33、诚实是上策。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">34、出来吧，我的心，带着你的爱去与它相会。——印度·泰戈尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">35、诗人之所以成为诗人，就在于努力使自己的灵魂摆脱一切与虚伪世界相像的东西……他是纯洁的，他是天真的。——德·席勒</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">36、谦让是身体的良心。——巴尔扎克</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">37、谦逊是反省的最高贵的收获，它建立起对抗骄傲的防线。——温刹斯基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">38、具有才能的人总是善良的，坦白的，爽直的，决不矜持。——法·巴尔扎克</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">39、知识是财富，诚信也是一种财富，拥有知识能使你变得充实，拥有诚信能使世界变得更美好！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">40、机运永远战斗在谨慎者一边。——欧里庇得欺</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">41、精诚所至，金石为开。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">42、虚伪是丑恶向美德的一种进贡。——拉罗什富科·法国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">43、一颗好心抵得过黄金。——英·莎士比亚</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">44、如果我们生活的全部目的仅仅在于个人的幸福，而我们个人的幸福又仅仅在于爱情，那么生活就会变成一片遍布荒茔枯冢和破碎心灵的真正阴暗的荒原，变成一座可怕的地狱。——别林斯基·俄国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">45、地洼下，水流之；人谦下，德归之。——魏征</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">46、一切有成效的工作都是以某种诚信为先决条件。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">47、真正的蒙味主义并不去阻止传播真实的、明白的和有用的事物，而是使假的东西到处流行。——德·歌德</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">48、质朴却比巧妙的言词更能打动我的心。——英·莎士比亚</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">49、你不同情跌倒的人的痛苦，在你遇难时也将没有朋友帮忙。——波斯·萨迪</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">50、人与人之间最大的信任就是关于进言的信任。——英·培根</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">51、本性流露永远胜过豪言壮语。——（英）莱辛</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">52、最大限度的诚实是最好的处事之道。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">53、金钱比起一分纯洁的良心来，又算什么呢？——英·哈代</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">54、真诚才是人生最高的美德。——英·乔叟</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">55、真正的伟人从不自视伟大。——赫兹里特</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">56、温和、谦逊、多礼的言行，有时能使人回心转意。——萨迪</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">57、谁穿上谦卑这件衣裳，谁就是最美最俊的人。——蒙哥马利</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">58、在顺境中要节制，在逆境中要谨慎。——佩里安德</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">59、善良的行为有一种好处，就是使人的灵魂变得高尚了，(www.znl.la)并且使它可以做出更美好的行为。——（法）卢梭</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">60、没有单纯、善良和真实，就没有伟大。——（俄）列夫.托尔斯泰</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">61、当一个人不仅对别人、甚至对自己都不会有一丝欺骗的时候，他的这种特性就是真挚。——俄·柯罗连科</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">62、在人生道路上谦让三分，就能天宽地阔。——卡内基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">63、聪明人是不会把所有的鸡蛋都放在一个篮子里的。——塞万提斯</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">64、一个人在受到责备而不是受到赞扬之后仍能保持谦虚，那才是真正的谦虚。——里克特</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">65、同情，使软弱的人觉得这个世界温柔；使坚强的人觉得这个世界高尚。——阿诺德·英国</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">66、良心是我们每个人心壮举的岗哨，它在那里值勤站岗，监视着我们别做出违法的事情来。它是安插在自我的中心堡垒中的暗探。——英·毛姆</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">67、诚信，是一股清泉，它将洗去欺诈的肮脏，让世界的每一个角落都流淌着洁净。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">68、我愿证明，凡是行为善良与高尚的人，定能因之而担当患难。——德·贝多芬</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">69、真实之中有伟大，伟大之中有真实。——（法）雨果</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">70、真实与朴实是天才的宝贵品质。——苏·斯坦尼斯拉夫斯基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">71、人因为博学才谦逊，因为勇于牺牲才力量无比。——吉卜林</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">72、蜜蜂从花中啜蜜离开时营营地道谢，浮夸的蝴蝶却是相信花是应该向他道谢的。——泰戈尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">73、创起诚信校园，树起诚信学风，成为诚信学子。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">74、诚信，让心灵无瑕，让友谊长存，让世界美好！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">75、诚信为荣，失信可耻。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">76、真诚是通向荣誉之路。——法·左拉</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">77、诚信是道路，随着开拓者的脚步延伸；诚信是智慧，随着博学者的求索积累；诚信是成功，随着奋进者的拼搏临近；诚信是财富的种子，只要你诚心种下，就能找到打开金库的钥匙。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">78、我要求别人诚实，我自己就得诚实。——（俄）陀思妥耶夫斯基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">79、谨慎即良师。——格罗汉</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">80、老老实实最能打动人心。——英·莎士比亚</p><p><br/></p>','以诚待人的名人语录1、越是善良的人，越察觉不出别人的居心不良。——法·米列2、我每每看见人真是虚心谦卑的时候，我就不禁想到“压伤的芦苇它不折断，将残的灯火它不吹灭”这一教示。——《马太福音》3、为而不矜，作而不恃。——皮日休4、要让新结识的','1491104326','1491104371','0','1','1','1','','1','0','1','0','0','以诚待人','','1','');
INSERT INTO `my_article` VALUES ('5','小编精选经典爱情励志签名','','','','管理员','','/uploads/img1/20170402/58e073101797a.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">经典爱情名人名言</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、付出真爱，才能无愧于心：值得你爱，就会无怨无悔。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、不能见面的时候，他们互相思念。可是一旦能够见面，一旦再走在一起，他们又会互相折磨。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、晚秋季节还能找到春天和夏天错过的鲜花吗？——巴尔扎克</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、爱情是两个人的利己主义。——拉萨尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、爱情和婚姻是两股道上跑的车。——蒙台涅</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、每个女人内心里都向往着爱情，渴望获得受人钟爱的快乐。希望得到保护、提高、同情，这是女人的一种特性。再加上多愁善感和情不自禁，往往使女人很难拒绝对方。这使她们认为自己是在恋爱。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、爱上一个人的时候，总会有点害怕，怕得到他；怕失掉他。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、不主动就会失去，但主动多了真的会好累。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、女人的体力本来就柔弱，所以，通常她们都喜欢手臂大的壮汉。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、摧残爱情的方式很多，不过连根拔起的狂风暴雨，却是借钱。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、得不到回报的付出，要懂得适可而止。否则，打扰了别人伤了自己。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、一个人生活，可以很自由。但是，只有一个人，便不能说是幸福。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、想念一个人是爱的一部分，如果你们从未分离，就永远不会真正明白你们的爱有多强大。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、爱情有吸引力，婚姻有约束力。想要逃离两者只会白费力。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、有时候，人太清醒反而觉得累，觉得不快乐，但是想要学会装糊涂还真是难。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、爱情需要薄薄的一层忧伤，需要一点点嫉妒、疑虑、戏剧性的游戏。——瓦西列夫</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、我无法保证给你一段完美的感情，没有争吵、没有分歧，但我能保证只要你坚持，我定会不离不弃。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、假如你问我该不该结婚，我会回答你：无论如何，你都会后悔的。——苏格拉底</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、一个姑娘爱上一个男子的时候，决不会看出他的缺点来。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、如果你爱她（他），就对她（他）说吧，不要让她（他）错过，因为你可能因为放弃了这次机会，那么机会就有可能永远不会再来了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">21、放弃一个很爱你的人，并不痛苦。放弃一个你很爱的人，那才痛苦。爱上一个不爱你的人，那是更痛苦。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">22、没有什么比辩才更能引起女人的兴趣了。可怜的女人，她们完全不明白一个能听话的男友比一个能说话的男友，不知要强多少倍。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">23、获得爱情你可以随便用什么办法，而保持爱情却需要智慧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">24、爱情越热烈、越真诚，就越要含蓄。——巴尔扎克</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">25、要么承担，要么突破，剩余的时间就是对你所经历的一切保持沉默。终有一天，你会在这沉默里获得道路和答案。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">26、因为我不知道，下一辈子是否还能遇见你，所以我今生才会，那么努力，把最好的给你。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">27、有思想的人，不管他过去如何，你需要的是今后如何。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">28、万里何愁南共北，两心那论生和死。——洪昻</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">29、简单的事情重复做，就是专家；重复的事情用心做，就是赢家。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">30、爱情让人痹，婚姻让人麻木。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">31、一有人反对，爱情会变得象禁果一样更有价值。——巴尔扎克</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">32、爱一个人就是拨通电话时忽然不知道要说什麽，才知道原来只是想听听她那熟悉的声音，原来真正想拨通的，只是自己心底的一根弦。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">33、爱是一只锋利无比的箭，总是在你万分小心、千般防御的情况下，轻易就射入你的心田。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">34、爱情如水，并且还是白开水，天天用，热的时候可以喝，凉了也可以喝，隔夜的你还可以用它来洗脸洗手，纯洁而且朴实，想说出它怎么个好喝或怎么有营养来，难，也用不着。精彩和浪漫都是如鱼饮水冷暖自知的事。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">35、如果她（他）爱你，你也爱她（他），那你千万不要骗她，即使善意的欺骗最好也不要有，因为她（他）毕竟是你最爱的人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">36、有时幸福就像是手心里的沙，握得越紧，失去得越快；有时幸福就像是彼岸的花朵，隐约可见，却无法触摸。或许付出真心的人不一定能换来真心，但是你无须后悔，拥有一颗平静的心就是难得。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">37、打算讨老婆的男人，应有如下的觉悟：权利将减半，义务将倍增。——汤川秀树</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">38、爱一个意味什么呢？这意味着为他的幸福而高兴，为使他能够更幸福而去做需要做的一切，并从这当中得到快乐。——车尔尼雪夫斯基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">39、一个人受到感情的伤害，原本是可以慢慢淡忘的，但如果心里一直念念不忘，就会使其所受的伤害，永远难以痊愈。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">40、要是有人追求，世界上没有一个女人不是飘飘然的。正因为这样，女人才会那么迷死人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">41、爱情实话+爱情谎话=爱情神话。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">42、选这样的女人做你的妻子：如果她是一个男的，你会选她作朋友。——诺贝尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">43、并不是要达到了怎样的目的，爱才成为爱。无论怎样的爱都是一份美好，一份结果。而刻在心底的爱，因为无私无欲，因为淡泊忧伤，才会是真正的永恒。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">44、爱情在法国是一幕喜剧，在英国是一幕悲剧，在意大利是一幕歌剧，在德国是一幕的闹剧。——布莱</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">45、爱情的意义在于帮助对方提高，同时也提高自己。——车尔尼雪夫斯基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">46、获取女人欢心的要素大概是：坚定的意志、决断、勇气，以及亲切、正直诸品质，反之，智慧上的优异对女性不发生任何直接或本能的力量…</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">47、依赖很可怕，一旦陷下去了，那人一离开，你就会觉得生活缺氧，无法呼吸。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">48、若是有缘，时间空间都不是距离。若是无缘，终日相聚也无法会意。凡事不必太在意，更不需去强求，就让一切随缘吧！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">49、如果你们已经在一起了，就要去努力的相信对方，不要因为一件小事就去胡乱猜疑，那样一点好处都没有，也是你对你自己不自信的一种表，反而会让对方对你逐渐失去信心。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">50、好好对自己，一辈子没多长；好好对别人，下辈子不一定能遇上。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">51、追求和渴望，才有快乐，也有沮丧和失望。经过了沮丧和失望，我们才学会珍惜。你曾经不被人所爱，你才会珍惜将来那个爱你的人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">52、青年人无法无天，玩弄爱情；中年人食髓知味，追求爱情；老年人寂寞无聊，回忆爱情。——秋田雨雀</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">53、以沉默来表示爱时，其所表示的爱最多。——加尼特</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">54、如果一个人把生活兴趣全部建立在爱情那样暴风雨般的感情冲动上，那是会令人失望的。——居里夫人</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">55、上帝创造了男人是为了使他孤独，而创造女人是为了让他更孤独。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">56、若是，此去经年。我默默祈祷，愿你用心牵着你所爱的手，相濡以沫，幸福到老。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">57、想念是茧，层层叠叠，爱是利剑，能够突破一切，所有的离别，其实都是爱的考验，为了破茧成蝶。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">58、对的时间，遇见对的人，是一生幸福。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">59、你在孤独、悲伤的日子，请悄悄地念一念我的名字，并且说：这世上有人在怀念我，我活在一个人的心里。——普希金</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">60、错的时间，遇见对的人，是一生叹息。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">61、爱情一旦成为了习惯，就会一辈子也摆脱不了的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">62、男人对女人的伤害，不一定是他爱上了别人，而是在她有所期待的时候让她失望，在她脆弱的时候没有给她应有的安慰…</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">63、现在在一起，可能在一起，即将不在一起的，记住我这句话：错过了，就有可能永远不会再来了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">64、当你真心爱一个人时，那人除了有崇高的才能外，他还有一些可爱的弱点这也是你爱他的重要关键。——摩路瓦</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">65、女人是男人前程上的一大障碍。爱上一个女人，想再做什么事情就不容易了。要便利地爱上一个女人，不受她的一点妨碍，那只有一个办法--就是结婚。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">66、只想找一个在我失意时可以承受我的眼泪，在我快乐时，可以让我咬一口的肩膊。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">67、能使所爱的人快乐，便是得了报酬。——巴尔扎克</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">68、彼此恋爱，却不要做爱的系链。——纪伯伦</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">69、对的时间，遇见错的人，是一场心伤。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">70、仓促结婚，是要在悠闲中悔恨的。——康格里夫</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">71、给自己一个取暖的方式吧，以风的执念求索，以莲的姿态恬淡，给生命一个微笑的理由吧，别让自己的心承载太多的负重，用一抹微笑，将岁月打磨成人生枝头最美的风景。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">72、想你想在梦里面，爱你爱在心口难开！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">73、爱情和工作都能使人对外界漠不关心。——巴尔扎克</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">74、得不到的爱情是一个诗意的伤口。然而，它终有一天是会愈合的，只留下淡淡的痕迹，浅浅的哀愁。岁月会让你忘掉它。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">75、茫茫人海中谁遇见了你，你邂逅了谁；谁错过了你，你注意了谁；谁陪你走了一程，你陪谁过一生？一路上的行走，你会遇上很多人也许是陪你走一站的，也许只是一个过客，于是生命中留下了许多逗号，一段经历一个逗号，一段感情一个逗号，一段付出一个逗号，无数个逗号的等待，只为最终那个句号。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">76、当爱情要完结时，你不想画上句号也不行，当你怀疑是否主动画上句号时，那表示你根本就拾不得，也没办法画上这个句号。每一段情始终会有句号，句号要来时，你想挡都挡不住。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">77、人的一生中最要紧的发现自己，而在婚姻中则是被人所发现。——冉拉尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">78、快乐是装给别人看的另一种痛楚，狂欢是留给自己痛的另一种寂寞。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">79、别离，是为了重聚。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">80、别等到错过后才去后悔，别等到失去后才想挽回。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">81、男人，不要只从情感上去找世界，世界很大很博大很难精彩很，有很多事情可以做；如果想通过换人来换生活，换老婆来换情感，换情感来换世界，其实不一定会有什么出路。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">82、如果你想被别人爱，你首先必须使自己值得爱，不是一天，一个星期，而是永远。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">83、家庭关系建立在婚姻之上，婚姻则植根于两性间天然的相辅相成或互相联系之上。——康德</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">84、你曾经不被人所爱，你才会珍惜将来那个爱你的人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">85、幸福的秘诀之一，是抓准爱的节奏感。随时提醒自己目前的节拍，踩稳步伐，该停时停，该走时走；该进时进，该退时退。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">86、你若爱她，让你的爱像阳光一样包围她，并且给她自由。——泰戈尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">87、错的时间，遇见错的人，是一段荒唐</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">88、长相知，才能不相疑；不相疑，才能长相知。——曹禺</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">89、我不想做你的插曲，我只想做你生命中最完美的结局。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">90、你要知道，在这个世界上，总有一个人是会永远等着你的。无论什么时候，无论在什么地方，总会有这么一个人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">91、让我错以为，我可以幸福得象个被宠溺的孩子，让我错以为，只要抱住你，就可以拥有整个世界。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">92、放弃是一种割舍，放弃是一种责任，放弃是一种勇气，放弃的确是一种美丽！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">93、在错误的时间相遇，在正确的时间分开。走得最急的是最美的景色，伤的最深的是最真的感情。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">94、或许只有在离得最远的时候，才能把曾经走过的那段日子，看的最真确最清楚。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">95、友谊进而为恋爱易，由恋爱退而为友谊难。——杰克逊</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">96、思念总是有不得不收藏起来的时刻，而生命里最舍不得，藏得总是最深，且不让人知道。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">97、爱是亘古长明的灯塔，它定晴望着风暴却兀不为动，爱就是充实了的生命，正如盛满了酒的酒杯。——泰戈尔</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">98、只要心是晴朗的，人生就没有雨天。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">99、爱一个人就是在她迟归时想上一千种坏的可能，在想像中经历万般劫难，发誓等她回来要好好罚她，一旦见面却什麽都忘了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">100、再深的绝望，都是一个过程，总有结束的时候，回避始终不是办法。鼓起勇气昂然向前，或许机遇就在下一秒。就如几米说过，我总是在最深的绝望里，看见最美的风景。</p><p><br/></p>','经典爱情名人名言1、付出真爱，才能无愧于心：值得你爱，就会无怨无悔。2、不能见面的时候，他们互相思念。可是一旦能够见面，一旦再走在一起，他们又会互相折磨。3、晚秋季节还能找到春天和夏天错过的鲜花吗？——巴尔扎克4、爱情是两个人的利己主义。—','1491104501','1491104552','0','3','1','1','','1','0','1','0','0','爱情,签名','','1','');
INSERT INTO `my_article` VALUES ('6','关于感动的名人名言','','','','管理员','','/uploads/img1/20170402/58e0735a36a82.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">关于感动的名人名言</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、真实就是感动。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、其实感动就是这么简单，源于微笑，蔓延于整个生命。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、教育的真谛就是感动。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、理智要比心灵为高，思想要比感情可靠。——高尔基</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、眼泪就在眼圈里转，一不小心就滴了下来，感动也许就在一秒之前映入脑海，泪便是赋予前一秒的报酬，感动就是这么简单！在…在被别人感动着的同时，同样也感动了别人，因为感动就是如此的简单！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、感动就是生活。——亚当桑德勒(www.znl.la)</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、人类被赋予了一种工作，那就是精神的成长。——列夫·托尔斯泰</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、良心是由人的知识和全部生活方式来决定的。——马克思</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、阴谋陷害别人的人，自己会首先遭到不幸。——伊索</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、人在智慧上应当是明豁的，道德上应该是清白的，身体上应该是清洁的。——契诃夫</p><p><br/></p>','关于感动的名人名言1、真实就是感动。2、其实感动就是这么简单，源于微笑，蔓延于整个生命。3、教育的真谛就是感动。4、理智要比心灵为高，思想要比感情可靠。——高尔基5、眼泪就在眼圈里转，一不小心就滴了下来，感动也许就在一秒之前映入脑海，泪便是','1491104596','1491104626','3','1','1','1','','1','0','1','0','0','感动','','1','');
INSERT INTO `my_article` VALUES ('7','精选2017微信签名最新版伤感说说','','','','管理员','','/uploads/img1/20170402/58e073c31d441.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">每个人都会用文字来诉说自己的悲伤，结果越写越悲伤 。今天正能量主编就为大家带来2017年微信最新伤感说说，还是用文字来治愈你的忧伤吧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、 习惯你的一切，到头来不习惯没有你的全部</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、 夏初的悲伤，我站在阳光下无尽的眺望</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、我那卑微的等待，何时才能被你发现</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、承诺再美，也经不起时间的改变</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、只要是大晴天，我的悲伤就不会在阳光下，蔓延</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、经不住时间的更改，留不住此间的流年</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、世态炎凉，冷暖要自知</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、夏日里最明媚的阳光，驱散了关于你的所有悲伤</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、雨天带走了眼泪，阳光带走了悲伤。快乐依旧无处安放</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、住在我心里，房租你交了吗?</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、做男人的最高境界不是你去泡妞，而是让妞来泡你。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、这年代，什么都是钱，没有钱你就一废物。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、很可惜故事的最后，我们还是退回到了朋友的位置。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、你不能当饭吃，但没有你，我吃不下饭。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、不懂得爱自己的人，是没有能力去爱别人的。</p><p><br/></p>','每个人都会用文字来诉说自己的悲伤，结果越写越悲伤 。今天正能量主编就为大家带来2017年微信最新伤感说说，还是用文字来治愈你的忧伤吧。1、 习惯你的一切，到头来不习惯没有你的全部2、 夏初的悲伤，我站在阳光下无尽的眺望3、我那卑微的等待，何','1491104683','1491104753','1','3','1','5','','1','0','1','0','0','微信签名,伤感说说','','1','');
INSERT INTO `my_article` VALUES ('8','人生志向名言','','','','管理员','','/uploads/img1/20170402/58e0743916db5.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">人生志向名言</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、巨大的建筑，总是由一木一石叠起来的，我们何妨做做这一木一石呢？我时常做些琐屑事，便是为此。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、暂时的是现实，永生的是理想。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、抱负是高尚行为发展的萌牙。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、只有知道了通往今天的路，我们才能清楚而有智地规划未来。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、我们应该赞美岩石的刚强。我们应该学习岩石的刚强。我们应该对革命有着坚强的信心。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、知了的吟唱为何使人厌烦？因为它只会重复自己的名字。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、志不强者智不达。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、在抱负的最优美世界中，统统都是为最优美的目的而设。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、最理想的境地既不可达，人往往不知退而求其次。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、我们应该注意本身不用言语去伤害另外同道，但是，当别人用言语来伤害本身的时候，也应该受得起。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、支配战士的举措的是信奉。他能够忍受统统艰难、痛苦，而到达他所选定的目的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、只要坚持积极的理想，就能产生奋斗的勇气。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、革命抱负，不是可有可无的点缀品，而是一小我私家生命的动力，有了抱负，就即是有了魂魄。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、只有同这个世界结开起往，我们的理想才能结出果然；脱离这个世界，理想便没有后果。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、壮心未与年俱老，死去犹能作鬼雄。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、锦城虽乐，不如回故里；乐土虽好，非久留之地。归去来兮。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、人类的心灵需要抱负甚于需要物质。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、坐志要如山，行讲要如水。没有如山，没有能坚定，没有如水，没有能直达。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、有人说：理想是理想，未必能实现。我以为理想必能实现，不能实现的是梦想。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、做人不可有傲态，不可无傲骨。</p><p><br/></p>','人生志向名言1、巨大的建筑，总是由一木一石叠起来的，我们何妨做做这一木一石呢？我时常做些琐屑事，便是为此。2、暂时的是现实，永生的是理想。3、抱负是高尚行为发展的萌牙。4、只有知道了通往今天的路，我们才能清楚而有智地规划未来。5、我们应该赞','1491104809','1491104844','0','1','1','5','','1','0','1','0','0','人生志向','','1','');
INSERT INTO `my_article` VALUES ('9','那些搞笑的人生格言','','','','管理员','','/uploads/img1/20170402/58e07495c1573.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">那些搞笑的人生格言：</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、见到我以后你会突然发现——原来美也可以这样具体呀！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、生命中，不断地有人离开或进入。于是，看见的，看不见的；记住的，遗忘了。生命中，不断地有得到和失落。于是，看不见的，看见了；遗忘的，记住了。然而，看不见的，是不是就等于不存在？记住的，是不是永远不会消失？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、你出生的时候，你哭着，周围的人笑着；你逝去的时候，你笑着，而周围的人在哭！一切都是轮回！！！！我们都在轮回中。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、在埃及，一个男人可以娶四个老婆，那得多累啊，还是中国好。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、夏天就是不好，穷的时候我连西北风都没得喝。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、一个人越在意的地方，就是最令他自卑的地方。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、女人无所谓正派，正派是因为受到的引诱不够；男人无所谓忠诚，忠诚是因为背叛的筹码太低……</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、也许有些人很可恶，有些人很卑鄙。而当我设身为他想象的时候，我才知道：他比我还可怜。所以请原谅所有你见过的人，好人或者坏人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、女人拥有无数个qq号只为了调戏一个男人，男人常用一个qq号上面加满各种各样的女人，你有几个号？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、不要在一棵树上吊死，在几棵树上多试试死几次……——死就死得彻底！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、后悔是一种耗费精神的情绪。后悔是比损失更大的损失，比错误更大的错误。所以不要后悔。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、我们确实活得艰难，一要承受种种外部的压力，更要面对自己内心的困惑。在苦苦挣扎中，如果有人向你投以理解的目光，你会感到一种生命的暖意，或许仅有短暂的一瞥，就足以使我感奋不已。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、世上的姑娘总以为自己是骄傲的公主（除了少数极丑和少数极聪明的姑娘例外）。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、不怕被人利用，就怕你没用！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、如果你借太多的钱给一个人，你会令此人变成坏人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、你可以像猪一样的生活，但你永远都不能像猪那样快乐！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、如果朋友让你生气，那说明你仍然在意他的友情。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、男人在结婚前觉得适合自己的女人很少，结婚后觉得适合自己的女人很多。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、令狐冲说“有些事情本身我们无法控制，只好控制自己。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、四大傻：恋爱不成上吊的，没病没灾吃药的，合同签成无效的，看着手机傻笑的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">21、有钱人终成眷属！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">22、不在课堂上沉睡，就在酒桌上埋醉。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">23、别人的钱财乃我的身外之物！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">24、你以为我会眼睁睁地看着你去送死吗？我会闭上眼睛的！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">25、是镜子，总会反光的…是金子，总会花光的！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">26、于千万人之中，遇见你所遇见的人；于千万年之中，时间的无涯荒野里，没有早一步，也没有晚一步，刚巧赶上了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">27、不怕虎一样的敌人，就怕猪一样的队友！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">28、打台湾我捐一个月的生活费，打美国我捐一年的生活费，打日本我捐他妈的一条命！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">29、我不去想是否能够成功，既然选择了远方，便只顾风雨兼程；我不去想，身后会不会袭来寒风冷雨，既然目标是地平线，留给世界的只能是背影。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">30、骑白马的不一定是王子，他可能是唐僧；带翅膀的也不一定是天使，他可能是鸟人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">31、唯女人与英语难过也，唯老婆与工作难找也</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">32、难道全世界的鸡蛋联合起来就能打破石头吗？！所以做人还是要现实些……</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">33、童年的无知可爱，少年的无知可笑；青年的无知可怜；中年的无知可叹，老年的无知可悲。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">34、快乐要有悲伤作陪，雨过应该就有天晴。如果雨后还是雨，如果忧伤之后还是忧伤。请让我们从容面对这离别之后的离别。微笑地去寻找一个不可能出现的你。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">35、帅有个屁用！到头来还不是被卒吃掉！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">36、天上掉钞票我不会弯腰，因为天上连馅饼都不会掉，更别说掉钞票了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">37、敌人变成战友多半是为了生存，战友变成敌人多半是为了金钱。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">38、智慧的代价是矛盾。这是人生对人生观开的玩笑。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">39、学习要加，骄傲要减，机会要乘，懒惰要除。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">40、现代的婚姻是情感的产物，更是竞争的结晶。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">41、《和平年代》里的话：当幻想和现实面对时，总是很痛苦的。要么你被痛苦击倒，要么你把痛苦踩在脚下。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">42、新人生四大喜事：聊天遇知己，逛街遇网友，手机单收费，情人你高兴。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">43、一个人炫耀什么，说明内心缺少什么。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">44、喝白酒一斤，我绝对没感觉，因为喝半斤就已经喝死了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">45、如果敌人让你生气，那说明你还没有胜他的把握。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">46、长得真有创意，活得真有勇气！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">47、一个人幸运的前提，其实是他有能力改变自己。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">48、拥抱真是个奇怪的东西，明明靠的那么近，却看不见彼此的脸。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">49、要我扫地就绝对不刷碗，要我刷碗就绝对不扫地，两样一起做？你当我是外星人啊！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">50、天赐你一双翅膀，就应该被红烧…</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">51、我拿什么整死你的爱人……</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">52、爷爷都是从孙子走过来的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">53、走自己的路，让别人打车去吧。穿别人的鞋，走自己的路，让他们找去吧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">54、骑白马的不一定是王子，可能是唐僧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">55、这个世界既不是有钱人的世界，也不是有权人的世界，它是有心人的世界。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">56、天才失败了就是蠢才！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">57、我就算是一只癞蛤蟆，我也决不娶母癞蛤蟆。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">58、世界上1%的人是吃小亏而占大便宜，而99%的人是占小便宜吃大亏。大多数成功人士都源于那1%。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">59、今天有人看见你了，你还是那样迷人，穿着格子背心，慢悠悠地走着，一副超然自在的样子，实在是可爱极了，真不知你当年是怎么赛过兔子的？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">60、当头晕的时候我终于明白了什么叫爱情。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">61、人如果靠吃饭活着，那饭不叫饭，叫饲料。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">62、再过几十年，我们来相会，送到火葬场，全部烧成灰，你一堆，我一堆，谁也不认识谁，全部送到农村做化肥。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">63、四讲：上午讲正气，中午讲义气，下午讲手气，晚上讲力气。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">64、你给我买10条烟总比我去一次夜总会划算吧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">65、俺的最低奋斗目标：农妇，山泉，有点田。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">66、废话是人际关系的第一句！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">67、能冲刷一切的除了眼泪，就是时间，以时间来推移感情，时间越长，冲突越淡，仿佛不断稀释的茶。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">68、按猪的审美观，我基本算得上是个美女。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">69、我喝水只喝纯净水，牛奶只喝纯牛奶，所以我很单纯……</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">70、站的更高，尿的更远。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">71、鱼对水说你看不到我的眼泪，因为我在水里。水说我能感觉到你的眼泪，因为你在我心里。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">72、不要和我比懒，我懒得和你比！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">73、其实我是一个天才，只可惜天妒英才！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">74、大部分人一辈子只做三件事：自欺、欺人、被人欺！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">75、我不是随便的人，我随便起来不是人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">76、参加选美的那些女人，都找不到好男人，因为好男人都结婚了，比如我。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">77、四项基本守则：喝酒基本靠送，抽烟基本靠供，工资基本不动，老婆基本不用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">78、死亡教会人一切，如同考试之后公布的结果——虽然恍然大悟，但为时晚矣。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">79、zg人学美国人容易，zg人学zg人难。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">80、猪有猪的思想，人有人的思想。如果猪有人的思想，那它就不是猪了——是八戒！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">81、生的伟大，死在花下！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">82、如果回帖是一种美德，那我早就成为圣人了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">83、日出东海落西山，愁也一天，喜也一天；遇事不钻牛角尖，人也舒坦，心也舒坦。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">84、你长的很有创意，活着是你的勇气，丑并非是你的本意，只是上帝发点脾气。你要勇敢地生活下去，来衬托出世界的美丽。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">85、婚姻的杀手有时不是外遇，而是时间。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">86、怨言是上天给于人类最大的供物，也是人类祷告中最真诚的部分。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">87、人越是得意的事情，越爱隐藏，越是痛苦的事情越爱小题大作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">88、四大祸根：酒是穿肠毒药，色是刮骨钢刀，气是下山猛虎，钱是惹祸的根苗。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">89、水至清则无鱼，人至贱则无敌！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">90、我也曾有过一双翅膀，不过我没用它在天上翱翔，而是放在锅里炖汤。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">91、记住该记住的，忘记该忘记的。改变能改变的，接受不能改变的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">92、我爱的人名花有主，爱我的人惨不忍睹，不是在放荡中变坏，就是在沉默中变态，老婆无味，情人太累，小姐太贵，没事开个男女聚会，拆散一对是一对。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">93、人生自古谁无死，哪个拉屎不用纸！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">94、人生短短几十年，不要给自己留下了什么遗憾，想笑就笑，想哭就哭，该爱的时候就去爱，无谓压抑自己。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">95、女为悦己者容，男为悦己者穷！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">96、我妈过生日，送脑白金还不如两块大梁骨煮煮吃，至少还能当下酒菜。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">97、只要锄头舞的好，那有墙角挖不倒？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">98、人都有以第一印象定好坏的习惯，认为一个人好时，就会爱屋及乌，认为一个人不好时，就会全盘否认。经典名言经典名人名言经典搞笑名言</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">99、我想早恋，但是已经晚了……</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">100、朋友分很多种，有些人真的是一辈子的朋友，有的不过是一杯子的朋友，当然，还有一被子的朋友。</p><p><br/></p>','那些搞笑的人生格言：1、见到我以后你会突然发现——原来美也可以这样具体呀！2、生命中，不断地有人离开或进入。于是，看见的，看不见的；记住的，遗忘了。生命中，不断地有得到和失落。于是，看不见的，看见了；遗忘的，记住了。然而，看不见的，是不是就','1491104888','1491104933','1','2','1','17','','1','0','1','0','0','搞笑,人生格言','','1','');
INSERT INTO `my_article` VALUES ('10','100句培根名言','','','','管理员','','/uploads/img1/20170402/58e0752c5a380.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">100句培根名言：</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、在一切有困难的交涉中，不可希冀一边下种一边收割。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、出身高贵的人，常是不太勤劳的，但他们对劳动的人却又往往心怀嫉妒。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、虚伪的友谊有如你的影子；当你在阳光下时，他会紧紧的跟着，但当你一旦横越过阴暗处时，它会立刻就离开你。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、知识是一种快乐，而好奇则是知识的萌芽。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、德行高尚的人们，其德愈增则受人嫉妒之机会愈减。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、真理易于从谬误中产生，难于从混乱中产生。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、奇迹多是在厄运中出现的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、活着就要学习，学习不是为了活着。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、美貌倘若生于一个品德高尚的人身上，当然是很光彩的；品行不端的人在它面前，便要自惭形秽，远自遁避了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、友谊不但能使人生走出暴风骤雨的感情而走向阳光明媚的晴空，而且能使人摆脱黑暗混乱的胡思乱想而走入光明与理性的思考。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、顺境的美德是节制，逆境的美德是坚韧，这后一种是较为伟大的德性。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、谚语可以体现一个民族的创造力，智慧和精神。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、如果说，友谊能够调剂人的感情的话，那么友谊的又一种作用则是能增进人的智慧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、狡猾是一种阴险邪恶的聪明。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、幸运所生的德性是节制，厄运所生的德性是坚忍……</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、在适当的时候去做事，可节省时间；背道而行往往会徒劳无功。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、一切幸运都并非没有烦恼，而一切厄运也绝非没有希望。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、读书补天然之不足，经验又补读书之不足。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、好炫耀的人是明哲之士所轻视的，愚蠢之人所艳羡的，诌佞之徒所奉承的，同时他们也是自己所夸耀的言语的奴隶。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、有些书可供一尝，有些书可以吞下，有不多的几部书则应当咀嚼消化；这就是说，有些书只要读读他们的一部分就够了，有些书可以全读，但是不必过于细心地读；还有不多的几部书则应当全读，勤读，而且用心地读。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">21、真理之川从它的错误之沟渠中流过；像萌芽一般，在一个真理之下又生一个疑问，真理疑问互为滋养。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">22、在人类历史的长河中，真理因为像黄金一样重，总是沉于河底而很难被人发现，相反地，那些牛粪一样轻的谬误倒漂浮在上面到处泛滥。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">23、过于重视行为规则拘泥形式，往往以致在事业上坐失良机。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">24、疑而能问，已得知识之半。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">25、知识像烛光，能照亮一个人，也能照亮无数的人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">26、有经验的老人执事令人放心，而青年人的干劲则鼓舞人心。如果说，老人的经验是可贵的，那么青年人的纯真则是崇高的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">27、习惯真是一种顽强而巨大的力量，它可以主宰人的一生，因此，人从幼年起就应该通过教育培养一种良好的习惯。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">28、如果问在人生中最重要的才能是什么？那么回答则是：第一，无所畏惧；第二，无所畏惧；第三，还是无所畏惧。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">29、要知道对好事的称颂过于夸大，也会招来人们的反感、轻蔑和嫉妒。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">30、在富人的想像里，财富是一座坚强的堡垒。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">31、书籍是思想的航船，在时代的波涛中破浪前进。它满载贵重的货物，运送给一代又一代。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">32、世上友谊本罕见，平等友情更难求。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">33、只有美貌而缺乏修养的人是不值得赞美的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">34、美貌的人并不都有其他才能。……所以许多容颜俊秀的人却一无所为，他们过于追求外形的美而放弃了内在的美。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">35、残疾人的成功通常不易招致嫉妒。因为他们有缺陷，使人乐于宽忍他们的成功。也常使潜在的对手忽视了他们的竞争和挑战。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">36、顺境中的好运，为人们所希冀；逆境中的好运，则为人所惊奇。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">37、人生如同道路。最近的捷径通常是最坏的路。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">38、没有比害怕本身更可害怕的了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">39、选择机会，就是节省时间。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">40、灰心生失望，失望生动摇，动摇生失败。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">41、同情是一切道德中最高的美德。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">42、善于选择要点就意味着节约时间，而不得要领的瞎忙，却等于乱放空炮。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">43、瓜是生在纯粹肥料里的最甜，天才是长在恶性土壤中的最好。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">44、金钱是好的仆人，却是不好的主人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">45、研究真理认识真理和相信真理，乃是人性中最高的美德。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">46、多诈的人藐视学问，愚鲁的人羡慕学问，聪明的人运用学问。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">47、时间是不可占有的公共财产，随着时间的推移，真理愈益显露。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">48、如果说金钱是商品的价值尺度，那么时间就是效率的价值尺度。因此对于一个办事缺乏效率者，必将为此付出高昂代价。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">49、读书不是为了雄辩和驳斥，也不是为了轻信和盲从，而是为了思考和权衡。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">50、首先细心思考，然后果断决定，最后坚韧不拔地去做。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">51、一个正在顺着生活规律挺进的青年，首先应注意自己的才能和愿望与事业相衡。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">52、疾病是逸乐所应得的利息。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">53、美有如夏天的水果，容易腐烂且不持久。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">54、历史使人贤明，诗造成气质高雅的人，数学使人高尚，自然哲学使人深沉，道德使人稳重，而伦理学和修辞学则使人善于争论。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">55、得不到友谊的人将是终身可怜的孤独者。没有友情的社会则只是一片繁华的沙漠。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">56、谁能比这种人更痛苦呢，他们人虽在世，却已亲身参加了埋葬自己名声的丧礼？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">57、无德之人常嫉他人之有德。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">58、幸运的时机好比市场上的交易，只要你稍有延误，它就将掉价了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">59、只见汪洋时就以为没有陆地的人，不过是拙劣的探索者。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">60、真挚的友谊犹如健康，不到失却时，无法体味其珍贵。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">61、任何本领都没有比良好的品格与态度更易受人欢迎，更易谋得高尚的职位。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">62、幸运所需要的美德是节制，而厄运所需要的美德是坚忍，后者比前者更为难能可贵。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">63、既然习惯是人生的主宰，人们就应当努力求得好的习惯。习惯如果是在幼年就起始的，那就是最完美的习惯，这是一定的，这个我们叫做教育。教育其实是一种从早年就起始的习惯。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">64、最难忍受的孤独莫过于缺少真正的友谊。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">65、书籍是在时代的波涛中航行的思想之船，它小心翼翼地把珍贵的货物运送给一代又一代。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">66、在读书的时候，我们与智者交谈；在生活的事务中，我们通常都是与愚人交谈。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">67、除了恐惧本身之外没什么好害怕的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">68、过于求速是做事上最大的危险之一。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">69、荣誉就像河流：轻浮的和空虚的荣誉浮在河面上，沉重的和厚实的荣誉沉在河底里。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">70、幸运并非没有许多的恐惧与烦恼；厄运也并非没有许多的安慰与希望。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">71、无论你怎样地表示愤怒，都不要做出任何无法挽回的事来。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">72、金钱是品德的行李，是走向美德的一大障碍；因财富之于品德，正如军队与辎重一样，没有它不行，有了它又妨碍前进，有时甚至因为照顾它反而丧失了胜利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">73、好的运气令人羡慕，而战胜厄运则更令人惊叹。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">74、因结婚而产生的爱，造出儿女；因友情而产生的爱，造就一个人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">75、使人们宁愿相信谬误，而不愿热爱真理的原因，不仅由于探索真理是艰苦的，而且是由于谬误更能迎合人类某些恶劣的天性。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">76、在我们生命的网上，不能隐匿着虚伪，否则，便在每根纵横的线上，都永远留下腐烂的痕迹。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">77、状貌之美胜于颜色之美，而适宜并优雅的行为之美又胜于状貌之美。美中之最上者就是图画所不能表现，初睹所不能见及者。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">78、凡过于把幸运之事归功于自己的聪明和智谋的人，多半是结局很不幸的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">79、在人类历史的长河中，真理因为像黄金一样重，总是沉于河底而很难被人发现；相反地，那些牛粪一样轻的谬误倒漂浮在上面到处泛滥。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">80、时间乃是最大的革新家。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">81、集体的习惯，其力量更大于个人的习惯。因此如果有一个有良好道德风气的社会环境，(www.znl.la)是最有利于培训好的社会公民的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">82、没有一种获利能及得上从我们的所有中节省下来的那样确切可靠。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">83、最快乐的事莫过于无拘无束。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">84、若要进入学问的世界，必须像赤子一样才行。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">85、过去的事情是无法挽回的。聪明人对现在与未来的事惟恐应付不暇，对既往的事岂能再去计较。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">86、你愈是少说你的伟大，我将愈想到你的伟大。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">87、智者创造的机会比他得到的机会要多。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">88、机会先把前额的头发给你捉而你不捉之后，就要把秃头给你捉了；或者至少它先把瓶子的把儿给你拿，如果你不拿，它就要把瓶子滚圆的身子给你，而那是很难捉住的。在开端起始时善用时机，再没有比这种智慧更大的了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">89、天使为欲求与神同等的权力，而犯法堕落；人类为求知识与神同等，而触法堕落。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">90、人们的举止应当象他们的衣服，不可太紧或过于讲究，应当宽舒一点，以便于工作和运动。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">91、对上帝的造物和工作的沉思产生了知识；但涉及到上帝本身时，却没有完满的知识，只有知识破灭后的惊异。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">92、严厉生畏，但是粗暴生恨，即使公事上的谴责，也应当庄重而不应当侮辱嘲弄。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">93、见思想如见其人，见知识如见其思想。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">94、从错误中比从混乱中易于发现真理。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">95、人们大半是依据他的意向而思想，依据他的学问与见识而谈话，而其行为却是依据他们的习惯。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">96、誓言是否有效，必须视发誓的目的而定；不是任何的目的都可以使誓言发生力量。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">97、我们的语言，不妨直爽，但不可粗暴骄傲；有时也应当说几句婉转的话，但切忌虚伪轻浮与油滑。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">98、我认为善的定义就是有利于人类。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">99、讨论犹如砺石，思想好比锋刃，两相砥砺将使思想更加锋利。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">100、人们愈是贤明，愈低着腰向他人学习。</p><p><br/></p>','100句培根名言：1、在一切有困难的交涉中，不可希冀一边下种一边收割。2、出身高贵的人，常是不太勤劳的，但他们对劳动的人却又往往心怀嫉妒。3、虚伪的友谊有如你的影子；当你在阳光下时，他会紧紧的跟着，但当你一旦横越过阴暗处时，它会立刻就离开你','1491105012','1491105099','3','1','1','17','','1','0','1','0','0','培根','','1','');
INSERT INTO `my_article` VALUES ('11','超级经典的励志名言：人生没有想法就不会又改变','','','','管理员','','/uploads/img1/20170402/58e0759ec44f1.png!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、一个年轻人，如果三年的时间里，没有任何想法，他这一生，就基本这个样子，没有多大改变了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、成功者就是胆识加魄力，曾经在火车上听人谈起过温州人的成功，说了这么三个字，“胆子大”。这其实，就是胆识，而拿得起，放得下，就是魄力。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、这个世界，有这么一小撮的人，打开报纸，是他们的消息，打开电视，是他们的消息，街头巷尾，议论的是他们的消息，仿佛世界是为他们准备的，他们能够呼风唤雨，无所不能。你的目标，应该是努力成为这一小撮人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4、如果，你真的爱你的爸妈，爱你的女朋友，就好好的去奋斗，去拼搏吧，这样，你才有能力，有经济条件，有自由时间，去陪他们，去好好爱他们。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5、这个社会，是快鱼吃慢鱼，而不是慢鱼吃快鱼。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">6、这个社会，是赢家通吃，输者一无所有，社会，永远都是只以成败论英雄。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7、如果你问周围朋友词语，如果十个人，九个人说不知道，那么，这是一个机遇，如果十个人，九个人都知道了，就是一个行业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">8、任何一个行业，一个市场，都是先来的有肉吃，后来的汤都没的喝。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">9、这个世界上，一流的人才，可以把三流项目做成二流或更好，但是，三流人才，会把一流项目，做的还不如三流。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">10、趁着年轻，多出去走走看看。读万卷书，不如行万里路，行万里路，不如阅人无数。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11、与人交往的时候，多听少说。这就是，上帝为什么给我们一个嘴巴两个耳朵的原因。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12、日常工作之外应当多注意自身修养的提高及自身技能的培训。随着计算机技术的广泛应用，为了不被社会所淘汰，就必须加强计算机技术的培训与提高。无论是企业培训还是个人培训都是不可或缺的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">13、不要装大，对于装大的人，最好的办法就是，捡块砖头，悄悄跟上去，一下子从背后放倒他。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">14、不要随便说脏话，这会让别人觉得你没涵养，不大愿意和你交往。即使交往，也是敷衍。因为他内心认定你素质很差。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">15、想要抽烟的时候，先问下周围的人可不可以，要学会尊重别人。少在女生面前耍酷抽烟，你不知道，其实她们内心很反感。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">16、买衣服的时候，要自己去挑，不要让家人给你买，虽然你第一第二次买的都不怎么样，可是，你会慢慢有眼光的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17、要想进步，就只有吸取教训，成功的经验都是歪曲的，成功了，想怎么说都可以，失败者没有发言权，可是，你可以通过他的事例反思，总结。教训，不仅要从自己身上吸取，还要从别人身上吸取。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18、学习，学习，再学习，有事没事，去书店看看书，关于管理，金融，营销，人际交往，未来趋势等这些，你能获得很多。这个社会竞争太激烈了，你不学习，就会被淘汰。大学毕业了，不是学习结束了，而是学习刚刚开始。我个人推荐一个很好的视频节目，《谁来一起午餐》。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">19、如果你不是歌手，不是画家，也不是玩行为艺术的，那么，请在平时注意你的衣着。现在这个社会，衣着能表现出你属于哪一个群体，哪一个圈子。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 790px; float: left; line-height: 26px; font-size: 14px; color: rgb(68, 68, 68); font-family: &#39;Trebuchet MS&#39;, Helvetica, &#39;Microsoft YaHei&#39;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">20、记住，平均每天看电视超过三个小时以上的，一定都是那些月收入不超过两千元的，如果你想要月收入超过两千，请不要把时间浪费在电视上。同样的道理，那些平均每天玩网络游戏或聊天超过三个小时以上的，也都是那些月收入不超过两千的。</p><p><br/></p>','1、一个年轻人，如果三年的时间里，没有任何想法，他这一生，就基本这个样子，没有多大改变了。2、成功者就是胆识加魄力，曾经在火车上听人谈起过温州人的成功，说了这么三个字，“胆子大”。这其实，就是胆识，而拿得起，放得下，就是魄力。3、这个世界，','1491105166','1491105208','9','3','1','5','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('12','心灵有家，生命才有路。','','','','管理员','','/uploads/img1/20170402/58e08960d2c99.jpg!300X300.jpg','<p style=\"text-indent: 2em; line-height: 2em;\">生命的魅力在于“静”。外表的宁静给人以美，内心的宁静给人以慧。外表宁静，因安稳而给人静穆之美，因无争给人以祥和之美。内心宁静，因淡泊而不受诱惑，因凝神而思远，因镇定而从容，因而智慧常在。静，不是单纯的平静，而是人生沉淀在灵魂深处的智慧，是人生最美的状态。<br/><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">心灵有家，生命才有路。我们要学会和外界独处，和生命独处，和自己独处。学会独处的人，心胸才能够豁达；学会独处的人，心智才能够成熟；学会独处的人，才能领悟到生活的深邃。独处是灵魂生长的必要空间，独处让我们内心充实起来。我们的内心就是在无数个独处中渐渐坚强起来。独处，让内心更强大。<br/><br/>一念苦，一念乐，一念得，一念失，我们的心在苦乐得失间无数次的来与去，会有疲倦的时候，我们要时常护理好自己的内心，心平静了，才能听见自己的声音。心清净了，才能看见万物的清澈，心放下了，才不被他物所负累，心明了了，才不因外境而迷离。如果，人生是一个剧场，这个导演不在别处，只在心里。<br/><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">为人处事靠自己，背后评说由他人。有时我们太在意耳边的声音，决策优柔寡断，行动畏首畏尾，最终累了心灵，困了精神。就算你做得再好，也会有人指指点点；即便你一塌糊涂，亦能听到赞歌。能够拯救你的，只能是你自己，不必纠结于外界的评判，不必掉进他人的眼神，不必为了讨好这个世界而扭曲了自己。<br/></p><p style=\"text-indent: 2em; line-height: 2em;\">人生的最大遗憾莫过于错误地坚持了不该坚持的东西，轻易地放弃了不该放弃的东西，每一个人都有自己的理想，都有那个期望达到的目标，或许有这么一天我能够成为一名教师，或许有那么一天我能实现自己的理想，达到自己的目标！生活还在继续，不要忘记微笑地对待每一天，不要忘记珍惜余下的每一天！<br/><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">每个人的人生道路在茫茫人海中不过就是陨落的慧星划过的一道光线，彼此碰撞，彼此磨砺，彼此包容，彼此阅读，彼此借鉴。人生短暂，不要把所有的关系都考虑得那么复杂，不如彼此都宽松一些时间，让渡一些空间，包容一些对错，善意理解别人的不同意见，因为简单的人生才能感知生命的意义和内涵。<br/><br/>“这世界是一半一半的。天一半，地一半；男一半，女一半；善一半，恶一半；清净一半，浊秽一半。很可惜，你拥有的是不全的世界。”“为什么?”“你要求完美，不能接受残缺的一半，所以你拥有的是不全的世界，毫无圆满可言”，学会包容，就会拥有一个完整的世界。<br/><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">心灵有家，生命之路将宽广无边！</p>','生命的魅力在于“静”。外表的宁静给人以美，内心的宁静给人以慧。外表宁静，因安稳而给人静穆之美，因无争给人以祥和之美。内心宁静，因淡泊而不受诱惑，因凝神而思远，因镇定而从容，因而智慧常在。静，不是单纯的平静，而是人生沉淀在灵魂深处的智慧，是人','1491110046','1491110243','1','4','1','1','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('36','你不是真正的快乐吉他谱_邓紫棋六线谱','','','','管理员','邓紫棋,你不是真正的快乐,五月天,','/uploads/img1/20170618/5946497f8186c.jpg!300X300.jpg','五月天歌曲，你不是真正的快乐吉他谱，指法音高D调，变调夹夹一品，实际音高bE调。你不是真正的快乐吉他六线谱，三张图片谱例。如果看不清可以另存为电脑用看图软件打开。五月天歌曲吉他弹唱谱，前奏尾奏编配完整。邓紫棋演唱的女声版，用心的改编唱出了理解、坚定和希望，现实生活中不为人知的内心独白，最后一句我要你快乐，感动莫名。<br /><img alt=\"五月天-你不是真正的快乐吉他谱\" src=\"/uploads/img1/20170618/5946497f8186c.jpg\" /><img alt=\"五月天-你不是真正的快乐吉他弹唱谱\" src=\"/uploads/img1/20170618/59464989330c6.jpg\" /><img alt=\"你不是真正的快乐简谱六线谱\" src=\"/uploads/img1/20170618/5946498f750dc.jpg\" />','五月天歌曲，你不是真正的快乐吉他谱，指法音高D调，变调夹夹一品，实际音高bE调。你不是真正的快乐吉他六线谱，三张图片谱例。如果看不清可以另存为电脑用看图软件打开。五月天歌曲吉他弹唱谱，前奏尾奏编配完整。邓紫棋演唱的女声版，用心的改编唱出了理','1497778586','1497778586','5','24','1','1','','1','1','0','0','0','邓紫棋,你不是真正的快乐,五月天,','','1','');
INSERT INTO `my_article` VALUES ('14','爱在旅途','','','','管理员','','/uploads/img1/20170402/58e08a0a21f3b.jpg!300X300.jpg','<p style=\"line-height: 2em;\">人生永远在路上<br/>旅途<br/>寄托的希望<br/>也是一条不归路<br/>没有后退<br/>一直往前冲<br/>不在乎过程艰辛<br/>也不关注终点如何<br/>只为了证明<br/>是在世上走一遭<br/>&nbsp;<br/>人生永远在路上<br/>旅途<br/>或许遇见雄伟高山<br/>奔腾的河流<br/>别太依恋这些<br/>因为<br/>你只是一个过客<br/>带不走<br/>一块山石一滴水柱<br/>也留不住<br/>坚实的步伐<br/>&nbsp;<br/>有一天<br/>当你老亦<br/>也走不动了<br/>希望能倒在软软草地上<br/>聆听清晰的小溪<br/>慢慢沉睡<br/>睡过地老天荒</p>','人生永远在路上旅途寄托的希望也是一条不归路没有后退一直往前冲不在乎过程艰辛也不关注终点如何只为了证明是在世上走一遭&nbsp;人生永远在路上旅途或许遇见雄伟高山奔腾的河流别太依恋这些因为你只是一个过客带不走一块山石一滴水柱也留不住坚实的步伐','1491110385','1491110413','1','4','1','1','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('15','烟雨江南 执念倾颜','','','','管理员','','/uploads/img1/20170402/58e08a7dbd219.jpg','<p style=\"line-height: 2em;\">静坐流年，轻倚烟火，时光已悄然迈向十一月的门楣，窗外，风卷着雨，雨裹着树叶纷纷飘落，清风冷雨，丝丝寒意。聆听着风的呢喃和雨的洗礼，我把我的心挂在风里，任相思如绵绵细雨，缠绕在指尖，弥漫在心田。相逢的渡口，写满了流年的絮语，看一滴滴的雨水落地，溅起一朵朵的雨花，爱的梦境和诗意，在心海跳跃……<br/>&nbsp;<br/>&nbsp; 雨，下的好安静。在这种意境里，慢慢回想着往事。想到了从前的自己，想到了与你朝夕相处的同桌，想到了你从前喜欢的咖啡，从前与同伴闹下的别扭……这一切的往事，都会随着这场雨过去。会被这场雨带到记忆的最深处存留，也许这就是我听雨带来的收获与感受吧。<br/>&nbsp;<br/>&nbsp; 爱看雨，爱听雨，也爱在雨中行走，所以非常非常地喜欢下雨。雨让城市的喧嚣静静沉淀，雨把岁月的尘埃洗得干干净净。雨后的清风明月，让这个世界变得诗情画意，韵味十足。<br/>&nbsp;<br/>&nbsp; 我喜欢雨，因为雨的境界里最适合读书。这样的雨天，有时还真能想起较为宏大的课题来，比如生之意义，幸福的概念等等。在陀螺般旋转的岁月里，在下雨的空闲中，回首过去的匆忙的脚步，难得有静静思考的机会，对自己有一个总结或评价，但总也想不太好，想不清楚。<br/><br/>&nbsp; 当然也难得浪漫一回，正好在雨夜里，偷得浮生半日闲，让思绪无拘无束地伸展，让思想天马行空般自由飞翔，爱想啥就想啥爱不想啥就不想啥，这本身也是一种幸福吧。<br/><br/>&nbsp; 可以撑上一把伞（最好是油纸伞）在雨里行走，雨在头上哗哗地下着，沿着伞边无声地流着，就像下雪的时候，脚底踩着雪吱嘎吱嘎地响着，雪纷纷扬扬地落着，心境就慢慢沉下来了。小雨或是大雪飘落在你心底的最柔软最脆弱的地方，一些温馨的事儿便都爬上心头，像雨雾一样弥漫开来，那思绪便被放逐得很远很远……<br/><br/>&nbsp; 最好的意境还是在雨中夜读，就像大雪的天气里，红泥火炉，山村佳酿，三二好友，天南海北，谈笑风生一样的惬意。听着外面潇潇的雨声，或有大珠小珠在屋瓦上丁咚弹奏，或有急风骤雨扑窗而来，电光时时闪现，把一些植物的影子投到窗前，疏影横斜，枝叶婆娑。这种氛围中，绿茶一杯，红烛一盏，手执一卷线装书，走进古人的境界，走进大师先哲的世界，与另一个时空维度里的人们对话交流，偶有所感所想，记于笔记心中，丰富知识，吸纳智慧，不也是幸福着的一种方式么。<br/><br/>&nbsp; 流连的岁月里，相守一份从容的静美。不为索求，只为那邂逅相遇的缘分，一个守望，在流年的轮回里执着。任思念的羽翼，渲染着光阴的漫长，岁月沧桑，情在眸里，爱在心上，默契着岁月里的那些感悟，极致了我生命的每一个清晨黄昏。此生有爱，我心不冷，镌把心灵絮语，串成入眸的风铃，悬挂在初冬的门楣，风吹起，在绵绵细雨中曼妙，几多留恋，深情，落进一泓温柔情怀中，年复一年，日复一日，温柔了岁月，静好了流年！<br/><br/>&nbsp; 当飞舞的思念随着沙沙的雨声盘旋飘远，穿越夜的弥漫，最后落在笔尖，许一世柔情给你。那一场情深意浓，始终为你停留。有清冷的风穿过虚掩的窗棂飘来，拂过脸颊，发丝掠过眉梢嘴角的瞬间，露出一窝醉心的浅笑。那一世的牵绊，都是心底最温暖的源泉。初见岁月的旖旎总是被点燃，脚步，总是在追赶，追赶一种沉湎，那些如春藤蔓延的情牵，那些安放在诗笺里缠绵的心念，都因你而鲜活生动。把沿途的美丽，写成且行且惜。<br/><br/>&nbsp; 推开窗，一丝凉意夹杂着细碎的雨滴，带着暮秋的气息，迎面而来，顿时冷却了身上的薄衣。心中，却是阳光暖暖。一点点将温暖慢慢晕开，湿润着心底深处的那片柔软。隔着千里山水遥遥眺望江南的袅袅炊烟，隔着茫茫人海默默想念梦中那个身影，繁华若梦，青花烟雨已编织成一张密密的心网，把今朝的思念，留驻在梦的彼岸。默许一份暖，还有那暖暖的笑靥，牵挂，以温馨为墨绘成一片期待，将深情融入字里行间，待到春暖花开时，你便是我无悔的依赖。<br/><br/>&nbsp; 静默红尘，等一场如诗般的邂逅，等待你我相伴在烟雨江南，燃一世繁华，暖一场相逢，一起守着花开香色，细数云卷云舒的起落，任光阴一寸寸无情消逝与流转，待我们的青丝变成白发的时候，那些百转千回的缠绵，湮没在时光的长河中。与你，在一所滋满青苔的老宅里，隔窗听风雨，与你对坐浅酌，借山水清幽，点缀细水长流的温情，与山水共清欢，与岁月共老。<br/><br/>&nbsp; 我爱雨，雨中最宜与古诗词相伴。雨有诗的韵律与雅趣，有国画的朦胧与缥缈。雨中的景物，一切朦胧如织，若隐若现，是一种半透明的美丽。像一幅水墨，那淡淡的情调，从宣纸上慢慢地洇染开来。雨，让诗人写不尽的千姿百态，让画家画不完的雅致风流。微微细雨，夹杂着片片树叶，随着一阵阵清凉的风飘洒在大地上。如同跳舞的少女一般婀娜多姿，亭亭玉立。雨尽情地下着，冲洗着大地上的污垢，也洗刷着人们的心。雨滴在脸上，仿佛能闻到一种淡淡的清香与甘甜。<br/><br/>&nbsp; 尽管她曾经带给了你不一样的情怀。但，这所有的一切都成为了记忆。静下心来听雨，多了一份感伤，多了一份思念，也多了一份释怀。慢慢的把心交给意境，在意境里沉醉，在意境里体会一种别样的真实与美丽！</p>','静坐流年，轻倚烟火，时光已悄然迈向十一月的门楣，窗外，风卷着雨，雨裹着树叶纷纷飘落，清风冷雨，丝丝寒意。聆听着风的呢喃和雨的洗礼，我把我的心挂在风里，任相思如绵绵细雨，缠绕在指尖，弥漫在心田。相逢的渡口，写满了流年的絮语，看一滴滴的雨水落地','1491110452','1491110544','11','4','1','17','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('16','散文鉴赏精髓','','','','管理员','','/uploads/img1/20170402/58e08ac46f42c.jpg','<p><strong style=\"font-family: Verdana; font-size: 20px; line-height: 26px; white-space: normal; background-color: rgb(255, 255, 255);\">散文鉴赏</strong><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">一、了解写作背景，把握文章的时代性，了解作者生平，经历，特点（从不同角度，不同阶段，不同层次，运用各种分析法进行有效的分析思考，与之为友，求得思想灵魂心灵上的沟通与交流）</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">二、把握文章内容、主旨、结构、理清思路、抓住线索求得整体上的把握（充分运用系统思想）</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">三、鉴赏文章在谋篇布局、表达方式的艺术性及其是如何思考如何产生。（在明确散文各种表达方式、修辞、特点、要素的基础上）</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">四、揣摩语言，合旨适境。（文眼）</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">1、在客观把握文章内容的基础上，对重点语句进行深刻思考与赏析，把握其象征意义、比喻意义，寻觅文章各部分在言情表意上的内在联系。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">2、以文章题旨、情境为参照系。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">3、考虑其他方面，如本句句式结构、在语段中的作用意义、相邻句在全文中的作用，以及所用的表达方式，修辞等等</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">五、明确意像，缘情入景，构建意像。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">再把我语言的基础上，融入作者和读者的双重感受后，清晰意像，然后找出各意像构成的各要素之间的关系和意像群之间的内在关系，结合作者情感，创作背景，读者的真切体验，构建符合文章主旨和读者个性的意境来</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">六、对不同作品进行比较鉴赏</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">充分展开联想，从散文的意境、用词用语、形象刻画、景物描写、情感抒发、哲理内涵、表达技巧、谋篇布局的角度进行同类或相反的比较，侧重文章表达的艺术性</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">七、对文章进行整体构思分析、欣赏、明确各要素之间的关系</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">八、进行深刻反思、从而有所感悟、激发自身对相关问题的思考、读后进行创作，汲取精华，提高素养</span></p>','散文鉴赏一、了解写作背景，把握文章的时代性，了解作者生平，经历，特点（从不同角度，不同阶段，不同层次，运用各种分析法进行有效的分析思考，与之为友，求得思想灵魂心灵上的沟通与交流） 二、把握文章内容、主旨、结构、理清思路、抓住线索求','1491110582','1497449226','1','4','1','5','','1','0','1','0','0','散文鉴赏','','1','/uploads/file1/20170614/594141e8ee1e3.txt');
INSERT INTO `my_article` VALUES ('17','“唐僧”徐少华复出拍戏再演唐僧？','','','','管理员','','/uploads/img1/20170402/58e08b66831a2.jpg','<p><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">日前，徐少华参加了一部电影的拍摄，这也是他在98年参加《西游记》续集拍摄后再次复出拍戏。”</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">徐少华1958年出生于山东青岛，著名影视话剧表演艺术家，国家一级演员，是86版电视剧《西游记》中唐僧扮演者</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">“当年感觉他嫩的能掐出水。”当年他真的是又嫩又美，难怪妖精都想吃！”“当年三个唐僧就觉得他最帅，女儿国那边和朱琳演的太好了。”“好想再见《西游记》师徒重聚啊。”</span></p>','日前，徐少华参加了一部电影的拍摄，这也是他在98年参加《西游记》续集拍摄后再次复出拍戏。”徐少华1958年出生于山东青岛，著名影视话剧表演艺术家，国家一级演员，是86版电视剧《西游记》中唐僧扮演者“当年感觉他嫩的能掐出水。”当年他真的是又嫩','1491110739','1491110784','0','5','1','1','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('18','警方近日摧毁特大贩毒团伙','','','','管理员','','/uploads/img1/20170402/58e08be571d4e.jpg!300X300.jpg','<p style=\"text-align: left;\"><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">辽宁省阜新市公安局27日发布消息称，该局捣毁一个特大跨省制贩毒团伙，缴获新型毒品甲卡西酮230公斤。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">　　甲卡西酮是一种致幻性很强的新型毒品，可引发吸毒者焦虑、痉挛、妄想和血液循环等问题，严重者可导致死亡。因海外发生过数起吸毒者“啃脸”事件，亦被称为“丧尸药”，其危害程度不亚于海洛因等传统毒品。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">　　2016年11月，阜新警方在侦办一起毒品案件时，发现谢某与沈某频繁在网络上交流制毒信息，警方立即成立专案组调查此事。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">　　缉毒人员经过一个月的调查得知，谢某提供技术和资金，由沈某在网络上购买制毒原料，通过物流方式运输，利用一处厂房作为掩护制毒，然后联系下线销往山东等地。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">　　12月13日，在基本查明制毒窝点情况和团伙成员的活动规律后，包括14名武装特警在内的缉毒人员实施统一抓捕，将主犯谢某、沈某等人当场抓获。在气味刺鼻的制毒窝点内，一台大型过滤设备正在运转，旁边散落着装有化学原料的塑料桶。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">　　截至目前，警方已抓获4名涉案嫌犯，现场缴获易制毒化学品约300公斤，以及大量生产设备、化学制剂等。这一特大跨省制贩毒网络被彻底捣毁。</span><br/><span style=\"font-family: Verdana; font-size: 20px; line-height: 26px; background-color: rgb(255, 255, 255);\">　　目前，此案正在进一步调查审理中。</span><br/><br/><br/></p><p style=\"text-align: center;\"><img title=\'警方近日摧毁特大贩毒团伙\' alt=\'警方近日摧毁特大贩毒团伙\' title=\'警方近日摧毁特大贩毒团伙\' alt=\"\" src=\"/uploads/img1/20170402/58e08be98338f.jpg\"/></p>','辽宁省阜新市公安局27日发布消息称，该局捣毁一个特大跨省制贩毒团伙，缴获新型毒品甲卡西酮230公斤。　　甲卡西酮是一种致幻性很强的新型毒品，可引发吸毒者焦虑、痉挛、妄想和血液循环等问题，严重者可导致死亡。因海外发生过数起吸毒者“啃脸”事件，','1491110867','1491110922','1','5','1','1','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('19','情侣2万卖亲生女儿，买猫一只花2000','','','','管理员','','/uploads/img1/20170402/58e08c46b0b69.jpg!300X300.jpg','<p style=\"text-align: center;\"><img title=\'情侣2万卖亲生女儿，买猫一只花2000\' alt=\'情侣2万卖亲生女儿，买猫一只花2000\' title=\'情侣2万卖亲生女儿，买猫一只花2000\' alt=\"\" src=\"http://localhost:85/uploads/img1/20170402/58e08c57031cd.jpg\"/></p><p style=\"text-align: left;\"><br/><span style=\"font-size: 20px;\">嘉善一对小情侣却以没稳定工作、养不起孩子为由，在网上叫卖孩子。在用亲生女儿换来2万元钱后，他们竟转手就花2000元买了只宠物猫。</span><br/><span style=\"font-size: 20px;\">　　</span><br/><span style=\"font-size: 20px;\">记者从嘉善县人民检察院了解到，这还不是他们第一次卖孩子，之前这个90后未婚妈妈还私下非法卖过一个女儿。</span><br/><br/><span style=\"font-size: 20px;\">近日，这名枉为人母的女子被嘉善法院判刑，而孩子爸爸也被嘉善检察院追诉获刑。</span></p>','嘉善一对小情侣却以没稳定工作、养不起孩子为由，在网上叫卖孩子。在用亲生女儿换来2万元钱后，他们竟转手就花2000元买了只宠物猫。　　记者从嘉善县人民检察院了解到，这还不是他们第一次卖孩子，之前这个90后未婚妈妈还私下非法卖过一个女儿。近日，','1491110976','1491111069','0','5','1','1','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('20','《我是演说家》乐嘉称华少虚伪 华少回应：混蛋','','','','管理员','','/uploads/img1/20170402/58e08cfcebe61.jpg!300X300.jpg','<p style=\"text-align: center\"><img title=\'《我是演说家》乐嘉称华少虚伪 华少回应：混蛋\' alt=\'《我是演说家》乐嘉称华少虚伪 华少回应：混蛋\' title=\'《我是演说家》乐嘉称华少虚伪 华少回应：混蛋\' alt=\'《我是演说家》乐嘉称华少虚伪 华少回应：混蛋\' src=\"/uploads/img1/20170402/58e08cfcebe61.jpg\"/></p><p><br/></p><p><span style=\"font-size: 20px;\">华少与乐嘉自《我是演说家》开播以来，一直闹出不和新闻：先是开局华少遭遇“众矢之的”，然后出现“乐嘉呛声华少”，在观众纷纷猜测二人不和的时候，两人竟意外又来了个“冰释前嫌”谈笑风生。</span></p><p>&nbsp;</p><p><span style=\"font-size: 20px;\">根据参加此次录制的记者回忆，这一次发生口角的原因是因为《我是演说家》人气学员刘轩（刘墉之子），华少在点评刘轩时采取了贬低自己抬高刘轩的方式，让乐嘉深感不满，认为华少如此抬高刘轩太过虚伪，所以直接对华少说“我觉得你这个人很虚伪”。不知是不是之前两人积怨太多，华少当时就怒了，毫不客气，直接回击“我坐在这里有我说话的权利，如果有人要指控我，请拿出证据，否则我只能把你当混蛋处理。但是我认为连用词的准确都做不到的人，不可以当老师！”言下之意，认为乐嘉如此说话方式，根本不配当导师！</span></p><p>&nbsp;</p><p><span style=\"font-size: 20px;\">在导师战队pk战时，华少选择了“队内厮杀”的战术。华少派出自己队内的王帆和冉高明进行对决。华少认为这种选择也是迫于情势，实属无奈之举。却被乐嘉当场反驳华少“用心险恶”，乐嘉认为华少这么做其实是“以退为进”，最后还落了一个“好人”的称号。而自己每次“戳破真相”反被大众认为是“恶人”。面对乐嘉公开的“挑衅”，华少当下回击“你看世界是什么样的，世界就是什么样的”。华少明显以苏东坡和佛印“心中有佛，所见皆佛，心中有屎，所见皆屎”的著名典故暗讽乐嘉是“屎”予以有力回击</span></p><p><br/></p>','华少与乐嘉自《我是演说家》开播以来，一直闹出不和新闻：先是开局华少遭遇“众矢之的”，然后出现“乐嘉呛声华少”，在观众纷纷猜测二人不和的时候，两人竟意外又来了个“冰释前嫌”谈笑风生。&nbsp;根据参加此次录制的记者回忆，这一次发生口角的原因','1491111123','1491111178','1','5','1','5','','1','0','1','0','0','','','1','');
INSERT INTO `my_article` VALUES ('21','大鱼海棠动漫手机壁纸','','','','管理员','','/uploads/img1/20170402/58e0b4e171648.jpg!300X300.jpg','<p style=\"text-align: center;\">大鱼海棠动漫手机壁纸</p><p style=\"text-align: center\"><img title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' src=\"/uploads/img1/20170402/58e0b4e171648.jpg\"/></p><p style=\"text-align: center\"><img title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' src=\"/uploads/img1/20170402/58e0b4e2b96ea.jpg\"/></p><p style=\"text-align: center\"><img title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' src=\"/uploads/img1/20170402/58e0b4e3e0445.jpg\"/></p><p style=\"text-align: center\"><img title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' title=\'大鱼海棠动漫手机壁纸\' alt=\'大鱼海棠动漫手机壁纸\' src=\"/uploads/img1/20170402/58e0b4e51eeca.jpg\"/></p><p><br/></p>','大鱼海棠动漫手机壁纸','1491121284','1491121415','1','24','1','1','','1','0','1','0','0','大鱼海棠','','1','');
INSERT INTO `my_article` VALUES ('22','呆萌可爱熊本熊手机壁纸','','','','管理员','','/uploads/img1/20170402/58e0b593a726a.jpg!300X300.jpg','<p style=\"text-align: center;\">呆萌可爱熊本熊手机壁纸</p><p style=\"text-align: center\"><img title=\'呆萌可爱熊本熊手机壁纸\' alt=\'呆萌可爱熊本熊手机壁纸\' title=\'呆萌可爱熊本熊手机壁纸\' alt=\'呆萌可爱熊本熊手机壁纸\' title=\'呆萌可爱熊本熊手机壁纸\' alt=\'呆萌可爱熊本熊手机壁纸\' src=\"/uploads/img1/20170402/58e0b593a726a.jpg\"/></p><p style=\"text-align: center\"><img title=\'呆萌可爱熊本熊手机壁纸\' alt=\'呆萌可爱熊本熊手机壁纸\' title=\'呆萌可爱熊本熊手机壁纸\' alt=\'呆萌可爱熊本熊手机壁纸\' title=\'呆萌可爱熊本熊手机壁纸\' alt=\'呆萌可爱熊本熊手机壁纸\' src=\"/uploads/img1/20170402/58e0b594c85eb.jpg\"/></p><p><br/></p>','呆萌可爱熊本熊手机壁纸','1491121494','1491121568','0','24','1','1','','1','0','1','0','0','熊本熊','','1','');
INSERT INTO `my_article` VALUES ('23','电影《盗墓笔记》电脑桌面壁纸','','','','管理员','','/uploads/img1/20170402/58e0b607dad29.jpg!300X300.jpg','<p style=\"text-align: center;\">电影《盗墓笔记》电脑桌面壁纸</p><p style=\"text-align: center\"><img title=\'电影《盗墓笔记》电脑桌面壁纸\' alt=\'电影《盗墓笔记》电脑桌面壁纸\' title=\'电影《盗墓笔记》电脑桌面壁纸\' alt=\'电影《盗墓笔记》电脑桌面壁纸\' title=\'电影《盗墓笔记》电脑桌面壁纸\' alt=\'电影《盗墓笔记》电脑桌面壁纸\' src=\"/uploads/img1/20170402/58e0b607dad29.jpg\"/></p><p style=\"text-align: center\"><img title=\'电影《盗墓笔记》电脑桌面壁纸\' alt=\'电影《盗墓笔记》电脑桌面壁纸\' title=\'电影《盗墓笔记》电脑桌面壁纸\' alt=\'电影《盗墓笔记》电脑桌面壁纸\' title=\'电影《盗墓笔记》电脑桌面壁纸\' alt=\'电影《盗墓笔记》电脑桌面壁纸\' src=\"/uploads/img1/20170402/58e0b6087f475.jpg\"/></p><p><br/></p>','电影《盗墓笔记》电脑桌面壁纸','1491121631','1491121685','1','24','1','1','','1','0','1','0','0','盗墓笔记','','1','');
INSERT INTO `my_article` VALUES ('24','电视剧诛仙青云志李易峰壁纸','','','','管理员','','/uploads/img1/20170402/58e0b6ab1d351.jpg!300X300.jpg','<p style=\"text-align: center;\">电视剧诛仙青云志李易峰壁纸</p><p style=\"text-align: center\"><img title=\'电视剧诛仙青云志李易峰壁纸\' alt=\'电视剧诛仙青云志李易峰壁纸\' title=\'电视剧诛仙青云志李易峰壁纸\' alt=\'电视剧诛仙青云志李易峰壁纸\' title=\'电视剧诛仙青云志李易峰壁纸\' alt=\'电视剧诛仙青云志李易峰壁纸\' src=\"/uploads/img1/20170402/58e0b6ab1d351.jpg\"/></p><p style=\"text-align: center\"><img title=\'电视剧诛仙青云志李易峰壁纸\' alt=\'电视剧诛仙青云志李易峰壁纸\' title=\'电视剧诛仙青云志李易峰壁纸\' alt=\'电视剧诛仙青云志李易峰壁纸\' title=\'电视剧诛仙青云志李易峰壁纸\' alt=\'电视剧诛仙青云志李易峰壁纸\' src=\"/uploads/img1/20170402/58e0b6ac51f56.jpg\"/></p><p><br/></p>','电视剧诛仙青云志李易峰壁纸','1491121726','1491121868','0','24','1','5','','1','0','1','0','0','诛仙青云志,李易峰','','1','');
INSERT INTO `my_article` VALUES ('25','电视剧老九门剧照高清电脑壁纸','','','','管理员','','/uploads/img1/20170402/58e0b730e9780.jpg!300X300.jpg','<p style=\"text-align: center;\">电视剧老九门剧照高清电脑壁纸</p><p style=\"text-align: center\"><img title=\'电视剧老九门剧照高清电脑壁纸\' alt=\'电视剧老九门剧照高清电脑壁纸\' title=\'电视剧老九门剧照高清电脑壁纸\' alt=\'电视剧老九门剧照高清电脑壁纸\' title=\'电视剧老九门剧照高清电脑壁纸\' alt=\'电视剧老九门剧照高清电脑壁纸\' src=\"/uploads/img1/20170402/58e0b730e9780.jpg\"/></p><p style=\"text-align: center\"><img title=\'电视剧老九门剧照高清电脑壁纸\' alt=\'电视剧老九门剧照高清电脑壁纸\' title=\'电视剧老九门剧照高清电脑壁纸\' alt=\'电视剧老九门剧照高清电脑壁纸\' title=\'电视剧老九门剧照高清电脑壁纸\' alt=\'电视剧老九门剧照高清电脑壁纸\' src=\"/uploads/img1/20170402/58e0b73234558.jpg\"/></p><p><br/></p>','电视剧老九门剧照高清电脑壁纸','1491121900','1491121983','0','24','1','1','','1','0','1','0','0','老九门剧照,老九门壁纸','','1','');
INSERT INTO `my_article` VALUES ('26','2016新海诚新作《你的名字》手机高清壁纸','','','','管理员','','/uploads/img1/20170402/58e0b7c3169e6.jpg!300X300.jpg','<p>2016新海诚新作《你的名字》手机高清壁纸</p><p style=\"text-align: center\"><img title=\'2016新海诚新作《你的名字》手机高清壁纸\' alt=\'2016新海诚新作《你的名字》手机高清壁纸\' title=\'2016新海诚新作《你的名字》手机高清壁纸\' alt=\'2016新海诚新作《你的名字》手机高清壁纸\' title=\'2016新海诚新作《你的名字》手机高清壁纸\' alt=\'2016新海诚新作《你的名字》手机高清壁纸\' src=\"/uploads/img1/20170402/58e0b7c3169e6.jpg\"/></p><p style=\"text-align: center\"><img title=\'2016新海诚新作《你的名字》手机高清壁纸\' alt=\'2016新海诚新作《你的名字》手机高清壁纸\' title=\'2016新海诚新作《你的名字》手机高清壁纸\' alt=\'2016新海诚新作《你的名字》手机高清壁纸\' title=\'2016新海诚新作《你的名字》手机高清壁纸\' alt=\'2016新海诚新作《你的名字》手机高清壁纸\' src=\"/uploads/img1/20170402/58e0b7c41c7e1.jpg\"/></p><p><br/></p>','2016新海诚新作《你的名字》手机高清壁纸','1491122056','1491122127','0','24','1','5','','1','0','1','0','0','新海诚,你的名字','','1','');
INSERT INTO `my_article` VALUES ('27','2016新海诚新作《你的名字》桌面壁纸','','','','管理员','','/uploads/img1/20170402/58e0b84c491e6.jpg!300X300.jpg','<p>2016新海诚新作《你的名字》桌面壁纸</p><p style=\"text-align: center\"><img title=\'2016新海诚新作《你的名字》桌面壁纸\' alt=\'2016新海诚新作《你的名字》桌面壁纸\' title=\'2016新海诚新作《你的名字》桌面壁纸\' alt=\'2016新海诚新作《你的名字》桌面壁纸\' title=\'2016新海诚新作《你的名字》桌面壁纸\' alt=\'2016新海诚新作《你的名字》桌面壁纸\' src=\"/uploads/img1/20170402/58e0b84c491e6.jpg\"/></p><p style=\"text-align: center\"><img title=\'2016新海诚新作《你的名字》桌面壁纸\' alt=\'2016新海诚新作《你的名字》桌面壁纸\' title=\'2016新海诚新作《你的名字》桌面壁纸\' alt=\'2016新海诚新作《你的名字》桌面壁纸\' title=\'2016新海诚新作《你的名字》桌面壁纸\' alt=\'2016新海诚新作《你的名字》桌面壁纸\' src=\"/uploads/img1/20170402/58e0b84cd216e.jpg\"/></p><p><br/></p>','2016新海诚新作《你的名字》桌面壁纸','1491122177','1491122262','3','24','1','1','','1','0','1','0','0','新海诚,你的名字,桌面壁纸','','1','');
INSERT INTO `my_article` VALUES ('28','我的天呐系列表情包','','','','管理员','','/uploads/img1/20170402/58e0b8d218f03.png!300X300.jpg','<p style=\"text-align: center;\">我的天呐系列表情包</p><p style=\"text-align: center\"><img title=\'我的天呐系列表情包\' alt=\'我的天呐系列表情包\' title=\'我的天呐系列表情包\' alt=\'我的天呐系列表情包\' title=\'我的天呐系列表情包\' alt=\'我的天呐系列表情包\' src=\"/uploads/img1/20170402/58e0b8d218f03.png\"/></p><p style=\"text-align: center\"><img title=\'我的天呐系列表情包\' alt=\'我的天呐系列表情包\' title=\'我的天呐系列表情包\' alt=\'我的天呐系列表情包\' title=\'我的天呐系列表情包\' alt=\'我的天呐系列表情包\' src=\"/uploads/img1/20170402/58e0b8d309d09.png\"/></p><p><br/></p>','我的天呐系列表情包','1491122325','1491122396','0','25','1','1','','1','0','1','0','0','QQ表情包','','1','');
INSERT INTO `my_article` VALUES ('29','各种早安问候表情包','','','','管理员','','/uploads/img1/20170402/58e0b91a50e0e.png!300X300.jpg','<p style=\"text-align: center;\">各种早安问候表情包</p><p style=\"text-align: center\"><img title=\'各种早安问候表情包\' alt=\'各种早安问候表情包\' title=\'各种早安问候表情包\' alt=\'各种早安问候表情包\' src=\"/uploads/img1/20170402/58e0b91a50e0e.png\"/></p><p><br/></p>','各种早安问候表情包','1491122422','1491122463','2','25','1','1','','1','0','1','0','0','表情包','','1','');
INSERT INTO `my_article` VALUES ('30','晚上不睡觉玩手机系列表情包','','','','管理员','','/uploads/img1/20170402/58e0b97c90433.png!300X300.jpg','<p style=\"text-align: center;\">晚上不睡觉玩手机系列表情包</p><p style=\"text-align: center\"><img title=\'晚上不睡觉玩手机系列表情包\' alt=\'晚上不睡觉玩手机系列表情包\' title=\'晚上不睡觉玩手机系列表情包\' alt=\'晚上不睡觉玩手机系列表情包\' src=\"/uploads/img1/20170402/58e0b97c90433.png\"/></p><p><br/></p>','晚上不睡觉玩手机系列表情包','1491122517','1491122562','3','25','1','1','','1','0','1','0','0','表情包','','1','');
INSERT INTO `my_article` VALUES ('31','可爱的龙猫','','','','管理员','','/uploads/img1/20170402/58e0ba8b90627.jpg!300X300.jpg','<p style=\"text-align: center;\">可爱的龙猫</p><p style=\"text-align: center\"><img title=\'可爱的龙猫\' alt=\'可爱的龙猫\' title=\'可爱的龙猫\' alt=\'可爱的龙猫\' src=\"/uploads/img1/20170402/58e0ba8b90627.jpg\"/></p><p><br/></p>','可爱的龙猫','1491122786','1491122836','3','23','1','5','','1','0','1','0','0','龙猫','','1','');
INSERT INTO `my_article` VALUES ('32','内涵搞笑漫画换制服','','','','管理员','','/uploads/img1/20170402/58e0bb193fd7e.jpg!300X300.jpg','<p style=\"text-align: center;\">内涵搞笑漫画换制服</p><p style=\"text-align: center\"><img title=\'内涵搞笑漫画换制服\' alt=\'内涵搞笑漫画换制服\' title=\'内涵搞笑漫画换制服\' alt=\'内涵搞笑漫画换制服\' src=\"/uploads/img1/20170402/58e0bb193fd7e.jpg\"/></p><p><br/></p>','内涵搞笑漫画换制服','1491122907','1491122976','6','23','1','1','','1','0','1','0','0','内涵搞笑','','1','');
INSERT INTO `my_article` VALUES ('33','日本漫画家渥美冬留作品','','','','管理员','','/uploads/img1/20170402/58e0bb6406c82.jpg!300X300.jpg','<p style=\"text-align: center;\">日本漫画家渥美冬留作品</p><p style=\"text-align: center\"><img title=\'日本漫画家渥美冬留作品\' alt=\'日本漫画家渥美冬留作品\' title=\'日本漫画家渥美冬留作品\' alt=\'日本漫画家渥美冬留作品\' src=\"/uploads/img1/20170402/58e0bb6406c82.jpg\"/></p><p><br/></p>','日本漫画家渥美冬留作品','1491123005','1491123054','7','23','1','5','','1','0','1','0','0','渥美冬留','','1','');
INSERT INTO `my_article` VALUES ('34','漫画少女系列','','','','管理员','','/uploads/img1/20170402/58e0bc13663fa.jpeg!300X300.jpg','<p style=\"text-align: center;\">漫画少女系列</p><p style=\"text-align: center\"><img title=\'漫画少女系列\' alt=\'漫画少女系列\' title=\"漫画少女系列\" alt=\"漫画少女系列\" src=\"/uploads/img1/20170402/58e0bbdbb7bf2.jpeg\"/></p><p><br/></p>','漫画少女系列','1491123126','1491123222','6','23','1','1','','1','0','1','0','0','漫画少女系列','','1','');
INSERT INTO `my_article` VALUES ('37','手机QQ悄悄更新一个重磅功能：提取图中文字','','','http://www.qqseller.com/QQdong','管理员','手机QQ,提取图中文字','','\n<p>\r\n	近日，手机QQ悄然上线一个新功能，能够直接提取图片中的文字了。</p>\r\n<p>\r\n	操作很简单，当好友发来一张图片时，我们只需要点击这张图片来到全屏，然后长按图片，即可调出“提取图中文字”功能。</p>\r\n<center>\r\n	<img alt=\"手机QQ悄悄更新一个重磅功能：提取图中文字\" border=\"1\" height=\"800\" src=\"/uploads/img1/20170811/8bd4450dbe2d01e59517df314018a6d3.jpg\" width=\"449\">\n</center>\r\n<p>\r\n	提取后的文字还能二次编辑，方便日常交流办公。</p>\r\n<p>\r\n	据悉，该功能使用的时OCR技术，即“光学字符识别”，也是目前最流行的图片文字识别技术。</p>\r\n<p>\r\n	不知为何，这么实用的功能，在QQ更新目录中竟然只字未提，或许是QQ想给大家一个惊喜吧。</p>\n','近日，手机QQ悄然上线一个新功能，能够直接提取图片中的文字了。\r\n\r\n	操作很简单，当好友发来一张图片时，我们只需要点击这张图片来到全屏，然后长按图片，即可调出“提取图中文字”功能。\r\n\r\n	\n\r\n\r\n	提取后的文字还能二次编辑，方便日常交','1502426793','1502426793','1','5','1','0','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('38','BlackHat大会：腾讯安全3人获白帽黑客奥斯卡提名','','','http://www.qqseller.com/QQdong','管理员','BlackHat大会,腾讯安全','/uploads/img1/20170811/333767987604f96019ca839553184ce2.jpeg!300X300.jpg','\n<p>\r\n	中新网7月28日电 美国当地时间7月27日，一年一度的BlackHat美国黑帽大会在拉斯维加斯召开。作为全球信息安全行业公认的最高盛会，吸引了全球上万名企业、政府研究人员，及顶级安全厂商、研究组织的优秀白帽黑客代表参加。腾讯安全联合实验室作为中国网络安全的中坚力量，受邀参与此次盛会。</p>\r\n<p>\r\n	有白帽黑客奥斯卡之称的Pwine Awards奖是BlackHat上的保留节目，专为有重大和突出研究成果的信息安全工作者设立，被提名甚至得奖都是荣誉的象征，腾讯安全联合实验室共有3人获得Pwine Awards三大奖项提名。除此之外，在BlackHat上发布的微软安全响应中心TOP100白帽黑客贡献榜中，腾讯安全8位安全专家实力入选并获致谢，再次代表中国军团向世界展示中国安全实力!</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"315\" src=\"/uploads/img1/20170811/333767987604f96019ca839553184ce2.jpeg\" width=\"500\">\n</center>\r\n<p style=\"text-align: center;\">\r\n	3人提名8人致谢，腾讯安全彰显中国安全力量</p>\r\n<p>\r\n	Pwnie Awards奖被誉为全球白帽黑客奥斯卡，对于全球范围内的信息安全工作者来说，获得Pwnie Awards奖提名是其职业生涯中极为荣耀的一刻，意味着其研究成果具有世界范围的影响力，并且还要具备前瞻性，能够为安全行业的未来发展产生深入影响。</p>\r\n<p>\r\n	腾讯安全联合实验室科恩实验室(以下简称科恩实验室)专家何淇丹、刘耕铭凭借CVE-2016-5197/CVE-2016-5198，对 Nexus 手机实现从浏览器到沙箱逃逸的研究成果获得最佳客户端漏洞奖提名，何淇丹还凭借CVE-2016-1815，对苹果 OSX 实现权限提升研究成果获得最佳提权漏洞奖提名，腾讯安全联合实验室玄武实验室(以下简称玄武实验室)专家刘科以在一年中发现近 150 个漏洞，获得超过 100 个 CVE 编号的研究成果获得史诗成就奖提名。</p>\r\n<p>\r\n	另外，在每年的BlackHat大会上，微软安全响应中心都会发布MSRC Top100白帽黑客贡献榜，以鼓励和致谢做出巨大贡献的TOP100白帽黑客们，在今年MSRC Top100白帽黑客贡献榜中，腾讯安全共有8人实力入选并获致谢。</p>\r\n<p>\r\n	分享前瞻技术，腾讯安全两大议题入选BlackHat</p>\r\n<p>\r\n	作为业内公认的最高技术盛会，丰富而又具备前瞻性的议题是BlackHat最大的亮点，因此为保证会议对全球安全行业的引导和前瞻性，BlackHat对议题的筛选非常苛刻，仅有20%的入选率。在本届大会上，腾讯安全共有“远程无物理接触攻入特斯拉”和“零权限入侵三星KNOX”两大高质量议题入选。</p>\r\n<p>\r\n	在BlackHat大会上，科恩实验室专家刘令、聂森、杜岳峰将首次分享远程无物理接触攻入特斯拉的细节，以及后续跟进措施。去年9月，科恩实验室通过系统漏洞无物理接触远程攻入特斯拉车电网络，实现了对特斯拉驻车状态和行驶状态下的远程控制。这是全球范围内第一次通过安全漏洞成功无物理接触远程攻入特斯拉车电网络，并实现对特斯拉进行任意的车身和行车控制。</p>\r\n<p>\r\n	此外，科恩实验室专家申迪将分享如何通过由他发现的一系列漏洞形成完整攻击链，绕过KASLR、DFI等安全防护机制，最终完成系统提权攻破三星KNOX的技术过程。</p>\r\n<p>\r\n	持续输出技术实力，合力守护全球网络安全</p>\r\n<p>\r\n	近年来，随着国内互联网的迅速发展，中国互联网安全企业也逐渐走出去参与国际安全事务，与同行业国际顶尖厂商同台竞技交流切磋。在国际安全事务中大放异彩的腾讯安全联合实验室便是其中的典型代表。</p>\r\n<p>\r\n	科恩实验室凭借“全球首次远程无物理接触方式入侵特斯拉汽车”研究成果，成为2016年度唯一一支入选“特斯拉安全研究员名人堂”的团队，并获特斯拉CEO亲笔致谢。2016年腾讯安全联合实验室为谷歌、微软、苹果、adobe等国际厂商共计挖掘269个漏洞，位居国内第一。另外，腾讯安全还是苹果iOS11、Safari系统独家安全合作伙伴，帮助苹果用户拦截骚扰电话、智能识别并拦截欺诈网址。不仅如此，科恩实验室负责人吴石曾获Pwnie Awards“终身成就奖”提名，是亚洲唯一被提名者。而玄武实验室负责人TK教主于�D在2016 年获得 Pwnie Awards“最具创新性研究奖”提名，成为该奖项设立 10 年来唯一获得过该提名的亚洲人。</p>\r\n<p>\r\n	腾讯安全联合实验室自去年成立以来，便持续不断地在国际顶尖会议或比赛中向外输出前沿技术和研究成果，其研究领域覆盖连接、系统、应用、信息、设备、云六大互联网关键领域。腾讯安全联合实验室在国际白帽黑客盛会中向世界展现中国安全技术实力和价值，这无疑将进一步促进国际安全行业对中国互联网安全厂商的信心和信赖</p>\n','中新网7月28日电 美国当地时间7月27日，一年一度的BlackHat美国黑帽大会在拉斯维加斯召开。作为全球信息安全行业公认的最高盛会，吸引了全球上万名企业、政府研究人员，及顶级安全厂商、研究组织的优秀白帽黑客代表参加。腾讯安全联合实验室作','1502426795','1502426795','1','5','1','1','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('39','腾讯AI加速器启动 25个AI创业项目集结亮相','','','http://www.qqseller.com/QQdong','管理员','腾讯AI','/uploads/img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg!300X300.jpg','\n<p>\r\n	中新网7月21日电 7月21日，腾讯AI加速器正式启动，经过上千个AI创业项目、为期3个月的选拔后，最终25个项目正式入选。这些项目将由此开始为期6个月的加速期，在技术、资源、导师、市场、投资资源的全面帮助下快速成长。</p>\r\n<p>\r\n	就在一周前，腾讯众创空间(海外)也在波士顿完成了对美国AI创业团队的选拨，3支优胜团队将在不久后入驻腾讯AI加速器，与国内AI创业者互相交流。这“一内一外”的双线动作表明，腾讯开放平台开始关注AI生态构建，以AI加速器为桥梁，连接腾讯AI能力与产业合作伙伴，推动各行各业“智”变。</p>\r\n<p>\r\n	围绕产品实战，AI加速器成员将于22日、23日进行为期两天的闭门研讨。作为首次辅导，将由AI科学家以及技术专家，对入选项目分组进行以产品、技术为核心的定制化诊断，也会针对企业战略、组织与人才管理等公司经营层面问题进行交流。</p>\r\n<p>\r\n	腾讯副总裁、AI Lab负责人姚星，腾讯开放平台副总经理王兰，腾讯AI LAB机器学习中心负责人刘晗等腾讯管理层及技术专家，中科大教授陈小平等AI专家以及国智恒北斗科技集团董事长王绍珉等参与了AI加速器的启动。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"261\" src=\"/uploads/img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg\" width=\"396\">\n</center>\r\n<p style=\"text-align: center;\">\r\n	图：腾讯副总裁、AI Lab负责人姚星</p>\r\n<p>\r\n	“AI能力和大数据作为新时代底层能源和技术，应该像电力和蒸汽机一样，开放给每个创业者甚至民众所用，”姚星在AI加速器启动仪式上表示，“虽然AI行业风头正健，但实际上整个产业依然处于非常早期阶段，很多方面还不成熟，包括AI在算法上的研究积累，产品在应用场景里的细化。这些都有待于大家的共同努力和突破，才能在未来\'让AI无处不在\'。”</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"247\" src=\"/uploads/img1/20170811/575e7e18758e2ec34a55a5bd525a18ee.jpeg\" width=\"371\">\n</center>\r\n<p style=\"text-align: center;\">\r\n	图：腾讯开放平台副总经理王兰</p>\r\n<p>\r\n	王兰表示，作为承载腾讯最新AI能力的AI加速器，将帮助构建人工智能创业生态，扶持创业者，助力人工智能的技术产业化。“腾讯开放平台一直致力于创业生态的建设，而AI代表下一个时代的核心生产力。如何通过一个良好的开放生态，帮助AI领域的新锐军形成核心竞争力，是我们所关注的。这半年多的时间我们一直寻找AI创业中最优秀的公司，通过AI加速器所聚合的腾讯生态扶持力量让他们变得更加优秀。”</p>\r\n<p>\r\n	此次入选AI加速器的25个项目中，包含了助理来也、三角兽、竹间智能、追一科技，这些在当下自然语言处理领域最为热门的创业公司;而汇医慧影、�V学教育、小库科技、小法博机器人等项目则聚焦于医疗、教育、建筑、法务等多个垂直细分的AI应用领域，展现出了AI基础与传统领域结合产生的巨大效率提升;此外，欢创科技、速腾聚创、COWAROBOT、时空壶等项目则将AI与硬件相结合，在自动驾驶、空间定位甚至翻译领域成就突出。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"278\" src=\"/uploads/img1/20170811/f6f34fceae4be2f02eaf1607d3db821f.jpeg\" width=\"500\">\n</center>\r\n<p style=\"text-align: center;\">\r\n	图：腾讯AI加速器入选学员与导师团合影</p>\r\n<p>\r\n	这些项目中不少已经崭露头角，例如，聚焦于为行业提供智能人机交互解决方案的三角兽，他们不仅为多家电视、手机厂商提供过AI层面的解决方案，也与BAT等大型公司产生着不同层面的合作。国内领先的私人助理式服务平台“助理来也”，则致力于通过对话和推荐等最自然的交互方式来连接人和本地商户，向用户提供日程、咖啡、打车和跑腿等 20 多个品类的助理式服务。而汇医慧影则将计算机视觉、机器学习与医疗相结合，通过建立人体器官模型以及深度神经网络技术，实现了病灶的高识别度，并且率先将胸部、脑部核磁的自动诊断应用在实际操作流程中。</p>\r\n<p>\r\n	尽管从技术到应用，AI创业已到风口。但作为初创公司，普遍存在技术能力储备不足，技术深度以及覆盖面不够，缺乏市场认知，资金短缺等问题。面对行业痛点，AI加速器通过开放腾讯的AI能力，提供AI技术、导师、产业资源、市场、投资五大扶持，帮助AI技术及产品寻找到更多的应用场景。</p>\r\n<p>\r\n	在AI技术层面，AI加速器将连接来自腾讯AILab、优图、腾讯云等的AI能力，为学员提供超过20项的顶尖AI技术。同时，提供超过1000万的腾讯云资源，帮助项目降低计算成本提高数据处理效率，助力项目成长。</p>\r\n<p>\r\n	在导师层面，配备覆盖产业、学术、工业、设计、投资界的顶级大咖。通过6个月的导师线下辅导、1v1服务，为学员项目提供深度的产品和技术解析，协助打磨AI产品。</p>\r\n<p>\r\n	产业资源上，加速器为项目提供AI上下游产业链资源对接，包括芯片、工业设计、生产制造等供应链资源，以及项目垂类行业例如医疗、交通、电商等行业资源。</p>\r\n<p>\r\n	此外，成员项目可以通过腾讯开放平台、互联网+、腾讯云等渠道，获取市场资源与更多合作伙伴进行对接。同时，他们将会获得与腾讯投资、双百计划的对接机会，并通过加速器获得多家投资机构的重点关注。</p>\r\n<p>\r\n	“在和美国AI从业者的交流中，他们有一个意料之外也在情理之中的结论：就是AI的未来在中国，”王兰表明中国的AI产业具有领先世界的潜力和未来，而AI加速器愿意与创业者共建这个未来，“腾讯开放平台伴随着互联网的发展经历过PC互联网时代、移动互联网时代，而AI加速器是我们在AI时代开放的探索和先锋军。它的推出将探索我们在AI时代的创业开放生态体系。” (完)</p>\r\n<p style=\"text-align: center;\">\r\n	下附：腾讯AI加速器入选项目名单</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"719\" src=\"/uploads/img1/20170811/b1595e94d679d9878aa3d05d020255b9.jpeg\" width=\"500\">\n</center>\r\n<p style=\"text-align: center;\">\r\n	图：腾讯AI加速器入选项目名单</p>\n','中新网7月21日电 7月21日，腾讯AI加速器正式启动，经过上千个AI创业项目、为期3个月的选拔后，最终25个项目正式入选。这些项目将由此开始为期6个月的加速期，在技术、资源、导师、市场、投资资源的全面帮助下快速成长。\r\n\r\n	就在一周前，','1502426800','1502426800','0','5','1','1','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('40','腾讯QQ挖掘“二次元”背后生意 仍面临变现困局','','','http://www.qqseller.com/QQdong','管理员','二次元,QQ年轻化','','\n<p>\r\n	“二次元”，一般认为是“动漫世界”、“虚幻世界”的代称，但这个“虚幻世界”的生意却做得风生水起。7月17日~18日，第三届“QQ JOY X次元”活动在成都开幕。“白天门票48元，晚上有《王者荣耀》主题晚会，门票会贵些。”简易棚搭成的卖票处被围得水泄不通。</p>\r\n<p>\r\n	《每日经济新闻》记者注意到，在活动现场，《王者荣耀》里的“安琪拉”、《英雄联盟》里的“索拉卡”在身边穿梭。若有着普通服装者，会感觉自己才是“非主流”。正如腾讯社交网络事业群增值产品部总经理刘宪凯所说，“一次元、二次元的消费其实挺主流”。</p>\r\n<h2>\r\n	“二次元”瞄准年轻人</h2>\r\n<p>\r\n	腾讯2016年财报披露，旗下两大社交平台，18岁的QQ和6岁的微信月活账户分别是8.49亿和8.89亿，不相上下。</p>\r\n<p>\r\n	互联网产品中，存活18年可以算骨灰级老人了，那么QQ老了吗?现场一位年轻人告诉记者，“朋友同学都在QQ上，至于微信，我们更多是用来付钱的。”据估算，2016年国内核心“二次元”用户规模达7000万人，泛二次元用户规模达2亿人。这意味着每20个中国人中就有1个是“二次元”重度粉丝，有3个是轻度粉丝。从年龄构成上看，最早接触“二次元”的80后正逐渐“老去”，90后尤其是95后，以及00后才是“二次元”用户的主力人群，占到90%以上。</p>\r\n<h2>\r\n	增值服务收入仍靠会员包月</h2>\r\n<p>\r\n	QQ JOY偏重衍生品的落地，还打起了电商的主意。即便聚集了用户、完成了闭环，QQ的二次元依旧没有走出变现困局。</p>\r\n<p>\r\n	腾讯控股(00700，HK)披露，公司2016年增值服务板块实现营收1078亿元，占总营收的71%。其中，以数字内容服务和虚拟道具为主的社交网络收入为370亿元，会员包月付费依旧是这笔收入的主干道。刘宪凯坦言，QQ生态的直接变现，从利润实现来讲，现在还是投入阶段。</p>\n','“二次元”，一般认为是“动漫世界”、“虚幻世界”的代称，但这个“虚幻世界”的生意却做得风生水起。7月17日~18日，第三届“QQ JOY X次元”活动在成都开幕。“白天门票48元，晚上有《王者荣耀》主题晚会，门票会贵些。”简易棚搭成的卖票处','1502426800','1502426800','1','5','1','0','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('41','第三届QQJOY X次元在蓉举办','','','http://www.qqseller.com/QQdong','管理员','QQJOY,qq二次元','','<p>\r\n	近日，第三届 QQJOY X次元盛典在成都开幕，展会延续了以往两届的成绩，首日有众多二次元年轻人到场。本届QQJOY以“社交+内容”模式展现QQ二次元全生态，集合cosplay表演、QQ二次元科技产品体验等环节，并举办首台王者荣耀主题晚会“王者盛宴”以及国漫经典主题晚会“致敬经典”。同时，首届“QQJOY音画大赏”也将在盛典上开启颁奖环节。此次，QQ在现场展示包括QQ动漫、QQ空间、企鹅电竞、QQ个性化、厘米秀、天天P图等一整套二次元生态体系，展现了QQ作为年轻人社交平台在二次元领域的完整布局。</p>','近日，第三届 QQJOY X次元盛典在成都开幕，展会延续了以往两届的成绩，首日有众多二次元年轻人到场。本届QQJOY以“社交+内容”模式展现QQ二次元全生态，集合cosplay表演、QQ二次元科技产品体验等环节，并举办首台王者荣耀主题晚会“','1502426949','1502426949','0','5','1','0','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('42','腾讯副总裁丁珂：网络安全人性化服务需建立“三条准则”','','','http://www.qqseller.com/QQdong','管理员','腾讯副总裁,网络安全,人性化服务','/uploads/img1/20170811/1500e44e18d10686bf06637ff70a2070.jpeg!300X300.jpg','\n<p>\r\n	中新网7月26日电 7月26日，以“新安全，共担当”为主题的2017年网络安全生态峰会在北京召开。作为中国互联网安全新生态的倡导者，腾讯公司应邀出席本次大会。在7月26日主会场，腾讯副总裁丁珂发表了题为《互联网安全人性化服务》的主题演讲，并针对当前愈加严峻的互联网黑产对抗形势，首次提出了网络安全人性化服务的“三条准则”。</p>\r\n<p>\r\n	丁珂认为，当前网络黑产所带来的安全挑战愈加严峻，对抗网络黑产不能单纯依赖技术手段“一刀切”，而应该从“技术升级、人性服务、可信保障”三个维度建立行业服务准则，以此有效提升黑产对抗效率。在黑产对抗方面，腾讯安全基于过去十余年的经验和技术积累，已经在行业内形成了一套完备的人性化服务体系。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"328\" src=\"/uploads/img1/20170811/1500e44e18d10686bf06637ff70a2070.jpeg\" width=\"500\">\n</center>\r\n<p style=\"text-align: center;\">\r\n	(图为腾讯副总裁丁珂)</p>\r\n<p>\r\n	黑产对抗形势严峻，技术打击不能“一刀切”</p>\r\n<p>\r\n	在会上，腾讯副总裁丁珂首先介绍了黑产的严峻形势，举例说明了黑产的传播模式。丁珂表示，目前互联网安全形势愈加严峻，黑产团伙集团化协作运作，恶意网址制作成本低收益高，利用人性弱点，如贪婪、恐惧、虚荣等肆意传播规模巨大，给打击带来挑战。据相关数据统计，2016年全国信息诈骗金额超过200亿，仅以北京地区为例，诈骗案件数量达32,506件，涉案金额13.6亿。</p>\r\n<p>\r\n	“尽管近年来行业在对抗黑产、打击犯罪方面已经取得积极进展，但形势仍不容乐观;尤其在对抗黑产、拦截恶意网址方面，单纯依赖技术存在一定弊端。”丁珂认为，中国拥有规模庞大的站点及社会机构服务网站，而其中绝大多数往往缺乏安全防范意识和技术能力，成为黑产传播过程中被恶意利用的对象。</p>\r\n<p>\r\n	面对严峻的网络安全形势，以数据对抗数据，利用大数据技术打击网络黑产已成为行业共识，然而，缺乏人性化的服务也让技术打击面临“一刀切”困境。以微软Azure云下的 chinacloudsites.cn在微信里被腾讯安全拦截为例：恶意网址利用正常网站的XSS漏洞肆意传播，面对被挂马的网站，如果拦截造成该网站的短期损失，但不拦截则造成网民数倍于网站的更大损失。针对以上挑战，安全服务在保护网民利益不受侵害、对危险网址进行及时拦截同时，也需要与站长建立快速反馈渠道，协助站长解除安全隐患。</p>\r\n<p>\r\n	首倡“人性化服务三条准则”，腾讯模式引关注</p>\r\n<p>\r\n	丁珂认为，当前网络黑产所带来的安全挑战愈加严峻，对抗网络黑产不能单纯依赖技术手段“一刀切”，而应该从“技术升级、人性服务、可信保障”三个维度建立行业服务准则，以此有效提升黑产对抗效率。在黑产对抗方面，腾讯安全基于过去十余年的经验和技术积累，已经在行业内形成了一套完备的人性化服务体系。</p>\r\n<p>\r\n	第一，技术升级是人性化服务的基础保障。在这方面，腾讯安全已经成为推动对抗黑产技术升级的重要力量。作为全球最大的安全云库，腾讯安全云库历时19年打击黑产经验积累，已积累了数亿反诈骗大数据，其中包括诈骗电话、银行帐号、木马病毒、钓鱼网址等典型诈骗数据样本。通过大数据算法进行机器学习和批量处理可智能识别恶意网址，每天识别恶意网址百万级，有效打击黑产，避免技术误判。腾讯安全通过向上百家合作网址输出安全能力和腾讯系所有产品内网址安全提示，可覆盖超过99%的互联网用户，全网每天阻断用户访问欺诈网址超过3亿次，为用户建立全天候全方位的安全屏障。</p>\r\n<p>\r\n	第二，建立面向站长人性化服务标准体系。一方面，腾讯安全与站长合作建立了Notice协议，通过制定标准化通知协议，建立站长和安全厂商的联系通道，确保第一时间帮助站长定位并解决问题。与此同时，腾讯安全还推出了站长服务平台，协助站长更好地推送网站漏洞、被利用的链接，更好地降低安全问题对用户和站点带来的影响，并将适时在全国主流城市面向站长开展“吐槽大会”，倾听站长的声音，共建服务标准。</p>\r\n<p>\r\n	第三，面向监管机构、行业开放合作建立可信保障体系。在与政府权威部门合作打击黑产的实践中，腾讯成立的守护者计划以大数据构建反诈骗闭环，通过串联起公安、银行、互联网企业、运营商、网民五大闭环，形成事前预防、事中提醒、事后挽救的反诈骗全产业链生态共治体系，有效保护了网民财产安全。腾讯守护者计划大数据反诈骗产品，神荼网址反诈骗系统在与国家食品药品监督管理总局合作的过程中，帮助执法部门打掉价值8000多万的虚假药品、保健品、假货。</p>\r\n<p>\r\n	开放平台，腾讯安全共建互联网安全新生态</p>\r\n<p>\r\n	丁珂表示，安全不仅是腾讯公司的核心战略，更是腾讯公司践行社会责任的重要体现，腾讯将坚持开放、合作、共享的理念，推动中国互联网安全新生态的建立。</p>\r\n<p>\r\n	在联合行业合作伙伴共同打击网络黑产的同时，腾讯安全不断向国内外持续输出安全实力， 2016年腾讯安全联合实验室发现谷歌、微软、苹果、adobe等国际厂商共计269个漏洞，位居国内第一。腾讯安全联合实验室旗下科恩实验室以“全球首次远程无物理接触方式破解特斯拉汽车”的研究成果，成为2016年唯一一支获得“特斯拉安全研究名人堂”的团队。另外，腾讯安全还是苹果iOS11、Safari系统独家安全合作伙伴。</p>\r\n<p>\r\n	另外，在向行业输出安全实力的同时，腾讯安全还利用自身优势打造网络安全人才培养闭环，为国内安全行业持续“造血”。腾讯安全发起并举办了腾讯信息安全争霸赛(TCTF)，立由腾讯安全联合实验室7大掌门人和国内数十位资深网络安全老师组成的明星导师团，为通过比赛选拔的学生进行指导，并将优秀选手输送到国际赛场，以赛代练，促进实战人才的培养，建立了信息安全专业人才培养的闭环。</p>\r\n<p>\r\n	据悉，由腾讯公司主办的第三届中国互联网安全领袖峰会(Cyber Security Summit 2017，简称“CSS2017”)将在8月15日于北京召开。大会以“安全新秩序，连接新机遇”为主题，下设大数据与云安全、安全法治治理、智能硬件与物联网安全、人工智能与安全伦理、网络空间威胁态势感知、网络安全标准化、腾讯安全探索、金融安全八大分会场，并结合时下热点，从技术、情报、法治等多个维度立体化探讨网络安全新秩序下各产业面临的挑战与机遇。</p>\n','中新网7月26日电 7月26日，以“新安全，共担当”为主题的2017年网络安全生态峰会在北京召开。作为中国互联网安全新生态的倡导者，腾讯公司应邀出席本次大会。在7月26日主会场，腾讯副总裁丁珂发表了题为《互联网安全人性化服务》的主题演讲，并','1502426972','1502426972','1','5','1','1','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('43','腾讯手机充值汇聚爱心 守护留守儿童健康成长','','','http://www.qqseller.com/QQdong','管理员','留守儿童,腾讯手机充值','','\n<p>\r\n	为帮助留守儿童加强与父母沟通，提升社会对留守儿童的关注度，腾讯手机充值联合腾讯公益及壹基金共同打造“回声计划”关爱留守儿童活动。活动期间，用户使用手机充值服务并参与活动时，可额外获得虚拟的“回声能量”，累积后可进行捐赠。腾讯会根据“回声能量”值赠送一定的通话时长给到留守儿童，增加留守儿童与父母沟通交流的机会。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"334\" src=\"/uploads/allimg/170725/10123322Y-0.png?imageView&amp;thumbnail=550x0\" width=\"554\">\n</center>\r\n<p>\r\n	据了解，我国约有6000万留守儿童，他们的父母常年在外务工，有的半年、一年甚至是多年都难以给孩子打一通电话、写一封信、见一次面……按照留守儿童总数6000万测算，全国约有1794万农村留守儿童一年只能见父母1至2次，有921万孩子一年都见不到父母一次。亲情的疏离和淡漠让留守儿童心理逐渐变得冷漠。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"363\" src=\"/uploads/allimg/170725/1012336238-1.png?imageView&amp;thumbnail=550x0\" width=\"545\">\n</center>\r\n<p>\r\n	“回声计划”是一项旨在帮助留守儿童与父母沟通的公益活动。活动期间，参与活动的用户通过微信手机充值充话费、充流量、宽带缴费时，可积攒“回声能量”，然后再进入“微信钱包-手机充值-更多服务-做公益\"页面进行捐赠。当所有参与用户捐赠的“回声能量”达到指定目标后，手机充值会为留守儿童配捐“回声电话”的通话时间，为留守儿童与远方父母架起沟通的桥梁，让更多留守儿童的心声得到回声。</p>\r\n<p>\r\n	在活动上线同时，腾讯手机充值还推出了微电影——《请给我们,一首歌的时间》，影片中留守儿童用稚嫩的声音唱着妈妈教给他们的《鲁冰花》，诉说着对远方父母的思念。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"353\" src=\"/uploads/allimg/170725/1012331607-2.png?imageView&amp;thumbnail=550x0\" width=\"552\">\n</center>\r\n<p>\r\n	此外，壹基金创始人李连杰、壹基金壹乐园推广大使陶虹、壹基金明星义工范湉湉、黄执中等公益人士也加入“回声计划”，为留守儿童争取更多的关注和帮助。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"740\" src=\"/uploads/allimg/170725/1012332645-3.png?imageView&amp;thumbnail=550x0\" width=\"554\">\n</center>\r\n<p>\r\n	如今，互联网逐渐连接了一切，人们通过微信、QQ等通讯软件连接彼此，拉近了人与人空间上的距离。但腾讯认为，科技能够拉近的不只是空间上的距离，连接的不仅是个体，更能够连接人心。截止目前，通过腾讯公益平台募集到的历史善款总额超过19.7亿，累计帮助超过1.15亿人次。空巢老人、贫困大学生、患病儿童等等被社会遗忘的人群，在腾讯公益获得了援助。</p>\r\n<p>\r\n	据了解，腾讯“为爱充值”公益项目将持续关注弱势群体，承担更多的社会责任，用科技的力量为他们的生活带来些许改变。</p>\n','为帮助留守儿童加强与父母沟通，提升社会对留守儿童的关注度，腾讯手机充值联合腾讯公益及壹基金共同打造“回声计划”关爱留守儿童活动。活动期间，用户使用手机充值服务并参与活动时，可额外获得虚拟的“回声能量”，累积后可进行捐赠。腾讯会根据“回声能量','1502427007','1502427007','0','5','1','0','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('44','腾讯最强悍的就是“自己的历史自己书写”','','','http://www.qqseller.com/QQdong','管理员','腾讯,qq','','\n<p>\r\n	 </p>\r\n<p>\r\n	该文章转自 FT中文网</p>\r\n<center>\r\n	<img alt=\"腾讯广告主席刘胜义：腾讯最强悍的就是“自己的历史自己书写”\" border=\"1\" height=\"600\" src=\"https://img.huxiucdn.com/article/cover/201707/23/193034648953.jpg?imageView2/1/w/800/h/600/%7CimageMogr2/strip/interlace/1/quality/85/format/jpg\" width=\"800\">\n</center>\r\n<p>\r\n	作者 | FT中文网总编辑 王丰</p>\r\n<p>\r\n	2017年6月中旬，有关中国互联网巨头腾讯对旗下媒体业务进行重大改革的新闻，充斥了很多业界人士的朋友圈。这个部门在腾讯内部简称OMG(Online Media Group，“网络媒体事业群”)，是个5000人之众的团队。论规模和行业影响力，在中国媒体生态圈内可谓举足轻重。</p>\r\n<p>\r\n	就在此前三个月，已经执掌这个部门11年的腾讯高级执行副总裁、马来西亚人刘胜义刚刚离任，改任“腾讯广告主席、集团市场与全球品牌主席”。腾讯首席运营官任宇昕则接管OMG，到6月份即宣布了上述改革措施，内容包括打破新闻门户腾讯网(qq.com)原有的频道制架构，代之以“大原创内容”和“大内容运营”两个部门。此外，多数行业分析还指出，任宇昕提升了OMG旗下新闻客户端“天天快报”的战略地位，希望尽快打破天天快报与竞争对手“今日头条”在争夺移动流量入口方面陷入的胶着状态。</p>\r\n<p>\r\n	对于市值屡创新高，已经跻身全球第五、六大互联网公司的腾讯，这一系列近年来罕见的架构调整，体现了什么样的战略考量和得失的反思?“腾讯广告主席”究竟是干什么的?广告将在腾讯未来的发展中扮演什么样的角色? 6月中旬，我在香港与刘胜义共进午餐，就上述话题长谈了两个多小时。</p>\r\n<p>\r\n	我们在港岛香格里拉酒店56层的珀翠法国餐厅(Restaurant Petrus)见面。今年52岁的刘胜义身着一袭黑色中山装，态度亲切，笑容可掬。他是一位资深广告人，在2006年加入腾讯之前，曾在阳狮(Publicis)、麦肯(McCann-Erickson)等多家跨国广告集团担任中国区高管职务，现在仍旧是全球各大广告节和商学院营销课程讲堂的常客。</p>\r\n<p>\r\n	于是，我们的对话就从他非同寻常的职业轨迹开始：一位拥有20多年从业经验的4A广告人，加入一家年轻的互联网公司，在11年间组建并管理了一个庞大的媒体集团，现在又被任命为这家互联网巨头的“广告主席”，这是一种怎样的体验?</p>\r\n<p>\r\n	刘胜义提到最多的一个词，就是“颠覆”。“我当年从马来西亚来到中国发展，是颠覆1.0;再从广告行业到互联网公司，是颠覆2.0。在互联网公司又开始做内容，现在又被调回总部做广告… 这一切不都是颠覆吗?”</p>\r\n<p>\r\n	问答间，午餐的前菜已经端上来，是由黄、绿、橙各色小西红柿制作的沙拉，配以鱼子酱和罗勒叶，异常清爽。</p>\r\n<p>\r\n	讲到他的老本行，刘胜义不无怀旧地提起了4A广告行业的黄金时代——“Mad Men的时代… 一个ideas可以改变世界的时代”;但他话锋一转，很快就深入了广告行业和传统媒体行业面临的种种危机和挑战。“以Big Idea(大想法)为核心的传统营销时代，即将被Big Data(大数据)为基因的现代营销时代取代，”也是他在采访中多次重复的主题。</p>\r\n<p>\r\n	从即将被颠覆的行业及早转型，加入颠覆者的阵营，这就是他改变自己命运的方式。提起自己在执掌OMG十一年的探索和得失，刘胜义仍旧兴奋得两眼放光。</p>\r\n<p>\r\n	他并不讳言腾讯微博当年面对新浪微博的败绩，以及近几年“天天快报”与“今日头条”的鏖战，但着重讲到了最令他自豪的几项成就，比如对腾讯视频的改革。</p>\r\n<p>\r\n	2014年初，腾讯高层曾考虑剥离亏损的视频业务，将其出售给优酷土豆。而刘胜义看好Netflix的商业模式，认为腾讯视频也有同样前景，坚持认为“不能卖”。在香港的一次决定腾讯视频命运的高管会上，他成功地说服马化腾、刘炽平等决策者放弃出售。此后，他又主导对腾讯视频进行“深度改革”，在人员调配和购买版权内容资金方面全力以赴。腾讯视频团队还抓住获得《中国好声音》第三季网络直播权的时机，说服张小龙，与微信共同推出了“好声音摇一摇”竞猜玩法，大幅增加了移动端用户粘性。2017年第一季度腾讯财报显示，腾讯视频成为媒体广告收入增长的主要来源之一，腾讯视频的各项指标也跃居行业前两名。</p>\r\n<p>\r\n	但是无法回避的是，随着OMG换帅，他亲手建立的腾讯媒体帝国也面临调整变革。刘胜义对此的回答非常冷静、坦诚。他甚至主动提起了外界对自己职务变动的评价：</p>\r\n<p>\r\n	“外面有不少人说，我被降权了。听到这种说法， 我不以为然。原因是什么?是我内心就认为这是正确的决策。”</p>\r\n<p>\r\n	他说，从腾讯集团的角度看，内容生产者未来必须进一步挖掘与上下游产业合作的机会，并且以技术作为引领提升用户体验的关键。“Mark(任宇昕)作为公司的COO，又是技术出身，他在整合公司内不同业务群的的实战经验比我丰富得多。”</p>\r\n<p>\r\n	除了认同公司战略、服从调配的“大局观”，刘胜义说，自己对此次角色变化处之泰然的另外一个原因是，他看到了腾讯广告战略的大前景，有一种二度创业的兴奋感。</p>\r\n<p>\r\n	“我做为OMG的负责人11年了，现在公司发展到了一个新的阶段，我也获得了第二次绽放才华的机会。现在谈起广告来，我自己都觉得不像是52岁，而是像个25岁的年轻人。”</p>\r\n<p>\r\n	这时，我们的两道主菜——煎鳕鱼和烤牛柳——陆续上桌。鳕鱼肉质很嫩，配以绿色的鹰嘴豆泥和切得极碎的西班牙辣肉肠，非常诱人。但是我已经无暇用心品尝，而是努力想撬开他的口，希望他能在腾讯广告战略方面透露些“大新闻”：广告是否会成为继游戏和社交之后，腾讯的下一个增长点?</p>\r\n<p>\r\n	这也是近来业界普遍关注的问题。就在我们见面前两周，美国知名科技媒体The Information在一篇报道中称，微信2017年初与星巴克合作推出社交送礼功能“用星说”，曾在微信产品经理内部引发争论：是否值得为单一品牌专门开发这样一个功能?这篇报道指出，这个案例体现了腾讯内部正在发生的一种文化转变：一向专注消费者产品和体验的腾讯，现在正试图从企业服务领域赚取更多利润，比如广告销售和云服务。</p>\r\n<p>\r\n	刘胜义倒仍旧是不徐不疾，一边思索一边侃侃而谈。一方面，他强调广告是腾讯一贯的重要战略，并非最近才开始发力;而中国与美国互联网广告生态的差异也让他确信，腾讯的广告业务尚大有可为，并且可以走出与Google和Facebook两大巨头迥异的发展路径。</p>\r\n<p>\r\n	以下为FT中文网与腾讯广告主席刘胜义对话节选：</p>\r\n<p>\r\n	FT中文网：你在2006年加入腾讯之前，是中国4A广告行业顶尖高管之一。为什么选择腾讯?当时它是一家什么样的公司?</p>\r\n<p>\r\n	刘胜义：那个时候我隐隐觉得4A广告公司的商业模式需要演进变革。如果我们研究4A行业在过去100年的历史，在“Mad Men”的那个年代(编者注：即美国广告行业的黄金时代——1950-1960年代)， ideas是可以改变世界的。Ideas能够主导很多想象空间。</p>\r\n<p>\r\n	但是在20年前、15年前的中国，consumerism (消费主义)尚处在发展初期，4A公司的业务模式难以形成一个很大的规模;另一方面，这些4A公司对他们在中国市场的业务仍旧是以集团化、全球化企业的思维模式在管理，两者形成了矛盾。于是我想，能否去颠覆一下自己，挑战自己的局限?</p>\r\n<p>\r\n	我期待成为互联网颠覆时代有实战经历的布道者。那个时候没有人讲人工智能，没有人讲社交媒体，我只知道科技和互联网一定是未来。有机会跟腾讯接触后，我产生了很大的兴趣。当时腾讯的收入比较单一，还没有游戏收入，完全靠互联网增值服务，连Pony(编者注：即腾讯公司董事会主席兼首席执行官马化腾)也认为，能够对照的全球成功模式就只有Yahoo。当时连Google也刚刚成立不久。</p>\r\n<p>\r\n	当时刘炽平(腾讯集团公司总裁)也刚刚加入腾讯，他最大的使命就是帮助Pony布局未来。他们拉我进来，就是为了帮助腾讯在广告行业打开全球的局面。我进来的时候，腾讯每年的广告收入才一个多亿。2006年做到了2.67个亿。2016年的财报里腾讯的广告收入将近270亿——在这10年中广告收入翻了100倍。这一切真要归功于团队。</p>\r\n<p>\r\n	FT中文网：作为“腾讯广告主席、集团市场与全球品牌主席”，你的战略目标和具体任务是什么?</p>\r\n<p>\r\n	刘胜义：其实广告并不是腾讯的一个新战略，而是一直以来的重要战略，从我最初加入腾讯就是如此。我们在十年间的成绩和进步也有目共睹。</p>\r\n<p>\r\n	现在我更想做的事，不光是要提升对短期成长的预期、挖掘资源、增强变现能力，也不光是要站在腾讯集团的高度，更好地整合腾讯内部各路英雄们旗下的广告资源，更好地合作。</p>\r\n<p>\r\n	我觉得，今天的广告行业面临很大的变革和被颠覆的局面。中国互联网广告所处的机遇也是前所未有的。我们过去很多时候都是对照美国，现在美国也开始对照中国。如果仔细分析这两个广告生态系统，你会发觉它们是不一样的。比如，美国广告市场中，现在40%的份额是互联网广告;而中国今年互联网广告占比应该能够达到64%。当然，美国的互联网广告市场绝对值仍是中国的1.6倍。</p>\r\n<p>\r\n	另外，在美国广告生态当中，社交类广告在整体互联网广告中占比是20%，而Facebook又占了社交类广告中的80%左右。在中国，目前社交类广告占互联网广告比例只有8%-9%左右;腾讯又占据中国社交媒体广告中的将近80%。</p>\r\n<p>\r\n	所以说，中国在线广告的机会是很大的。面对这个机会，我们是按照美国那个思路去跑起来，还是沉下来好好想一想，如何按照中国市场的需求，一步步部署腾讯自己的广告蓝图、写出自己的鸿篇巨制?我觉得腾讯最强悍的事就是“自己的历史自己书写”，这才是我们想做的。</p>\r\n<p>\r\n	我们会走出什么样的不同道路呢?在腾讯，广告已经被赋予了两层意义：一层是对股东价值创造的意义，在未来更长的时间内成为一个对公司财务贡献的稳定来源;另一层则是进一步巩固、加强腾讯作为一个“连接器”的意义，把商业的连接透过广告的形式变成更深的结合。腾讯希望能够把平台的能力通过广告的形式赋能于广告主。</p>\r\n<p>\r\n	例如我们最近发力LBS(“基于地理位置的服务”)广告，主要面对线下的商户，围绕基于地理位置信息的用户进行推送，把用户的区域缩到某个区甚至是商业区块。通过LBS广告，类似星巴克这样的咖啡店就可以给周围的用户发送邀请或者优惠券。这将会更大地程度发挥社交广告连接用户和线下商户的功能。</p>\r\n<p>\r\n	腾讯希望服务越来越多的广告主。在保持收入稳健增长的同时，继续追求广告主的高增长。而行业的覆盖度以及每一个垂直行业广告主的渗透率和留存率，是我比较在意的指标。总之，我们希望能够品牌和效果并重。</p>\r\n<p>\r\n	FT中文网：你对腾讯广告业务的发展有何具体策略?比如近几年业内和消费者关注度都很高的微信朋友圈广告，未来会有什么变化?</p>\r\n<p>\r\n	刘胜义：腾讯广告业务未来的发展路径非常清晰，即全面拥抱社交网络、视频和移动广告。</p>\r\n<p>\r\n	我认为，未来整合方向在于：</p>\r\n<p>\r\n	一、对于大客户提供品效合一(编者注：即“品牌广告与效果广告合一”)的广告综合解决方案，以提高渗透率。</p>\r\n<p>\r\n	二、对于长尾客户，通过优化定向算法及升级关于营销管理及效果衡量的广告自助服务工具，继续提高小型及区域性广告主的数量。</p>\r\n<p>\r\n	从广告资源的角度来说，腾讯社交广告资源对广告主格外具有吸引力。要凭借平台卓越的定向能力，突出的消费者触达能力以及优质的品牌形象，围绕广告形式进行创新，向用户提供更多原生及沉浸式体验，以增强广告效果。目前微信公众账号互选广告允许广告主与微信公众账号进行互相选择，可以更好的将相关广告和恰当的内容进行匹配。微信平台已成为社交及其他广告业务同比增长的主要贡献因素。升级微信朋友圈的LBS本地推广广告功能，使广告主可更精准定位“附近的客户”这项功能，尤其受到了婚庆服务及家居装饰等广告主的欢迎。</p>\r\n<p>\r\n	目前，微信朋友圈的互动非常活跃，内容也是非常优质的。我们对微信的广告收入增长持乐观的态度。我们会自然而然地释放库存，一点点地增加广告数量，但前提是不伤害用户体验。在不影响用户体验的情况下逐步增加广告量。这就需要我们具有更强的定位能力，以锁定合适的广告商。这是腾讯在微信朋友圈广告上的策略。</p>\r\n<p>\r\n	广告业正经历潜移默化的改变。就趋势而言，一方面按效果付费广告营收的快速增长，而另一方面品牌广告的增长速度其实却在下降。关于信息流广告，按时长计费(CPT)广告向按效果付费广告的转换，我们认为此类转换已经足够多了，这种转换反映了一些广告市场的趋势，即传统品牌广告商越来越有兴趣采用按效果付费广告。另外，新闻聚合类广告服务的需求量的确很大，商业化前景很高，已是我们最大的品牌广告类别，这部分是因为手机屏幕浏览和PC屏幕浏览不同，手机浏览需要一滑一点地浏览，因此适合根据点击计算的按效果付费广告。这种转换是广告主需求导致的。</p>\r\n<p>\r\n	社交平台上的短视频广告已成为全球趋势，这也是非常有价值的尝试，因为短视频广告不会影响用户的体验，同时也能为客户带来比较高的转化率。我们将会扩大短视频广告形式的投放，但不会操之过急，而是一步一个脚印稳步推进。</p>\r\n<p>\r\n	FT中文网：你提到广告行业面临被颠覆的局面。腾讯要做这个颠覆者吗?</p>\r\n<p>\r\n	刘胜义：五六年前，我在哈佛商学院深造的时候，有一位很有名的教授David Yoffie请我去给他的学生讲课。他在课堂上问了我一个问题：“为什么你们腾讯不去拥抱开放平台?” 当时我的回答是：“为什么要开放呢?腾讯的很多成就都是我们自己辛苦努力做出来的。” 今天我才意识到，当时的回答有多傻。</p>\r\n<p>\r\n	在“3Q大战”之后，我们意识到，开放了才天外有天。所以说，我觉得一家公司去主宰整个广告行业不见得是好事。我们得去建设开放的生态，鼓励更多的人参与进来。</p>\r\n<p>\r\n	FT中文网：Google和Facebook是当前全球数字广告业两大霸主。未来的腾讯广告会跟这两者模式有何异同?</p>\r\n<p>\r\n	刘胜义：Google 和Facebook分别制定了搜索和社交广告的游戏规则，都拥有庞大的用户数据，丰富而且可以做到精准营销，并根据广告效果付费。根本性的不同在于他们所掌握的用户信息。</p>\r\n<p>\r\n	我无意比较腾讯与上述两家公司模式的异同。我想说的是，所有互联网公司在广告业务上保持一致性认同的是，当下是算法驱动的时代。基于算法的智能推送和信息流广告，也已成为当下互联网效果广告主流。数据也证实了这一点：中国移动端信息推送服务广告收入在2016年接近40亿美元，增幅超过110%。在2017年收入将预计达到66亿美元。</p>\r\n<p>\r\n	优质内容将在移动互联网和社交网络时代的广告中扮演更加重要的角色。用户参与产生的内容和围绕广告主需求打造的原生广告，将取代品牌的自说自话，吸引更多受众的有效关注。腾讯会结合本身多个平台的数据洞察以及广告主的需求，量身打造更符合用户习惯的原生内容，将广告变为内容的一部分。</p>\r\n<p>\r\n	近年来，我们通过极致的互联网服务解决用户“痛点”，另一方面提供平台，让再小的个体都能拥有自己的品牌，并帮助他们高效地与用户建立连接，从而实现品牌的快速成长。这些个体品牌覆盖了自媒体、数字内容创作者和移动互联网解决方案创业者等多种类型。我相信，在腾讯平台上成长起来的个体品牌价值总量已经超越了腾讯的品牌价值。</p>\r\n<p>\r\n	FT中文网：你现在要整合腾讯内部的各种广告资源以及相关的业务和团队，面临最大的挑战是什么?</p>\r\n<p>\r\n	刘胜义：我觉得最大的挑战首先是“放空心态”。以前，作为腾讯网络媒体事业群总裁，我整天冲在前线，任务就是带领团队过关斩将，实现总部设定的目标。现在回到总部，则需要从宏观层面思考问题：什么东西对企业长期发展是最好的?什么对用户是最好的?立足于长远，就要耐得住寂寞。另外一方面，我们现在要研究广告这个垂直领域涉及的各个层面的具体问题，事无巨细都要参与。</p>\r\n<p>\r\n	第二大挑战在我看来是“Silo”( 编者注：Silo原意为“存放农作物的圆筒形谷仓”，作为企业管理概念，指的是大企业内部互相平行业务线、部门之前缺乏有效沟通、整合而形成的“孤岛”)。我来自业务群，很能够理解业务群负责人的“我能够攻下一个城市，我以此为豪”的血性、狼性。这也是腾讯所尊崇的。但各个部门能否将这种驱动力统一为整合的意愿，我觉得还是需要继续深化加固的。 坦率地说，我觉得腾讯18年来，我们的管理团队互相磨合的能力，互相理解、宽容的程度，每年在增强。</p>\r\n<p>\r\n	第三个挑战就是观念的转变。我相信，全世界都会同意我们是一家很强悍的企业。腾讯的成功在于我们To C(面向消费者)能力很强，其实这也是腾讯的基因。但广告业务是To B(面向商家)的，我们需要转变观念。</p>\r\n<p>\r\n	让我感到兴奋的是，马化腾和刘炽平在最近的干部大会中，都把这一点明确指出来。现在我要做的就是协助腾讯建立To B的能力。腾讯一向强调用户体验，如果我们把关怀用户体验的那份热忱用在To B的业务中，用心去理解To B业务成功的每一个关键路径，就能真正实现 “from good to great”(从优秀到伟大)。</p>\n',' \r\n\r\n	该文章转自 FT中文网\r\n\r\n	\n\r\n\r\n	作者 | FT中文网总编辑 王丰\r\n\r\n	2017年6月中旬，有关中国互联网巨头腾讯对旗下媒体业务进行重大改革的新闻，充斥了很多业界人士的朋友圈。这个部门在腾讯内部简称OMG(Onli','1502427009','1502427009','0','5','1','0','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('45','我的青春我做主——QQ表情出饰品了','','','http://www.qqseller.com/QQdong','管理员','QQ表情,二次元,QQ标签包','','\n<p>\r\n	正在成都举行的2017 “QQJOY X次元盛典”迎来了一位特殊的小伙伴：QQ表情饰品作为青春代言人出现在多款热门产品的展台中。作为7月8日刚刚登陆全国各大珠宝店的潮流时尚饰品，QQ表情饰品在短时间内就吸引了许多年轻人的关注。此次在QQJOY X次元盛典的实物展出更是燃起了青春风暴，为现场带来了独特的风景线。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"332\" src=\"/uploads/img1/20170811/0ab19f77dbf8f8d82fc09c2697a08a60.jpg\" width=\"500\">\n</center>\r\n<p>\r\n	【QQJOY X次元盛典上的一次特殊邂逅 用青春燃烧你的与众不同】</p>\r\n<p>\r\n	一直以来，QQ表情都深受年轻人的喜爱。不同的QQ表情或俏皮或可爱或恶搞，但都在用特别的方式传达着网络那头聊天伙伴的心情和情感。它就是我们青春里最特别的“代言人”。 QQ表情饰品将这些青春里的小心思变成了可以佩戴的饰品，高调的开始宣扬我们的时尚和与众不同。一年一度的QQJOY X次元盛典是玩家们狂欢的派对，也是怀揣着青春梦想的年轻人们的一次重要集会，能够登陆这样的场合，不仅彰显了QQ表情饰品青春洋溢的时尚基调，对于现场年轻人来说，这更是一次充满惊喜的青春邂逅。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"333\" src=\"/uploads/img1/20170811/dad2c8249cb41f5deec2a5ef52e9cf0a.jpg\" width=\"500\">\n</center>\r\n<p>\r\n	<strong>【主推产品亮相展台 人气一时无两】</strong></p>\r\n<p>\r\n	为了让更多年轻人有机会了解到QQ表情饰品，品牌方特地为QQJOY X次元盛典准备了多款本季热推的主打饰品。整个QQ表情饰品以经典QQ表情为设计原形，第一季推出了爱情、青春、友情、恶搞和萌趣五大系列的饰品。当在QQJOY X次元盛典中看到这些熟悉的QQ表情变身为项链、吊坠、戒指、手镯、手链甚至耳饰的时候，一种青春时光倒流且鲜活的感觉油然而生。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"333\" src=\"/uploads/allimg/170719/10362961W-2.jpg\" width=\"500\">\n</center>\r\n<p>\r\n	<strong>【第一季76款饰品已上市 你的青春你做主】</strong></p>\r\n<p>\r\n	目前QQ表情饰品已经全面登陆全国各大珠宝店，它们散发着时尚璀璨的夺目光芒，也在演绎着最时尚最自我的青春时光。你的青春你做主，你的表情你来选，收一款为自己的少年时光做个见证，是最值得炫耀的成长仪式。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"375\" src=\"/uploads/img1/20170811/e9d67987c2c2f9bee12062937b86d1fa.jpg\" width=\"500\">\n</center>\r\n<p>\r\n	欢乐，时尚，青春，这就是QQ表情饰品。期待与你相遇。</p>\n','正在成都举行的2017 “QQJOY X次元盛典”迎来了一位特殊的小伙伴：QQ表情饰品作为青春代言人出现在多款热门产品的展台中。作为7月8日刚刚登陆全国各大珠宝店的潮流时尚饰品，QQ表情饰品在短时间内就吸引了许多年轻人的关注。此次在QQJO','1502427062','1502427062','0','5','1','0','','1','0','0','0','0','','','1','');
INSERT INTO `my_article` VALUES ('46','手机QQ内测奇葩功能“句有料”：想聊天，先给钱','','','http://www.qqseller.com/QQdong','管理员','句有料,手机QQ','','\n<center>\r\n	<img alt=\"1.jpg\" border=\"1\" height=\"473\" src=\"/uploads/img1/20170811/784f2557ed68bbe044a551b483cae77f.jpg\" width=\"534\">\n</center>\r\n<p>\r\n	站长之家(Chinaz.com)7月20日消息：有网友爆料称，手机QQ正在测试一项名为“句有料”的奇葩功能。开启该功能后，对方需要先付费，才能向你发送消息。在消息的下方会有金额的提示，而普通消息将会被屏蔽，换句话说就是“一句都要有“料”，也就是金钱。”</p>\r\n<center>\r\n	<img alt=\"2.jpg\" border=\"1\" height=\"238\" src=\"/uploads/img1/20170811/ad3ac1dc6cf75c3223002d2ae093d84a.jpg\" width=\"592\">\n</center>\r\n<p>\r\n	这意味着，电子红包的玩法又多了新的花样：想找我聊天?没门，先看看能给多少钱再说。</p>\r\n<center>\r\n	<img alt=\"3.jpg\" border=\"1\" height=\"493\" src=\"/uploads/img1/20170811/cc92b5898bc957afc996e49c820c0e21.jpg\" width=\"598\">\n</center>\r\n<p>\r\n	据悉，“句有料”功能将在QQ v7.1. 5 中上线，具体怎么玩，反响如何?我们拭目以待。</p>\n','站长之家(Chinaz.com)7月20日消息：有网友爆料称，手机QQ正在测试一项名为“句有料”的奇葩功能。开启该功能后，对方需要先付费，才能向你发送消息。在消息的下方会有金额的提示，而普通消息将会被屏蔽，换句话说就是“一句都要有“料”，也','1502427095','1502427095','0','5','1','0','','1','0','0','0','0','','','1','');


# 转存表中的数据：my_attachment 
INSERT INTO `my_attachment` VALUES ('1','58b6984332248.png','img1/20170402/58e0710ce067f.png','1','76144','1','1491104013','1','0');
INSERT INTO `my_attachment` VALUES ('2','58b6984332248.png','img1/20170402/58e0715600d13.png','1','43764','1','1491104086','1','0');
INSERT INTO `my_attachment` VALUES ('3','58b6984332248.png','img1/20170402/58e071c78d904.png','1','86382','1','1491104199','1','0');
INSERT INTO `my_attachment` VALUES ('4','58b6984332248.png','img1/20170402/58e07266df9f5.png','1','74155','1','1491104359','1','0');
INSERT INTO `my_attachment` VALUES ('5','58b6984332248.png','img1/20170402/58e073101797a.png','1','97335','1','1491104528','1','0');
INSERT INTO `my_attachment` VALUES ('6','58b6984332248.png','img1/20170402/58e0735a36a82.png','1','98074','1','1491104602','1','0');
INSERT INTO `my_attachment` VALUES ('7','58b6984332248.png','img1/20170402/58e073c31d441.png','1','89903','1','1491104707','1','0');
INSERT INTO `my_attachment` VALUES ('8','58b6984332248.png','img1/20170402/58e0743916db5.png','1','110477','1','1491104825','1','0');
INSERT INTO `my_attachment` VALUES ('9','58b6984332248.png','img1/20170402/58e07495c1573.png','1','102717','1','1491104917','1','0');
INSERT INTO `my_attachment` VALUES ('10','58b6984332248.png','img1/20170402/58e0752c5a380.png','1','121056','1','1491105068','1','0');
INSERT INTO `my_attachment` VALUES ('11','58b6984332248.png','img1/20170402/58e0759ec44f1.png','1','50851','1','1491105183','1','0');
INSERT INTO `my_attachment` VALUES ('12','1-150Z41T614137.jpg','img1/20170402/58e08960d2c99.jpg','1','18766','1','1491110241','1','0');
INSERT INTO `my_attachment` VALUES ('13','1-150Z41T614137.jpg','img1/20170402/58e089c5115cd.jpg','1','62092','1','1491110341','1','0');
INSERT INTO `my_attachment` VALUES ('14','1-150Z41T614137.jpg','img1/20170402/58e08a0a21f3b.jpg','1','70128','1','1491110410','1','0');
INSERT INTO `my_attachment` VALUES ('15','1-150Z41T614137.jpg','img1/20170402/58e08a7dbd219.jpg','1','43555','1','1491110526','1','0');
INSERT INTO `my_attachment` VALUES ('16','1-150Z41T614137.jpg','img1/20170402/58e08ac46f42c.jpg','1','22857','1','1491110596','1','0');
INSERT INTO `my_attachment` VALUES ('17','1-150Z41T614137.jpg','img1/20170402/58e08b66831a2.jpg','1','18921','1','1491110758','1','0');
INSERT INTO `my_attachment` VALUES ('18','1-150Z41T614137.jpg','img1/20170402/58e08be571d4e.jpg','1','15885','1','1491110885','1','0');
INSERT INTO `my_attachment` VALUES ('19','1-16122H02A1D3.jpg','img1/20170402/58e08be98338f.jpg','1','15885','1','1491110889','1','0');
INSERT INTO `my_attachment` VALUES ('20','1-150Z41T614137.jpg','img1/20170402/58e08c46b0b69.jpg','1','11482','1','1491110983','1','0');
INSERT INTO `my_attachment` VALUES ('21','1-16122H0050NB.jpg','img1/20170402/58e08c57031cd.jpg','1','11482','1','1491110999','1','0');
INSERT INTO `my_attachment` VALUES ('22','1-150Z41T614137.jpg','img1/20170402/58e08cfcebe61.jpg','1','76392','1','1491111165','1','0');
INSERT INTO `my_attachment` VALUES ('23','58300ceb38083.jpg','img1/20170402/58e0b4e171648.jpg','1','125872','1','1491121378','1','0');
INSERT INTO `my_attachment` VALUES ('24','58300ce86fce4.jpg','img1/20170402/58e0b4e2b96ea.jpg','1','140556','1','1491121379','1','0');
INSERT INTO `my_attachment` VALUES ('25','58300ced544ef.jpg','img1/20170402/58e0b4e3e0445.jpg','1','150027','1','1491121381','1','0');
INSERT INTO `my_attachment` VALUES ('26','58300cee90335.jpg','img1/20170402/58e0b4e51eeca.jpg','1','97340','1','1491121382','1','0');
INSERT INTO `my_attachment` VALUES ('27','58300b8a51c9c.jpg','img1/20170402/58e0b593a726a.jpg','1','169445','1','1491121556','1','0');
INSERT INTO `my_attachment` VALUES ('28','58300b8aec3fc.jpg','img1/20170402/58e0b594c85eb.jpg','1','99553','1','1491121557','1','0');
INSERT INTO `my_attachment` VALUES ('29','58300a1bc362c.jpg','img1/20170402/58e0b607dad29.jpg','1','110970','1','1491121672','1','0');
INSERT INTO `my_attachment` VALUES ('30','58300a1d0870d.jpg','img1/20170402/58e0b6087f475.jpg','1','91512','1','1491121673','1','0');
INSERT INTO `my_attachment` VALUES ('31','582c7def435ad.jpg','img1/20170402/58e0b6ab1d351.jpg','1','165812','1','1491121836','1','0');
INSERT INTO `my_attachment` VALUES ('32','582c7df07fbee.jpg','img1/20170402/58e0b6ac51f56.jpg','1','204565','1','1491121837','1','0');
INSERT INTO `my_attachment` VALUES ('33','58300d190288f.jpg','img1/20170402/58e0b730e9780.jpg','1','299420','1','1491121970','1','0');
INSERT INTO `my_attachment` VALUES ('34','58300d1856342.jpg','img1/20170402/58e0b73234558.jpg','1','174284','1','1491121971','1','0');
INSERT INTO `my_attachment` VALUES ('35','5829860df16bb.jpg','img1/20170402/58e0b7c3169e6.jpg','1','108101','1','1491122116','1','0');
INSERT INTO `my_attachment` VALUES ('36','5829860e83696.jpg','img1/20170402/58e0b7c41c7e1.jpg','1','93992','1','1491122117','1','0');
INSERT INTO `my_attachment` VALUES ('37','58298721a48d0.jpg','img1/20170402/58e0b84c491e6.jpg','1','61722','1','1491122252','1','0');
INSERT INTO `my_attachment` VALUES ('38','582987207478e.jpg','img1/20170402/58e0b84cd216e.jpg','1','84109','1','1491122253','1','0');
INSERT INTO `my_attachment` VALUES ('39','584ec7f7b0da0.png','img1/20170402/58e0b8d218f03.png','1','135206','1','1491122387','1','0');
INSERT INTO `my_attachment` VALUES ('40','584ec7f76c661.png','img1/20170402/58e0b8d309d09.png','1','85691','1','1491122387','1','0');
INSERT INTO `my_attachment` VALUES ('41','584ec4643eba4.png','img1/20170402/58e0b91a50e0e.png','1','92182','1','1491122459','1','0');
INSERT INTO `my_attachment` VALUES ('42','584ec4643eba4.png','img1/20170402/58e0b97c90433.png','1','162754','1','1491122557','1','0');
INSERT INTO `my_attachment` VALUES ('43','20120125143820_AGXEP.thumb.700_0.jpg','img1/20170402/58e0ba8b90627.jpg','1','98096','1','1491122828','1','0');
INSERT INTO `my_attachment` VALUES ('44','20120125143820_AGXEP.thumb.700_0.jpg','img1/20170402/58e0bb193fd7e.jpg','1','114584','1','1491122969','1','0');
INSERT INTO `my_attachment` VALUES ('45','20120125143820_AGXEP.thumb.700_0.jpg','img1/20170402/58e0bb6406c82.jpg','1','113775','1','1491123044','1','0');
INSERT INTO `my_attachment` VALUES ('46','20131011220547_uTiBS.thumb.700_0.jpeg','img1/20170402/58e0bbdbb7bf2.jpeg','0','129075','1','1491123164','1','0');
INSERT INTO `my_attachment` VALUES ('47','20131011220547_uTiBS.thumb.700_0.jpeg','img1/20170402/58e0bc13663fa.jpeg','0','129075','1','1491123220','1','0');
INSERT INTO `my_attachment` VALUES ('48','[喜羊羊与灰太狼]第125集_hd.mp4','file1/20170402/58e0bd072ae88.mp4','0','16777215','0','1491123463','1','0');
INSERT INTO `my_attachment` VALUES ('49','QQ截图20170402165846.jpg','img1/20170402/58e0bd4fde258.jpg','1','10944','1','1491123536','1','0');
INSERT INTO `my_attachment` VALUES ('50','[喜羊羊与灰太狼]第126集_hd.mp4','file1/20170402/58e0bdbe11a15.mp4','0','16777215','0','1491123646','1','0');
INSERT INTO `my_attachment` VALUES ('51','QQ截图20170402165846.jpg','img1/20170402/58e0bdd8bbecc.jpg','1','10944','1','1491123673','1','0');
INSERT INTO `my_attachment` VALUES ('52','[喜羊羊与灰太狼]第128集_hd.mp4','file1/20170402/58e0be0edc6b5.mp4','0','16777215','0','1491123727','1','0');
INSERT INTO `my_attachment` VALUES ('53','QQ截图20170402165846.jpg','img1/20170402/58e0be12cecd6.jpg','1','10944','1','1491123731','1','0');
INSERT INTO `my_attachment` VALUES ('54','QQ截图20170402165846.jpg','img1/20170402/58e0be604fb5e.jpg','1','10944','1','1491123808','1','0');
INSERT INTO `my_attachment` VALUES ('55','[喜羊羊与灰太狼]第129集_hd.mp4','file1/20170402/58e0be692b750.mp4','0','16777215','0','1491123817','1','0');
INSERT INTO `my_attachment` VALUES ('56','李玲玉-情网.mp4','file1/20170402/58e0c09d6fe23.mp4','0','16777215','0','1491124381','1','0');
INSERT INTO `my_attachment` VALUES ('57','QQ截图20170402171231.jpg','img1/20170402/58e0c0a208301.jpg','1','48840','1','1491124386','1','0');
INSERT INTO `my_attachment` VALUES ('58','QQ截图20170402171708.jpg','img1/20170402/58e0c19ba9638.jpg','1','65451','1','1491124636','1','0');
INSERT INTO `my_attachment` VALUES ('59','邓紫棋-夜空中最亮的星.mp4','file1/20170402/58e0c1b1ee8c3.mp4','0','16777215','0','1491124658','1','0');
INSERT INTO `my_attachment` VALUES ('60','QQ截图20170402171924.jpg','img1/20170402/58e0c2287db37.jpg','1','39642','1','1491124777','1','0');
INSERT INTO `my_attachment` VALUES ('61','王祖蓝-上海滩.mp4','file1/20170402/58e0c230bc127.mp4','0','16777215','0','1491124784','1','0');
INSERT INTO `my_attachment` VALUES ('62','86401313.jpg','img1/20170402/58e0c54a2ae6b.jpg','1','2967','1','1491125578','1','0');
INSERT INTO `my_attachment` VALUES ('63','55d6f78b15ad1.mp3','file1/20170402/58e0c551d914c.mp3','3','9033732','0','1491125585','1','0');
INSERT INTO `my_attachment` VALUES ('64','7730-150115164I5.jpg','img1/20170402/58e0c637b307f.jpg','1','1054586','1','1491125817','1','0');
INSERT INTO `my_attachment` VALUES ('65','默.mp3','file1/20170402/58e0c643cbdbb.mp3','3','12110092','0','1491125827','1','0');
INSERT INTO `my_attachment` VALUES ('66','60458b9830a1a01f322f2ef144460ea0.jpg','img1/20170402/58e0c86abf883.jpg','1','88641','1','1491126379','1','0');
INSERT INTO `my_attachment` VALUES ('67','演员.mp3','file1/20170402/58e0c87513118.mp3','3','1797891','0','1491126389','1','0');
INSERT INTO `my_attachment` VALUES ('68','n1.png','img1/20170402/58e1142329eff.png','1','3045','1','1491145763','1','0');
INSERT INTO `my_attachment` VALUES ('69','n1.png','img1/20170402/58e1145a15f3d.png','1','7578','1','1491145818','1','0');
INSERT INTO `my_attachment` VALUES ('70','n1.png','img1/20170402/58e1147bc20dc.png','1','4848','1','1491145852','1','0');
INSERT INTO `my_attachment` VALUES ('71','n1.png','img1/20170402/58e114945c973.png','1','9965','1','1491145876','1','0');
INSERT INTO `my_attachment` VALUES ('72','n1.png','img1/20170402/58e115f715dc3.png','1','6634','1','1491146231','1','0');
INSERT INTO `my_attachment` VALUES ('73','n1.png','img1/20170402/58e11640d06fe.png','1','3501','1','1491146305','1','0');
INSERT INTO `my_attachment` VALUES ('74','QQ号模板.xls','file1/20170414/58f031a7d6003.xls','5','158208','0','1492136360','1','0');
INSERT INTO `my_attachment` VALUES ('75','大致要求.txt','file1/20170414/58f032297b869.txt','0','775','0','1492136489','1','0');
INSERT INTO `my_attachment` VALUES ('76','林俊杰 - 弹唱.mp4','file1/20170427/59017d7087d61.mp4','0','16777215','0','1493269879','1','0');
INSERT INTO `my_attachment` VALUES ('77','581e9e7c5eab2.jpg','img1/20170611/593cfe19ee8ce.jpg','1','170510','1','1497169435','1','0');
INSERT INTO `my_attachment` VALUES ('78','581e9e7c5eab2.jpg','img1/20170611/593d010feaf98.jpg','1','170510','1','1497170193','1','0');
INSERT INTO `my_attachment` VALUES ('79','20170605开发还存的小问题-补充.txt','file1/20170614/59410c765c383.txt','0','436','0','1497435254','1','0');
INSERT INTO `my_attachment` VALUES ('80','581e9e7c5eab2.jpg','img1/20170614/59410cf2be646.jpg','1','170510','1','1497435380','1','0');
INSERT INTO `my_attachment` VALUES ('81','20170605开发还存的小问题-补充.txt','file1/20170614/594141e8ee1e3.txt','0','436','0','1497448937','1','0');
INSERT INTO `my_attachment` VALUES ('82','581e9e7c5eab2.jpg','img1/20170614/59414b8c126b1.jpg','1','170510','1','1497451405','1','0');
INSERT INTO `my_attachment` VALUES ('83','581e9e7c5eab2.jpg','img1/20170614/5941511843ca8.jpg','1','170510','1','1497452826','1','0');
INSERT INTO `my_attachment` VALUES ('84','581e9e7c5eab2.jpg','img1/20170614/594152546c56b.jpg','1','170510','1','1497453141','1','0');
INSERT INTO `my_attachment` VALUES ('85','dns.txt','file1/20170614/59415261247ea.txt','0','32','0','1497453153','1','0');
INSERT INTO `my_attachment` VALUES ('86','布仁巴雅尔 - 天边.mp3','file1/20170615/59415d8e47cf2.mp3','3','4589108','0','1497456014','1','0');
INSERT INTO `my_attachment` VALUES ('87','581e9e7c5eab2.jpg','img1/20170615/5942997fcbf21.jpg','1','170510','1','1497536897','1','0');
INSERT INTO `my_attachment` VALUES ('88','581e9e7c5eab2.jpg','img1/20170615/594299b8d44f7.jpg','1','170510','1','1497536954','1','0');
INSERT INTO `my_attachment` VALUES ('89','581e9e7c5eab2.jpg','img1/20170615/59429a63cde8a.jpg','1','170510','1','1497537125','1','0');
INSERT INTO `my_attachment` VALUES ('90','581e9e7c5eab2.jpg','img1/20170615/59429ade295b7.jpg','1','170510','1','1497537247','1','0');
INSERT INTO `my_attachment` VALUES ('91','581e9e7c5eab2.jpg','img1/20170615/59429ae4cdc1d.jpg','1','170510','1','1497537254','1','0');
INSERT INTO `my_attachment` VALUES ('92','581e9e7c5eab2.jpg','img1/20170615/59429c73a08b8.jpg','1','170510','1','1497537653','1','0');
INSERT INTO `my_attachment` VALUES ('93','581e9e7c5eab2.jpg','img1/20170615/59429f960926d.jpg','1','170510','1','1497538455','1','0');
INSERT INTO `my_attachment` VALUES ('94','581e9e7c5eab2.jpg','img1/20170615/5942a08184cd3.jpg','1','170510','1','1497538691','1','0');
INSERT INTO `my_attachment` VALUES ('95','581e9e7c5eab2.jpg','img1/20170615/5942a089141d2.jpg','1','170510','1','1497538698','1','0');
INSERT INTO `my_attachment` VALUES ('96','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942a0aa36832.jpg','1','14433','1','1497538730','1','0');
INSERT INTO `my_attachment` VALUES ('97','581e9e7c5eab2.jpg','img1/20170615/5942a0eba2d91.jpg','1','170510','1','1497538797','1','0');
INSERT INTO `my_attachment` VALUES ('98','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942a0f38182b.jpg','1','14433','1','1497538803','1','0');
INSERT INTO `my_attachment` VALUES ('99','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942a5eeae6ab.jpg','1','14433','1','1497540078','1','0');
INSERT INTO `my_attachment` VALUES ('100','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942a77c674f7.jpg','1','14433','1','1497540476','1','0');
INSERT INTO `my_attachment` VALUES ('101','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942a7c57fc4c.jpg','1','14433','1','1497540549','1','0');
INSERT INTO `my_attachment` VALUES ('102','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942a9f25bd7e.jpg','1','14433','1','1497541106','1','0');
INSERT INTO `my_attachment` VALUES ('103','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942aa6ace131.jpg','1','14433','1','1497541227','1','0');
INSERT INTO `my_attachment` VALUES ('104','58ba260f8439e.jpg!300X300.jpg','img1/20170615/5942aec5d8c31.jpg','1','14433','1','1497542342','1','0');
INSERT INTO `my_attachment` VALUES ('105','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5942af8de496c.jpg','1','14433','1','1497542542','1','0');
INSERT INTO `my_attachment` VALUES ('106','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5942afd712ac3.jpg','1','14433','1','1497542615','1','0');
INSERT INTO `my_attachment` VALUES ('107','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5942b0a9d38eb.jpg','1','14433','1','1497542826','1','0');
INSERT INTO `my_attachment` VALUES ('108','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5942b0f140d97.jpg','1','14433','1','1497542897','1','0');
INSERT INTO `my_attachment` VALUES ('109','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5942b1103be93.jpg','1','14433','1','1497542928','1','0');
INSERT INTO `my_attachment` VALUES ('110','20170605开发还存的小问题-补充.txt','file1/20170616/5942b5c7cfe0a.txt','0','436','0','1497544135','1','0');
INSERT INTO `my_attachment` VALUES ('111','《我说参同契》南怀瑾（上中下）.txt','file1/20170616/5942b5d76085b.txt','0','877600','0','1497544151','1','0');
INSERT INTO `my_attachment` VALUES ('112','58ba260f8439e.jpg!300X300.jpg','img1/20170616/59435f662d977.jpg','1','14433','1','1497587558','1','0');
INSERT INTO `my_attachment` VALUES ('113','58ba260f8439e.jpg!300X300.jpg','img1/20170616/59435f6c9bca0.jpg','1','14433','1','1497587564','1','0');
INSERT INTO `my_attachment` VALUES ('114','581e9e7c5eab2.jpg','img1/20170616/59435f7070a13.jpg','1','170510','1','1497587570','1','0');
INSERT INTO `my_attachment` VALUES ('115','《我说参同契》南怀瑾（上中下）.txt','file1/20170616/59435f78b597c.txt','0','877600','0','1497587576','1','0');
INSERT INTO `my_attachment` VALUES ('116','dns.txt','file1/20170616/59435f8886735.txt','0','32','0','1497587592','1','0');
INSERT INTO `my_attachment` VALUES ('117','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5943ec28a7aca.jpg','1','14433','1','1497623593','1','0');
INSERT INTO `my_attachment` VALUES ('118','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5943ec2fe5c99.jpg','1','14433','1','1497623600','1','0');
INSERT INTO `my_attachment` VALUES ('119','581e9e7c5eab2.jpg','img1/20170616/5943ec346e773.jpg','1','170510','1','1497623606','1','0');
INSERT INTO `my_attachment` VALUES ('120','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5943f56cdd105.jpg','1','14433','1','1497625965','1','0');
INSERT INTO `my_attachment` VALUES ('121','58ba260f8439e.jpg!300X300.jpg','img1/20170616/5944007fd9705.jpg','1','14433','1','1497628800','1','0');
INSERT INTO `my_attachment` VALUES ('122','58ba260f8439e.jpg!300X300.jpg','img1/20170617/594547abb13ab.jpg','1','14433','1','1497712556','1','0');
INSERT INTO `my_attachment` VALUES ('123','58ba260f8439e.jpg!300X300.jpg','img1/20170617/59454dc550a0a.jpg','1','14433','1','1497714117','1','0');
INSERT INTO `my_attachment` VALUES ('124','581e9e7c5eab2.jpg','img1/20170617/59454dc9eafd3.jpg','1','170510','1','1497714123','1','0');
INSERT INTO `my_attachment` VALUES ('125','','img1/20170618/5946497f8186c.jpg','0','0','1','1497778569','1','0');
INSERT INTO `my_attachment` VALUES ('126','','img1/20170618/594693185fbf0.jpg','0','0','1','1497797401','1','0');
INSERT INTO `my_attachment` VALUES ('127','58ba260f8439e.jpg!300X300.jpg','img1/20170624/594e3593085d7.jpg','1','14433','1','1498297747','1','0');
INSERT INTO `my_attachment` VALUES ('128','58ba260f8439e.jpg!300X300.jpg','img1/20170624/594e7d3415813.jpg','1','14433','1','1498316084','1','0');
INSERT INTO `my_attachment` VALUES ('129','58ba260f8439e.jpg!300X300.jpg','img1/20170717/596c3445581de.jpg','1','14433','1','1500263493','1','0');
INSERT INTO `my_attachment` VALUES ('130','模板.xls','file1/20170718/596dd9c49e4d3.xls','5','167936','0','1500371396','1','0');
INSERT INTO `my_attachment` VALUES ('131','模板.xls','file1/20170718/596dd9ec1bbfc.xls','5','167936','0','1500371436','1','0');
INSERT INTO `my_attachment` VALUES ('132','581e9e7c5eab2.jpg','img1/20170719/596f2332360cc.jpg','1','170510','1','1500455731','1','0');
INSERT INTO `my_attachment` VALUES ('133','收藏网站.txt','file1/20170720/5970180eab694.txt','0','1414','0','1500518414','1','0');
INSERT INTO `my_attachment` VALUES ('134','581e9e7c5eab2.jpg','img1/20170720/5970181bc922b.jpg','1','170510','1','1500518429','1','0');
INSERT INTO `my_attachment` VALUES ('135','58ba260f8439e.jpg!300X300.jpg','img1/20170721/597180d2b6417.jpg','1','14433','1','1500610770','1','0');
INSERT INTO `my_attachment` VALUES ('136','58ba260f8439e.jpg!300X300.jpg','img1/20170721/597180f90fcc7.jpg','1','14433','1','1500610809','1','0');
INSERT INTO `my_attachment` VALUES ('137','','img1/20170805/5985bac3efcfe.jpg','0','0','1','1501936325','1','0');
INSERT INTO `my_attachment` VALUES ('138','58ba260f8439e.jpg!300X300.jpg','img1/20170808/5989d12fe652d.jpg','1','14433','1','1502204208','1','0');
INSERT INTO `my_attachment` VALUES ('139','58ba260f8439e.jpg!300X300.jpg','img1/20170810/598bcbd7c982e.jpg','1','14433','1','1502333912','1','0');
INSERT INTO `my_attachment` VALUES ('140','dns.txt','file1/20170810/598c28e3d21fc.txt','0','32','0','1502357731','1','0');
INSERT INTO `my_attachment` VALUES ('141','网址.txt','file1/20170810/598c29e3bc8d1.txt','0','42','0','1502357987','1','0');
INSERT INTO `my_attachment` VALUES ('142','58ba260f8439e.jpg!300X300.jpg','img1/20170810/598c2ad59eb9c.jpg','1','14433','1','1502358229','1','0');
INSERT INTO `my_attachment` VALUES ('143','581e9e7c5eab2.jpg','img1/20170810/598c2b7901953.jpg','1','170510','1','1502358394','1','0');
INSERT INTO `my_attachment` VALUES ('144','3','33','0','3','0','1502380661','1','0');
INSERT INTO `my_attachment` VALUES ('145','i','ii','0','0','0','1502380661','1','0');
INSERT INTO `my_attachment` VALUES ('146','.','..','0','0','0','1502380661','1','0');
INSERT INTO `my_attachment` VALUES ('147','','img1/20170811/333767987604f96019ca839553184ce2.jpeg','0','0','1','1502381185','1','0');
INSERT INTO `my_attachment` VALUES ('148','','','0','0','0','1502381936','1','0');
INSERT INTO `my_attachment` VALUES ('149','','img1/20170811/8bd4450dbe2d01e59517df314018a6d3.jpg','0','0','1','1502382271','1','0');
INSERT INTO `my_attachment` VALUES ('150','','img1/20170811/931320c284f1810d61649352def470df.jpg','0','0','1','1502382556','1','0');
INSERT INTO `my_attachment` VALUES ('151','','img1/20170811/931320c284f1810d61649352def470df.jpg','0','0','1','1502382557','1','0');
INSERT INTO `my_attachment` VALUES ('152','','img1/20170811/c09b06d86fb68c5ebd073c4cc4fd4666.jpg','0','0','1','1502382566','1','0');
INSERT INTO `my_attachment` VALUES ('153','','img1/20170811/d82e3b4b30832fdb4e56c23cee880638.jpg','0','0','1','1502382567','1','0');
INSERT INTO `my_attachment` VALUES ('154','','img1/20170811/333767987604f96019ca839553184ce2.jpeg','0','0','1','1502382568','1','0');
INSERT INTO `my_attachment` VALUES ('155','','img1/20170811/1500e44e18d10686bf06637ff70a2070.jpeg','0','0','1','1502382569','1','0');
INSERT INTO `my_attachment` VALUES ('156','','img1/20170811/1500e44e18d10686bf06637ff70a2070.jpeg','0','0','1','1502382590','1','0');
INSERT INTO `my_attachment` VALUES ('157','','img1/20170811/1500e44e18d10686bf06637ff70a2070.jpeg','0','0','1','1502382618','1','0');
INSERT INTO `my_attachment` VALUES ('158','','img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg','0','0','1','1502382619','1','0');
INSERT INTO `my_attachment` VALUES ('159','','img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg','0','0','1','1502382619','1','0');
INSERT INTO `my_attachment` VALUES ('160','','img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg','0','0','1','1502382620','1','0');
INSERT INTO `my_attachment` VALUES ('161','','img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg','0','0','1','1502382621','1','0');
INSERT INTO `my_attachment` VALUES ('162','','img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg','0','0','1','1502382631','1','0');
INSERT INTO `my_attachment` VALUES ('163','','img1/20170811/333767987604f96019ca839553184ce2.jpeg','0','0','1','1502423997','1','0');
INSERT INTO `my_attachment` VALUES ('164','','img1/20170811/333767987604f96019ca839553184ce2.jpeg','0','0','1','1502424597','1','0');
INSERT INTO `my_attachment` VALUES ('165','','img1/20170811/a98fae0f13bb33a12c6c0cea84cfa2e5.jpg','0','0','1','1502426737','1','0');
INSERT INTO `my_attachment` VALUES ('166','','img1/20170811/931320c284f1810d61649352def470df.jpg','0','0','1','1502426738','1','0');
INSERT INTO `my_attachment` VALUES ('167','','img1/20170811/d82e3b4b30832fdb4e56c23cee880638.jpg','0','0','1','1502426760','1','0');
INSERT INTO `my_attachment` VALUES ('168','','img1/20170811/c09b06d86fb68c5ebd073c4cc4fd4666.jpg','0','0','1','1502426770','1','0');
INSERT INTO `my_attachment` VALUES ('169','','img1/20170811/333767987604f96019ca839553184ce2.jpeg','0','0','1','1502426795','1','0');
INSERT INTO `my_attachment` VALUES ('170','','img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg','0','0','1','1502426796','1','0');
INSERT INTO `my_attachment` VALUES ('171','','img1/20170811/a98fae0f13bb33a12c6c0cea84cfa2e5.jpg','0','0','1','1502426889','1','0');
INSERT INTO `my_attachment` VALUES ('172','','img1/20170811/931320c284f1810d61649352def470df.jpg','0','0','1','1502426899','1','0');
INSERT INTO `my_attachment` VALUES ('173','','img1/20170811/16ae7b6d582288133b3208e0bee30e9f.jpg','0','0','1','1502426909','1','0');
INSERT INTO `my_attachment` VALUES ('174','','img1/20170811/d82e3b4b30832fdb4e56c23cee880638.jpg','0','0','1','1502426911','1','0');
INSERT INTO `my_attachment` VALUES ('175','','img1/20170811/333767987604f96019ca839553184ce2.jpeg','0','0','1','1502426949','1','0');
INSERT INTO `my_attachment` VALUES ('176','','img1/20170811/8bd4450dbe2d01e59517df314018a6d3.jpg','0','0','1','1502426950','1','0');
INSERT INTO `my_attachment` VALUES ('177','','img1/20170811/1500e44e18d10686bf06637ff70a2070.jpeg','0','0','1','1502426972','1','0');
INSERT INTO `my_attachment` VALUES ('178','','img1/20170811/ba60072c6126a78fd86415d709c19713.jpeg','0','0','1','1502426973','1','0');


# 转存表中的数据：my_attachmentindex 
INSERT INTO `my_attachmentindex` VALUES ('1','1','1','');
INSERT INTO `my_attachmentindex` VALUES ('2','2','1','');
INSERT INTO `my_attachmentindex` VALUES ('3','3','1','');
INSERT INTO `my_attachmentindex` VALUES ('4','4','1','');
INSERT INTO `my_attachmentindex` VALUES ('5','5','1','');
INSERT INTO `my_attachmentindex` VALUES ('6','6','1','');
INSERT INTO `my_attachmentindex` VALUES ('7','7','1','');
INSERT INTO `my_attachmentindex` VALUES ('8','8','1','');
INSERT INTO `my_attachmentindex` VALUES ('9','9','1','');
INSERT INTO `my_attachmentindex` VALUES ('10','10','1','');
INSERT INTO `my_attachmentindex` VALUES ('11','11','1','');
INSERT INTO `my_attachmentindex` VALUES ('12','12','1','');
INSERT INTO `my_attachmentindex` VALUES ('14','14','1','');
INSERT INTO `my_attachmentindex` VALUES ('15','15','1','');
INSERT INTO `my_attachmentindex` VALUES ('16','16','1','');
INSERT INTO `my_attachmentindex` VALUES ('17','17','1','');
INSERT INTO `my_attachmentindex` VALUES ('19','18','1','');
INSERT INTO `my_attachmentindex` VALUES ('18','18','1','');
INSERT INTO `my_attachmentindex` VALUES ('21','19','1','');
INSERT INTO `my_attachmentindex` VALUES ('20','19','1','');
INSERT INTO `my_attachmentindex` VALUES ('22','20','1','');
INSERT INTO `my_attachmentindex` VALUES ('23','21','1','');
INSERT INTO `my_attachmentindex` VALUES ('24','21','1','');
INSERT INTO `my_attachmentindex` VALUES ('25','21','1','');
INSERT INTO `my_attachmentindex` VALUES ('26','21','1','');
INSERT INTO `my_attachmentindex` VALUES ('27','22','1','');
INSERT INTO `my_attachmentindex` VALUES ('28','22','1','');
INSERT INTO `my_attachmentindex` VALUES ('29','23','1','');
INSERT INTO `my_attachmentindex` VALUES ('30','23','1','');
INSERT INTO `my_attachmentindex` VALUES ('31','24','1','');
INSERT INTO `my_attachmentindex` VALUES ('32','24','1','');
INSERT INTO `my_attachmentindex` VALUES ('33','25','1','');
INSERT INTO `my_attachmentindex` VALUES ('34','25','1','');
INSERT INTO `my_attachmentindex` VALUES ('35','26','1','');
INSERT INTO `my_attachmentindex` VALUES ('36','26','1','');
INSERT INTO `my_attachmentindex` VALUES ('37','27','1','');
INSERT INTO `my_attachmentindex` VALUES ('38','27','1','');
INSERT INTO `my_attachmentindex` VALUES ('39','28','1','');
INSERT INTO `my_attachmentindex` VALUES ('40','28','1','');
INSERT INTO `my_attachmentindex` VALUES ('41','29','1','');
INSERT INTO `my_attachmentindex` VALUES ('42','30','1','');
INSERT INTO `my_attachmentindex` VALUES ('43','31','1','');
INSERT INTO `my_attachmentindex` VALUES ('44','32','1','');
INSERT INTO `my_attachmentindex` VALUES ('45','33','1','');
INSERT INTO `my_attachmentindex` VALUES ('47','34','1','');
INSERT INTO `my_attachmentindex` VALUES ('49','1','11','');
INSERT INTO `my_attachmentindex` VALUES ('51','2','11','');
INSERT INTO `my_attachmentindex` VALUES ('53','3','11','');
INSERT INTO `my_attachmentindex` VALUES ('54','4','11','');
INSERT INTO `my_attachmentindex` VALUES ('57','5','11','');
INSERT INTO `my_attachmentindex` VALUES ('58','6','11','');
INSERT INTO `my_attachmentindex` VALUES ('60','7','11','');
INSERT INTO `my_attachmentindex` VALUES ('62','1','10','');
INSERT INTO `my_attachmentindex` VALUES ('64','2','10','');
INSERT INTO `my_attachmentindex` VALUES ('66','3','10','');
INSERT INTO `my_attachmentindex` VALUES ('68','9','0','category');
INSERT INTO `my_attachmentindex` VALUES ('69','4','0','category');
INSERT INTO `my_attachmentindex` VALUES ('70','5','0','category');
INSERT INTO `my_attachmentindex` VALUES ('71','6','0','category');
INSERT INTO `my_attachmentindex` VALUES ('72','7','0','category');
INSERT INTO `my_attachmentindex` VALUES ('73','8','0','category');
INSERT INTO `my_attachmentindex` VALUES ('122','1','0','special');
INSERT INTO `my_attachmentindex` VALUES ('127','1','0','block');


# 转存表中的数据：my_authorize 


# 转存表中的数据：my_block 
INSERT INTO `my_block` VALUES ('1','Introduction','首页','/uploads/img1/20170624/594e3593085d7.jpg!300X300.jpg','2');


# 转存表中的数据：my_category 
INSERT INTO `my_category` VALUES ('1','名人语录','mryulu','','9','1','0','','','','','','','List_article.html','Show_article.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('2','网络语录','wlyulu','','9','1','0','','','','','','','List_article.html','Show_article.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('3','励志名言','lizhi','','9','1','0','','','','','','','List_article.html','Show_article.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('4','文章','article','/uploads/img1/20170402/58e1145a15f3d.png','0','1','0','','_self','小清新文章','','生活一定要五颜六色，但绝不能乱七八糟。','','List_article.html','Show_article.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('5','新闻','news','/uploads/img1/20170402/58e1147bc20dc.png','0','1','0','','','','','','','List_article.html','Show_article.html','','1','3','','0');
INSERT INTO `my_category` VALUES ('6','图片','pic','/uploads/img1/20170402/58e114945c973.png','0','1','0','','','','','不会打字，那就只能发图咯！','','List_pic.html','Show_article.html','','1','4','','0');
INSERT INTO `my_category` VALUES ('7','音乐','music','/uploads/img1/20170402/58e115f715dc3.png','0','10','0','','','','','some awesome services we provide!','','List_music.html','Show_music.html','<table class=\"FCK__ShowTableBorders\" width=\"850\"><tbody style=\"line-height: 1.5em !important\"><tr style=\"line-height: 1.5em !important;height: 37px\" class=\"firstRow\"><td valign=\"center\" width=\"100\" style=\"border-width: 1px; border-color: rgb(0, 0, 0); padding: 0px 7px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">大三和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-color: rgb(0, 0, 0); border-top-width: 1px; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">C</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-color: rgb(0, 0, 0); border-top-width: 1px; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">D</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-color: rgb(0, 0, 0); border-top-width: 1px; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">E</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-color: rgb(0, 0, 0); border-top-width: 1px; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">F</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-color: rgb(0, 0, 0); border-top-width: 1px; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">G</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-color: rgb(0, 0, 0); border-top-width: 1px; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">A</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-color: rgb(0, 0, 0); border-top-width: 1px; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">B</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">小三和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Cm</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Dm</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Em</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Fm</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Gm</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Am</span>&nbsp;</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Bm</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">大七和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">C7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">D7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">E7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">F7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">G7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">A7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">B7</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">小七和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Cm7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Dm7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Em7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Fm7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Gm7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Am7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Bm7</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">大大七和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Cmaj7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Dmaj7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Emaj7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Fmaj7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Gmaj7</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Amaj7</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Bmaj7</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">六和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">C6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">D6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">E6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">F6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">G6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">A6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">B6</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">九和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">C9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">D9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">E9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">F9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">G9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">A9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">B9</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">小六和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Cm6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Dm6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Em6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Fm6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Gm6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Am6</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Bm6</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">小九和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Cm9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Dm9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Em9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Fm9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Gm9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Am9</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Bm9</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">挂二和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Csus2</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Dsus2</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Esus2</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Fsus2</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Gsus2</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Asus2</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Bsus2</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">挂四和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Csus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Dsus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Esus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Fsus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Gsus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Asus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">Bsus4</span>&nbsp;</span></p></td></tr><tr style=\"line-height: 1.5em !important;height: 37px\"><td valign=\"center\" width=\"100\" style=\"border-right-color: rgb(0, 0, 0); border-width: medium 1px 1px; border-top-style: none; padding: 0px 7px; border-left-color: rgb(0, 0, 0); border-bottom-color: rgb(0, 0, 0); line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 128, 0);font-family: 宋体\">挂四七和弦</span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">C7sus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">D7sus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">E7sus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">F7sus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">G7sus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">A7sus4</span><span style=\"color:#0000ff\">&nbsp;</span></span></p></td><td valign=\"center\" width=\"70\" style=\"border-right-color: rgb(0, 0, 0); border-right-width: 1px; padding: 0px 7px; border-top-width: medium; border-top-style: none; border-bottom-color: rgb(0, 0, 0); border-bottom-width: 1px; line-height: 1.5em !important;\"><p style=\"margin-top: 0;margin-bottom: 0;text-align: center\"><span style=\"line-height: 1.5em !important;font-size: 14px;color: rgb(0, 0, 255);font-family: 宋体\"><span style=\"color:#0000ff\">B7sus4</span>&nbsp;</span></p></td></tr></tbody></table><p><br/></p>','1','5','','0');
INSERT INTO `my_category` VALUES ('8','视频','video','/uploads/img1/20170402/58e11640d06fe.png','0','11','0','','','','','最优美动听的音乐MV，感动你每个细胞？','','List_video.html','Show_video.html','','1','6','','0');
INSERT INTO `my_category` VALUES ('9','语录','yulu','/uploads/img1/20170402/58e1142329eff.png','0','1','0','','','','','','','List_article.html','Show_article.html','','0','2','','0');
INSERT INTO `my_category` VALUES ('23','漫画','manhua','','6','1','0','','','','','','','List_pic.html','Show_article.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('24','壁纸','bizhi','','6','1','0','','','','','','','List_pic.html','Show_article.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('25','斗图','doutu','','6','1','0','','','','','','','List_pic.html','Show_article.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('26','欧美','oumei','/uploads/img1/20170329/58db170bcbac3.jpg','7','10','0','','','','','','','List_music.html','Show_music.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('27','中文','zhongwen','/uploads/img1/20170329/58db1721d9e59.jpg!300X300.jpg','7','10','0','','','','','','','List_music.html','Show_music.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('29','MV视频','MVshipin','','8','11','0','','','','','','','List_video.html','Show_video.html','','1','1','','0');
INSERT INTO `my_category` VALUES ('30','搞笑视频','gaoxiaoshipin','','8','11','0','','','','','','','List_video.html','Show_video.html','','1','1','','0');


# 转存表中的数据：my_category_access 


# 转存表中的数据：my_collect 
INSERT INTO `my_collect` VALUES ('10','5','QQ新闻动态','http://www.qqseller.com','http://www.qqseller.com/qqdongtai/','.mainArea','#faqlist dd a,href','#faq_content h1,text','meta[name=keywords],content','','#faq_content div:eq(2),html','','','#faq_content div:eq(2) img:eq(0),src','','','0','','1502426662','list8','.html','1','3','1','1');


# 转存表中的数据：my_collects 
INSERT INTO `my_collects` VALUES ('5','1','12','5','5','1489638675');
INSERT INTO `my_collects` VALUES ('3','1','10','5','5','1489470620');
INSERT INTO `my_collects` VALUES ('4','1','7','5','5','1489471295');
INSERT INTO `my_collects` VALUES ('6','1','11','5','5','1489642412');
INSERT INTO `my_collects` VALUES ('7','1','1','11','5','1489653079');
INSERT INTO `my_collects` VALUES ('8','23','9','5','5','1490364256');
INSERT INTO `my_collects` VALUES ('9','23','6','5','5','1490364389');
INSERT INTO `my_collects` VALUES ('10','23','6','1','1','1490842399');
INSERT INTO `my_collects` VALUES ('11','23','34','29','1','1490884450');
INSERT INTO `my_collects` VALUES ('12','23','7','1','1','1490967666');
INSERT INTO `my_collects` VALUES ('13','23','4','30','11','1491449893');


# 转存表中的数据：my_comment 
INSERT INTO `my_comment` VALUES ('1','2','1','对人生感悟的名言','云木马','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1491105331','人之所以痛苦，在于追求错误的东西。','0','0','23');
INSERT INTO `my_comment` VALUES ('2','3','1','关于坚强的名人语录','云木马','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1491105369','生活就像海洋，只有意志坚强的人，才能到达彼岸。','0','0','23');
INSERT INTO `my_comment` VALUES ('3','6','1','关于感动的名人名言','云木马','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1491105398','阴谋陷害别人的人，自己会首先遭到不幸。','0','0','23');


# 转存表中的数据：my_config 
INSERT INTO `my_config` VALUES ('1','CFG_WEBNAME','网站名称','','','2','1','小清新网','1');
INSERT INTO `my_config` VALUES ('2','CFG_WEBURL','网站域名','','','2','1','http://localhost:85','2');
INSERT INTO `my_config` VALUES ('3','CFG_WEBTITLE','网站标题','站点首页title(SEO)的设置','','2','1','小清新网','4');
INSERT INTO `my_config` VALUES ('4','CFG_KEYWORDS','站点关键词','','','2','1','小清新,语录,音乐,图片,视频','5');
INSERT INTO `my_config` VALUES ('5','CFG_DESCRIPTION','站点描述','','','3','1','欢迎来到小清新网，这里是文艺青年的心灵驿站，希望你在这里能找到自己心灵的栖息之地。','6');
INSERT INTO `my_config` VALUES ('6','CFG_THEMESTYLE','PC模板风格','','select','2','1','xqx','8');
INSERT INTO `my_config` VALUES ('7','CFG_COOKIE_ENCODE','cookie加密码','','','2','1','m5msJbKhM','15');
INSERT INTO `my_config` VALUES ('8','CFG_POWERBY','网站版权信息','','','3','1','Copyright©2014-2017 All Rights Reserved.','11');
INSERT INTO `my_config` VALUES ('9','CFG_STATS','CNZZ统计','','','3','1','','12');
INSERT INTO `my_config` VALUES ('45','CFG_EMAIL_ACTIVE','是否开启邮箱激活','','','4','6','1','0');
INSERT INTO `my_config` VALUES ('10','CFG_BEIAN','网站备案号','','','2','1','滇ICP备14001033号-2','14');
INSERT INTO `my_config` VALUES ('11','CFG_ADDRESS','联系地址','','','2','1','昆明市北市区','8');
INSERT INTO `my_config` VALUES ('12','CFG_PHONE','联系电话','','','2','1','0871-8888888','9');
INSERT INTO `my_config` VALUES ('13','CFG_WEBSITE_CLOSE','关闭网站','','','4','2','0','0');
INSERT INTO `my_config` VALUES ('14','CFG_WEBSITE_CLOSE_INFO','关站提示','','','3','2','站点维护中，请稍等一会...','0');
INSERT INTO `my_config` VALUES ('15','CFG_MOBILE_AUTO','手机版开启','','','4','1','1','16');
INSERT INTO `my_config` VALUES ('16','CFG_EMAIL_FROM','发件邮箱地址','','','2','3','1172096750@qq.com','0');
INSERT INTO `my_config` VALUES ('17','CFG_EMAIL_FROM_NAME','发件人名称','','','2','3','站名','0');
INSERT INTO `my_config` VALUES ('18','CFG_EMAIL_HOST','STMP服务器','','','2','3','smtp.exmail.qq.com','0');
INSERT INTO `my_config` VALUES ('19','CFG_EMAIL_PORT','服务器端口','','','1','3','25','0');
INSERT INTO `my_config` VALUES ('20','CFG_EMAIL_LOGINNAME','邮箱帐号','','','2','3','1172096750@qq.com','0');
INSERT INTO `my_config` VALUES ('21','CFG_EMAIL_PASSWORD','邮箱密码','','','2','3','','0');
INSERT INTO `my_config` VALUES ('22','CFG_BADWORD','禁用词语','','','3','2','艾滋病|中国共产党|111111111','0');
INSERT INTO `my_config` VALUES ('23','CFG_FEEDBACK_GUEST','允许匿名评论','','','4','2','1','0');
INSERT INTO `my_config` VALUES ('24','CFG_MEMBER_OPEN','开启会员功能','','','4','5','1','1');
INSERT INTO `my_config` VALUES ('25','CFG_MEMBER_VERIFYEMAIL',' 开启邮件验证','','','4','5','1','2');
INSERT INTO `my_config` VALUES ('26','CFG_MEMBER_NOTALLOW','禁止使用的昵称','','','3','5','www,bbs,ftp,mail,user,users,admin,administrator','8');
INSERT INTO `my_config` VALUES ('27','CFG_UPLOAD_MAXSIZE','允许上传大小','KB','','1','4','20480000','0');
INSERT INTO `my_config` VALUES ('28','CFG_IMGTHUMB_SIZE','缩略图组尺寸','','','2','4','300X300','0');
INSERT INTO `my_config` VALUES ('29','CFG_IMGTHUMB_TYPE','缩略图生成方式','固定大小截取 ,原图等比例缩略','radio\r\n0|原图等比例缩略\r\n1|固定大小截取','4','4','0','0');
INSERT INTO `my_config` VALUES ('30','CFG_IMGTHUMB_WIDTH','固宽缩略图组长度','固定宽度等比缩略,如60,50','','2','4','600','0');
INSERT INTO `my_config` VALUES ('31','CFG_UPLOAD_ROOTPATH','上传根目录','','','2','4','./uploads/','0');
INSERT INTO `my_config` VALUES ('32','CFG_UPLOAD_FILE_EXT','允许附件类型','','','3','4','jpg,gif,png,jpeg,txt,doc,docx,xls,ppt,zip,rar,mp3,mp4','0');
INSERT INTO `my_config` VALUES ('33','CFG_UPLOAD_IMG_EXT','允许图片类型','带缩略图的图片','','2','4','jpg,gif,png,jpeg','0');
INSERT INTO `my_config` VALUES ('34','CFG_VERIFY_REGISTER','开启注册验证码','','','4','2','1','0');
INSERT INTO `my_config` VALUES ('35','CFG_VERIFY_LOGIN','开启登录验证码','','','4','2','1','0');
INSERT INTO `my_config` VALUES ('36','CFG_VERIFY_GUESTBOOK','开启留言板验证码','','','4','2','1','0');
INSERT INTO `my_config` VALUES ('37','CFG_VERIFY_REVIEW','开启评论验证码','','','4','2','0','0');
INSERT INTO `my_config` VALUES ('38','CFG_SQL_FILESIZE','sql文件大小','备份数据库，值不可太大，否则会导致内存溢出备份、恢复失败，合理大小在512K~10M间，建议3M一卷。单位字节,5M=5*1024*1024=5242880','','1','4','5242880','0');
INSERT INTO `my_config` VALUES ('39','CFG_DOWNLOAD_HIDE','隐藏下载地址','','','4','4','0','0');
INSERT INTO `my_config` VALUES ('40','CFG_MOBILE_THEMESTYLE','手机模板风格','','select','2','1','mshouji','10');
INSERT INTO `my_config` VALUES ('41','CFG_DEFAULT_TPL','PC默认模版','','select','2','1','xqx@2017#','7');
INSERT INTO `my_config` VALUES ('42','CFG_DEFAULT_MOBILE_TPL','手机默认模板','','select','2','1','@shouji_xqx','9');
INSERT INTO `my_config` VALUES ('43','CFG_BAIDUSTATS','百度统计','','','3','1','','13');
INSERT INTO `my_config` VALUES ('44','CFG_MWEBURL','手机站域名','','','2','1','http://localhost:85/Mobile','3');
INSERT INTO `my_config` VALUES ('46','CFG_EMAIL_TITLE','邮件标题','','','2','6','','0');
INSERT INTO `my_config` VALUES ('47','CFG_EMAIL_TPL','邮件内容','','','3','6','','0');
INSERT INTO `my_config` VALUES ('48','WESYS_NAME','公众号名称','','','2','7','','0');
INSERT INTO `my_config` VALUES ('49','WESYS_ID','公众号原始id','','','2','7','','0');
INSERT INTO `my_config` VALUES ('50','WESYS_NUMBER','微信号','','','2','7','','0');
INSERT INTO `my_config` VALUES ('51','WESYS_APPID','AppID（公众号）','','','2','7','','0');
INSERT INTO `my_config` VALUES ('52','WESYS_APPSECRET','AppSecret','','','2','7','','0');
INSERT INTO `my_config` VALUES ('53','WESYS_TYPE','微信号类型','','select\r\n0|请选择公众号类型\r\n1|普通订阅号\r\n2|普通服务号\r\n3|认证订阅号\r\n4|认证服务号','2','7','0','0');
INSERT INTO `my_config` VALUES ('54','QQ_APPID','QQ APPID','','','2','8','203564','1');
INSERT INTO `my_config` VALUES ('55','QQ_APPKEY','QQ APP KEY','<a href=\"http://connect.qq.com/\" target=\"_blank\">点击此处</a>获取QQ互联APPID','','2','8','bab1f3acc0c67b69a1f470ac5e8dc36a','2');
INSERT INTO `my_config` VALUES ('56','SINA_APPID','新浪微博APPID','','','2','8','602735229','4');
INSERT INTO `my_config` VALUES ('57','SINA_APPKEY','新浪微博 APP KEY','<a href=\"http://open.weibo.com/\" target=\"_blank\">点击此处</a>获取新浪微博互联APP','','2','8','66781cbeab9fdb9b014a387ab6e943fe','5');
INSERT INTO `my_config` VALUES ('58','STORAGE_OPEN','是否开启云存储','','radio\r\n0|关闭\r\n1|开启','2','9','0','0');
INSERT INTO `my_config` VALUES ('59','ACCESSKEY','AccessKey','','','2','9','','0');
INSERT INTO `my_config` VALUES ('60','SECRETKEY','SecretKey','','','2','9','','0');
INSERT INTO `my_config` VALUES ('61','BUCKET','存储空间(bucket)','','','2','9','','0');
INSERT INTO `my_config` VALUES ('62','DOMAIN','访问域名(domain)','','','2','9','','0');
INSERT INTO `my_config` VALUES ('63','QQ_CALLBACK','QQ回调地址','<hr>','','2','8','http://localhost:90/Oauth-login-type-qq.html','3');
INSERT INTO `my_config` VALUES ('64','SINA_CALLBACK','微博回调地址','<hr>','','2','8','http://localhost:90/Oauth-login-type-sina.html','6');
INSERT INTO `my_config` VALUES ('65','LOGIN_SCORE','登录增加积分','','','1','5','2','4');
INSERT INTO `my_config` VALUES ('66','PUBLISH_SCORE','发帖增加积分','','','1','5','2','5');
INSERT INTO `my_config` VALUES ('67','REPLY_SCORE','回复增加积分','','','1','5','1','6');
INSERT INTO `my_config` VALUES ('68','REGISTER_SCORE','注册增加积分','','','1','5','2','3');
INSERT INTO `my_config` VALUES ('69','SIGN_SCORE','签到增加积分','','','1','5','1','7');
INSERT INTO `my_config` VALUES ('70','ALIPAY_EMAIL','支付宝收款帐号','','','2','10','','0');
INSERT INTO `my_config` VALUES ('71','ALIPAY_KEY','支付宝密钥','','','2','10','','0');
INSERT INTO `my_config` VALUES ('72','ALIPAY_PARTNER','支付宝合作者ID','支付宝申请地址：<a target=\"_blank\" href=\"https://www.alipay.com/\">立即申请</a>','','2','10','','0');
INSERT INTO `my_config` VALUES ('76','WECHAT_APPID','微信支付APPID','','','2','10','','0');
INSERT INTO `my_config` VALUES ('77','WECHAT_MCHID','微信支付MCHID','','','2','10','','0');
INSERT INTO `my_config` VALUES ('78','WECHAT_KEY','微信支付key','','','2','10','','0');
INSERT INTO `my_config` VALUES ('79','WECHAT_APPSECRET','微信支付APPSECRET','微信支付申请地址：<a target=\"_blank\" href=\"https://pay.weixin.qq.com/\">立即申请</a>','','2','10','','0');


# 转存表中的数据：my_copyfrom 


# 转存表中的数据：my_digg 
INSERT INTO `my_digg` VALUES ('1','4','11','23','1','0','1491449890');


# 转存表中的数据：my_forum 


# 转存表中的数据：my_forum_reply 


# 转存表中的数据：my_guestbook 


# 转存表中的数据：my_itemgroup 
INSERT INTO `my_itemgroup` VALUES ('1','flagtype','文档属性','0');
INSERT INTO `my_itemgroup` VALUES ('2','blocktype','自由块类别','0');
INSERT INTO `my_itemgroup` VALUES ('3','softtype','软件类型','0');
INSERT INTO `my_itemgroup` VALUES ('4','softlanguage','软件语言','0');
INSERT INTO `my_itemgroup` VALUES ('5','star','星座','0');
INSERT INTO `my_itemgroup` VALUES ('6','animal','生肖','0');
INSERT INTO `my_itemgroup` VALUES ('7','education','教育程度','0');
INSERT INTO `my_itemgroup` VALUES ('8','configgroup','配置分组','0');
INSERT INTO `my_itemgroup` VALUES ('9','configtype','配置变量类型','0');


# 转存表中的数据：my_iteminfo 
INSERT INTO `my_iteminfo` VALUES ('1','图片','flagtype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('2','头条','flagtype','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('3','推荐','flagtype','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('4','精华','flagtype','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('5','幻灯','flagtype','16','0','0');
INSERT INTO `my_iteminfo` VALUES ('6','跳转','flagtype','32','0','0');
INSERT INTO `my_iteminfo` VALUES ('7','其他','flagtype','64','0','0');
INSERT INTO `my_iteminfo` VALUES ('8','文字','blocktype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('9','图片','blocktype','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('10','丰富','blocktype','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('11','国产','softtype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('12','中文版','softlanguage','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('13','英文版','softlanguage','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('14','多语言版','softlanguage','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('15','白羊座','star','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('16','金牛座','star','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('17','双子座','star','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('18','巨蟹座','star','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('19','狮子座','star','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('20','处女座','star','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('21','天枰座','star','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('22','天蝎座','star','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('23','射手座','star','9','0','0');
INSERT INTO `my_iteminfo` VALUES ('24','摩羯座','star','10','0','0');
INSERT INTO `my_iteminfo` VALUES ('25','水瓶座','star','11','0','0');
INSERT INTO `my_iteminfo` VALUES ('26','双鱼座','star','12','0','0');
INSERT INTO `my_iteminfo` VALUES ('27','鼠','animal','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('28','牛','animal','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('29','虎','animal','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('30','兔','animal','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('31','龙','animal','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('32','蛇','animal','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('33','马','animal','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('34','羊','animal','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('35','猴','animal','9','0','0');
INSERT INTO `my_iteminfo` VALUES ('36','鸡','animal','10','0','0');
INSERT INTO `my_iteminfo` VALUES ('37','狗','animal','11','0','0');
INSERT INTO `my_iteminfo` VALUES ('38','猪','animal','12','0','0');
INSERT INTO `my_iteminfo` VALUES ('39','小学','education','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('40','初中','education','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('41','高中/中专','education','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('42','大学专科','education','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('43','大学本科','education','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('44','硕士','education','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('45','博士以上','education','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('46','站点配置','configgroup','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('47','核心配置','configgroup','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('48','邮箱配置','configgroup','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('49','上传配置','configgroup','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('50','会员配置','configgroup','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('51','帐号激活信','configgroup','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('52','数字','configtype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('53','字符','configtype','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('54','文本','configtype','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('55','布尔(真假)','configtype','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('56','公众号配置','configgroup','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('57','第三方登录配置','configgroup','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('58','七牛云存储','configgroup','9','0','0');
INSERT INTO `my_iteminfo` VALUES ('59','支付接口','configgroup','10','0','0');


# 转存表中的数据：my_link 
INSERT INTO `my_link` VALUES ('7','好分享','http://yq.w6g.com/','','','0','1490755810','1');


# 转存表中的数据：my_member 
INSERT INTO `my_member` VALUES ('23','123@qq.com','3b79d5262d4178835ed1010084192b2e','un4i5G','user1','0.00','107','/uploads/avatar/20170126/170126021215.jpg','1482412604','1491449244','0.0.0.0','35','3','0','0','0','','');
INSERT INTO `my_member` VALUES ('24','1172096750@qq.com','1654564bd5b726bd21ec7429ec51cdfa','rBbQka','user2','0.00','20','/uploads/avatar/20170204/170204072434.jpg','1485787255','1486647742','0.0.0.0','12','2','0','0','0','','');
INSERT INTO `my_member` VALUES ('25','504872033@qq.com','ebad0f9203c9c556ee350c19bf9fed29','TPaXA9','hxch1006','0.00','6','/uploads/avatar/25.jpg','1486097800','1491126554','0.0.0.0','4','1','0','0','0','','');
INSERT INTO `my_member` VALUES ('26','123456@qq.com','05d6bbcc835deba13c1c43fc15ed7679','jF6Me5','hxch1987','0.00','0','','1486098001','1486098263','0.0.0.0','2','2','0','0','0','','');


# 转存表中的数据：my_member_slog 
INSERT INTO `my_member_slog` VALUES ('1','23','1','','','+2','1491105290','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('2','23','1','对人生感悟的名言','','+1','1491105331','发表评论，积分+1');
INSERT INTO `my_member_slog` VALUES ('3','23','1','关于坚强的名人语录','','+1','1491105369','发表评论，积分+1');
INSERT INTO `my_member_slog` VALUES ('4','23','1','关于感动的名人名言','','+1','1491105398','发表评论，积分+1');
INSERT INTO `my_member_slog` VALUES ('5','23','1','精选2017微信签名最新版伤感说说','','+1','1491105421','发表评论，积分+1');
INSERT INTO `my_member_slog` VALUES ('6','25','1','','','+2','1491126555','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('7','25','1','王祖蓝-上海滩mv','','+1','1491126562','发表评论，积分+1');
INSERT INTO `my_member_slog` VALUES ('8','23','1','','','+2','1491449244','登录成功，积分+2');


# 转存表中的数据：my_memberdetail 
INSERT INTO `my_memberdetail` VALUES ('24','1','李四','李四','0000-00-00','0','0','北京,东城区,null,','1172096750','','13888888888','0','0','0','0','0','0','0','','1485879024','','好听！！！');
INSERT INTO `my_memberdetail` VALUES ('23','1','云木马','云木马','0000-00-00','0','0','河北,唐山,古冶区,','1172096750','','13888888888','0','0','0','0','0','0','0','','1485959813','JAVA开发工程师','这位童鞋很懒，什么也没有留下～～！');
INSERT INTO `my_memberdetail` VALUES ('26','0','','abc','1990-01-01','0','0','','','','','0','0','0','0','0','0','0','','1497848015','','');


# 转存表中的数据：my_membergroup 
INSERT INTO `my_membergroup` VALUES ('1','新手上路','','0','10','0','0');
INSERT INTO `my_membergroup` VALUES ('2','注册会员','','10','50','0','0');
INSERT INTO `my_membergroup` VALUES ('3','中级会员','','50','200','0','0');
INSERT INTO `my_membergroup` VALUES ('4','高级会员','','200','500','0','0');
INSERT INTO `my_membergroup` VALUES ('5','金牌会员','','500','1000','0','0');
INSERT INTO `my_membergroup` VALUES ('6','论坛元老','','1000','2000','0','0');


# 转存表中的数据：my_menu 
INSERT INTO `my_menu` VALUES ('1','常规管理','0','','','','0','1','1','fa-desktop');
INSERT INTO `my_menu` VALUES ('2','模块管理','0','','','','0','0','4','fa-stack-exchange');
INSERT INTO `my_menu` VALUES ('3','系统管理','0','','','','0','1','2','fa-gears');
INSERT INTO `my_menu` VALUES ('4','扩展管理','0','','','','0','1','5','fa-plug');
INSERT INTO `my_menu` VALUES ('5','栏目管理','1','','','','0','1','11','fa-bars');
INSERT INTO `my_menu` VALUES ('6','内容管理','1','','','','0','1','12','fa-file-text');
INSERT INTO `my_menu` VALUES ('7','快捷面板','1','','','','0','1','13','fa-dashboard');
INSERT INTO `my_menu` VALUES ('8','栏目管理','5','Category','index','','0','1','111','');
INSERT INTO `my_menu` VALUES ('9','广告管理','4','','','','0','1','22','fa-plug');
INSERT INTO `my_menu` VALUES ('10','自由块管理','35','Block','index','','0','1','211','');
INSERT INTO `my_menu` VALUES ('11','普通广告管理','9','Abc','index','','0','1','212','');
INSERT INTO `my_menu` VALUES ('12','专题管理','35','Special','index','','0','1','214','');
INSERT INTO `my_menu` VALUES ('13','公告管理','61','Announce','index','','0','1','215','');
INSERT INTO `my_menu` VALUES ('14','友情链接','44','Link','index','','0','1','416','');
INSERT INTO `my_menu` VALUES ('15','留言本管理','61','Guestbook','index','','0','1','217','');
INSERT INTO `my_menu` VALUES ('16','评论管理','61','Comment','index','','1','1','218','');
INSERT INTO `my_menu` VALUES ('17','系统设置','3','','','','0','1','31','fa-gears');
INSERT INTO `my_menu` VALUES ('18','会员管理','59','','','','0','1','33','fa-users');
INSERT INTO `my_menu` VALUES ('19','管理员管理','59','','','','0','1','34','fa-user');
INSERT INTO `my_menu` VALUES ('20','网站设置','17','System','site','','1','1','1','');
INSERT INTO `my_menu` VALUES ('21','伪静态|缓存设置','17','System','url','','0','1','312','');
INSERT INTO `my_menu` VALUES ('22','清除系统缓存','17','System','clearCache','','0','0','316','');
INSERT INTO `my_menu` VALUES ('23','在线客服设置','17','System','online','','0','1','313','');
INSERT INTO `my_menu` VALUES ('24','更新缓存','3','','','','0','1','32','fa-trash-o');
INSERT INTO `my_menu` VALUES ('25','一键更新全站','24','ClearHtml','all','','0','1','321','');
INSERT INTO `my_menu` VALUES ('26','更新首页','24','ClearHtml','home','','0','1','322','');
INSERT INTO `my_menu` VALUES ('27','更新栏目','24','ClearHtml','lists','','0','1','323','');
INSERT INTO `my_menu` VALUES ('28','更新文档','24','ClearHtml','shows','','0','1','324','');
INSERT INTO `my_menu` VALUES ('29','更新专题','24','ClearHtml','special','','0','1','325','');
INSERT INTO `my_menu` VALUES ('30','会员管理','18','Member','index','','1','1','2','');
INSERT INTO `my_menu` VALUES ('31','会员组管理','18','Membergroup','index','','0','1','332','');
INSERT INTO `my_menu` VALUES ('32','系统用户管理','19','Rbac','index','','0','1','341','');
INSERT INTO `my_menu` VALUES ('33','用户组设置','19','Rbac','role','','0','1','342','');
INSERT INTO `my_menu` VALUES ('34','节点列表','19','Rbac','node','','0','0','343','');
INSERT INTO `my_menu` VALUES ('35','系统模块管理','3','','','','0','1','33','fa-stack-exchange');
INSERT INTO `my_menu` VALUES ('36','我的账户','59','','','','0','1','42','fa-braille');
INSERT INTO `my_menu` VALUES ('37','模型管理','35','Model','index','','0','1','411','');
INSERT INTO `my_menu` VALUES ('38','菜单管理','35','Menu','index','','0','1','412','');
INSERT INTO `my_menu` VALUES ('39','数据库管理','63','Database','index','','0','1','4','');
INSERT INTO `my_menu` VALUES ('40','联动管理','35','Itemgroup','index','','0','1','414','');
INSERT INTO `my_menu` VALUES ('41','区域管理','44','Area','index','','0','1','415','');
INSERT INTO `my_menu` VALUES ('42','修改我的信息','36','Personal','index','','0','1','421','');
INSERT INTO `my_menu` VALUES ('43','修改密码','36','Personal','pwd','','0','1','422','');
INSERT INTO `my_menu` VALUES ('44','其他扩展','4','','','','0','1','24','fa-archive');
INSERT INTO `my_menu` VALUES ('45','已传文件管理','35','Attachment','index','','0','1','417','');
INSERT INTO `my_menu` VALUES ('46','数据元管理','35','Meta','index','','0','0','416','');
INSERT INTO `my_menu` VALUES ('47','模板管理','35','Templets','index','','0','0','428','');
INSERT INTO `my_menu` VALUES ('49','批量采集','60','Collect','index','','0','1','1','');
INSERT INTO `my_menu` VALUES ('48','tag管理','44','Tag','index','','1','1','418','');
INSERT INTO `my_menu` VALUES ('50','联盟广告管理','9','Union','index','','0','1','213','');
INSERT INTO `my_menu` VALUES ('51','更新sitemap','17','Sitemap','index','','1','1','317','');
INSERT INTO `my_menu` VALUES ('52','搜索词管理','44','Search','index','','0','1','419','');
INSERT INTO `my_menu` VALUES ('53','属性管理','62','Property','index','','0','1','4','');
INSERT INTO `my_menu` VALUES ('54','属性值管理','62','Property_value','index','','0','1','5','');
INSERT INTO `my_menu` VALUES ('55','批量入库','44','Importimgs','index','','0','1','417','');
INSERT INTO `my_menu` VALUES ('56','采集到的内容','60','Temp','index','','0','1','3','');
INSERT INTO `my_menu` VALUES ('57','单页采集','60','Collect','page','','0','1','2','');
INSERT INTO `my_menu` VALUES ('58','论坛回复管理','61','Forum_reply','index','','0','1','219','');
INSERT INTO `my_menu` VALUES ('59','用户管理','0','','','','0','1','3','fa-users');
INSERT INTO `my_menu` VALUES ('60','采集管理','4','','','','0','1','22','fa-cloud-download');
INSERT INTO `my_menu` VALUES ('61','消息管理','4','','','','0','1','21','fa-comments');
INSERT INTO `my_menu` VALUES ('62','属性管理','4','','','','0','1','23','fa-flag');
INSERT INTO `my_menu` VALUES ('63','数据库管理','3','','','','0','1','34','fa-database');


# 转存表中的数据：my_meta 
INSERT INTO `my_meta` VALUES ('1','1','HOME_URL_MODEL','2');
INSERT INTO `my_meta` VALUES ('2','1','HOME_URL_PATHINFO_DEPR','-');
INSERT INTO `my_meta` VALUES ('3','1','HOME_URL_ROUTER_ON','1');
INSERT INTO `my_meta` VALUES ('4','1','HOME_URL_ROUTE_RULES','Mobile$=>Mobile/Index/index\r\nSpecial/:id\\d=>Special/shows\r\n:e/p/:p\\d=>List/index\r\n:e/:id\\d=>Show/index\r\n/^(\\w+)$/=>List/index?e=:1\r\ntagname/:tagname=>Tag/index');
INSERT INTO `my_meta` VALUES ('5','1','HOME_HTML_CACHE_ON','1');
INSERT INTO `my_meta` VALUES ('6','1','MOBILE_HTML_CACHE_ON','0');
INSERT INTO `my_meta` VALUES ('7','1','HTML_CACHE_INDEX_ON','1');
INSERT INTO `my_meta` VALUES ('8','1','HTML_CACHE_INDEX_TIME','1200');
INSERT INTO `my_meta` VALUES ('9','1','HTML_CACHE_LIST_ON','1');
INSERT INTO `my_meta` VALUES ('10','1','HTML_CACHE_LIST_TIME','0');
INSERT INTO `my_meta` VALUES ('11','1','HTML_CACHE_SHOW_ON','1');
INSERT INTO `my_meta` VALUES ('12','1','HTML_CACHE_SHOW_TIME','1200');
INSERT INTO `my_meta` VALUES ('15','9','ONLINE_CFG_MODE','1');
INSERT INTO `my_meta` VALUES ('13','1','HTML_CACHE_SPECIAL_ON','1');
INSERT INTO `my_meta` VALUES ('14','1','HTML_CACHE_SPECIAL_TIME','0');
INSERT INTO `my_meta` VALUES ('16','9','ONLINE_CFG_STYLE','blue');
INSERT INTO `my_meta` VALUES ('17','9','ONLINE_CFG_H','1');
INSERT INTO `my_meta` VALUES ('18','9','ONLINE_CFG_H_MARGIN','0');
INSERT INTO `my_meta` VALUES ('19','9','ONLINE_CFG_V','2');
INSERT INTO `my_meta` VALUES ('20','9','ONLINE_CFG_V_MARGIN','0');
INSERT INTO `my_meta` VALUES ('21','9','ONLINE_CFG_QQ','1172096750$$$点击咨询\r\n1172096750$$$点击留言');
INSERT INTO `my_meta` VALUES ('22','9','ONLINE_CFG_WANGWANG','hxch1006$$$在线旺旺...');
INSERT INTO `my_meta` VALUES ('23','9','ONLINE_CFG_PHONE_ON','1');
INSERT INTO `my_meta` VALUES ('24','9','ONLINE_CFG_PHONE','08713838438');
INSERT INTO `my_meta` VALUES ('25','9','ONLINE_CFG_GUESTBOOK_ON','1');
INSERT INTO `my_meta` VALUES ('26','9','ONLINE_CFG_QQ_PARAM','<a target=\'_blank\' href=\"http://wpa.qq.com/msgrd?v=3&uin=[客服号]&site=qq&menu=yes\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:[客服号]:51\" alt=\"[客服说明]\" title=\"[客服说明]\"/></a>');
INSERT INTO `my_meta` VALUES ('27','9','ONLINE_CFG_WANGWANG_PARAM','<a target=\"_blank\" href=\"http://www.taobao.com/webww/ww.php?ver=3&touid=[客服号]&siteid=cntaobao&status=1&charset=utf-8\" ><img border=\"0\" src=\"http://amos.alicdn.com/online.aw?v=2&uid=[客服号]&site=cntaobao&s=10&charset=UTF-8\" alt=\"[客服说明]\" /></a>');


# 转存表中的数据：my_model 
INSERT INTO `my_model` VALUES ('1','文章模型','','article','1','','List_article.html','Show_article.html','1');
INSERT INTO `my_model` VALUES ('2','单页模型','','page','1','','List_page.html','Show_page.html','2');
INSERT INTO `my_model` VALUES ('3','产品模型','','product','1','','List_product.html','Show_product.html','3');
INSERT INTO `my_model` VALUES ('4','图片模型','','picture','1','','List_picture.html','Show_picture.html','4');
INSERT INTO `my_model` VALUES ('5','下载模型','','soft','1','','List_soft.html','Show_soft.html','5');
INSERT INTO `my_model` VALUES ('7','话题模型','','topic','1','','List_topic.html','Show_topic.html','6');
INSERT INTO `my_model` VALUES ('8','专题模型','','special','1','','List_special.html','Show_special.html','7');
INSERT INTO `my_model` VALUES ('9','论坛模型','','forum','1','','List_forum.html','Show_forum.html','8');
INSERT INTO `my_model` VALUES ('10','音乐模型','','music','1','','List_music.html','Show_music.html','9');
INSERT INTO `my_model` VALUES ('11','视频模型','','video','1','','List_video.html','Show_video.html','10');


# 转存表中的数据：my_music 
INSERT INTO `my_music` VALUES ('1','Home - 高音质原版伴奏 - Micheal Bulble','','','','管理员','','/uploads/img1/20170402/58e0c54a2ae6b.jpg!300X300.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\"><strong>Home - 高音质原版歌词</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; line-height: 30px; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">原唱：Micheal Bulble</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; line-height: 30px; white-space: normal;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Another summer day</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">又一个夏天</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">has come and gone away</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">来了又走</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">In Paris and Rome</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">无论在巴黎或是罗马</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">but I wanna go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我只想回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Maybe surrounded by</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">尽管四周</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">a million people I</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">人群围绕</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">still feel all alone</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我仍感到孤单</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I just wanna go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我只想回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I miss you you know</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">亲爱的 我想你 你是知道的</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">And I&#39;ve been keeping all the letters</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我保留着所有</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">that I wrote to you</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">写给你的信</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Each one a line or two</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">每一行 每一个字</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I&#39;m fine baby how are you</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">亲爱的 我很好 那你呢</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I would send them but I know that it&#39;s just not enough</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我想把这些信寄给你，但我知道，这远不够</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">My words were cold and flat</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我的语言平淡无奇</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">And you deserve more than that</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">你应得到的远不址这些</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Another aeroplane another sunny place</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">又一个机场 又一个沐浴阳光之地</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I m lucky I know</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我很幸运 我知道</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">but I wanna go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">但我只想回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I ve got to go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我得回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Let me go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">让我回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I m just too far</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">因为我离你</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">From where you are</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">如此遥远</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I wanna come home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我想回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">And I feel just like I&#39;m living</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我感觉仿佛我过着</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">someone else&#39;s life</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">别人的生活</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">It&#39;s like I just stepped outside</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">总感觉我似乎置身其外</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">when everything was going right</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">哪怕事事皆顺利</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">And I know just why you could not come along with me</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我知道为何你不能与我同行</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">This was not your dream</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">因为那不是你的梦想</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">but you always believed in me</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">然而你一直相信我</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Another winter day</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">又一个冬天</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Has come and gone away</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">来了又走</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">in either Paris or Rome</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">无论在巴黎还是罗马</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">and I wanna go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我只想回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Let me go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">让我回家吧</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">And I&#39;m surrounded by</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">尽管四周</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">A million people I</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">人群围绕</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">still feel alone</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我仍感到孤单</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Let me go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">让我回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Oh I miss you you know</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我想你 你知道的</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Let me go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">让我回家吧</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I ve had my run</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我在奔跑</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">baby I m done</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">宝贝 我已经在路上</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I ve gotta go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我要回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">Let me go home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">让我回家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">It&#39;ll all be alright</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">一切都会好的</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I ll be home tonight</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">今晚我会到家</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">I m coming back home</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Simsun; font-size: 15px; white-space: normal; text-align: center; line-height: 1.75em;\">我就要回家了</p><p><br/></p>','Home - 高音质原版歌词\r\n原唱：Micheal Bulble\r\nAnother summer day又一个夏天\r\nhas come and gone away来了又走\r\nIn Paris and Rome无论在巴黎或是罗马...','1491125363','1491126484','2','26','1','5','','1','0','1','0','0','Home,Micheal Bulble','','1','/uploads/file1/20170402/58e0c551d914c.mp3');
INSERT INTO `my_music` VALUES ('2','默-网友翻唱','','','','管理员','','/uploads/img1/20170402/58e0c637b307f.jpg!300X300.jpg','<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">默- 网友翻唱</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">词：尹约</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">曲：钱雷</span></p><p><span style=\"color:#333333;font-family:Microsoft YaHei, Arial, Tahoma, hiragino sans gb, Helvetica\"><span style=\"font-size: 14px; line-height: 22.4px;\">原唱：那英<br/></span></span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">忍不住化身一条固执的鱼</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">逆着洋流独自游到底</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">年少时候虔诚发过的誓</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">沉默地沉没在深海里</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">重温几次</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">结局还是 失去你</span><br/><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">我被爱判处终身孤寂</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">不还手 不放手</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">笔下画不完的圆</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">心间填不满的缘</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">是你</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">为何爱判处众生孤寂</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">挣不脱 逃不过</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">眉头解不开的结</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">命中解不开的劫</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">是你</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">眉头解不开的结</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">命中解不开的劫</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Arial, Tahoma, &#39;hiragino sans gb&#39;, Helvetica; font-size: 14px; line-height: 22.4px; background-color: rgb(255, 255, 255);\">是你</span></p>','默- 网友翻唱\r\n词：尹约曲：钱雷\r\n原唱：那英\r\n忍不住化身一条固执的鱼\r\n逆着洋流独自游到底\r\n年少时候虔诚发过的誓\r\n沉默地沉没在深海里\r\n...','1491125719','1491126031','2','27','1','5','','1','0','1','0','0','','','1','/uploads/file1/20170402/58e0c643cbdbb.mp3');
INSERT INTO `my_music` VALUES ('3','演员 - 网友翻唱','','','','管理员','','/uploads/img1/20170402/58e0c86abf883.jpg!300X300.jpg','<p style=\"text-align: center;\">演员 - 薛之谦</p><p style=\"text-align: center;\">词：薛之谦 曲：薛之谦</p><p style=\"text-align: center;\">简单点说话的方式简单点</p><p style=\"text-align: center;\">递进的情绪请省略</p><p style=\"text-align: center;\">你又不是个演员</p><p style=\"text-align: center;\">别设计那些情节</p><p style=\"text-align: center;\">没意见我只想看看你怎么圆</p><p style=\"text-align: center;\">你难过的太表面 像没天赋的演员</p><p style=\"text-align: center;\">观众一眼能看见</p><p style=\"text-align: center;\">该配合你演出的我演视而不见</p><p style=\"text-align: center;\">在逼一个最爱你的人即兴表演</p><p style=\"text-align: center;\">什么时候我们开始收起了底线</p><p style=\"text-align: center;\">顺应时代的改变看那些拙劣的表演</p><p style=\"text-align: center;\">可你曾经那么爱我干嘛演出细节</p><p style=\"text-align: center;\">我该变成什么样子才能延缓厌倦</p><p style=\"text-align: center;\">原来当爱放下防备后的这些那些</p><p style=\"text-align: center;\">才是考验</p><p style=\"text-align: center;\">没意见你想怎样我都随便</p><p style=\"text-align: center;\">你演技也有限</p><p style=\"text-align: center;\">又不用说感言</p><p style=\"text-align: center;\">分开就平淡些</p><p style=\"text-align: center;\">该配合你演出的我演视而不见</p><p style=\"text-align: center;\">别逼一个最爱你的人即兴表演</p><p style=\"text-align: center;\">什么时候我们开始没有了底线</p><p style=\"text-align: center;\">顺着别人的谎言被动就不显得可怜</p><p style=\"text-align: center;\">可你曾经那么爱我干嘛演出细节</p><p style=\"text-align: center;\">我该变成什么样子才能配合出演</p><p style=\"text-align: center;\">原来当爱放下防备后的这些那些</p><p style=\"text-align: center;\">都有个期限</p><p style=\"text-align: center;\">其实台下的观众就我一个</p><p style=\"text-align: center;\">其实我也看出你有点不舍</p><p style=\"text-align: center;\">场景也习惯我们来回拉扯</p><p style=\"text-align: center;\">还计较着什么</p><p style=\"text-align: center;\">其实说分不开的也不见得</p><p style=\"text-align: center;\">其实感情最怕的就是拖着</p><p style=\"text-align: center;\">越演到重场戏越哭不出了</p><p style=\"text-align: center;\">是否还值得</p><p style=\"text-align: center;\">该配合你演出的我尽力在表演</p><p style=\"text-align: center;\">像情感节目里的嘉宾任人挑选</p><p style=\"text-align: center;\">如果还能看出我有爱你的那面</p><p style=\"text-align: center;\">请剪掉那些情节让我看上去体面</p><p style=\"text-align: center;\">可你曾经那么爱我干嘛演出细节</p><p style=\"text-align: center;\">不在意的样子是我最后的表演</p><p style=\"text-align: center;\">是因为爱你我才选择表演 这种成全</p><p><br/></p>','演员 - 薛之谦词：薛之谦 曲：薛之谦\r\n简单点说话的方式简单点\r\n递进的情绪请省略\r\n你又不是个演员\r\n别设计那些情节...','1491126188','1497454793','5','27','1','5','','1','0','1','0','0','','','1','/uploads/file1/20170402/58e0c87513118.mp3');


# 转存表中的数据：my_node 
INSERT INTO `my_node` VALUES ('1','Manage','后台应用','1','','1','0','1');
INSERT INTO `my_node` VALUES ('2','Rbac','用户权限管理','1','','1','1','2');
INSERT INTO `my_node` VALUES ('3','index','用户列表','1','','1','2','3');
INSERT INTO `my_node` VALUES ('4','addUser','添加用户','1','','2','2','3');
INSERT INTO `my_node` VALUES ('5','editUser','编辑用户','1','','3','2','3');
INSERT INTO `my_node` VALUES ('6','delUser','删除用户','1','','4','2','3');
INSERT INTO `my_node` VALUES ('7','Index','前台应用','1','','2','0','1');
INSERT INTO `my_node` VALUES ('8','role','用户组列表','1','','5','2','3');
INSERT INTO `my_node` VALUES ('9','addRole','添加用户组','1','','6','2','3');
INSERT INTO `my_node` VALUES ('10','editRole','编辑用户组','1','','7','2','3');
INSERT INTO `my_node` VALUES ('11','delRole','删除用户组','1','','8','2','3');
INSERT INTO `my_node` VALUES ('12','access','权限管理','1','','9','2','3');
INSERT INTO `my_node` VALUES ('13','node','节点列表','0','','10','2','3');
INSERT INTO `my_node` VALUES ('14','addNode','添加节点','0','','11','2','3');
INSERT INTO `my_node` VALUES ('15','editNode','编辑节点','0','','12','2','3');
INSERT INTO `my_node` VALUES ('16','delNode','删除节点','0','','13','2','3');
INSERT INTO `my_node` VALUES ('17','System','系统设置','1','','2','1','2');
INSERT INTO `my_node` VALUES ('18','site','网站设置','1','','1','17','3');
INSERT INTO `my_node` VALUES ('19','Model','模型管理','1','','3','1','2');
INSERT INTO `my_node` VALUES ('20','index','模型列表','1','','1','19','3');
INSERT INTO `my_node` VALUES ('21','add','添加模型','1','','2','19','3');
INSERT INTO `my_node` VALUES ('22','edit','模型修改','1','','3','19','3');
INSERT INTO `my_node` VALUES ('23','del','删除模型','1','','4','19','3');
INSERT INTO `my_node` VALUES ('24','sort','更新排序','1','','5','19','3');
INSERT INTO `my_node` VALUES ('25','Category','栏目管理','1','','4','1','2');
INSERT INTO `my_node` VALUES ('26','index','栏目列表','1','','1','25','3');
INSERT INTO `my_node` VALUES ('27','add','添加栏目','1','','2','25','3');
INSERT INTO `my_node` VALUES ('28','edit','修改栏目','1','','3','25','3');
INSERT INTO `my_node` VALUES ('29','del','删除栏目','1','','4','25','3');
INSERT INTO `my_node` VALUES ('30','sort','更新栏目排序','1','','5','25','3');
INSERT INTO `my_node` VALUES ('31','Member','会员管理','1','','5','1','2');
INSERT INTO `my_node` VALUES ('32','index','会员列表','1','','1','31','3');
INSERT INTO `my_node` VALUES ('33','add','添加会员','1','','2','31','3');
INSERT INTO `my_node` VALUES ('34','edit','编辑会员','1','','3','31','3');
INSERT INTO `my_node` VALUES ('35','del','删除会员','1','','4','31','3');
INSERT INTO `my_node` VALUES ('36','Membergroup','会员组管理','1','','6','1','2');
INSERT INTO `my_node` VALUES ('37','index','会员组列表','1','','1','36','3');
INSERT INTO `my_node` VALUES ('38','add','添加会员组','1','','2','36','3');
INSERT INTO `my_node` VALUES ('39','edit','编辑会员组','1','','3','36','3');
INSERT INTO `my_node` VALUES ('40','del','删除会员组','1','','4','36','3');
INSERT INTO `my_node` VALUES ('41','Announce','公告管理','1','','7','1','2');
INSERT INTO `my_node` VALUES ('42','index','公告列表','1','','1','41','3');
INSERT INTO `my_node` VALUES ('43','add','添加公告','1','','2','41','3');
INSERT INTO `my_node` VALUES ('44','edit','编辑公告','1','','3','41','3');
INSERT INTO `my_node` VALUES ('45','del','删除公告','1','','4','41','3');
INSERT INTO `my_node` VALUES ('46','Link','友情链接','1','','8','1','2');
INSERT INTO `my_node` VALUES ('47','index','友情列表','1','','1','46','3');
INSERT INTO `my_node` VALUES ('48','add','添加友情','1','','2','46','3');
INSERT INTO `my_node` VALUES ('49','edit','编辑友情','1','','3','46','3');
INSERT INTO `my_node` VALUES ('50','del','删除友情','1','','4','46','3');
INSERT INTO `my_node` VALUES ('51','Guestbook','留言本管理','1','','9','1','2');
INSERT INTO `my_node` VALUES ('52','index','留言本列表','1','','1','51','3');
INSERT INTO `my_node` VALUES ('53','reply','回复留言','1','','2','51','3');
INSERT INTO `my_node` VALUES ('54','del','删除留言','1','','3','51','3');
INSERT INTO `my_node` VALUES ('55','clearCache','清除缓存','1','','2','17','3');
INSERT INTO `my_node` VALUES ('56','Personal','我的账户','1','','10','1','2');
INSERT INTO `my_node` VALUES ('57','index','修改资料','1','','1','56','3');
INSERT INTO `my_node` VALUES ('58','pwd','修改密码','1','','2','56','3');
INSERT INTO `my_node` VALUES ('59','Comment','评论管理','1','','10','1','2');
INSERT INTO `my_node` VALUES ('60','index','评论列表','1','','1','59','3');
INSERT INTO `my_node` VALUES ('61','edit','编辑评论','1','','2','59','3');
INSERT INTO `my_node` VALUES ('62','del','删除评论','1','','3','59','3');
INSERT INTO `my_node` VALUES ('63','Area','区域管理','1','','12','1','2');
INSERT INTO `my_node` VALUES ('64','index','区域列表','1','','1','63','3');
INSERT INTO `my_node` VALUES ('65','add','添加区域','1','','2','63','3');
INSERT INTO `my_node` VALUES ('66','edit','编辑区域','1','','3','63','3');
INSERT INTO `my_node` VALUES ('67','del','删除区域','1','','4','63','3');
INSERT INTO `my_node` VALUES ('68','Itemgroup','联动组管理','1','','13','1','2');
INSERT INTO `my_node` VALUES ('69','index','联动组列表','1','','1','68','3');
INSERT INTO `my_node` VALUES ('70','add','添加联动组','1','','2','68','3');
INSERT INTO `my_node` VALUES ('71','edit','编辑联动组','1','','3','68','3');
INSERT INTO `my_node` VALUES ('72','del','删除联动组','1','','4','68','3');
INSERT INTO `my_node` VALUES ('73','Iteminfo','联动管理','1','','14','1','2');
INSERT INTO `my_node` VALUES ('74','index','联动列表','1','','1','73','3');
INSERT INTO `my_node` VALUES ('75','add','添加联动','1','','2','73','3');
INSERT INTO `my_node` VALUES ('76','edit','编辑联动','1','','3','73','3');
INSERT INTO `my_node` VALUES ('77','del','删除联动','1','','4','73','3');
INSERT INTO `my_node` VALUES ('78','sort','更新排序','1','','5','73','3');
INSERT INTO `my_node` VALUES ('79','Special','专题管理','1','','15','1','2');
INSERT INTO `my_node` VALUES ('80','index','专题列表','1','','1','79','3');
INSERT INTO `my_node` VALUES ('81','add','添加专题','1','','2','79','3');
INSERT INTO `my_node` VALUES ('82','edit','编辑专题','1','','3','79','3');
INSERT INTO `my_node` VALUES ('83','del','删除专题','1','','4','79','3');
INSERT INTO `my_node` VALUES ('84','trach','回收站','1','','5','79','3');
INSERT INTO `my_node` VALUES ('85','restore','还原专题','1','','6','79','3');
INSERT INTO `my_node` VALUES ('86','clear','彻底删除','1','','7','79','3');
INSERT INTO `my_node` VALUES ('87','Block','自由块管理','1','','16','1','2');
INSERT INTO `my_node` VALUES ('88','index','自由块列表','1','','1','87','3');
INSERT INTO `my_node` VALUES ('89','add','添加自由块','1','','2','87','3');
INSERT INTO `my_node` VALUES ('90','edit','编辑自由块','1','','3','87','3');
INSERT INTO `my_node` VALUES ('91','del','删除自由块','1','','4','87','3');
INSERT INTO `my_node` VALUES ('92','Database','数据库管理','1','','17','1','2');
INSERT INTO `my_node` VALUES ('93','index','数据表列表','1','','1','92','3');
INSERT INTO `my_node` VALUES ('94','backup','数据库备份','1','','2','92','3');
INSERT INTO `my_node` VALUES ('95','optimize','数据表优化','1','','3','92','3');
INSERT INTO `my_node` VALUES ('96','repair','数据表修复','1','','4','92','3');
INSERT INTO `my_node` VALUES ('97','restore','还原管理','1','','5','92','3');
INSERT INTO `my_node` VALUES ('98','restoreData','数据恢复','1','','6','92','3');
INSERT INTO `my_node` VALUES ('99','delSqlFiles','删除文件','1','','7','92','3');
INSERT INTO `my_node` VALUES ('100','url','伪静态缓存设置','1','','3','17','3');
INSERT INTO `my_node` VALUES ('101','ClearHtml','静态缓存管理','1','','18','1','2');
INSERT INTO `my_node` VALUES ('102','all','一键更新全站','1','','1','101','3');
INSERT INTO `my_node` VALUES ('103','home','更新首页','1','','2','101','3');
INSERT INTO `my_node` VALUES ('104','lists','更新栏目','1','','3','101','3');
INSERT INTO `my_node` VALUES ('105','shows','更新文档','1','','4','101','3');
INSERT INTO `my_node` VALUES ('106','special','更新专题','1','','5','101','3');
INSERT INTO `my_node` VALUES ('107','Menu','菜单管理','1','','19','1','2');
INSERT INTO `my_node` VALUES ('108','index','菜单列表','1','','1','107','3');
INSERT INTO `my_node` VALUES ('109','add','添加菜单','1','','2','107','3');
INSERT INTO `my_node` VALUES ('110','edit','修改菜单','1','','3','107','3');
INSERT INTO `my_node` VALUES ('111','sort','排序更新','1','','4','107','3');
INSERT INTO `my_node` VALUES ('112','qk','快捷更新','1','','5','107','3');
INSERT INTO `my_node` VALUES ('113','del','删除菜单','1','','6','107','3');
INSERT INTO `my_node` VALUES ('114','Attachment','已上传文件管理','1','','20','1','2');
INSERT INTO `my_node` VALUES ('115','index','文件列表','1','','1','114','3');
INSERT INTO `my_node` VALUES ('116','del','删除文件','1','','4','114','3');
INSERT INTO `my_node` VALUES ('117','Abc','广告管理','1','','21','1','2');
INSERT INTO `my_node` VALUES ('118','index','广告位列表','1','','1','117','3');
INSERT INTO `my_node` VALUES ('119','add','添加广告位','1','','2','117','3');
INSERT INTO `my_node` VALUES ('120','edit','修改广告位','1','','3','117','3');
INSERT INTO `my_node` VALUES ('121','del','删除广告位','1','','4','117','3');
INSERT INTO `my_node` VALUES ('122','detail','广告列表','1','','5','117','3');
INSERT INTO `my_node` VALUES ('123','addDetail','添加广告','1','','6','117','3');
INSERT INTO `my_node` VALUES ('124','editDetail','修改广告','1','','7','117','3');
INSERT INTO `my_node` VALUES ('125','sort','更新广告排序','1','','7','117','3');
INSERT INTO `my_node` VALUES ('126','getcode','获取广告代码','1','','8','117','3');
INSERT INTO `my_node` VALUES ('127','delDetail','删除广告','1','','9','117','3');
INSERT INTO `my_node` VALUES ('128','Templets','模板管理','1','','22','1','2');
INSERT INTO `my_node` VALUES ('129','index','模板列表','1','','1','128','3');
INSERT INTO `my_node` VALUES ('130','add','添加模板','1','','2','128','3');
INSERT INTO `my_node` VALUES ('131','edit','修改模板','1','','3','128','3');
INSERT INTO `my_node` VALUES ('132','del','删除模板','1','','4','128','3');


# 转存表中的数据：my_oauth_user 


# 转存表中的数据：my_orderaction 


# 转存表中的数据：my_orderdetail 


# 转存表中的数据：my_orderinfo 


# 转存表中的数据：my_pay 


# 转存表中的数据：my_pay_month 


# 转存表中的数据：my_picture 


# 转存表中的数据：my_product 


# 转存表中的数据：my_property 
INSERT INTO `my_property` VALUES ('1','0','0','尺寸','','1','0','1501904676','');
INSERT INTO `my_property` VALUES ('2','0','0','颜色','','1','0','1501904687','');


# 转存表中的数据：my_property_value 
INSERT INTO `my_property_value` VALUES ('1','2','黑色','1501905911');
INSERT INTO `my_property_value` VALUES ('2','2','白色','1501905926');
INSERT INTO `my_property_value` VALUES ('3','2','橙色','1501905937');
INSERT INTO `my_property_value` VALUES ('4','2','黄色','1501905951');
INSERT INTO `my_property_value` VALUES ('5','1','38毫米','1501905969');
INSERT INTO `my_property_value` VALUES ('6','1','42毫米','1501905985');


# 转存表中的数据：my_role 
INSERT INTO `my_role` VALUES ('1','管理员','0','1','管理员');


# 转存表中的数据：my_role_user 
INSERT INTO `my_role_user` VALUES ('1','2');


# 转存表中的数据：my_search 
INSERT INTO `my_search` VALUES ('1','0','mv','0','1','2','1491124391','0','::1','http://localhost:85/video');


# 转存表中的数据：my_soft 


# 转存表中的数据：my_special 


# 转存表中的数据：my_tag 
INSERT INTO `my_tag` VALUES ('1','article','1','坚强','1','1','1','1491104259','0');
INSERT INTO `my_tag` VALUES ('2','article','3','人生感悟','1','1','2','1491104271','0');
INSERT INTO `my_tag` VALUES ('3','article','2','最坏的打算','1','1','2','1491104293','0');
INSERT INTO `my_tag` VALUES ('4','article','1','以诚待人','1','1','1','1491104371','0');
INSERT INTO `my_tag` VALUES ('5','article','3','爱情','1','1','1','1491104552','0');
INSERT INTO `my_tag` VALUES ('6','article','3','签名','1','1','1','1491104552','0');
INSERT INTO `my_tag` VALUES ('7','article','1','感动','1','1','1','1491104626','0');
INSERT INTO `my_tag` VALUES ('8','article','3','微信签名','1','1','1','1491104753','0');
INSERT INTO `my_tag` VALUES ('9','article','3','伤感说说','1','1','1','1491104753','0');
INSERT INTO `my_tag` VALUES ('10','article','1','人生志向','1','1','2','1491104835','0');
INSERT INTO `my_tag` VALUES ('11','article','2','搞笑','1','1','1','1491104933','0');
INSERT INTO `my_tag` VALUES ('12','article','2','人生格言','1','1','1','1491104933','0');
INSERT INTO `my_tag` VALUES ('13','article','1','培根','1','1','1','1491105099','0');
INSERT INTO `my_tag` VALUES ('14','article','4','散文鉴赏','1','1','5','1491110621','0');
INSERT INTO `my_tag` VALUES ('15','article','24','大鱼海棠','1','1','1','1491121415','0');
INSERT INTO `my_tag` VALUES ('16','article','24','熊本熊','1','1','1','1491121568','0');
INSERT INTO `my_tag` VALUES ('17','article','24','盗墓笔记','1','1','1','1491121685','0');
INSERT INTO `my_tag` VALUES ('18','article','24','诛仙青云志','1','1','1','1491121868','0');
INSERT INTO `my_tag` VALUES ('19','article','24','李易峰','1','1','1','1491121868','0');
INSERT INTO `my_tag` VALUES ('20','article','24','老九门剧照','1','1','1','1491121983','0');
INSERT INTO `my_tag` VALUES ('21','article','24','老九门壁纸','1','1','1','1491121983','0');
INSERT INTO `my_tag` VALUES ('22','article','24','新海诚','1','1','2','1491122127','0');
INSERT INTO `my_tag` VALUES ('23','article','24','你的名字','1','1','2','1491122127','0');
INSERT INTO `my_tag` VALUES ('24','article','24','桌面壁纸','1','1','1','1491122262','0');
INSERT INTO `my_tag` VALUES ('25','article','25','QQ表情包','1','1','1','1491122396','0');
INSERT INTO `my_tag` VALUES ('26','article','25','表情包','1','1','2','1491122463','0');
INSERT INTO `my_tag` VALUES ('27','article','23','龙猫','1','1','1','1491122836','0');
INSERT INTO `my_tag` VALUES ('28','article','23','内涵搞笑','1','1','1','1491122976','0');
INSERT INTO `my_tag` VALUES ('29','article','23','渥美冬留','1','1','1','1491123054','0');
INSERT INTO `my_tag` VALUES ('30','article','23','漫画少女系列','1','1','2','1491123171','0');
INSERT INTO `my_tag` VALUES ('31','video','29','李玲玉','1','1','1','1491124427','0');
INSERT INTO `my_tag` VALUES ('32','video','29','情网mv','1','1','1','1491124427','0');
INSERT INTO `my_tag` VALUES ('33','article','29','邓紫棋','1','1','4','1491124673','0');
INSERT INTO `my_tag` VALUES ('34','video','29','夜空中最亮的星','1','1','1','1491124673','0');
INSERT INTO `my_tag` VALUES ('35','video','29','王祖蓝','1','1','2','1491124790','0');
INSERT INTO `my_tag` VALUES ('36','video','29','上海滩mv','1','1','2','1491124790','0');
INSERT INTO `my_tag` VALUES ('37','music','27','Home','1','1','4','1491125598','0');
INSERT INTO `my_tag` VALUES ('38','music','27','Micheal Bulble','1','1','4','1491125598','0');
INSERT INTO `my_tag` VALUES ('39','picture','4','周杰伦壁纸','1','1','2','1497453185','0');
INSERT INTO `my_tag` VALUES ('40','picture','4','周杰伦图片','1','1','2','1497453185','0');
INSERT INTO `my_tag` VALUES ('41','soft','32','学唱歌','1','1','4','1497587659','0');
INSERT INTO `my_tag` VALUES ('42','soft','32','唱歌技巧和发声方法','1','1','4','1497587659','0');
INSERT INTO `my_tag` VALUES ('48','article','24','你不是真正的快乐','1','1','1','1501936325','0');
INSERT INTO `my_tag` VALUES ('49','article','24','五月天','1','1','1','1501936325','0');
INSERT INTO `my_tag` VALUES ('50','article','24','','1','1','1','1501936325','0');


# 转存表中的数据：my_temp 
INSERT INTO `my_temp` VALUES ('123','腾讯QQ群机器人服务调整中：QQ小冰、Baby Q被关闭','','管理员','腾讯QQ群,群机器人','/uploads/img1/20170811/d82e3b4b30832fdb4e56c23cee880638.jpg!300X300.jpg','IT之家7月30日消息 在今年3月中旬，微软小冰和腾讯QQ合作把QQ小冰机器人带到了QQ群，QQ群群主可以邀请小冰进群，小冰就可以与群用户进行实时对话，还支持支持语音和图像的多感官交流。除了聊天功能外，QQ群聊小冰还开放了测天气、猜成语、占','http://www.qqseller.com/QQdongtai/2691.html','','','\n<p>\r\n	IT之家7月30日消息 在今年3月中旬，微软小冰和腾讯QQ合作把QQ小冰机器人带到了QQ群，QQ群群主可以邀请小冰进群，小冰就可以与群用户进行实时对话，还支持支持语音和图像的多感官交流。除了聊天功能外，QQ群聊小冰还开放了测天气、猜成语、占星术、对诗等群游戏和群管理技能。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"638\" src=\"/uploads/img1/20170811/d82e3b4b30832fdb4e56c23cee880638.jpg\" width=\"600\">\n</center>\r\n<p>\r\n	不过今天晚上开始，众多网友反馈，腾讯QQ群机器人包括QQ小冰、腾讯自家的Baby Q被关闭，群机器人服务暂停使用，具体恢复时间未知。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"1066\" src=\"/uploads/img1/20170811/c1f274b8a2802e7c7431545dc7e44ed4.jpg\" width=\"600\">\n</center>\r\n<p>\r\n	Baby Q是腾讯推出的群聊机器人，与QQ小冰相比，Baby Q更侧重于百科知识等内容，服务在4月初上线。</p>\n','1502426760','1502426760','0','5','1','1','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('124','QQ上的年轻人：每个人的15分钟成名时间','','管理员','QQ成名时间','/uploads/img1/20170811/c09b06d86fb68c5ebd073c4cc4fd4666.jpg!300X300.jpg','如果一直只关注微信朋友圈上发生的事物，那你可能根本不知道什么是“厘米秀”。\r\n\r\n	2016年初，一款名叫“厘米秀”的新产品在QQ上线，这是一款类似QQ秀的产品，但经过研发团队的升级和改良后，厘米秀变成了一款年轻用户社交的产品，它既可以是表','http://www.qqseller.com/QQdongtai/2887.html','','','\n<p>\r\n	如果一直只关注微信朋友圈上发生的事物，那你可能根本不知道什么是“厘米秀”。</p>\r\n<p>\r\n	2016年初，一款名叫“厘米秀”的新产品在QQ上线，这是一款类似QQ秀的产品，但经过研发团队的升级和改良后，厘米秀变成了一款年轻用户社交的产品，它既可以是表情包，也是弹幕，激发了年轻用户的热情—在上线一周年之后，厘米秀的日活跃用户达到数千万的量级，重新唤醒了QQ在年轻化和娱乐社交上的探索动力。</p>\r\n<center>\r\n	<img alt=\"\" src=\"/uploads/img1/20170811/c09b06d86fb68c5ebd073c4cc4fd4666.jpg\" style=\"border-width: 1px; border-style: solid; width: 500px; height: 293px;\">\n</center>\r\n<p>\r\n	电竞、直播、阅后即焚……这些因互联网而生的“新物种”甚至不被80后所理解，但毫无疑问，它们正影响着当下年轻人的审美和价值取向。</p>\r\n<p>\r\n	每一代的年轻人，都有其各自的娱乐方式，但二次元却是亘古不变的主题：70后和80后是看着电视播放日韩动漫长大的一辈人，他们的童年是《名侦探柯南》和《数码宝贝》;而90后和00后则是透过手机认识了解世界，围绕着他们的是更加丰富的动漫、游戏和文学内容，这包括《王者荣耀》《全职高手》和《一人之下》等风靡大江南北的影游作品。</p>\r\n<p>\r\n	透过互联网的赋能，原本作为亚文化的二次元正向年轻用户群体快速扩散，并渐渐向主流文化靠近。据第三方机构的研究报告称，2016年国内核心“二次元”用户规模达7000万人，泛二次元人群高达两亿，年龄结构从80后全面向95后和00后迁移。</p>\r\n<p>\r\n	而作为国内年轻人集中度最高的社交平台，QQ早已洞察到这一趋势。早在两年前，QQ在动漫、文学和电竞领域上率先布局，并以社交关系链将这些业务串联起来，构成目前QQ的二次元生态圈。</p>\r\n<p>\r\n	已经18岁的QQ，仍在努力把这种年轻的DNA延续下去，并成为腾讯下一个20年的“船票”。马化腾曾经表达过自己的最大担忧，就是“越来越看不懂年轻人的喜好，不理解以后互联网主流用户的使用习惯是什么”。</p>\r\n<p>\r\n	如今QQ的年轻化，似乎正在解决马化腾的忧虑。</p>\r\n<p>\r\n	<strong>成名窗口</strong></p>\r\n<p>\r\n	无论白天有多忙，每天晚上9点半，张一帆都会打开企鹅电竞，为在直播间里等候多时的观众讲解《王者荣耀》的最新赛事。作为解说，张一帆并不中立，他会在解说时公开支持自己喜欢的战队，就像一名狂热的粉丝去影响其他的粉丝，于是在他的直播上，往往是队列一致的评论刷屏。</p>\r\n<p>\r\n	每个人都有15分钟的成名时间，这是艺术家安迪·沃霍尔曾预言的定律。他相信人的成名和普通之间，只是短短半小时。</p>\r\n<p>\r\n	张一帆相信，从每晚的9点半开始，就是开启他的15分钟成名时间。</p>\r\n<p>\r\n	在成为一名主播前，张一帆并不知道自己有机会获得这一切。他曾经玩过同为腾讯旗下的游戏《英雄联盟》，虽然技术称不上精湛，但这奠定了他在解说领域的基础。在《王者荣耀》这款易入门、难进阶的手游里，张一帆施展出自己的才华。如今在企鹅电竞上，虽然他的粉丝数量只有几千，但每天坚持做直播生成为他生活的一部分。</p>\r\n<p>\r\n	现实生活中的张一帆，不过是一名普通高校的学生，他没有突出的学习成绩，也缺乏社交技巧。然而在企鹅电竞直播上，从观众到主播之间的跳跃，张一帆为自己赢得了15分钟的成名时间—他从来没有料想过，每晚有上千名粉丝在他的解说下为电竞选手摇旗呐喊。</p>\r\n<p>\r\n	张一帆是幸运的。假若没有《王者荣耀》的全民热潮，没有近年电竞在全国各地的迅速普及，也没有移动直播的风口，张一帆可能没有机会寻找到这条适合自己的赛道。</p>\r\n<p>\r\n	张一帆不知道，这15分钟的成名时间还会持续多久，但他希望这一刻能无限延长，甚至成为自己的一盘生意。于是他开始学习其他主播的解说方式，也会购买一些“网红秘诀”自我培训。</p>\r\n<p>\r\n	“我知道很多主播都主动与粉丝分享自己的生活，但我不愿意这样做。”张一帆说，他处于一种矛盾的状态里：越大的曝光度意味着巨大的市场潜力，但只有在直播的江湖里才没有人知道他现实中最平凡的一面，一旦走出这个圈子他将难再重回普通人的生活，“有时候我只希望他们记住我的解说就足够了”。</p>\r\n<p>\r\n	<strong>年轻人生态</strong></p>\r\n<p>\r\n	有的人通过QQ一夜成名，也有的人为其他人的成名一路追随。</p>\r\n<p>\r\n	刚满20岁的周哈哈是S.I.N.G女团部落的运营负责人，除了负责发布有关S.I.N.G的官方消息外，她每天还会投入将近8小时的时间去与关注部落的成员互动和交流，回复他们关注的问题。</p>\r\n<p>\r\n	与SHN48相比，S.I.N.G女团的人气和知名度显然无法相提并论，但这样一个偏向小众的偶像团队，在QQ部落上有着将近2万的粉丝。</p>\r\n<p>\r\n	至少在周哈哈看来，这种能够更近距离接触偶像和与朋友们分享消息的参与感，为她带来了满足和快乐。</p>\r\n<p>\r\n	事实上，兴趣部落并不只是追星的圈子，这个社群平台是QQ近年来在用户运营层面上的一次重大创新。在兴趣部落上，既可以是明星的后援会，也可以是文学、体育乃至鬼畜的爱好者共同体。</p>\r\n<p>\r\n	让年轻人自发地讨论、交流和分享内容，实际上就是将话语权交给年轻，这是QQ有别于过去只用于维系沟通关系的产品思路—对于年轻用户来说，存在着一个与熟人聊天之外的交流空间，共同的兴趣爱好将驱动他们更长时间地停留在QQ上;对于QQ而言，这种带有人格化的社群能提供更加精准的用户画像，进而提高产品在商业层面的转化率。</p>\r\n<p>\r\n	更重要的是，这种伴随着偶像共同成长所带来的成就感，甚至超出了连接本身的意义。在腾讯所构建的庞大内容体系中，QQ作为平台起到了聚集广泛用户的作用，但这只是浅层的连接，更深入的连接需要通过用户的自主组织来形成。</p>\r\n<p>\r\n	“如果你问我为什么会喜欢S.I.N.G的具体原因，我也不知道该怎么说。”在周哈哈眼中，跟随着这个两年前才正式成立的女子偶像团队一路走来，在不知不觉中产生了感情，“最初还觉得这个团队人这么多，名字都很难记住吧，但现在她们的名字我已经背得滚瓜烂熟，这是一种非常微妙的感觉。”</p>\r\n<p>\r\n	<strong>草根的未来</strong></p>\r\n<p>\r\n	刚出道不久的王子如未曾料想过，COSER原来可以从爱好变成一份职业。起初，她在大一的时候参加了学校成立的动漫协会，然后接触到Cosplay这一圈子，陆续开始兼职工作。她向时代周报记者表示，进入7月暑假后，她的工作量明显增大，几乎每周都有演出工作，每天的工作量均在12小时以上。</p>\r\n<p>\r\n	“昨天我还是《阴阳师》里的‘神乐’，今天就变成了《王者荣耀》里的‘大乔’。”王子如自认为自己的形象比较适合中国风，但这对服装的要求更高，有时候造价几千元的衣服只能穿一两次。</p>\r\n<p>\r\n	缘于Cosplay这个爱好，她在尝试扮演历史角色的同时也开始研究这些人物的历史故事，并最终让她在大三时向学校申请将自己的专业改为历史学。“COSER并不是在舞台上摆个POSE那么简单，我们还要学舞蹈，甚至是自己动手做道具。”</p>\r\n<p>\r\n	在COSER这个圈子里，参加动漫展和游戏活动是累积人气的最佳途经，但真正可以做到资深的COSER寥寥无几，尤其是那些需要曝光度的新人，想要打进这个圈子必须依靠更多的资源。</p>\r\n<p>\r\n	因此当得知本届QQJOY将设置“音画大赏”比赛后，王子如认为自己的机会来了。音画大赏是腾讯QQJOY针对二次元人群发起的一个草根选秀节目，由于目前头部爱好者在二次元行业里仍占据着主导地位，腾讯公司社交网络事业群增值产品部总经理刘宪凯认为音画大赏可以为更广大的二次元人群提供展示自己的机会。</p>\r\n<p>\r\n	“其实目前团队把更多的精力集中在草根培养上。例如通过技术去判断主播的风格和潜力，我们为他们分发更多的资源，让草根的主播有机会成长起来，这一项工作不太容易被外界所留意到。”刘宪凯向时代周报记者表示。</p>\r\n<p>\r\n	与张一帆不同的是，王子如不知道自己的成名15分钟什么时候才会到来，她的选择是耐心静候。“我相信二次元文化会越来越成熟，在类似QQ这样的平台上，COSER以后会有更多的出路，例如转向幕后制作人或者培训工作。”王子如说道。</p>\n','1502426770','1502426770','0','5','1','1','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('115','腾讯音乐侯德洋：QQ音乐通过“音乐号”搞社交','','管理员','QQ音乐','','QQ音乐作为中国最成功的互联网音乐平台，在社交方面的探索也是在不断的演进，而在最新的7.5的版本发布了一个新的功能，音乐号，不仅仅是通过歌单、个性化推荐，通过一些音乐故事，通过一些音乐人的推荐，可以直接到用户里面发现更多新的音乐。按照腾讯音','http://www.qqseller.com/QQdongtai/2903.html','','','\n<p>\r\n	QQ音乐作为中国最成功的互联网音乐平台，在社交方面的探索也是在不断的演进，而在最新的7.5的版本发布了一个新的功能，音乐号，不仅仅是通过歌单、个性化推荐，通过一些音乐故事，通过一些音乐人的推荐，可以直接到用户里面发现更多新的音乐。按照腾讯音乐娱乐集团副总裁侯德洋的说法，则是“QQ音乐借音乐号找到社交的感觉”。在日前由第一财经周刊和优衣库联合发布的“2017年中国新中产品质生活报告发布会”上，侯德洋就接受了记者的采访，就QQ音乐在社交方面的探索发表了自己的看法。</p>\r\n<p>\r\n	“目前我们推荐歌的方法套路非常笼统，通过搜索的入口进来，通过热门歌单，找到一些想发现的歌单，但是怎么可以通过更新的维度发现音乐，我们跟团队研究过，通过故事是一个非常有趣的方法。”在侯德洋看来，传统的榜单式的推歌并无太多的新意，在社交属性上也略显不足，而通过让用户可以通过故事了解更多的歌曲则将会是一个全新的尝试，同时也能够最大限度地发挥腾讯在高品质自媒体和机构媒体方面的资源优势。</p>\r\n<p>\r\n	据QQ音乐提供的数据显示，在上线一个多月之后，音乐号已经累计产出了超过5000条精品专栏内容。根据QQ音乐方面的统计，音乐号的转化率大约为50%，即有一半的用户在看了文章内容后，会选择收听当中推荐的歌曲，远高于原有的推荐方式。</p>\r\n<p>\r\n	在“音乐号”出现并且获得初步成功后，QQ音乐这个备受关注的巨无霸级产品也被赋予了新的活力。“一直以来大家以为QQ音乐就是一个播放器，最近有了一些音乐的内容，音乐号里面产生了非常多的用户的共鸣，在这个过程中朋友跟朋友之间会形成互动，我们开始找到一些社交的感觉。”侯德洋认为，从腾讯的角度来看，在内容推荐的角度，推动音乐号的方法，用音乐号连接更多的音乐爱好者，用音乐去把更多的好友之间的关系捆绑起来，这些都是QQ音乐未来的方向。</p>\n','1502426689','1502426689','0','5','1','0','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('116','联通延期复牌 与腾讯联合招聘隐示混改名单','','管理员','联通延期复牌','','近日，一则招聘信息让联通混改名单再度引起关注。\r\n\r\n	该招聘信息显示，由中国联通和腾讯联合成立的运营中心开始招聘各路人员，专门负责火爆的腾讯王卡。腾讯王卡团队此次招聘产品经理、设计师、工程师等职位。\r\n\r\n	据了解，腾讯王卡是一款中国联通','http://www.qqseller.com/QQdongtai/2889.html','','','\n<p>\r\n	近日，一则招聘信息让联通混改名单再度引起关注。</p>\r\n<p>\r\n	该招聘信息显示，由中国联通和腾讯联合成立的运营中心开始招聘各路人员，专门负责火爆的腾讯王卡。腾讯王卡团队此次招聘产品经理、设计师、工程师等职位。</p>\r\n<p>\r\n	据了解，腾讯王卡是一款中国联通携手腾讯公司去年10月份推出的互联网产品，与之前运营商传统销售套餐的模式完全不同。其作用之一是为腾讯系软件提供免费流量——即用户可通过最少19元/月的价格实现微信、QQ、腾讯视频、王者荣耀等腾讯系应用、游戏的4G流量免费。由于软件矩阵庞大，腾讯王卡的免费流量应用达上百款之多，甚至还包括斗鱼、熊猫直播等非腾讯系应用。</p>\r\n<p>\r\n	而据记者观察，近日腾讯王卡动作不断。先是在微信钱包的限时推送一栏中，看见了“腾讯王卡”的身影。紧接着，7月28日，宣布天王卡可变更为大王卡。此前腾讯仅开放了小王卡与大王卡的向上升级通道，而并未开放降级通道，今天下午中国联通发布消息称，将允许腾讯天王卡降级到腾讯大王卡，用户的月费也从之前的59元/月降级到19元/月。</p>\r\n<p>\r\n	与此同时，腾讯王卡团队7月28日发出招聘信息，显示由中国联通和腾讯联合成立的运营中心正在招人。</p>\r\n<p>\r\n	早在2014年8月份，中国联通高层就表示过，中国联通在思考和探索混合所有制，可能会在创新型业务领域，及增值业务领域方面推进混合所有制改革，公司在这些方面已有所行动。</p>\r\n<p>\r\n	事实上，虽然中国联通混改方案尚未正式出炉，但互联网巨头与联通的合作却早已展开。</p>\r\n<p>\r\n	对于混改参与方的选择，联通副总经理姜正新在去年11月份的合作大会专访中曾向《证券日报》记者表示，联通在合作伙伴选择方面重点选择在业务上互补性更强的合作伙伴。</p>\r\n<p>\r\n	联通副总经理邵广禄补充说，联通混改不是简单地引入资本，而是更看重价值上能够互补，增强联通整体竞争力。他表示，联通有几架马车：终端、网络、应用。应用这部分主要在互联网公司，紧密跟互联网公司合作是联通的主要策略。</p>\r\n<p>\r\n	而BATJ等互联网巨头参与联通混改的初衷，也不单单是投资获利这么简单，业务的深度互补合作，无疑是各方都最看重的部分。</p>\r\n<p>\r\n	在联通混改方案获得发改委批复前后，腾讯王卡的一系列动作，让业内人士认为，腾讯重点参与联通混改的概率很高。</p>\r\n<p>\r\n	在获得发改委批复后，中国联通或仍需面临多家部委的沟通和批复。不过业内预期，在宣布发改委完成批复后，后续的一系列节奏可能会有所提速。</p>\r\n<p>\r\n	不过，根据昨日联通临时股东大会的决议，公司股票自2017年7月17日起继续停牌1个月。</p>\n','1502426690','1502426690','0','5','1','0','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('117','马化腾回忆18年前QQ创业之初：最害怕过周末','','管理员','QQ18周年,马化腾','','8月9日，在腾讯组织发起的首届粤港澳湾区青年营活动上，马化腾回忆起创办腾讯之初的种种心酸。\r\n\r\n	面对这一群比QQ年龄还小的00后，马化腾这样介绍腾讯：腾讯有一个外号叫做鹅厂，最早起家的产品就是QQ，它有个企鹅的形象。这个企鹅已经18岁了','http://www.qqseller.com/QQdongtai/2905.html','','','\n<p>\r\n	8月9日，在腾讯组织发起的首届粤港澳湾区青年营活动上，马化腾回忆起创办腾讯之初的种种心酸。</p>\r\n<p>\r\n	面对这一群比QQ年龄还小的00后，马化腾这样介绍腾讯：腾讯有一个外号叫做鹅厂，最早起家的产品就是QQ，它有个企鹅的形象。这个企鹅已经18岁了，比在座的各位同学年纪都大，是你们的大哥了。</p>\r\n<center>\r\n	<img alt=\"马化腾回忆18年前QQ创业之初：最害怕过周末\" border=\"1\" height=\"348\" src=\"/uploads/img1/20170811/16ae7b6d582288133b3208e0bee30e9f.jpg\" width=\"600\">\n</center>\r\n<p>\r\n	但我们也有一个小弟弟，就是微信，它才诞生6年多，但成长非常快。大家也知道，腾讯还有很多产品，比如游戏，现在也是全球最大的游戏公司之一，还包括影视、音乐、动漫、体育、文学、读书等等。社交和数字内容是腾讯较强的项目。</p>\r\n<p>\r\n	回想起18年前，他描述了一个细节：“某天早上起来意识到今天是周末，就会想‘水电费又白交了’。如果只是打工，周末就非常高兴，可能你们读书也是这样。但真正创业就感觉到希望每天都干活，如果有一天说是周末，就很着急，心里压力很大。”</p>\r\n<p>\r\n	马化腾透露，一开始的时候并没想着要做成多么大的一个企业，当时产品和商业模式都还看不清楚，团队想着的事情就是“别人想用什么系统我帮他开发，能把我的技能转化成生产力，能够养活自己，就非常高兴了。”</p>\r\n<p>\r\n	对于今天取得的成功，马化腾归因于腾讯踏实做事和内部团结。他说：“最大的问题是成长过程中大家遇到一些问题能不能有商有量，能不能齐心携手度过，以及能不能得到投资者的支持。如果你遇到好的投资者，是一辈子都可以帮你成长的。后来的种种原先没有想到，先踏踏实实做好每一步是最重要的。”</p>\n','1502426713','1502426713','0','5','1','0','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('118','国内正严打微信QQ等非法经营旅游业务','','管理员','非法经营','','湖南省旅游发展委员会下发通知，湖南各地将开展整治网络平台等非法经营旅行社业务专项检查行动，严打网络平台等非法经营旅行社业务。此次专项检查行动将清理整治一批非法招徕、组织、接待旅游者的社会组织、企业和个人、微博、微信公众号、微信群、QQ群，依','http://www.qqseller.com/QQdongtai/2896.html','','','\n<p>\r\n	湖南省旅游发展委员会下发通知，湖南各地将开展整治网络平台等非法经营旅行社业务专项检查行动，严打网络平台等非法经营旅行社业务。此次专项检查行动将清理整治一批非法招徕、组织、接待旅游者的社会组织、企业和个人、微博、微信公众号、微信群、QQ群，依法依规进行处置，检查后将视情况进行集中曝光。</p>\r\n<p>\r\n	湖南省旅发委提醒，下列这些方面应特别注意：</p>\r\n<p>\r\n	1、各类社会组织、企业和个人、微博、微信、QQ等网络社交平台招徕、组织、接待旅游者，应当依法办理工商营业执照，取得《旅行社业务经营许可证》，并严格在许可证载明的业务范围开展业务。</p>\r\n<p>\r\n	2、取得旅游经营资质的社会组织、企业和个人、微博、微信、QQ等网络社交平台招徕、组织、接待旅游者，应当符合《中华人民共和国旅游法》等相关法律法规规定，明示合法经营许可信息，严格依法诚信经营，杜绝虚假宣传、“不合理低价游”、强迫和诱骗消费等行为。</p>\r\n<p>\r\n	3、各类社会组织、企业和个人、微博、微信、QQ等网络社交平台推介的旅游企业应当具备合法经营资质，无不诚信经营记录，推荐的旅游产品应当符合保障旅游者人身、财产安全的要求，符合国家相关法律法规规定。</p>\r\n<p>\r\n	4、湖南全省旅行社应严格遵守《中华人民共和国旅游法》第三十四条之规定，不得向不具备旅游经营资质的社会组织、企业和个人、微博、微信、QQ等网络社交平台委托招徕、组织、接待旅游者的事项。</p>\r\n<p>\r\n	本文属于原创文章，如若转载，请注明来源：国内正严打微信QQ等非法经营旅游业务http://dcdv.zol.com.cn/649/6494312.html</p>\n','1502426715','1502426715','0','5','1','0','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('119','腾讯信用分来了，但仅限QQ超级会员','','管理员','腾讯信用分','','在支付宝的芝麻信用分席卷行业之后，目前腾讯也悄然开放“腾讯信用分”的查询通道，从页面介绍来看，腾讯信用分同样是根据履约、安全、财富、消费以及社交这五项成绩来判定综合成绩，最低300分，最高850分。\r\n\r\n	但遗憾的是，目前只有QQ超级会员','http://www.qqseller.com/QQdongtai/2899.html','','','\n<p>\r\n	在支付宝的芝麻信用分席卷行业之后，目前腾讯也悄然开放“腾讯信用分”的查询通道，从页面介绍来看，腾讯信用分同样是根据履约、安全、财富、消费以及社交这五项成绩来判定综合成绩，最低300分，最高850分。</p>\r\n<p>\r\n	但遗憾的是，目前只有QQ超级会员可以查看，其余用户暂时还无缘查看。</p>\r\n<center>\r\n	<img alt=\"硬罡支付宝！腾讯信用分来了，但仅限QQ超级会员；iPhone 8确认放弃Touch ID；LV推出智能手表  | 雷锋早报\" src=\"/uploads/img1/20170811/0beea2284657c6ab50daa8e8c300dfd8.jpg\" style=\"border-width: 1px; border-style: solid; width: 386px; height: 378px;\">\n</center>\r\n<p>\r\n	<strong>和阿里正面交兵</strong></p>\r\n<p>\r\n	“腾讯信用分未来的应用空间会很大，下一个十年，对腾讯意义重大。”艾媒咨询集团CE O张毅昨日告诉南都记者，腾讯信用分作为后来者，优势是有微信支付、Q Q钱包加持，但劣势也很明显：“腾讯所掌握的消费数据，不如阿里的芝麻全。”</p>\r\n<p>\r\n	腾讯和阿里巴巴，在个人征信领域或将开始一场正面厮杀。另外，张毅认为，腾讯信用和所涵盖的行为数据和芝麻信用之间，也仍存有差距。其认为，要想弯道超车，微信支付等腾讯的前端金融产品是关键。推出于2015年，除了阿里系的电商之外，芝麻信用目前接入的服务和领域还覆盖住宿、出行、医疗、互联网婚恋等。</p>\r\n<p>\r\n	至于此次腾讯着重强调的社交指数，则明显是阿里巴巴的短板。而当下风头正劲的微信支付，也是从社交切入。张毅认为，未来腾讯信用并不是没有赶超的可能，微信支付和支付宝之争便是先例。</p>\r\n<p>\r\n	实际上，早在今年初腾讯信用便已经进行内测。如何落地?目前来看，出行、借贷方面可能会走得比较快———巧合的是，昨日微信小程序宣布和摩拜单车推出免押金活动，针对摩拜单车小程序端的新用户，可以享受免押金试骑的福利。此前，摩拜单车的押金高达299元。而支付宝更快一步，已经于今年初开始陆续和O FO、小蓝单车达成授信免押金的合作。借贷方面，目前腾讯系的微众银行，旗下微粒贷在微信九宫格上已有独立入口。分析认为，不排除未来腾讯信用将重点接入微粒贷。</p>\n','1502426736','1502426736','0','5','1','0','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('120','悦诗风吟携手腾讯QQ开展合作 升级支付渠道','','管理员','悦诗风吟,腾讯QQ','','美妆品牌innisfree悦诗风吟携手腾讯QQ，在活动现场发布了包括innisfree悦诗风吟虚拟现实(AR)产品专享、腾讯QQfamily联名限量产品等在内的一系列合作项目。\r\n\r\n	“我们选择腾讯QQ，因其深入人心的品牌影响力，及其对消','http://www.qqseller.com/QQdongtai/2901.html','','','\n<p>\r\n	美妆品牌innisfree悦诗风吟携手腾讯QQ，在活动现场发布了包括innisfree悦诗风吟虚拟现实(AR)产品专享、腾讯QQfamily联名限量产品等在内的一系列合作项目。</p>\r\n<p>\r\n	“我们选择腾讯QQ，因其深入人心的品牌影响力，及其对消费者在数字体验上的不断创新，这与innisfree悦诗风吟在追求为消费者提供结合创新科技与自然的美妆产品上不谋而合”。</p>\r\n<p>\r\n	在签约仪式上，innisfree悦诗风吟全球CEO安世洪表示，“我们相信腾讯QQ将帮助消费者在我们店内体验到妙趣横生的数字化娱乐，与高效便捷的消费体验。”据悉，此次innisfree悦诗风吟与腾讯QQ所推出的合作计划，将包括一系列覆盖产品包装IP共享，零售娱乐化体验，支付渠道升级等在内的不同领域，致力于让消费者在购物体验中获得超越产品本身所带来的功效性。</p>\r\n<p>\r\n	在第一阶段，innisfree悦诗风吟将推出携手腾讯QQ旗下最具人气IP品牌——QQfamily的联名限量产品，并在产品包装中结合虚拟现实科技，让年轻消费者在购物中感受QQfamily中个性迥异的人气角色，并增加对innisfree悦诗风吟杰出产品的好感度。</p>\r\n<p>\r\n	更值得一提的是，除了IP形象合作、QQ-AR技术合作外，QQ钱包也将全面接入innisfree，从8月起，消费者可以在中国大陆innisfree线下400多家门店中使用QQ钱包进行移动支付。</p>\r\n<p>\r\n	在发布仪式现场，innisfree悦诗风吟与腾讯QQ共同签署了合作备忘录，并由腾讯公司社交网络事业群市场部总经理李丹通过扫描innisfree悦诗风吟联名套装，让现场媒体及嘉宾率先感受到在虚拟现实技术的助力中，QQfamily为innisfree悦诗风吟所带来的数字化娱乐场景。</p>\r\n<p>\r\n	innisfree悦诗风吟中国区总经理蔡健人在现场向媒体表示：“运用IP联名提升双方品牌好感度;通过QQ钱包向消费者提供更便捷更多优惠的支付平台;运用虚拟现实技术，帮助我们的消费者更好地感受结合数字科技的场景化营销所带来的生动体验。在未来，innisfree悦诗风吟的诸多产品中将会有越来越多的小惊喜等待着更多年轻的中国顾客去发现。”</p>\r\n<p>\r\n	随着此次合作计划的开启，消费者将从8月起通过店内消费，获得QQfamily联名限量版产品，并率先通过手机识别，感受虚拟现实技术下QQfamily的自然主义绿色生活。同时也可以通过QQ钱包进行支付及消费积分，以换取更多贴心优惠及礼遇。</p>\n','1502426736','1502426736','0','5','1','0','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('121','腾讯QQ旋风突然停运 “明星产品”随时代而去','','管理员','腾讯QQ旋风','/uploads/img1/20170811/a98fae0f13bb33a12c6c0cea84cfa2e5.jpg!300X300.jpg','无论你是iPhone、三星，还是国产骄傲华为、荣耀，亦或是OPPO、vivo等明星品牌的忠实用户，你是否有想过，互联网的发展给你带来了什么，又带走了什么。在这个移动互联盛行的时代，恐怕有很多人已经忘记了PC端的那些“曾经”。\r\n\r\n	8月3','http://www.qqseller.com/QQdongtai/2894.html','','','\n<p>\r\n	无论你是iPhone、三星，还是国产骄傲华为、荣耀，亦或是OPPO、vivo等明星品牌的忠实用户，你是否有想过，互联网的发展给你带来了什么，又带走了什么。在这个移动互联盛行的时代，恐怕有很多人已经忘记了PC端的那些“曾经”。</p>\r\n<p>\r\n	8月3日，腾讯旗下下载工具QQ旋风宣布由于业务发展上的调整，“QQ旋风”将于2017年9月6日停止运营。</p>\r\n<p>\r\n	QQ旋风以及腾讯这两年关闭的腾讯微博、朋友等产品，无一例外都曾经是腾讯的明星产品，但是如今却被关停不免令人替马化腾惋惜。但换个角度去想，随着我国互联网的一步步发展，马化腾所谓“明星产品”的关停，其实也是一个时代的远去的必然结果。</p>\r\n<p>\r\n	<strong>QQ旋风与迅雷不得不说的那些事</strong></p>\r\n<p>\r\n	QQ旋风于2008年发行，至今已将近10年。在当年的中国下载工具市场上，迅雷与QQ旋风是使用人数最多的两款产品，二者的竞争你追我赶，互不相让。</p>\r\n<p>\r\n	2009年11月，迅雷推出离线下载服务，但要求必须是会员且收取10元/月服务费。2010年4月，QQ旋风也推出了离线下载功能，所有QQ会员均有离线下载特权，因而不少QQ用户都曾从迅雷转向QQ旋风。</p>\r\n<p>\r\n	但是正如马化腾的腾讯微博、朋友网等“明星产品”一样，QQ旋风与行业主流相比还是逊色了一些。</p>\r\n<p>\r\n	据网友反映，3年前开始，QQ旋风的服务便已经处于不稳定的状态，并关闭了QQ旋风云播放功能。昨日，QQ旋风官方表示，由于业务发展上的调整，“QQ旋风”将于2017年9月6日停止运营。各位用户需要在2017年9月6日前将旋风资源转出，过期后您的资源数据将会被删除，无法转出、恢复或进行其他操作。</p>\r\n<p>\r\n	QQ旋风下载速度快，占用资源少，界面清爽简单一直是其优点，但实际上，QQ旋风最新版本的4.8版本，也是2015年11月19日上线的，在那之后就再也没有更新过。</p>\r\n<p>\r\n	一直以来，会员收入都是迅雷总营收中占比最大的部分。在国内互联网圈里，除了腾讯的会员体系之外，有着忠实稳定且数量庞大的付费会员群体的恐怕也只有迅雷了。</p>\r\n<p>\r\n	据每经报道，迅雷2017年第一季度财报显示，截至今年3月31日，迅雷拥有付费会员408万人，而这408万人仅仅一个季度就给迅雷“充”了2080万美元的会费，占到总营收的52.5%。</p>\r\n<center>\r\n	<img alt=\"QQ旋风宣布关闭 一个时代远去的必然结果\" src=\"/uploads/img1/20170811/a98fae0f13bb33a12c6c0cea84cfa2e5.jpg\" style=\"border-width: 1px; border-style: solid; width: 600px; height: 425px;\">\n</center>\r\n<p>\r\n	<strong>时代远去的必然</strong></p>\r\n<p>\r\n	早期的互联网时代，因为网络速度慢、经常掉线、不稳定等因素，人们习惯于把需要的软件、视频等资料下载到本地再使用，而直接下载会有很高的失败率，即使成功也会耗费较长的时间，换句话说，下载是一种刚需。</p>\r\n<p>\r\n	于是，以迅雷、QQ旋风以及早期的网络蚂蚁、网际快车等为代表的下载工具因成功解决用户痛点而饱受欢迎。</p>\r\n<p>\r\n	后来经过时代的发展，一些小的软件和产品我们通过360或者其他浏览器自带的下载功能就能搞定，而一些大型软件系统自研发的下载工具效率会更高。</p>\n','1502426737','1502426737','0','5','1','1','','1','0','0','0','0','');
INSERT INTO `my_temp` VALUES ('122','腾讯宣布QQ旋风9月6日寿终正寝 已瘫痪3年之久','','管理员','QQ旋风','/uploads/img1/20170811/931320c284f1810d61649352def470df.jpg!300X300.jpg','8月3日，QQ旋风官网宣布将于9月6日停止运营。相比之前突然终结云播放服务，此次腾讯停止运营QQ旋风留给用户不少缓冲时间，直到9月6日才会完全关闭服务，腾讯也建议用户尽快将离线空间的资源转出、备份。\r\n\r\n	\n\r\n\r\n	QQ旋风官网发布的公','http://www.qqseller.com/QQdongtai/2892.html','','','\n<p>\r\n	8月3日，QQ旋风官网宣布将于9月6日停止运营。相比之前突然终结云播放服务，此次腾讯停止运营QQ旋风留给用户不少缓冲时间，直到9月6日才会完全关闭服务，腾讯也建议用户尽快将离线空间的资源转出、备份。</p>\r\n<center>\r\n	<img alt=\"\" border=\"1\" height=\"507\" src=\"/uploads/allimg/170804/102503O01-0.jpg\" width=\"530\">\n</center>\r\n<p style=\"text-align: center;\">\r\n	QQ旋风官网发布的公告</p>\r\n<p>\r\n	腾讯公告称，由于业务发展上的调整，“QQ旋风”将于2017年9月6日停止运营。请各位用户在2017年9月6日前将旋风资源转出，过期后您的资源数据将会被删除，无法转出、恢复或进行其他操作。</p>\r\n<p>\r\n	QQ旋风是腾讯在2008年推出的一款下载工具，其一切功能向其竞争对手看齐。2009年11月迅雷推出了离线下载服务，收取会员每月10元服务费。QQ旋风在2010年4月也推出了离线下载功能，只要是QQ会员即可享受离线下载功能，同时一个月10元QQ会员费保持不变，吸引了大量迅雷用户转用QQ旋风。2013月7月推出QQ旋风4.4版中，再次跟随迅雷步伐，新增了云播放功能，会员只要有种子文件即可观看应对视频。</p>\r\n<p>\r\n	2014年11月11日腾讯宣布，QQ旋风云播放功能已于11月7日暂停服务，QQ会员无法通过种子文件来在线观看视频，下载文件也变得日益困难，软件更新变慢，最新版是2015年11月19日更新的4.8.773.400版，腾讯何时结束QQ旋风服务只是时间问题。</p>\n','1502426759','1502426759','0','5','1','1','','1','0','0','0','0','');


# 转存表中的数据：my_topic 


# 转存表中的数据：my_union 
INSERT INTO `my_union` VALUES ('7','PC全局图片广告','<!--广告位-->','1479028592','0','0','1');
INSERT INTO `my_union` VALUES ('8','PC全局对联广告','<!--广告位-->','1479028630','0','0','1');
INSERT INTO `my_union` VALUES ('9','PC全局右下角悬浮广告','<!--广告位-->','1479028948','0','0','1');
INSERT INTO `my_union` VALUES ('10','右侧橱窗广告','<img src=\"/Public/Home/jita/images/ad.jpg\" />','1479029133','0','0','1');


# 转存表中的数据：my_video 
INSERT INTO `my_video` VALUES ('1','喜羊羊与灰太狼第125集','','','','管理员','','/uploads/img1/20170402/58e0bd4fde258.jpg!300X300.jpg','<p>喜羊羊与灰太狼第125集</p>','喜羊羊与灰太狼第125集','1491123402','1491224392','3','30','1','3','','1','0','1','0','0','','','1','/uploads/file1/20170402/58e0bd072ae88.mp4');
INSERT INTO `my_video` VALUES ('2','喜羊羊与灰太狼第126集','','','','管理员','','/uploads/img1/20170402/58e0bdd8bbecc.jpg!300X300.jpg','<p>喜羊羊与灰太狼第126集</p>','喜羊羊与灰太狼第126集','1491123626','1491123676','0','30','1','5','','1','0','1','0','0','','','1','/uploads/file1/20170402/58e0bdbe11a15.mp4');
INSERT INTO `my_video` VALUES ('3','喜羊羊与灰太狼第128集','','','','管理员','','/uploads/img1/20170402/58e0be12cecd6.jpg!300X300.jpg','<p>喜羊羊与灰太狼第128集</p>','喜羊羊与灰太狼第128集','1491123710','1491123736','1','30','1','5','','1','0','1','0','0','','','1','/uploads/file1/20170402/58e0be0edc6b5.mp4');
INSERT INTO `my_video` VALUES ('4','喜羊羊与灰太狼第129集','','','','管理员','','/uploads/img1/20170402/58e0be604fb5e.jpg!300X300.jpg','<p>喜羊羊与灰太狼第129集</p>','喜羊羊与灰太狼第129集','1491123789','1491123820','4','30','1','1','','1','0','1','1','0','','','1','/uploads/file1/20170402/58e0be692b750.mp4');
INSERT INTO `my_video` VALUES ('5','李玲玉-情网mv','','','','管理员','','/uploads/img1/20170402/58e0c0a208301.jpg!300X300.jpg','<p>李玲玉-情网mv</p>','李玲玉-情网','1491124331','1491124427','6','29','1','1','','1','0','1','0','0','李玲玉,情网mv','','1','/uploads/file1/20170402/58e0c09d6fe23.mp4');
INSERT INTO `my_video` VALUES ('6','邓紫棋-夜空中最亮的星mv','','','','管理员','','/uploads/img1/20170402/58e0c19ba9638.jpg!300X300.jpg','<p>邓紫棋-夜空中最亮的星mv</p>','邓紫棋-夜空中最亮的星mv','1491124587','1491124673','6','29','1','5','','1','0','1','0','0','邓紫棋,夜空中最亮的星','','1','/uploads/file1/20170402/58e0c1b1ee8c3.mp4');
INSERT INTO `my_video` VALUES ('7','王祖蓝-上海滩mv','','','','管理员','','/uploads/img1/20170402/58e0c2287db37.jpg!300X300.jpg','<p>王祖蓝-上海滩mv</p>','王祖蓝-上海滩mv','1491124713','1497455697','10','29','1','5','','1','0','1','0','0','王祖蓝,上海滩mv','','1','/uploads/file1/20170402/58e0c230bc127.mp4');
