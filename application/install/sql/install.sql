DROP TABLE IF EXISTS `danmaku_ip`;
CREATE TABLE `danmaku_ip` (
  `ip` varchar(12) NOT NULL COMMENT '发送弹幕的IP地址',
  `c` int(1) NOT NULL DEFAULT '1' COMMENT '规定时间内的发送次数',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `danmaku_list`
--

DROP TABLE IF EXISTS `danmaku_list`;
CREATE TABLE `danmaku_list` (
  `id` varchar(32) NOT NULL COMMENT '弹幕池id',
  `cid` int(8) NOT NULL AUTO_INCREMENT COMMENT '弹幕id',
  `type` varchar(128) NOT NULL COMMENT '弹幕类型',
  `text` varchar(128) NOT NULL COMMENT '弹幕内容',
  `color` varchar(128) NOT NULL COMMENT '弹幕颜色',
  `size` varchar(128) NOT NULL COMMENT '弹幕大小',
  `videotime` float(24,3) NOT NULL COMMENT '时间点',
  `ip` varchar(128) NOT NULL COMMENT '用户ip',
  `time` int(10) NOT NULL COMMENT '发送时间',
  `referer` text NOT NULL COMMENT '弹幕来源网址',
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `danmaku_report`
--

DROP TABLE IF EXISTS `danmaku_report`;
CREATE TABLE `danmaku_report` (
  `cid` int(8) NOT NULL COMMENT '弹幕ID',
  `id` varchar(128) NOT NULL COMMENT '弹幕池id',
  `text` varchar(128) NOT NULL COMMENT '举报内容',
  `type` varchar(128) NOT NULL COMMENT '举报类型',
  `time` varchar(128) NOT NULL COMMENT '举报时间',
  `ip` varchar(12) NOT NULL COMMENT '发送弹幕的IP地址',
  `referer` text NOT NULL COMMENT '弹幕来源网址',
  PRIMARY KEY (`text`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mac_actor`
--

DROP TABLE IF EXISTS `mac_actor`;
CREATE TABLE `mac_actor` (
  `actor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor_name` varchar(255) NOT NULL DEFAULT '',
  `actor_en` varchar(255) NOT NULL DEFAULT '',
  `actor_alias` varchar(255) NOT NULL DEFAULT '',
  `actor_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `actor_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `actor_letter` char(1) NOT NULL DEFAULT '',
  `actor_sex` char(1) NOT NULL DEFAULT '',
  `actor_color` varchar(6) NOT NULL DEFAULT '',
  `actor_pic` varchar(255) NOT NULL DEFAULT '',
  `actor_blurb` varchar(255) NOT NULL DEFAULT '',
  `actor_remarks` varchar(100) NOT NULL DEFAULT '',
  `actor_area` varchar(20) NOT NULL DEFAULT '',
  `actor_height` varchar(10) NOT NULL DEFAULT '',
  `actor_weight` varchar(10) NOT NULL DEFAULT '',
  `actor_birthday` varchar(10) NOT NULL DEFAULT '',
  `actor_birtharea` varchar(20) NOT NULL DEFAULT '',
  `actor_blood` varchar(10) NOT NULL DEFAULT '',
  `actor_starsign` varchar(10) NOT NULL DEFAULT '',
  `actor_school` varchar(20) NOT NULL DEFAULT '',
  `actor_works` varchar(255) NOT NULL DEFAULT '',
  `actor_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `actor_time` int(10) unsigned NOT NULL DEFAULT '0',
  `actor_time_add` int(10) unsigned NOT NULL DEFAULT '0',
  `actor_time_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `actor_time_make` int(10) unsigned NOT NULL DEFAULT '0',
  `actor_hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `actor_hits_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `actor_hits_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `actor_hits_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `actor_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0',
  `actor_score_all` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `actor_score_num` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `actor_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `actor_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `actor_tpl` varchar(30) NOT NULL DEFAULT '',
  `actor_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `actor_content` text NOT NULL,
  PRIMARY KEY (`actor_id`) USING BTREE,
  KEY `actor_name` (`actor_name`) USING BTREE,
  KEY `actor_en` (`actor_en`) USING BTREE,
  KEY `actor_letter` (`actor_letter`) USING BTREE,
  KEY `actor_level` (`actor_level`) USING BTREE,
  KEY `actor_time` (`actor_time`) USING BTREE,
  KEY `actor_time_add` (`actor_time_add`) USING BTREE,
  KEY `actor_sex` (`actor_sex`) USING BTREE,
  KEY `actor_area` (`actor_area`) USING BTREE,
  KEY `actor_up` (`actor_up`) USING BTREE,
  KEY `actor_down` (`actor_down`) USING BTREE,
  KEY `actor_score` (`actor_score`) USING BTREE,
  KEY `actor_score_all` (`actor_score_all`) USING BTREE,
  KEY `actor_score_num` (`actor_score_num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for mac_admin
-- ----------------------------
DROP TABLE IF EXISTS `mac_admin`;
CREATE TABLE `mac_admin` (
  `admin_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(30) NOT NULL DEFAULT '',
  `admin_pwd` char(32) NOT NULL DEFAULT '',
  `admin_random` char(32) NOT NULL DEFAULT '',
  `admin_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `admin_auth` text NOT NULL,
  `admin_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_login_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_login_num` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_last_login_ip` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  KEY `admin_name` (`admin_name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

--
-- Table structure for table `mac_adtype`
--

DROP TABLE IF EXISTS `mac_adtype`;
CREATE TABLE `mac_adtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '类别名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1-正常；0：禁用',
  `sort` int(11) NOT NULL DEFAULT '50' COMMENT '排序',
  `tag` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告位标识',
  `description` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='APP广告管理';

--
-- Dumping data for table `mac_adtype`
--

/*!40000 ALTER TABLE `mac_adtype` DISABLE KEYS */;
INSERT INTO `mac_adtype` VALUES (52,'个人中心',1,0,'user_center','http://img-lvdoui.test.upcdn.net/fx.png',1560965440,1593330630),(53,'搜索广告位',0,0,'searcher','<a href=\"\" target=\"_blank\"><img src=\"\" width=\"100%\" height=\"100%\" border=\"0\" /></a>',1560965460,1595157884),(54,'播放器暂停广告',0,0,'player_pause','',1560965485,1572960349),(55,'播放器下方广告',0,0,'player_down','<a href=\"\" target=\"_blank\"><img src=\"\" width=\"100%\" height=\"100%\" border=\"0\" /></a>',1560965505,1584348125),(56,'综艺广告位',0,0,'variety','<a href=\"\" target=\"_blank\"><img src=\"\" width=\"100%\" height=\"100%\" border=\"0\" /></a>',1560965569,1583861143),(57,'动漫广告位',0,0,'cartoon','<a href=\"\" target=\"_blank\"><img src=\"\" width=\"100%\" height=\"100%\" border=\"0\" /></a>',1560965583,1583861131),(58,'剧集广告位',0,0,'sitcom','<a href=\"\" target=\"_blank\"><img src=\"\" width=\"100%\" height=\"100%\" border=\"0\" /></a>\r\n',1560965601,1583861119),(59,'电影广告位',0,0,'vod','<a href=\"\" target=\"_blank\"><img src=\"\" width=\"100%\" height=\"100%\" border=\"0\" /></a>',1560965614,1583861103),(60,'首页广告位',0,0,'index','<a href=\"\" target=\"_blank\"><img src=\"\" width=\"100%\" height=\"100%\" border=\"0\" /></a> \r\n',1560965629,1584348142),(61,'启动广告位',1,0,'startup_adv','<a href=\"\" target=\"_blank\"><img src=\"http://ossd.cn-sh2.ufileos.com/img/qdgg.gif\"  /></a>',1560965647,1594491349),(62,'QQ客服',1,0,'service_qq','389810156',1560965677,1598795259);

--
-- Table structure for table `mac_app_install_record`
--

DROP TABLE IF EXISTS `mac_app_install_record`;
CREATE TABLE `mac_app_install_record` (
  `app_install_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(255) NOT NULL DEFAULT '',
  `invite_user_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `is_pull` int(255) NOT NULL DEFAULT '0',
  `extra` varchar(255) NOT NULL DEFAULT '',
  `os` varchar(255) NOT NULL DEFAULT '',
  `os_version` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`app_install_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mac_app_version`
--

DROP TABLE IF EXISTS `mac_app_version`;
CREATE TABLE `mac_app_version` (
  `app_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `os` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `url2` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `is_required` int(11) NOT NULL,
  `type` int(255) DEFAULT '1',
  PRIMARY KEY (`app_version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='APP更新';

--
-- Dumping data for table `mac_app_version`
--

INSERT INTO `mac_app_version` VALUES (2,'1','v4.3.1','修复芒果播放。\r\n祝大家观影愉快！','http://app.maccms.ren','',1572790342,1605416869,1,2);

--
-- Table structure for table `mac_art`
--

DROP TABLE IF EXISTS `mac_art`;
CREATE TABLE `mac_art` (
  `art_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type_id_1` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `art_name` varchar(255) NOT NULL DEFAULT '',
  `art_sub` varchar(255) NOT NULL DEFAULT '',
  `art_en` varchar(255) NOT NULL DEFAULT '',
  `art_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `art_letter` char(1) NOT NULL DEFAULT '',
  `art_color` varchar(6) NOT NULL DEFAULT '',
  `art_from` varchar(30) NOT NULL DEFAULT '',
  `art_author` varchar(30) NOT NULL DEFAULT '',
  `art_tag` varchar(100) NOT NULL DEFAULT '',
  `art_class` varchar(255) NOT NULL DEFAULT '',
  `art_pic` varchar(255) NOT NULL DEFAULT '',
  `art_pic_thumb` varchar(255) NOT NULL DEFAULT '',
  `art_pic_slide` varchar(255) NOT NULL DEFAULT '',
  `art_blurb` varchar(255) NOT NULL DEFAULT '',
  `art_remarks` varchar(100) NOT NULL DEFAULT '',
  `art_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `art_tpl` varchar(30) NOT NULL DEFAULT '',
  `art_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `art_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `art_points` smallint(6) unsigned NOT NULL DEFAULT '0',
  `art_points_detail` smallint(6) unsigned NOT NULL DEFAULT '0',
  `art_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `art_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `art_hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `art_hits_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `art_hits_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `art_hits_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `art_time` int(10) unsigned NOT NULL DEFAULT '0',
  `art_time_add` int(10) unsigned NOT NULL DEFAULT '0',
  `art_time_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `art_time_make` int(10) unsigned NOT NULL DEFAULT '0',
  `art_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0',
  `art_score_all` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `art_score_num` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `art_rel_art` varchar(255) NOT NULL DEFAULT '',
  `art_rel_vod` varchar(255) NOT NULL DEFAULT '',
  `art_pwd` varchar(10) NOT NULL DEFAULT '',
  `art_pwd_url` varchar(255) NOT NULL DEFAULT '',
  `art_title` mediumtext NOT NULL,
  `art_note` mediumtext NOT NULL,
  `art_content` mediumtext NOT NULL,
  PRIMARY KEY (`art_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `type_id_1` (`type_id_1`) USING BTREE,
  KEY `art_level` (`art_level`) USING BTREE,
  KEY `art_hits` (`art_hits`) USING BTREE,
  KEY `art_time` (`art_time`) USING BTREE,
  KEY `art_letter` (`art_letter`) USING BTREE,
  KEY `art_down` (`art_down`) USING BTREE,
  KEY `art_up` (`art_up`) USING BTREE,
  KEY `art_tag` (`art_tag`) USING BTREE,
  KEY `art_name` (`art_name`) USING BTREE,
  KEY `art_enname` (`art_en`) USING BTREE,
  KEY `art_hits_day` (`art_hits_day`) USING BTREE,
  KEY `art_hits_week` (`art_hits_week`) USING BTREE,
  KEY `art_hits_month` (`art_hits_month`) USING BTREE,
  KEY `art_time_add` (`art_time_add`) USING BTREE,
  KEY `art_time_make` (`art_time_make`) USING BTREE,
  KEY `art_lock` (`art_lock`) USING BTREE,
  KEY `art_score` (`art_score`) USING BTREE,
  KEY `art_score_all` (`art_score_all`) USING BTREE,
  KEY `art_score_num` (`art_score_num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
-- Table structure for table `mac_card`
--

DROP TABLE IF EXISTS `mac_card`;
CREATE TABLE `mac_card` (
  `card_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(16) NOT NULL DEFAULT '',
  `card_pwd` varchar(8) NOT NULL DEFAULT '',
  `card_money` smallint(6) unsigned NOT NULL DEFAULT '0',
  `card_points` smallint(6) unsigned NOT NULL DEFAULT '0',
  `card_use_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `card_sale_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `card_add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `card_use_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`card_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `card_add_time` (`card_add_time`) USING BTREE,
  KEY `card_use_time` (`card_use_time`) USING BTREE,
  KEY `card_no` (`card_no`) USING BTREE,
  KEY `card_pwd` (`card_pwd`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_cash`
--

DROP TABLE IF EXISTS `mac_cash`;
CREATE TABLE `mac_cash` (
  `cash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cash_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cash_points` smallint(6) unsigned NOT NULL DEFAULT '0',
  `cash_money` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `cash_bank_name` varchar(60) NOT NULL DEFAULT '',
  `cash_bank_no` varchar(30) NOT NULL DEFAULT '',
  `cash_payee_name` varchar(30) NOT NULL DEFAULT '',
  `cash_time` int(10) unsigned NOT NULL DEFAULT '0',
  `cash_time_audit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cash_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `cash_status` (`cash_status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_category`
--

DROP TABLE IF EXISTS `mac_category`;
CREATE TABLE `mac_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL COMMENT '分类名',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父类id',
  `void_id` text NOT NULL COMMENT '电影id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开启：0：否；1：开启',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='APP栏目分类';

--
-- Dumping data for table `mac_category`
--

INSERT INTO `mac_category` VALUES (1,'电影抢先看',0,'108498,108487,108486,108478,108477,108475,108476,108470,108465,108464',1,0,1577729705,1595380938),(2,'追剧乐翻天',0,'108483,108482,108471,108472,108469,108466,106070,108460,108458,105760',1,0,1577729866,1595380965),(3,'腾讯视频专区',0,'41574,108442,36749,51553,56303,107339,51283,50797,50932,50643',1,0,1577729909,1595380992),(4,'优酷视频专区',0,'6994,50009,2969,42450,50011,49988,49548,47453,48618',1,0,1577729960,1583927634),(5,'最热喜剧大片',0,'107401,108502,108501,108500,108499,50956,108498,108495,108491,108494,108493',1,0,1577730105,1595381021);

--
-- Table structure for table `mac_cj_content`
--

DROP TABLE IF EXISTS `mac_cj_content`;
CREATE TABLE `mac_cj_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `nodeid` (`nodeid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_cj_history`
--

DROP TABLE IF EXISTS `mac_cj_history`;
CREATE TABLE `mac_cj_history` (
  `md5` char(32) NOT NULL,
  PRIMARY KEY (`md5`) USING BTREE,
  KEY `md5` (`md5`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Table structure for table `mac_cj_node`
--

DROP TABLE IF EXISTS `mac_cj_node`;
CREATE TABLE `mac_cj_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `type_rule` char(100) NOT NULL,
  `type_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  `program_config` text NOT NULL,
  `mid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`nodeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_collect`
--

DROP TABLE IF EXISTS `mac_collect`;
CREATE TABLE `mac_collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collect_name` varchar(30) NOT NULL DEFAULT '',
  `collect_url` varchar(255) NOT NULL DEFAULT '',
  `collect_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `collect_mid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `collect_appid` varchar(30) NOT NULL DEFAULT '',
  `collect_appkey` varchar(30) NOT NULL DEFAULT '',
  `collect_param` varchar(100) NOT NULL DEFAULT '',
  `collect_opt` int(2) NOT NULL,
  `collect_filter` int(2) NOT NULL DEFAULT '0',
  `collect_filter_from` varchar(255) NOT NULL,
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP数据采集';

--
-- Dumping data for table `mac_collect`
--

INSERT INTO `mac_collect` VALUES (24,'代搭建影视系统','QQ群:1146465924',1,1,'','','',0,0,'');

--
-- Table structure for table `mac_comment`
--

DROP TABLE IF EXISTS `mac_comment`;
CREATE TABLE `mac_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_mid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `comment_rid` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `comment_name` varchar(60) NOT NULL DEFAULT '',
  `comment_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_time` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_content` varchar(255) NOT NULL DEFAULT '',
  `comment_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comment_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comment_reply` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comment_report` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `comment_mid` (`comment_mid`) USING BTREE,
  KEY `comment_rid` (`comment_rid`) USING BTREE,
  KEY `comment_time` (`comment_time`) USING BTREE,
  KEY `comment_pid` (`comment_pid`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `comment_reply` (`comment_reply`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP评论数据';

--
-- Table structure for table `mac_danmu`
--

DROP TABLE IF EXISTS `mac_danmu`;
CREATE TABLE `mac_danmu` (
  `danmu_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `vod_id` int(11) NOT NULL,
  `at_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `danmu_time` int(11) NOT NULL,
  `status` int(255) NOT NULL DEFAULT '1',
  `dianzan_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`danmu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='弹幕';

--
-- Table structure for table `mac_gbook`
--

DROP TABLE IF EXISTS `mac_gbook`;
CREATE TABLE `mac_gbook` (
  `gbook_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gbook_rid` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gbook_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gbook_name` varchar(60) NOT NULL DEFAULT '',
  `gbook_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `gbook_time` int(10) unsigned NOT NULL DEFAULT '0',
  `gbook_reply_time` int(10) unsigned NOT NULL DEFAULT '0',
  `gbook_content` varchar(255) NOT NULL DEFAULT '',
  `gbook_reply` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gbook_id`) USING BTREE,
  KEY `gbook_rid` (`gbook_rid`) USING BTREE,
  KEY `gbook_time` (`gbook_time`) USING BTREE,
  KEY `gbook_reply_time` (`gbook_reply_time`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `gbook_reply` (`gbook_reply`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP留言反馈';

--
-- Table structure for table `mac_glog`
--

DROP TABLE IF EXISTS `mac_glog`;
CREATE TABLE `mac_glog` (
  `glog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_1` int(10) NOT NULL DEFAULT '0',
  `glog_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `glog_gold` smallint(6) unsigned NOT NULL DEFAULT '0',
  `glog_time` int(10) unsigned NOT NULL DEFAULT '0',
  `glog_remarks` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`glog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `glog_type` (`glog_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='发起提现';

--
-- Table structure for table `mac_gold_withdraw_apply`
--

DROP TABLE IF EXISTS `mac_gold_withdraw_apply`;
CREATE TABLE `mac_gold_withdraw_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `num` decimal(8,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 审批中 1 提现成功 2 提现失败',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_time` int(11) NOT NULL COMMENT '创建时间',
  `updated_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `success_time` int(11) NOT NULL DEFAULT '0' COMMENT '// 提现成功时间',
  `fail_time` int(11) NOT NULL DEFAULT '0' COMMENT '// 结束时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '提现方式',
  `account` varchar(255) NOT NULL DEFAULT '0' COMMENT '账户',
  `realname` varchar(255) NOT NULL DEFAULT '''''' COMMENT '真实姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金币提现申请';

--
-- Table structure for table `mac_group`
--

DROP TABLE IF EXISTS `mac_group`;
CREATE TABLE `mac_group` (
  `group_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) NOT NULL DEFAULT '',
  `group_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_type` varchar(255) NOT NULL DEFAULT '',
  `group_popedom` text NOT NULL,
  `group_points_day` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_points_week` smallint(6) NOT NULL DEFAULT '0',
  `group_points_month` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_points_year` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_points_free` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`) USING BTREE,
  KEY `group_status` (`group_status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员组管理';

--
-- Dumping data for table `mac_group`
--

INSERT INTO `mac_group` VALUES (1,'游客',1,',1,2,3,4,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',0,0,0,0,0),(2,'默认会员',1,',1,2,3,4,','{\"1\":{\"1\":\"1\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',0,0,0,0,0),(3,'VIP会员',1,',1,2,3,4,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',100,500,1500,15000,0);

--
-- Table structure for table `mac_groupchat`
--

DROP TABLE IF EXISTS `mac_groupchat`;
CREATE TABLE `mac_groupchat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群聊';

--
-- Table structure for table `mac_link`
--

DROP TABLE IF EXISTS `mac_link`;
CREATE TABLE `mac_link` (
  `link_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `link_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link_name` varchar(60) NOT NULL DEFAULT '',
  `link_sort` smallint(6) NOT NULL DEFAULT '0',
  `link_add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `link_time` int(10) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`) USING BTREE,
  KEY `link_sort` (`link_sort`) USING BTREE,
  KEY `link_type` (`link_type`) USING BTREE,
  KEY `link_add_time` (`link_add_time`) USING BTREE,
  KEY `link_time` (`link_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mac_link`
--

INSERT INTO `mac_link` VALUES (1,0,'一键脚本',1,1638284253,1638284253,'http://app.maccms.ren','');

--
-- Table structure for table `mac_message`
--

DROP TABLE IF EXISTS `mac_message`;
CREATE TABLE `mac_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='APP公告通知';

--
-- Dumping data for table `mac_message`
--

INSERT INTO `mac_message` VALUES (1,'你好陌生人：','2021-06-10 23:13:57','愿你三冬暖、愿你春不寒、愿你天黑有灯、下雨有伞、愿你路上有良人相伴~');

--
-- Table structure for table `mac_msg`
--

DROP TABLE IF EXISTS `mac_msg`;
CREATE TABLE `mac_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_to` varchar(30) NOT NULL DEFAULT '',
  `msg_code` varchar(10) NOT NULL DEFAULT '',
  `msg_content` varchar(255) NOT NULL DEFAULT '',
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`) USING BTREE,
  KEY `msg_code` (`msg_code`) USING BTREE,
  KEY `msg_time` (`msg_time`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_order`
--

DROP TABLE IF EXISTS `mac_order`;
CREATE TABLE `mac_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order_code` varchar(30) NOT NULL DEFAULT '',
  `order_price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `order_time` int(10) unsigned NOT NULL DEFAULT '0',
  `order_points` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_pay_type` varchar(10) NOT NULL DEFAULT '',
  `order_pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `order_remarks` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `order_code` (`order_code`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_time` (`order_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_plog`
--

DROP TABLE IF EXISTS `mac_plog`;
CREATE TABLE `mac_plog` (
  `plog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_1` int(10) NOT NULL DEFAULT '0',
  `plog_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `plog_points` smallint(6) unsigned NOT NULL DEFAULT '0',
  `plog_time` int(10) unsigned NOT NULL DEFAULT '0',
  `plog_remarks` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`plog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `plog_type` (`plog_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_role`
--

DROP TABLE IF EXISTS `mac_role`;
CREATE TABLE `mac_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_rid` int(10) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `role_en` varchar(255) NOT NULL DEFAULT '',
  `role_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `role_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `role_letter` char(1) NOT NULL DEFAULT '',
  `role_color` varchar(6) NOT NULL DEFAULT '',
  `role_actor` varchar(255) NOT NULL DEFAULT '',
  `role_remarks` varchar(100) NOT NULL DEFAULT '',
  `role_pic` varchar(255) NOT NULL DEFAULT '',
  `role_sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  `role_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `role_time` int(10) unsigned NOT NULL DEFAULT '0',
  `role_time_add` int(10) unsigned NOT NULL DEFAULT '0',
  `role_time_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `role_time_make` int(10) unsigned NOT NULL DEFAULT '0',
  `role_hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `role_hits_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `role_hits_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `role_hits_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `role_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0',
  `role_score_all` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `role_score_num` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `role_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `role_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `role_tpl` varchar(30) NOT NULL DEFAULT '',
  `role_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `role_content` text NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  KEY `role_rid` (`role_rid`) USING BTREE,
  KEY `role_name` (`role_name`) USING BTREE,
  KEY `role_en` (`role_en`) USING BTREE,
  KEY `role_letter` (`role_letter`) USING BTREE,
  KEY `role_actor` (`role_actor`) USING BTREE,
  KEY `role_level` (`role_level`) USING BTREE,
  KEY `role_time` (`role_time`) USING BTREE,
  KEY `role_time_add` (`role_time_add`) USING BTREE,
  KEY `role_score` (`role_score`) USING BTREE,
  KEY `role_score_all` (`role_score_all`) USING BTREE,
  KEY `role_score_num` (`role_score_num`) USING BTREE,
  KEY `role_up` (`role_up`) USING BTREE,
  KEY `role_down` (`role_down`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_sign`
--

DROP TABLE IF EXISTS `mac_sign`;
CREATE TABLE `mac_sign` (
  `sign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `reward` varchar(500) NOT NULL,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mac_tmpvod`
--

DROP TABLE IF EXISTS `mac_tmpvod`;
CREATE TABLE `mac_tmpvod` (
  `id1` int(10) unsigned DEFAULT NULL,
  `name1` varchar(255) NOT NULL DEFAULT '',
  `name_type` varchar(291) NOT NULL DEFAULT '',
  `tid1` smallint(6) NOT NULL DEFAULT '0',
  `year1` varchar(10) NOT NULL DEFAULT '',
  `area1` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mac_topic`
--

DROP TABLE IF EXISTS `mac_topic`;
CREATE TABLE `mac_topic` (
  `topic_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(255) NOT NULL DEFAULT '',
  `topic_en` varchar(255) NOT NULL DEFAULT '',
  `topic_sub` varchar(255) NOT NULL DEFAULT '',
  `topic_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `topic_sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  `topic_letter` char(1) NOT NULL DEFAULT '',
  `topic_color` varchar(6) NOT NULL DEFAULT '',
  `topic_tpl` varchar(30) NOT NULL DEFAULT '',
  `topic_type` varchar(255) NOT NULL DEFAULT '',
  `topic_pic` varchar(255) NOT NULL DEFAULT '',
  `topic_pic_thumb` varchar(255) NOT NULL DEFAULT '',
  `topic_pic_slide` varchar(255) NOT NULL DEFAULT '',
  `topic_key` varchar(255) NOT NULL DEFAULT '',
  `topic_des` varchar(255) NOT NULL DEFAULT '',
  `topic_title` varchar(255) NOT NULL DEFAULT '',
  `topic_blurb` varchar(255) NOT NULL DEFAULT '',
  `topic_remarks` varchar(100) NOT NULL DEFAULT '',
  `topic_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0',
  `topic_score_all` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_score_num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `topic_hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_hits_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_hits_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_hits_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_time` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_time_add` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_time_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_time_make` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_tag` varchar(255) NOT NULL DEFAULT '',
  `topic_rel_vod` text,
  `topic_rel_art` text,
  `topic_content` text,
  `topic_extend` text,
  PRIMARY KEY (`topic_id`) USING BTREE,
  KEY `topic_sort` (`topic_sort`) USING BTREE,
  KEY `topic_level` (`topic_level`) USING BTREE,
  KEY `topic_score` (`topic_score`) USING BTREE,
  KEY `topic_score_all` (`topic_score_all`) USING BTREE,
  KEY `topic_score_num` (`topic_score_num`) USING BTREE,
  KEY `topic_hits` (`topic_hits`) USING BTREE,
  KEY `topic_hits_day` (`topic_hits_day`) USING BTREE,
  KEY `topic_hits_week` (`topic_hits_week`) USING BTREE,
  KEY `topic_hits_month` (`topic_hits_month`) USING BTREE,
  KEY `topic_time_add` (`topic_time_add`) USING BTREE,
  KEY `topic_time` (`topic_time`) USING BTREE,
  KEY `topic_time_hits` (`topic_time_hits`) USING BTREE,
  KEY `topic_name` (`topic_name`) USING BTREE,
  KEY `topic_en` (`topic_en`) USING BTREE,
  KEY `topic_up` (`topic_up`) USING BTREE,
  KEY `topic_down` (`topic_down`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP专题';
--
-- Dumping data for table `mac_topic`
--

INSERT INTO `mac_topic` VALUES (2,'圣诞节必看，祝大家今天平安夜快乐~','shengdanjiebikanjiapian','',1,0,'','','detail.html','','https://ae01.alicdn.com/kf/Hc980ccce7a8845b5b4b1023e8fdeea08A.jpg','','','','','','今晚就是平安夜啦，祝大家今天平安夜快乐~明天圣诞节快乐~小编整理了18部圣诞节观看的电影。窝在被子里一个人看或者和伴侣和家人看都很适合哦~赶紧看起来吧~','',0,0,0,0.0,0,0,0,0,0,0,1590599402,1577460719,0,0,'爱情','50518,50515,50514,50511,50504,50503','','<p>今晚就是平安夜啦，祝大家今天平安夜快乐~明天圣诞节快乐~小编整理了18部圣诞节观看的电影。窝在被子里一个人看或者和伴侣和家人看都很适合哦~赶紧看起来吧~</p>',''),(4,'周末抢先看','zhoumoqiangxiandianyingguankanyizhikan','',1,0,'','','detail.html','','https://ae01.alicdn.com/kf/U486e0c4211d741c79cf755e1677dad7cN.jpg','','','','','','最近“少年的你”火爆全网，周冬雨在里面也是演技大爆发，获得一致好评。张艺谋曾评价周冬雨的表演“她是老天爷赏饭吃的演员，靠的就是一个感觉，她的戏不是演出来，就是自然而然来的。”下面咱们一起来欣赏下她的作品集，看周冬雨是如何从不起眼蜕变到惊艳影后的！','',0,0,0,0.0,0,0,0,0,0,0,1587447071,1577551494,0,0,'','50894,50893,50892,50891,50890','','<p>最近“少年的你”火爆全网，周冬雨在里面也是演技大爆发，获得一致好评。张艺谋曾评价周冬雨的表演“她是老天爷赏饭吃的演员，靠的就是一个感觉，她的戏不是演出来，就是自然而然来的。”下面咱们一起来欣赏下她的作品集，看周冬雨是如何从不起眼蜕变到惊艳影后的！</p>',''),(3,'2020年贺岁档','2020nianhesuidang','',1,0,'','','detail.html','','https://ae01.alicdn.com/kf/H7b2c30b42ebd47668db35a4e355c1df37.jpg','','','','','','2019年就剩下12天了，2020年一大波贺岁档正在向你招手：《唐人街探案3》《囧妈》《星球大战9》《中国女排》...小编为大家准备了十部春节档强片，你最期待哪一部呢？PS：小编将在第一时间，把最新的资源带给大家！准备好了吗？','',0,0,0,0.0,0,0,0,0,0,0,1587447103,1577537633,0,0,'动作','50632,50625,50620,50608,50606,50600','','<p>2019年就剩下12天了，2020年一大波贺岁档正在向你招手：《唐人街探案3》《囧妈》《星球大战9》《中国女排》...小编为大家准备了十部春节档强片，你最期待哪一部呢？PS：小编将在第一时间，把最新的资源带给大家！准备好了吗？</p>','');

--
-- Table structure for table `mac_type`
--

DROP TABLE IF EXISTS `mac_type`;
CREATE TABLE `mac_type` (
  `type_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) NOT NULL DEFAULT '',
  `type_en` varchar(60) NOT NULL DEFAULT '',
  `type_sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type_mid` smallint(6) unsigned NOT NULL DEFAULT '1',
  `type_pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type_tpl` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_list` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_detail` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_play` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_down` varchar(30) NOT NULL DEFAULT '',
  `type_key` varchar(255) NOT NULL DEFAULT '',
  `type_des` varchar(255) NOT NULL DEFAULT '',
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_union` varchar(255) NOT NULL DEFAULT '',
  `type_extend` text,
  PRIMARY KEY (`type_id`) USING BTREE,
  KEY `type_sort` (`type_sort`) USING BTREE,
  KEY `type_pid` (`type_pid`) USING BTREE,
  KEY `type_name` (`type_name`) USING BTREE,
  KEY `type_en` (`type_en`) USING BTREE,
  KEY `type_mid` (`type_mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP分类';

--
-- Dumping data for table `mac_type`
--

INSERT INTO `mac_type` VALUES (1,'电影','dianying',1,1,0,1,'type.html','show.html','detail.html','play.html','down.html','电影,电影大全,电影天堂,最新电影,好看的电影,电影排行榜','为您提供更新电影、好看的电影排行榜及电影迅雷下载，免费在线观看伦理电影、动作片、喜剧片、爱情片、搞笑片等全新电影。','电影','','{\"class\":\"\\u559c\\u5267,\\u52a8\\u4f5c,\\u7231\\u60c5,\\u60ca\\u609a,\\u72af\\u7f6a,\\u5192\\u9669,\\u79d1\\u5e7b,\\u60ac\\u7591,\\u5267\\u60c5,\\u52a8\\u753b,\\u6b66\\u4fa0,\\u6218\\u4e89,\\u6b4c\\u821e,\\u5947\\u5e7b,\\u4f20\\u8bb0,\\u8b66\\u532a,\\u5386\\u53f2,\\u8fd0\\u52a8,\\u4f26\\u7406,\\u707e\\u96be,\\u897f\\u90e8,\\u9b54\\u5e7b,\\u67aa\\u6218,\\u6050\\u6016,\\u8bb0\\u5f55\",\"area\":\"\\u5927\\u9646,\\u7f8e\\u56fd,\\u9999\\u6e2f,\\u97e9\\u56fd,\\u82f1\\u56fd,\\u53f0\\u6e7e,\\u65e5\\u672c,\\u6cd5\\u56fd,\\u610f\\u5927\\u5229,\\u5fb7\\u56fd,\\u897f\\u73ed\\u7259,\\u6cf0\\u56fd,\\u5176\\u5b83\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u6cd5\\u8bed,\\u5fb7\\u8bed,\\u5176\\u5b83\",\"year\":\"2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u9ec4\\u6e24,\\u5468\\u8fc5,\\u5468\\u51ac\\u96e8,\\u8303\\u51b0\\u51b0,\\u9648\\u5b66\\u51ac,\\u9648\\u4f1f\\u9706,\\u90ed\\u91c7\\u6d01,\\u9093\\u8d85,\\u6210\\u9f99,\\u845b\\u4f18,\\u6797\\u6b63\\u82f1,\\u5f20\\u5bb6\\u8f89,\\u6881\\u671d\\u4f1f,\\u5f90\\u5ce5,\\u90d1\\u607a,\\u5434\\u5f66\\u7956,\\u5218\\u5fb7\\u534e,\\u5468\\u661f\\u9a70,\\u6797\\u9752\\u971e,\\u5468\\u6da6\\u53d1,\\u674e\\u8fde\\u6770,\\u7504\\u5b50\\u4e39,\\u53e4\\u5929\\u4e50,\\u6d2a\\u91d1\\u5b9d,\\u59da\\u6668,\\u502a\\u59ae,\\u9ec4\\u6653\\u660e,\\u5f6d\\u4e8e\\u664f,\\u6c64\\u552f,\\u9648\\u5c0f\\u6625\",\"director\":\"\\u51af\\u5c0f\\u521a,\\u5f20\\u827a\\u8c0b,\\u5434\\u5b87\\u68ee,\\u9648\\u51ef\\u6b4c,\\u5f90\\u514b,\\u738b\\u5bb6\\u536b,\\u59dc\\u6587,\\u5468\\u661f\\u9a70,\\u674e\\u5b89\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}'),(2,'连续剧','lianxuju',2,1,0,1,'type.html','show.html','detail.html','play.html','down.html','电视剧,最新电视剧,好看的电视剧,热播电视剧,电视剧在线观看','为您提供2018新电视剧排行榜，韩国电视剧、泰国电视剧、香港TVB全新电视剧排行榜、好看的电视剧等热播电视剧排行榜，并提供免费高清电视剧下载及在线观看。','电视剧','','{\"class\":\"\\u53e4\\u88c5,\\u559c\\u5267,\\u5076\\u50cf,\\u5bb6\\u5ead,\\u8b66\\u532a,\\u8a00\\u60c5,\\u519b\\u4e8b,\\u6b66\\u4fa0,\\u60ac\\u7591,\\u5386\\u53f2,\\u519c\\u6751,\\u90fd\\u5e02,\\u795e\\u8bdd,\\u79d1\\u5e7b,\\u5c11\\u513f,\\u641e\\u7b11,\\u8c0d\\u6218,\\u6218\\u4e89,\\u5e74\\u4ee3,\\u72af\\u7f6a,\\u6050\\u6016,\\u60ca\\u609a,\\u7231\\u60c5,\\u5267\\u60c5,\\u5947\\u5e7b\",\"area\":\"\\u5927\\u9646,\\u97e9\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u65e5\\u672c,\\u7f8e\\u56fd,\\u6cf0\\u56fd,\\u82f1\\u56fd,\\u65b0\\u52a0\\u5761,\\u5176\\u4ed6,\\u9999\\u6e2f\\u5730\\u533a\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u80e1\\u6b4c,\\u970d\\u5efa\\u534e,\\u8d75\\u4e3d\\u9896,\\u5218\\u6d9b,\\u5218\\u8bd7\\u8bd7,\\u9648\\u4f1f\\u9706,\\u5434\\u5947\\u9686,\\u9646\\u6bc5,\\u5510\\u5ae3,\\u5173\\u6653\\u5f64,\\u5b59\\u4fea,\\u674e\\u6613\\u5cf0,\\u5f20\\u7ff0,\\u674e\\u6668,\\u8303\\u51b0\\u51b0,\\u6797\\u5fc3\\u5982,\\u6587\\u7ae0,\\u9a6c\\u4f0a\\u740d,\\u4f5f\\u5927\\u4e3a,\\u5b59\\u7ea2\\u96f7,\\u9648\\u5efa\\u658c,\\u674e\\u5c0f\\u7490\",\"director\":\"\\u5f20\\u7eaa\\u4e2d,\\u674e\\u5c11\\u7ea2,\\u5218\\u6c5f,\\u5b54\\u7b19,\\u5f20\\u9ece,\\u5eb7\\u6d2a\\u96f7,\\u9ad8\\u5e0c\\u5e0c,\\u80e1\\u73ab,\\u8d75\\u5b9d\\u521a,\\u90d1\\u6653\\u9f99\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}'),(3,'综艺','zongyi',3,1,0,1,'type.html','show.html','detail.html','play.html','down.html','综艺,综艺节目,最新综艺节目,综艺节目排行榜','为您提供新综艺节目、好看的综艺节目排行榜，免费高清在线观看选秀、情感、访谈、搞笑、真人秀、脱口秀等热门综艺节目。','综艺','','{\"class\":\"\\u771f\\u4eba\\u79c0,\\u8bbf\\u8c08,\\u60c5\\u611f,\\u9009\\u79c0,\\u65c5\\u6e38,\\u7f8e\\u98df,\\u53e3\\u79c0,\\u66f2\\u827a,\\u641e\\u7b11,\\u6e38\\u620f,\\u6b4c\\u821e,\\u751f\\u6d3b,\\u97f3\\u4e50,\\u65f6\\u5c1a,\\u76ca\\u667a,\\u804c\\u573a,\\u5c11\\u513f,\\u7eaa\\u5b9e,\\u76db\\u4f1a\",\"area\":\"\\u5927\\u9646,\\u97e9\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u7f8e\\u56fd,\\u5176\\u5b83\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004\",\"star\":\"\\u4f55\\u7085,\\u6c6a\\u6db5,\\u8c22\\u5a1c,\\u5468\\u7acb\\u6ce2,\\u9648\\u9c81\\u8c6b,\\u5b5f\\u975e,\\u674e\\u9759,\\u6731\\u519b,\\u6731\\u4e39,\\u534e\\u5c11,\\u90ed\\u5fb7\\u7eb2,\\u6768\\u6f9c\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}'),(4,'动漫','dongman',4,1,0,1,'type.html','show.html','detail.html','play.html','down.html','动漫,动漫大全,最新动漫,好看的动漫,日本动漫,动漫排行榜','为您提供新动漫、好看的动漫排行榜，免费高清在线观看热血动漫、卡通动漫、新番动漫、百合动漫、搞笑动漫、国产动漫、动漫电影等热门动漫。','动画片','','{\"class\":\"\\u70ed\\u8840,\\u79d1\\u5e7b,\\u63a8\\u7406,\\u641e\\u7b11,\\u5192\\u9669,\\u6821\\u56ed,\\u52a8\\u4f5c,\\u673a\\u6218,\\u8fd0\\u52a8,\\u6218\\u4e89,\\u5c11\\u5e74,\\u5c11\\u5973,\\u793e\\u4f1a,\\u539f\\u521b,\\u4eb2\\u5b50,\\u76ca\\u667a,\\u52b1\\u5fd7,\\u5176\\u4ed6\",\"area\":\"\\u5927\\u9646,\\u65e5\\u672c,\\u6b27\\u7f8e,\\u5176\\u4ed6\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"TV\\u7248,\\u7535\\u5f71\\u7248,OVA\\u7248,\\u771f\\u4eba\\u7248\"}'),(5,'直播','zhibo',5,1,0,1,'type.html','show.html','detail.html','play.html','down.html','直播,直播大全,最新直播,好看的直播,日本直播,直播排行榜','为您提供新直播、好看的直播排行榜，免费高清在线观看直播、央视直播、地方直播、综艺直播、CCTV、动漫电影等热门动漫。','电视直播','','{\"class\":\"\\u592e\\u89c6\\u76f4\\u64ad,\\u5730\\u65b9\\u76f4\\u64ad,\\u7efc\\u827a\\u8282\\u76ee,\\u5a31\\u4e50\\u8d44\\u8baf\",\"area\":\"\\u5927\\u9646,\\u65e5\\u672c,\\u6b27\\u7f8e,\\u5176\\u4ed6\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\\u9ad8\\u6e05,\\u84dd\\u5149\"}');

--
-- Table structure for table `mac_ulog`
--

DROP TABLE IF EXISTS `mac_ulog`;
CREATE TABLE `mac_ulog` (
  `ulog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ulog_mid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ulog_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ulog_rid` int(10) unsigned NOT NULL DEFAULT '0',
  `ulog_sid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ulog_nid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `ulog_points` smallint(6) unsigned NOT NULL DEFAULT '0',
  `ulog_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ulog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `ulog_mid` (`ulog_mid`) USING BTREE,
  KEY `ulog_type` (`ulog_type`) USING BTREE,
  KEY `ulog_rid` (`ulog_rid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Table structure for table `mac_user`
--

DROP TABLE IF EXISTS `mac_user`;
CREATE TABLE `mac_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(30) DEFAULT '',
  `user_pwd` varchar(32) DEFAULT '',
  `user_nick_name` varchar(30) NOT NULL DEFAULT '',
  `user_qq` varchar(16) NOT NULL DEFAULT '',
  `user_email` varchar(30) NOT NULL DEFAULT '',
  `user_phone` varchar(16) NOT NULL DEFAULT '',
  `user_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_portrait` varchar(200) NOT NULL DEFAULT '0',
  `user_portrait_thumb` varchar(100) NOT NULL DEFAULT '',
  `user_openid_qq` varchar(40) NOT NULL DEFAULT '',
  `user_openid_weixin` varchar(40) NOT NULL DEFAULT '',
  `user_question` varchar(255) NOT NULL DEFAULT '',
  `user_answer` varchar(255) NOT NULL DEFAULT '',
  `user_points` int(10) unsigned NOT NULL DEFAULT '0',
  `user_points_froze` int(10) unsigned NOT NULL DEFAULT '0',
  `user_reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_reg_ip` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_login_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `user_last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_login_today` int(10) NOT NULL DEFAULT '0',
  `user_last_login_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `user_login_num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `user_extend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `user_random` varchar(32) NOT NULL DEFAULT '',
  `user_end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `user_pid_2` int(10) unsigned NOT NULL DEFAULT '0',
  `user_pid_3` int(10) unsigned NOT NULL DEFAULT '0',
  `is_agents` int(11) NOT NULL DEFAULT '0',
  `user_gold` int(8) NOT NULL DEFAULT '0' COMMENT '用户拥有金币',
  `view_times` int(11) NOT NULL DEFAULT '0',
  `user_pid_num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `type_id` (`group_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `user_reg_time` (`user_reg_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员用户数据';

--
-- Table structure for table `mac_view30m`
--

DROP TABLE IF EXISTS `mac_view30m`;
CREATE TABLE `mac_view30m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) DEFAULT NULL,
  `view_seconds` int(255) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `vod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `mac_visit`
--

DROP TABLE IF EXISTS `mac_visit`;
CREATE TABLE `mac_visit` (
  `visit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0',
  `visit_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `visit_ly` varchar(100) NOT NULL DEFAULT '',
  `visit_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`visit_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `visit_time` (`visit_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `mac_vlog`
--

DROP TABLE IF EXISTS `mac_vlog`;
CREATE TABLE `mac_vlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vod_id` int(11) DEFAULT NULL,
  `nid` varchar(200) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `percent` varchar(255) DEFAULT NULL,
  `last_view_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `curProgress` int(11) NOT NULL,
  `urlIndex` int(11) NOT NULL,
  `playSourceIndex` int(11) NOT NULL,
  `isvip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='APP播放记录';

--
-- Table structure for table `mac_vod`
--

DROP TABLE IF EXISTS `mac_vod`;
CREATE TABLE `mac_vod` (
  `vod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(6) NOT NULL DEFAULT '0',
  `type_id_1` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `vod_name` varchar(255) NOT NULL DEFAULT '',
  `vod_sub` varchar(255) NOT NULL DEFAULT '',
  `vod_en` varchar(255) NOT NULL DEFAULT '',
  `vod_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vod_letter` char(1) NOT NULL DEFAULT '',
  `vod_color` varchar(6) NOT NULL DEFAULT '',
  `vod_tag` varchar(100) NOT NULL DEFAULT '',
  `vod_custom_tag` varchar(100) DEFAULT NULL,
  `vod_class` varchar(255) NOT NULL DEFAULT '',
  `vod_pic` varchar(255) NOT NULL DEFAULT '',
  `vod_pic_thumb` varchar(255) NOT NULL DEFAULT '',
  `vod_pic_slide` varchar(255) NOT NULL DEFAULT '',
  `vod_actor` varchar(255) NOT NULL DEFAULT '',
  `vod_director` varchar(255) NOT NULL DEFAULT '',
  `vod_writer` varchar(100) NOT NULL DEFAULT '',
  `vod_behind` varchar(100) NOT NULL DEFAULT '',
  `vod_blurb` varchar(255) NOT NULL DEFAULT '',
  `vod_remarks` varchar(100) NOT NULL DEFAULT '',
  `vod_pubdate` varchar(100) NOT NULL DEFAULT '',
  `vod_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_serial` varchar(20) NOT NULL DEFAULT '0',
  `vod_tv` varchar(30) NOT NULL DEFAULT '',
  `vod_weekday` varchar(30) NOT NULL DEFAULT '',
  `vod_area` varchar(20) NOT NULL DEFAULT '',
  `vod_lang` varchar(10) NOT NULL DEFAULT '',
  `vod_year` varchar(10) NOT NULL DEFAULT '',
  `vod_version` varchar(30) NOT NULL DEFAULT '',
  `vod_state` varchar(30) NOT NULL DEFAULT '',
  `vod_author` varchar(60) NOT NULL DEFAULT '',
  `vod_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `vod_tpl` varchar(30) NOT NULL DEFAULT '',
  `vod_tpl_play` varchar(30) NOT NULL DEFAULT '',
  `vod_tpl_down` varchar(30) NOT NULL DEFAULT '',
  `vod_isend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vod_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vod_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vod_levels` int(11) NOT NULL DEFAULT '0',
  `vod_copyright` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vod_points` smallint(6) unsigned NOT NULL DEFAULT '0',
  `vod_points_play` smallint(6) unsigned NOT NULL DEFAULT '0',
  `vod_points_down` smallint(6) unsigned NOT NULL DEFAULT '0',
  `vod_hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_hits_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_hits_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_hits_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_duration` varchar(10) NOT NULL DEFAULT '',
  `vod_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0',
  `vod_score_all` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_score_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `vod_time_add` int(10) unsigned NOT NULL DEFAULT '0',
  `vod_time_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `vod_time_make` int(10) unsigned NOT NULL DEFAULT '0',
  `vod_trysee` smallint(6) unsigned NOT NULL DEFAULT '0',
  `vod_douban_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vod_douban_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0',
  `vod_reurl` varchar(255) NOT NULL DEFAULT '',
  `vod_rel_vod` varchar(255) NOT NULL DEFAULT '',
  `vod_rel_art` varchar(255) NOT NULL DEFAULT '',
  `vod_pwd` varchar(10) NOT NULL DEFAULT '',
  `vod_pwd_url` varchar(255) NOT NULL DEFAULT '',
  `vod_pwd_play` varchar(10) NOT NULL DEFAULT '',
  `vod_pwd_play_url` varchar(255) NOT NULL DEFAULT '',
  `vod_pwd_down` varchar(10) NOT NULL DEFAULT '',
  `vod_pwd_down_url` varchar(255) NOT NULL DEFAULT '',
  `vod_content` text NOT NULL,
  `vod_play_from` varchar(255) NOT NULL DEFAULT '',
  `vod_play_server` varchar(255) NOT NULL DEFAULT '',
  `vod_play_note` varchar(255) NOT NULL DEFAULT '',
  `vod_play_url` mediumtext NOT NULL,
  `vod_down_from` varchar(255) NOT NULL DEFAULT '',
  `vod_down_server` varchar(255) NOT NULL DEFAULT '',
  `vod_down_note` varchar(255) NOT NULL DEFAULT '',
  `vod_down_url` mediumtext NOT NULL,
  `vod_plot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vod_plot_name` mediumtext NOT NULL,
  `vod_plot_detail` mediumtext NOT NULL,
  PRIMARY KEY (`vod_id`),
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `type_id_1` (`type_id_1`) USING BTREE,
  KEY `vod_level` (`vod_level`) USING BTREE,
  KEY `vod_hits` (`vod_hits`) USING BTREE,
  KEY `vod_letter` (`vod_letter`) USING BTREE,
  KEY `vod_name` (`vod_name`) USING BTREE,
  KEY `vod_year` (`vod_year`) USING BTREE,
  KEY `vod_area` (`vod_area`) USING BTREE,
  KEY `vod_lang` (`vod_lang`) USING BTREE,
  KEY `vod_tag` (`vod_tag`) USING BTREE,
  KEY `vod_class` (`vod_class`) USING BTREE,
  KEY `vod_lock` (`vod_lock`) USING BTREE,
  KEY `vod_up` (`vod_up`) USING BTREE,
  KEY `vod_down` (`vod_down`) USING BTREE,
  KEY `vod_en` (`vod_en`) USING BTREE,
  KEY `vod_hits_day` (`vod_hits_day`) USING BTREE,
  KEY `vod_hits_week` (`vod_hits_week`) USING BTREE,
  KEY `vod_hits_month` (`vod_hits_month`) USING BTREE,
  KEY `vod_plot` (`vod_plot`) USING BTREE,
  KEY `vod_points_play` (`vod_points_play`) USING BTREE,
  KEY `vod_points_down` (`vod_points_down`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `vod_time_add` (`vod_time_add`) USING BTREE,
  KEY `vod_time` (`vod_time`) USING BTREE,
  KEY `vod_time_make` (`vod_time_make`) USING BTREE,
  KEY `vod_actor` (`vod_actor`) USING BTREE,
  KEY `vod_director` (`vod_director`) USING BTREE,
  KEY `vod_score_all` (`vod_score_all`) USING BTREE,
  KEY `vod_score_num` (`vod_score_num`) USING BTREE,
  KEY `vod_total` (`vod_total`) USING BTREE,
  KEY `vod_score` (`vod_score`) USING BTREE,
  KEY `vod_version` (`vod_version`),
  KEY `vod_state` (`vod_state`),
  KEY `vod_isend` (`vod_isend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mac_youxi`
--

DROP TABLE IF EXISTS `mac_youxi`;
CREATE TABLE `mac_youxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='APP游戏页面';

INSERT INTO `mac_youxi` VALUES (1,'游戏','1','http://app.maccms.ren');

--
-- Table structure for table `mac_zhibo`
--

DROP TABLE IF EXISTS `mac_zhibo`;
CREATE TABLE `mac_zhibo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='直播';

--
-- Dumping data for table `mac_zhibo`
--

INSERT INTO `mac_zhibo` VALUES (1,'虎牙电视轮播','http://img3.imgtn.bdimg.com/it/u=4071645708,1806944269&fm=26&gp=0.jpg','https://app.maccms.ren'),(2,'网络电视直播','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=820960115,2542239298&fm=26&gp=0.jpg','http://www.zhiboba.org/dianshitai'),(3,'游拍直播','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2274747463,4183354344&fm=26&gp=0.jpg','https://m.4399youpai.com/zhibo/game'),(4,'六间房直播','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2025620803,4212504364&fm=26&gp=0.jpg','http://m.v.6.cn/?referrer='),(5,'电视剧轮播','https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2102833997,2917410739&fm=26&gp=0.jpg','http://www.baidu.com'),(6,'虎牙游戏直播','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2866237030,2397668445&fm=26&gp=0.jpg','https://www.huya.com/g'),(7,'小说','http://img2.imgtn.bdimg.com/it/u=2059116237,2535882687&fm=26&gp=0.jpg','http://m.shuhai.com'),(8,'微赞','http://img4.imgtn.bdimg.com/it/u=628053479,3428469491&fm=26&gp=0.jpg','https://wx.vzan.com/live/tvchat-70010603#');
