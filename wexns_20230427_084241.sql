-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: wexns
-- ------------------------------------------------------
-- Server version	5.7.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `danmaku_ip`
--

DROP TABLE IF EXISTS `danmaku_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `danmaku_ip` (
  `ip` varchar(12) NOT NULL COMMENT '发送弹幕的IP地址',
  `c` int(1) NOT NULL DEFAULT '1' COMMENT '规定时间内的发送次数',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danmaku_ip`
--

LOCK TABLES `danmaku_ip` WRITE;
/*!40000 ALTER TABLE `danmaku_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `danmaku_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danmaku_list`
--

DROP TABLE IF EXISTS `danmaku_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danmaku_list`
--

LOCK TABLES `danmaku_list` WRITE;
/*!40000 ALTER TABLE `danmaku_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `danmaku_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danmaku_report`
--

DROP TABLE IF EXISTS `danmaku_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danmaku_report`
--

LOCK TABLES `danmaku_report` WRITE;
/*!40000 ALTER TABLE `danmaku_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `danmaku_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_actor`
--

DROP TABLE IF EXISTS `mac_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_id_1` int(10) unsigned NOT NULL DEFAULT '0',
  `actor_tag` varchar(255) NOT NULL DEFAULT '',
  `actor_class` varchar(255) NOT NULL DEFAULT '',
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_actor`
--

LOCK TABLES `mac_actor` WRITE;
/*!40000 ALTER TABLE `mac_actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_admin`
--

DROP TABLE IF EXISTS `mac_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  PRIMARY KEY (`admin_id`) USING BTREE,
  KEY `admin_name` (`admin_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员账户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_admin`
--

LOCK TABLES `mac_admin` WRITE;
/*!40000 ALTER TABLE `mac_admin` DISABLE KEYS */;
INSERT INTO `mac_admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','3814cadf2138351a3eeb9e10995f16fb',1,',index/welcome,index/quickmenu,index/iframe,index/clear,index/unlocked,index/select,upload/upload,system/config,system/configcomment,system/configupload,system/configurl,system/configplay,system/configcollect,system/configinterface,system/configapi,system/configconnect,system/configweixin,system/configemail,timming/index,type/info,type/del,type/field,type/index,type/info,type/batch,type/del,type/field,type/extend,topic/data,topic/info,topic/batch,topic/del,topic/field,link/index,link/info,link/batch,link/del,link/field,gbook/data,gbook/info,gbook/del,gbook/field,comment/data,comment/info,comment/del,comment/field,images/index,images/del,category/index,category/info,category/del,category/field,vodplayer/index,vodplayer/info,vodplayer/del,vodplayer/field,role/data,role/info,role/del,role/field,role/info,vod/data,vod/info,vod/del,vod/field,vod/info,vod/data,vod/data,vod/data,vod/data,vod/batch,vod/data,vodserver/index,vodserver/info,vodserver/del,vodserver/field,voddowner/index,voddowner/info,voddowner/del,voddowner/field,actor/data,actor/info,actor/del,actor/field,actor/info,art/data,art/info,art/del,art/field,art/info,art/data,art/data,art/batch,art/data,admin/index,admin/info,admin/del,admin/field,group/index,group/info,group/del,group/field,user/data,user/info,user/del,user/field,card/index,card/info,card/del,order/index,order/del,ulog/index,ulog/del,plog/index,plog/del,glog/index,cash/index,cash/del,cash/audit,template/index,template/info,template/del,template/ads,template/wizard,collect/index,collect/info,collect/del,cj/index,cj/info,cj/del,cj/program,cj/col_url,cj/col_content,cj/publish,cj/export,cj/import,database/index,database/export,database/import,database/optimize,database/repair,database/del,database/columns,database/sql,database/rep,system/configuser,system/configsms,system/configapppopupwindow,system/configtaskarticle,appversion/index,appsetting/index,system/configpay,adtype/index,adtype/info,adtype/del,adtype/field,zhibo/index,youxi/index,message/index,message/info,message/del,message/field,groupchat/index,groupchat/info,groupchat/del,groupchat/field,wxapi/info,wxapi/del,wxapi/field,admin/lock,addon/index,urlsend/index,urlsend/push,urlsend/baidu_push,urlsend/baidu_bear,addon/downloaded,addon/install,addon/uninstall,addon/config,addon/state,addon/local,addon/upgrade,',1682555218,0,1672,1682555218,0);
/*!40000 ALTER TABLE `mac_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_adtype`
--

DROP TABLE IF EXISTS `mac_adtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='APP广告管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_adtype`
--

LOCK TABLES `mac_adtype` WRITE;
/*!40000 ALTER TABLE `mac_adtype` DISABLE KEYS */;
INSERT INTO `mac_adtype` VALUES (52,'中心',0,0,'user_center','http://img.isryun.com/images/2020/06/28/a6187fd4ed32ace554adbb81dbff1bbd.png',1560965440,1593330630),(53,'搜索页广告位',0,0,'searcher','<a href=\"#\"  target=\"_blank\" ><img src=\"https://s3.bmp.ovh/imgs/2022/04/28/d6f86eb32a195432.png\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965460,1651150988),(54,'播放器暂停广告',0,0,'player_pause','<a href=\"#\"  target=\"_blank\" ><img src=\"https://s3.bmp.ovh/imgs/2022/04/28/d6f86eb32a195432.png\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965485,1651150965),(55,'播放器下方广告',1,0,'player_down','<a href=\"http://gantanhao.vip/gth/#/minishop?share_id=481881&shop_name=%25E5%25A5%2587%25E4%25B9%2590%25E7%25A7%2591%25E6%258A%2580%25E9%2580%259A%25E8%25AE%25AF\"  target=\"_blank\" ><img src=\"https://static.91haoka.cn/1678855435l57.jpg\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965505,1682556062),(56,'综艺广告位',0,0,'variety','<a href=\"#\"  target=\"_blank\" ><img src=\"https://s3.bmp.ovh/imgs/2022/04/28/d6f86eb32a195432.png\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965569,1651150954),(57,'动漫广告位',0,0,'cartoon','<a href=\"#\"  target=\"_blank\" ><img src=\"https://s3.bmp.ovh/imgs/2022/04/28/d6f86eb32a195432.png\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965583,1651150946),(58,'连续剧广告位',0,0,'sitcom','<a href=\"#\"  target=\"_blank\" ><img src=\"https://s3.bmp.ovh/imgs/2022/04/28/d6f86eb32a195432.png\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965601,1651150937),(59,'电影广告位',0,0,'vod','<a href=\"#\"  target=\"_blank\" ><img src=\"https://s3.bmp.ovh/imgs/2022/04/28/d6f86eb32a195432.png\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965614,1651150918),(60,'首页广告位',1,0,'index','<a href=\"https://h5.whd8888.com/#/?shareCode=S3GZAD\"  target=\"_blank\" ><img src=\"https://s1.locimg.com/2023/04/07/d70d2dc0da0eb.png\" width=\"100%\" height=\"100%\" border=\"0\" /></a> ',1560965629,1682556021),(61,'启动页广告位',1,0,'csj_startup_adv','11443',1560965647,1663817941),(70,'一键登录',1,0,'define_account','0',1643361542,1643712221),(62,'QQ客服',1,0,'service_qq','838579971',1560965677,1682555454),(66,'会员下载',0,63,'download','',1619417774,0),(67,'会员画中画',0,201,'pictureinpicture','',1619417892,1643367156),(68,'会员投屏',0,200,'projection','',1619417925,1643367141),(71,'一键加群',0,0,'service_qqqun','',1643366902,1682555906),(72,'信息流',1,0,'csj_video8_adv','11447',1643366976,1663776581),(73,'激励视频',1,0,'csj_video_adv','11444',1643367007,1663776565),(74,'插屏广告',1,0,'csj_video2_adv','11445',1643367041,1663776551),(75,'全屏广告',1,0,'csj_index3_adv','11446',1643367074,1663776535),(76,'激励次数',1,0,'Number_of_awards','15',1643367121,1644381003),(79,'全屏广告',1,0,'startup_adv','<a href=\"http://gantanhao.vip/gth/#/minishop?share_id=481881&shop_name=%25E5%25A5%2587%25E4%25B9%2590%25E7%25A7%2591%25E6%258A%2580%25E9%2580%259A%25E8%25AE%25A\"><img src=\"https://static.91haoka.cn/1682253146CzI.jpg\" width=\"100%\" height=\"100%\" border=\"0\" /></a>',1643719971,1682555954);
/*!40000 ALTER TABLE `mac_adtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_annex`
--

DROP TABLE IF EXISTS `mac_annex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_annex` (
  `annex_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annex_time` int(10) unsigned NOT NULL DEFAULT '0',
  `annex_file` varchar(255) NOT NULL DEFAULT '',
  `annex_size` int(10) unsigned NOT NULL DEFAULT '0',
  `annex_type` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`annex_id`),
  KEY `annex_time` (`annex_time`),
  KEY `annex_file` (`annex_file`),
  KEY `annex_type` (`annex_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_annex`
--

LOCK TABLES `mac_annex` WRITE;
/*!40000 ALTER TABLE `mac_annex` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_annex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_app_install_record`
--

DROP TABLE IF EXISTS `mac_app_install_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_app_install_record`
--

LOCK TABLES `mac_app_install_record` WRITE;
/*!40000 ALTER TABLE `mac_app_install_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_app_install_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_app_version`
--

DROP TABLE IF EXISTS `mac_app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_app_version`
--

LOCK TABLES `mac_app_version` WRITE;
/*!40000 ALTER TABLE `mac_app_version` DISABLE KEYS */;
INSERT INTO `mac_app_version` VALUES (2,'1','v4.3.1','修复芒果播放。\r\n祝大家观影愉快！','http://aHR0cDovLzExMy4zMS4xMTQuMTc2Ojk2MTk=/app','',1572790342,1605416869,1,2);
/*!40000 ALTER TABLE `mac_app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_art`
--

DROP TABLE IF EXISTS `mac_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `art_pic_screenshot` text,
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_art`
--

LOCK TABLES `mac_art` WRITE;
/*!40000 ALTER TABLE `mac_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_card`
--

DROP TABLE IF EXISTS `mac_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_card`
--

LOCK TABLES `mac_card` WRITE;
/*!40000 ALTER TABLE `mac_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cash`
--

DROP TABLE IF EXISTS `mac_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cash`
--

LOCK TABLES `mac_cash` WRITE;
/*!40000 ALTER TABLE `mac_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_category`
--

DROP TABLE IF EXISTS `mac_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_category`
--

LOCK TABLES `mac_category` WRITE;
/*!40000 ALTER TABLE `mac_category` DISABLE KEYS */;
INSERT INTO `mac_category` VALUES (1,'电影抢先看',0,'108498,108487,108486,108478,108477,108475,108476,108470,108465,108464',1,0,1577729705,1595380938),(2,'追剧乐翻天',0,'108483,108482,108471,108472,108469,108466,106070,108460,108458,105760',1,0,1577729866,1595380965),(3,'腾讯视频专区',0,'41574,108442,36749,51553,56303,107339,51283,50797,50932,50643',1,0,1577729909,1595380992),(4,'优酷视频专区',0,'6994,50009,2969,42450,50011,49988,49548,47453,48618',1,0,1577729960,1583927634),(5,'最热喜剧大片',0,'107401,108502,108501,108500,108499,50956,108498,108495,108491,108494,108493',1,0,1577730105,1595381021);
/*!40000 ALTER TABLE `mac_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cj_content`
--

DROP TABLE IF EXISTS `mac_cj_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cj_content`
--

LOCK TABLES `mac_cj_content` WRITE;
/*!40000 ALTER TABLE `mac_cj_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cj_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cj_history`
--

DROP TABLE IF EXISTS `mac_cj_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_cj_history` (
  `md5` char(32) NOT NULL,
  PRIMARY KEY (`md5`) USING BTREE,
  KEY `md5` (`md5`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cj_history`
--

LOCK TABLES `mac_cj_history` WRITE;
/*!40000 ALTER TABLE `mac_cj_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cj_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cj_node`
--

DROP TABLE IF EXISTS `mac_cj_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cj_node`
--

LOCK TABLES `mac_cj_node` WRITE;
/*!40000 ALTER TABLE `mac_cj_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cj_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_collect`
--

DROP TABLE IF EXISTS `mac_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP数据采集';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_collect`
--

LOCK TABLES `mac_collect` WRITE;
/*!40000 ALTER TABLE `mac_collect` DISABLE KEYS */;
INSERT INTO `mac_collect` VALUES (21,'百度','https://m3u8.dbyunzy.com/api.php/provide/vod/?ac=list',2,1,'','','',0,0,''),(33,'V8','https://zy.sujx.top/api.php/provide/vod/at/xml/',1,1,'','','',0,0,''),(25,'天空资源站','https://m3u8.tiankongapi.com/api.php/provide/vod/?ac=list',2,1,'','','',0,0,''),(26,'天空1','https://api.tiankongapi.com/api.php/provide/vod/at/xml/',1,1,'','','',0,0,''),(28,'快播','http://www.kuaibozy.com/api.php/provide/vod/from/kbm3u8/at/xml/',1,1,'','','',0,0,''),(30,'八戒资源','http://cj.bajiecaiji.com/inc/api.php',1,1,'','','',0,0,''),(37,'官方','http://www.zycaiji.net:7788/api.php/provide/vod/?ac=list',2,1,'','','',0,0,''),(40,'神话1','http://shenhua.run/api.php/provide/vod/?ac=list',2,1,'','','',0,0,''),(41,'zhibo','https://997.yuanmajs.cn/api.php/provide/vod/?ac=list',2,1,'','','',0,0,''),(42,'zhibo','https://997.yuanmajs.cn/api.php/provide/vod/?ac=list',2,1,'','','',0,0,'');
/*!40000 ALTER TABLE `mac_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_comment`
--

DROP TABLE IF EXISTS `mac_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP评论数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_comment`
--

LOCK TABLES `mac_comment` WRITE;
/*!40000 ALTER TABLE `mac_comment` DISABLE KEYS */;
INSERT INTO `mac_comment` VALUES (1,1,2023,0,6,1,'明帝影视QP3D5',1975261827,1663080197,'真好看',0,0,0,0),(2,1,41746,0,7,1,'明帝影视YHISX',1975255058,1663770161,'哈哈哈',0,0,0,0);
/*!40000 ALTER TABLE `mac_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_danmu`
--

DROP TABLE IF EXISTS `mac_danmu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_danmu`
--

LOCK TABLES `mac_danmu` WRITE;
/*!40000 ALTER TABLE `mac_danmu` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_danmu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_gbook`
--

DROP TABLE IF EXISTS `mac_gbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP留言反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_gbook`
--

LOCK TABLES `mac_gbook` WRITE;
/*!40000 ALTER TABLE `mac_gbook` DISABLE KEYS */;
INSERT INTO `mac_gbook` VALUES (2,0,14,1,'明帝影视2Z57W',1975318924,1663410028,0,'小编你好，请添加影片《断桥2022》谢谢',''),(3,0,14,1,'明帝影视2Z57W',1975319853,1663592704,0,'小编你好，请添加影片《底线2022》谢谢',''),(4,0,14,1,'明帝影视2Z57W',1975319853,1663592705,0,'小编你好，请添加影片《底线2022》谢谢',''),(5,0,43,1,'15285970814',1975367990,1663685589,0,'红牛在线线路-《法医秦明之读心者》***s://ys.md214.cn/vodplay/7113-1-1.html','');
/*!40000 ALTER TABLE `mac_gbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_glog`
--

DROP TABLE IF EXISTS `mac_glog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_glog`
--

LOCK TABLES `mac_glog` WRITE;
/*!40000 ALTER TABLE `mac_glog` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_glog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_gold_withdraw_apply`
--

DROP TABLE IF EXISTS `mac_gold_withdraw_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_gold_withdraw_apply`
--

LOCK TABLES `mac_gold_withdraw_apply` WRITE;
/*!40000 ALTER TABLE `mac_gold_withdraw_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_gold_withdraw_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_group`
--

DROP TABLE IF EXISTS `mac_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员组管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_group`
--

LOCK TABLES `mac_group` WRITE;
/*!40000 ALTER TABLE `mac_group` DISABLE KEYS */;
INSERT INTO `mac_group` VALUES (1,'游客',1,',1,2,3,4,33,34,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"33\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"34\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',0,0,0,0,0),(2,'默认会员',1,',1,2,3,4,33,34,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"33\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"34\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',0,0,0,0,0),(3,'尊贵VIP会员',1,',1,2,3,4,33,34,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"33\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"34\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',10,50,140,1000,0);
/*!40000 ALTER TABLE `mac_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_groupchat`
--

DROP TABLE IF EXISTS `mac_groupchat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_groupchat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='群聊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_groupchat`
--

LOCK TABLES `mac_groupchat` WRITE;
/*!40000 ALTER TABLE `mac_groupchat` DISABLE KEYS */;
INSERT INTO `mac_groupchat` VALUES (1,'东南亚影视','http://www.qlkjy.cn');
/*!40000 ALTER TABLE `mac_groupchat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_link`
--

DROP TABLE IF EXISTS `mac_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_link`
--

LOCK TABLES `mac_link` WRITE;
/*!40000 ALTER TABLE `mac_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_message`
--

DROP TABLE IF EXISTS `mac_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='APP公告通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_message`
--

LOCK TABLES `mac_message` WRITE;
/*!40000 ALTER TABLE `mac_message` DISABLE KEYS */;
INSERT INTO `mac_message` VALUES (1,'你好陌生人：','2021-06-10 23:13:57','愿你三冬暖、愿你春不寒、愿你天黑有灯、下雨有伞、愿你路上有良人相伴~');
/*!40000 ALTER TABLE `mac_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_msg`
--

DROP TABLE IF EXISTS `mac_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_msg`
--

LOCK TABLES `mac_msg` WRITE;
/*!40000 ALTER TABLE `mac_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_order`
--

DROP TABLE IF EXISTS `mac_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_order`
--

LOCK TABLES `mac_order` WRITE;
/*!40000 ALTER TABLE `mac_order` DISABLE KEYS */;
INSERT INTO `mac_order` VALUES (18,8,0,'PAY20220916124355947930',5.00,1663303435,50,'',0,''),(19,41,0,'PAY20220920125839498931',5.00,1663649919,50,'',0,''),(20,7,0,'PAY20220922092458719138',5.00,1663809898,50,'',0,'');
/*!40000 ALTER TABLE `mac_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_plog`
--

DROP TABLE IF EXISTS `mac_plog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_plog`
--

LOCK TABLES `mac_plog` WRITE;
/*!40000 ALTER TABLE `mac_plog` DISABLE KEYS */;
INSERT INTO `mac_plog` VALUES (1,2,0,7,10,1651414607,''),(2,2,0,13,1,1651414684,'用户fb52e624477弹幕奖励1分'),(3,5,0,15,5,1663053843,'用户466b3e50b11分享奖励5分'),(4,6,0,7,10,1663072101,''),(5,6,0,13,1,1663080148,'用户e627905cd24弹幕奖励1分'),(6,6,0,11,1,1663080197,''),(7,6,0,10,1,1663082319,''),(8,7,0,7,10,1663138279,''),(9,7,0,10,1,1663212751,''),(10,7,0,15,5,1663217462,'用户17332296424分享奖励5分'),(11,7,0,13,1,1663239536,'用户17332296424弹幕奖励1分'),(12,7,0,10,1,1663405678,''),(13,15,0,10,1,1663410306,''),(14,6,0,10,1,1663418681,''),(15,30,0,7,10,1663428268,''),(16,7,0,10,1,1663564817,''),(17,6,0,10,1,1663595524,''),(18,35,0,10,1,1663603823,''),(19,7,0,10,1,1663605487,''),(20,7,0,10,1,1663731033,''),(21,7,0,10,1,1663767191,''),(22,7,0,11,1,1663770161,''),(23,6,0,10,1,1663854815,'');
/*!40000 ALTER TABLE `mac_plog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_role`
--

DROP TABLE IF EXISTS `mac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_role`
--

LOCK TABLES `mac_role` WRITE;
/*!40000 ALTER TABLE `mac_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_sign`
--

DROP TABLE IF EXISTS `mac_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_sign` (
  `sign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `reward` varchar(500) NOT NULL,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_sign`
--

LOCK TABLES `mac_sign` WRITE;
/*!40000 ALTER TABLE `mac_sign` DISABLE KEYS */;
INSERT INTO `mac_sign` VALUES (1,6,'2022-09-22','{\"points\":\"1\"}',1663854815,1663854815);
/*!40000 ALTER TABLE `mac_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_tmpart`
--

DROP TABLE IF EXISTS `mac_tmpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_tmpart` (
  `id1` int(10) unsigned DEFAULT NULL,
  `name1` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_tmpart`
--

LOCK TABLES `mac_tmpart` WRITE;
/*!40000 ALTER TABLE `mac_tmpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_tmpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_tmpvod`
--

DROP TABLE IF EXISTS `mac_tmpvod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_tmpvod` (
  `id1` int(10) unsigned DEFAULT NULL,
  `name1` varchar(255) NOT NULL DEFAULT '',
  `name_type` varchar(291) NOT NULL DEFAULT '',
  `tid1` smallint(6) NOT NULL DEFAULT '0',
  `year1` varchar(10) NOT NULL DEFAULT '',
  `area1` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_tmpvod`
--

LOCK TABLES `mac_tmpvod` WRITE;
/*!40000 ALTER TABLE `mac_tmpvod` DISABLE KEYS */;
INSERT INTO `mac_tmpvod` VALUES (43731,'星辰变','星辰变42022中国大陆',4,'2022','中国大陆');
/*!40000 ALTER TABLE `mac_tmpvod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_topic`
--

DROP TABLE IF EXISTS `mac_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP专题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_topic`
--

LOCK TABLES `mac_topic` WRITE;
/*!40000 ALTER TABLE `mac_topic` DISABLE KEYS */;
INSERT INTO `mac_topic` VALUES (2,'成龙专辑','yingyuandapian','',1,0,'','','detail.html','电影','https://img2.doubanio.com/view/photo/l/public/p2005944092.webp','https://img2.doubanio.com/view/photo/l/public/p2005944092.webp','https://img2.doubanio.com/view/photo/l/public/p2005944092.webp','','','','成龙专辑','',0,536,309,10.0,443,98,7324,81,787,4192,1663154135,1577460719,0,0,'','26816,24627,24626,24625,24623,24622,24621,24614,24613,24612,24609,24606,24605,24604,24603,24602,24601,24597,24596,24595','','<p>成龙是华人演艺圈备受尊敬的大哥，直到香港导演张婉婷的纪录片《龙的深处：失落的拼图》揭露成龙不为人知的身世，大家才知道，原来，威风八面的成龙原名房仕龙，由于父亲身份的原因，不得已改姓陈。于是，成龙才有了那个乡土气息极浓的名字———陈港生。出道伊始，成龙把艺名改做陈元龙，后来改做成龙，寓意深远的名字给成龙不断创造事业高峰。</p>',''),(6,'李连杰专辑','李连杰专辑','',1,0,'','','detail.html','电影','https://img2.doubanio.com/view/photo/l/public/p2212436592.webp','https://img2.doubanio.com/view/photo/l/public/p2212436592.webp','https://img2.doubanio.com/view/photo/l/public/p2212436592.webp','','','','李连杰连续五年获全国武术比赛的冠军，被北京市体委授予特等功，还被评为“勇攀高峰的突击手”，是七十年代武术界的常胜将军。也被称中华武术的第一高手。1979年，在第四届全运会上创造一人夺得5块金牌的奇迹后后逐渐淡出武术圈','',0,86,813,3.0,711,69,9481,55,948,2799,1663153970,1644501693,0,0,'','38750,38109,36526,36504,36239,36168,36118,36083,36057,36008,35449,35431,34845,34312,33579,32712,31829,30556,29910,28588,27528,27082,26375,24788,22180,16540,15046,3759,3636,3480,3335,3125,3120,3078,2773,2194,2180,1988,1985,1983,1982,1941,1799','','<p>李连杰连续五年获全国武术比赛的冠军，被北京市体委授予特等功，还被评为“勇攀高峰的突击手”，是七十年代武术界的常胜将军。也被称中华武术的第一高手....</p>',''),(3,'林正英专辑','remenjuji','',1,0,'','','detail.html','电视剧','https://i0.hdslb.com/bfs/article/f39564c9366a2b2c64100a6ed2dbd270ee71f9be.jpg','https://i0.hdslb.com/bfs/article/f39564c9366a2b2c64100a6ed2dbd270ee71f9be.jpg','https://i0.hdslb.com/bfs/article/f39564c9366a2b2c64100a6ed2dbd270ee71f9be.jpg','','','','热门剧集展播','',0,74,232,5.0,76,46,8007,249,543,4640,1663154185,1577537633,0,0,'','36907,36710,36397,33738,33497,31696,30219,28726,27205,27135,25774,25773,25756,25754,25752,25750,25746,25744,25739,25738,25737,25734,25733,25730,25729,25725,25724,25723,25721,25720,25718,25717,25716,25712,25710,25707,25700,25698,25697,25690,25687,25678,22355,22304,17742,4549,3692,3344,3331,2815,2405,2242,1987,1885,1609,1608,1568,1541','','<p>林正英，香港著名动作演员和武术指导。小时候在粉菊花师傅的戏班中学习京剧表演，后来凭借一身好功夫进入电影圈做龙虎武师和武术指导...</p>',''),(7,'电台直播专区','diantaizhibozhuanqu','',1,0,'','','detail.html','电影','https://hbimg.huabanimg.com/1ebd228820c35e0dcff34e2fba69ca417dd9d20cfc03-4G4tDj_fw1200','https://hbimg.huabanimg.com/1ebd228820c35e0dcff34e2fba69ca417dd9d20cfc03-4G4tDj_fw1200','https://hbimg.huabanimg.com/1ebd228820c35e0dcff34e2fba69ca417dd9d20cfc03-4G4tDj_fw1200','','','','现场直播','',0,560,677,1.0,931,96,8525,41,990,3541,1663154228,1644502064,0,0,'','36926,35589,35327,34034,33321,32048,29857,26981,25937,25461,20711,20631,19436,13751,10057,5264,4955,2888,2788,2375','','<p>让你亲临现场，进行一场现场直播。</p>','');
/*!40000 ALTER TABLE `mac_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_type`
--

DROP TABLE IF EXISTS `mac_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `type_logo` varchar(255) NOT NULL DEFAULT '',
  `type_pic` varchar(255) NOT NULL DEFAULT '',
  `type_jumpurl` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`) USING BTREE,
  KEY `type_sort` (`type_sort`) USING BTREE,
  KEY `type_pid` (`type_pid`) USING BTREE,
  KEY `type_name` (`type_name`) USING BTREE,
  KEY `type_en` (`type_en`) USING BTREE,
  KEY `type_mid` (`type_mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='APP分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_type`
--

LOCK TABLES `mac_type` WRITE;
/*!40000 ALTER TABLE `mac_type` DISABLE KEYS */;
INSERT INTO `mac_type` VALUES (1,'电影','dianying',1,1,0,1,'type.html','show.html','detail.html','play.html','down.html','电影,电影大全,电影天堂,最新电影,好看的电影,电影排行榜','为您提供更新电影、好看的电影排行榜及电影迅雷下载，免费在线观看伦理电影、动作片、喜剧片、爱情片、搞笑片等全新电影。','电影','','{\"class\":\"\\u559c\\u5267,\\u52a8\\u4f5c,\\u7231\\u60c5,\\u60ca\\u609a,\\u6050\\u6016\\u7247,\\u72af\\u7f6a,\\u5192\\u9669,\\u79d1\\u5e7b,\\u60ac\\u7591,\\u5267\\u60c5,\\u52a8\\u753b,\\u6b66\\u4fa0,\\u6218\\u4e89,\\u6b4c\\u821e,\\u5947\\u5e7b,\\u4f20\\u8bb0,\\u8b66\\u532a,\\u5386\\u53f2,\\u8fd0\\u52a8,\\u4f26\\u7406,\\u707e\\u96be,\\u897f\\u90e8,\\u9b54\\u5e7b,\\u67aa\\u6218,\\u6050\\u6016,\\u8bb0\\u5f55\",\"area\":\"\\u4e2d\\u56fd,\\u5185\\u5730,\\u5927\\u9646,\\u7f8e\\u56fd,\\u9999\\u6e2f,\\u97e9\\u56fd,\\u82f1\\u56fd,\\u53f0\\u6e7e,\\u65e5\\u672c,\\u6cd5\\u56fd,\\u610f\\u5927\\u5229,\\u5fb7\\u56fd,\\u897f\\u73ed\\u7259,\\u6cf0\\u56fd,\\u5176\\u5b83\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u6cd5\\u8bed,\\u5fb7\\u8bed,\\u5176\\u5b83\",\"year\":\"2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u9ec4\\u6e24,\\u5468\\u8fc5,\\u5468\\u51ac\\u96e8,\\u8303\\u51b0\\u51b0,\\u9648\\u5b66\\u51ac,\\u9648\\u4f1f\\u9706,\\u90ed\\u91c7\\u6d01,\\u9093\\u8d85,\\u6210\\u9f99,\\u845b\\u4f18,\\u6797\\u6b63\\u82f1,\\u5f20\\u5bb6\\u8f89,\\u6881\\u671d\\u4f1f,\\u5f90\\u5ce5,\\u90d1\\u607a,\\u5434\\u5f66\\u7956,\\u5218\\u5fb7\\u534e,\\u5468\\u661f\\u9a70,\\u6797\\u9752\\u971e,\\u5468\\u6da6\\u53d1,\\u674e\\u8fde\\u6770,\\u7504\\u5b50\\u4e39,\\u53e4\\u5929\\u4e50,\\u6d2a\\u91d1\\u5b9d,\\u59da\\u6668,\\u502a\\u59ae,\\u9ec4\\u6653\\u660e,\\u5f6d\\u4e8e\\u664f,\\u6c64\\u552f,\\u9648\\u5c0f\\u6625\",\"director\":\"\\u51af\\u5c0f\\u521a,\\u5f20\\u827a\\u8c0b,\\u5434\\u5b87\\u68ee,\\u9648\\u51ef\\u6b4c,\\u5f90\\u514b,\\u738b\\u5bb6\\u536b,\\u59dc\\u6587,\\u5468\\u661f\\u9a70,\\u674e\\u5b89\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}','','',''),(2,'连续剧','lianxuju',2,1,0,1,'type.html','show.html','detail.html','play.html','down.html','电视剧,最新电视剧,好看的电视剧,热播电视剧,电视剧在线观看','为您提供2018新电视剧排行榜，韩国电视剧、泰国电视剧、香港TVB全新电视剧排行榜、好看的电视剧等热播电视剧排行榜，并提供免费高清电视剧下载及在线观看。','电视剧','','{\"class\":\"\\u559c\\u5267,\\u6b66\\u4fa0,\\u60ac\\u7591,\\u5386\\u53f2,\\u79d1\\u5e7b,\\u72af\\u7f6a,\\u6050\\u6016,\\u60ca\\u609a,\\u519c\\u6751,\\u90fd\\u5e02,\\u795e\\u8bdd,\\u79d1\\u5e7b,\\u5c11\\u513f,\\u641e\\u7b11,\\u8c0d\\u6218,\\u6218\\u4e89,\\u5e74\\u4ee3,\\u6050\\u6016,\\u60ca\\u609a,\\u7231\\u60c5,\\u5267\\u60c5,\\u5947\\u5e7b,\\u53e4\\u88c5,\\u5076\\u50cf,\\u5bb6\\u5ead,\\u9752\\u6625,\\u8b66\\u532a,\\u8a00\\u60c5,\\u519b\\u4e8b,\",\"area\":\"\\u4e2d\\u56fd,\\u5185\\u5730,\\u5927\\u9646,\\u97e9\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u65e5\\u672c,\\u7f8e\\u56fd,\\u6cf0\\u56fd,\\u82f1\\u56fd,\\u65b0\\u52a0\\u5761,\\u5176\\u4ed6,\\u9999\\u6e2f\\u5730\\u533a\",\"lang\":\"\\u666e\\u901a\\u8bdd,\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u80e1\\u6b4c,\\u970d\\u5efa\\u534e,\\u8d75\\u4e3d\\u9896,\\u5218\\u6d9b,\\u5218\\u8bd7\\u8bd7,\\u9648\\u4f1f\\u9706,\\u5434\\u5947\\u9686,\\u9646\\u6bc5,\\u5510\\u5ae3,\\u5173\\u6653\\u5f64,\\u5b59\\u4fea,\\u674e\\u6613\\u5cf0,\\u5f20\\u7ff0,\\u674e\\u6668,\\u8303\\u51b0\\u51b0,\\u6797\\u5fc3\\u5982,\\u6587\\u7ae0,\\u9a6c\\u4f0a\\u740d,\\u4f5f\\u5927\\u4e3a,\\u5b59\\u7ea2\\u96f7,\\u9648\\u5efa\\u658c,\\u674e\\u5c0f\\u7490\",\"director\":\"\\u5f20\\u7eaa\\u4e2d,\\u674e\\u5c11\\u7ea2,\\u5218\\u6c5f,\\u5b54\\u7b19,\\u5f20\\u9ece,\\u5eb7\\u6d2a\\u96f7,\\u9ad8\\u5e0c\\u5e0c,\\u80e1\\u73ab,\\u8d75\\u5b9d\\u521a,\\u90d1\\u6653\\u9f99\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}','','',''),(3,'综艺','zongyi',4,1,0,1,'type.html','show.html','detail.html','play.html','down.html','综艺,综艺节目,最新综艺节目,综艺节目排行榜','为您提供新综艺节目、好看的综艺节目排行榜，免费高清在线观看选秀、情感、访谈、搞笑、真人秀、脱口秀等热门综艺节目。','综艺','','{\"class\":\"\\u660e\\u661f,\\u771f\\u4eba\\u79c0,\\u8bbf\\u8c08,\\u60c5\\u611f,\\u9009\\u79c0,\\u65c5\\u6e38,\\u7f8e\\u98df,\\u53e3\\u79c0,\\u66f2\\u827a,\\u641e\\u7b11,\\u6e38\\u620f,\\u6b4c\\u821e,\\u751f\\u6d3b,\\u97f3\\u4e50,\\u65f6\\u5c1a,\\u76ca\\u667a,\\u804c\\u573a,\\u5c11\\u513f,\\u7eaa\\u5b9e,\\u76db\\u4f1a\",\"area\":\"\\u4e2d\\u56fd,\\u5185\\u5730,\\u5927\\u9646,\\u97e9\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u7f8e\\u56fd,\\u5176\\u5b83\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004\",\"star\":\"\\u4f55\\u7085,\\u6c6a\\u6db5,\\u8c22\\u5a1c,\\u5468\\u7acb\\u6ce2,\\u9648\\u9c81\\u8c6b,\\u5b5f\\u975e,\\u674e\\u9759,\\u6731\\u519b,\\u6731\\u4e39,\\u534e\\u5c11,\\u90ed\\u5fb7\\u7eb2,\\u6768\\u6f9c\",\"director\":\"\\u51af\\u5c0f\\u521a,\\u5f20\\u827a\\u8c0b,\\u5434\\u5b87\\u68ee,\\u9648\\u51ef\\u6b4c,\\u5f90\\u514b,\\u738b\\u5bb6\\u536b,\\u59dc\\u6587,\\u5468\\u661f\\u9a70,\\u674e\\u5b89\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}','','',''),(4,'动漫','dongman',3,1,0,1,'type.html','show.html','detail.html','play.html','down.html','动漫,动漫大全,最新动漫,好看的动漫,日本动漫,动漫排行榜','为您提供新动漫、好看的动漫排行榜，免费高清在线观看热血动漫、卡通动漫、新番动漫、百合动漫、搞笑动漫、国产动漫、动漫电影等热门动漫。','动画片','','{\"class\":\"\\u79d1\\u5e7b,\\u52a8\\u4f5c,\\u6218\\u4e89,\\u5c11\\u5e74,\\u5c11\\u5973,\\u793e\\u4f1a,\\u539f\\u521b,\\u4eb2\\u5b50,\\u76ca\\u667a,\\u52b1\\u5fd7,\\u5176\\u4ed6,\\u70ed\\u8840,\\u63a8\\u7406,\\u641e\\u7b11,\\u5192\\u9669,\\u6821\\u56ed,\\u673a\\u6218,\\u8fd0\\u52a8\",\"area\":\"\\u4e2d\\u56fd,\\u5185\\u5730,\\u5927\\u9646,\\u65e5\\u672c,\\u6b27\\u7f8e,\\u5176\\u4ed6\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u9ec4\\u6e24,\\u5468\\u8fc5,\\u5468\\u51ac\\u96e8,\\u8303\\u51b0\\u51b0,\\u9648\\u5b66\\u51ac,\\u9648\\u4f1f\\u9706,\\u90ed\\u91c7\\u6d01,\\u9093\\u8d85,\\u6210\\u9f99,\\u845b\\u4f18,\\u6797\\u6b63\\u82f1,\\u5f20\\u5bb6\\u8f89,\\u6881\\u671d\\u4f1f,\\u5f90\\u5ce5,\\u90d1\\u607a,\\u5434\\u5f66\\u7956,\\u5218\\u5fb7\\u534e,\\u5468\\u661f\\u9a70,\\u6797\\u9752\\u971e,\\u5468\\u6da6\\u53d1,\\u674e\\u8fde\\u6770,\\u7504\\u5b50\\u4e39,\\u53e4\\u5929\\u4e50,\\u6d2a\\u91d1\\u5b9d,\\u59da\\u6668,\\u502a\\u59ae,\\u9ec4\\u6653\\u660e,\\u5f6d\\u4e8e\\u664f,\\u6c64\\u552f,\\u9648\\u5c0f\\u6625\",\"director\":\"\\u51af\\u5c0f\\u521a,\\u5f20\\u827a\\u8c0b,\\u5434\\u5b87\\u68ee,\\u9648\\u51ef\\u6b4c,\\u5f90\\u514b,\\u738b\\u5bb6\\u536b,\\u59dc\\u6587,\\u5468\\u661f\\u9a70,\\u674e\\u5b89\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"TV\\u7248,\\u7535\\u5f71\\u7248,OVA\\u7248,\\u771f\\u4eba\\u7248\"}','','','');
/*!40000 ALTER TABLE `mac_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_ulog`
--

DROP TABLE IF EXISTS `mac_ulog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `ulog_end_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ulog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `ulog_mid` (`ulog_mid`) USING BTREE,
  KEY `ulog_type` (`ulog_type`) USING BTREE,
  KEY `ulog_rid` (`ulog_rid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_ulog`
--

LOCK TABLES `mac_ulog` WRITE;
/*!40000 ALTER TABLE `mac_ulog` DISABLE KEYS */;
INSERT INTO `mac_ulog` VALUES (3,19,1,2,44327,0,0,0,1663492364,0),(4,30,1,4,114195,1,1,0,1663523611,0),(5,19,1,2,2756,0,0,0,1663642594,0),(6,43,1,4,7113,0,0,0,1663685482,0),(7,43,1,4,7113,2,1,0,1663685489,0),(8,43,1,4,7113,1,1,0,1663685543,0),(9,43,1,4,30496,1,1,0,1663685638,0),(10,7,1,6,89476,0,0,5,1663777882,0);
/*!40000 ALTER TABLE `mac_ulog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_user`
--

DROP TABLE IF EXISTS `mac_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `user_portrait` varchar(100) NOT NULL DEFAULT '',
  `user_portrait_thumb` varchar(100) NOT NULL DEFAULT '',
  `user_openid_qq` varchar(40) NOT NULL DEFAULT '',
  `user_openid_weixin` varchar(40) NOT NULL DEFAULT '',
  `user_question` varchar(255) NOT NULL DEFAULT '',
  `user_answer` varchar(255) NOT NULL DEFAULT '',
  `user_points` int(10) unsigned NOT NULL DEFAULT '0',
  `user_points_froze` int(10) unsigned NOT NULL DEFAULT '0',
  `user_reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_reg_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `user_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_login_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `user_last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `type_id` (`group_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `user_reg_time` (`user_reg_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员用户数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_user`
--

LOCK TABLES `mac_user` WRITE;
/*!40000 ALTER TABLE `mac_user` DISABLE KEYS */;
INSERT INTO `mac_user` VALUES (1,2,'223b7a1f09d','d70808e09f74c50b3c5bb1dc0be31baa','东南亚影视UKPIY','','','',1,'','','','','','',10,0,1682555814,0,1682555814,0,0,0,1,0,'f0daedb4962fd74dda2d6eb9a303479e',0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `mac_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_view30m`
--

DROP TABLE IF EXISTS `mac_view30m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_view30m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) DEFAULT NULL,
  `view_seconds` int(255) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `vod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_view30m`
--

LOCK TABLES `mac_view30m` WRITE;
/*!40000 ALTER TABLE `mac_view30m` DISABLE KEYS */;
INSERT INTO `mac_view30m` VALUES (1,1663783008,3120,29,NULL),(2,1663810194,60,7,NULL),(3,1663827125,60,7,NULL),(4,1663827156,120,7,NULL),(5,1663827185,180,7,NULL),(6,1663844816,240,47,NULL),(7,1663844846,300,47,NULL),(8,1663844876,360,47,NULL),(9,1663844906,420,47,NULL),(10,1663844936,480,47,NULL),(11,1663844966,540,47,NULL),(12,1663844996,600,47,NULL),(13,1663845026,660,47,NULL),(14,1663845056,720,47,NULL),(15,1663845086,780,47,NULL),(16,1663845116,840,47,NULL),(17,1663845146,900,47,NULL),(18,1663845176,960,47,NULL),(19,1663845206,1020,47,NULL),(20,1663845236,1080,47,NULL),(21,1663845266,1140,47,NULL),(22,1663845296,1200,47,NULL),(23,1663845326,1260,47,NULL),(24,1663845356,1320,47,NULL),(25,1663845386,1380,47,NULL),(26,1663845416,1440,47,NULL),(27,1663845446,1500,47,NULL),(28,1663845476,1560,47,NULL),(29,1663845506,1620,47,NULL),(30,1663845536,1680,47,NULL),(31,1663845566,1740,47,NULL),(32,1663845596,1800,47,NULL),(33,1663845626,1860,47,NULL),(34,1663856348,60,39,NULL),(35,1663856378,120,39,NULL),(36,1663856408,180,39,NULL),(37,1663856438,240,39,NULL),(38,1663856468,300,39,NULL),(39,1663856498,360,39,NULL),(40,1663856528,420,39,NULL),(41,1663856558,480,39,NULL),(42,1663856588,540,39,NULL),(43,1663856618,600,39,NULL),(44,1663856648,660,39,NULL),(45,1663856708,780,39,NULL),(46,1663856745,840,39,NULL),(47,1663856789,900,39,NULL),(48,1663856891,960,39,NULL),(49,1663856951,1080,39,NULL),(50,1663856981,1140,39,NULL),(51,1663857011,1200,39,NULL),(52,1663857041,1260,39,NULL),(53,1663857071,1320,39,NULL),(54,1663857101,1380,39,NULL),(55,1663857131,1440,39,NULL),(56,1663857161,1500,39,NULL),(57,1663857191,1560,39,NULL),(58,1663857221,1620,39,NULL),(59,1663857251,1680,39,NULL),(60,1663857281,1740,39,NULL),(61,1663857311,1800,39,NULL),(62,1663857341,1860,39,NULL),(63,1663857371,1920,39,NULL),(64,1663857401,1980,39,NULL),(65,1663857431,2040,39,NULL),(66,1663857461,2100,39,NULL),(67,1663857491,2160,39,NULL),(68,1663857521,2220,39,NULL),(69,1663857551,2280,39,NULL),(70,1663857581,2340,39,NULL),(71,1663857611,2400,39,NULL),(72,1663857641,2460,39,NULL),(73,1663857671,2520,39,NULL),(74,1663857701,2580,39,NULL),(75,1663857731,2640,39,NULL),(76,1663857761,2700,39,NULL),(77,1663857791,2760,39,NULL),(78,1663857821,2820,39,NULL),(79,1663857851,2880,39,NULL),(80,1663857881,2940,39,NULL),(81,1663857911,3000,39,NULL),(82,1663857941,3060,39,NULL),(83,1663857971,3120,39,NULL),(84,1663858001,3180,39,NULL),(85,1663858031,3240,39,NULL),(86,1663858061,3300,39,NULL),(87,1663858091,3360,39,NULL),(88,1663858121,3420,39,NULL),(89,1663858151,3480,39,NULL),(90,1663858181,3540,39,NULL),(91,1663858211,3600,39,NULL),(92,1663858241,3660,39,NULL),(93,1663858271,3720,39,NULL),(94,1663858301,3780,39,NULL),(95,1663858331,3840,39,NULL),(96,1663858361,3900,39,NULL),(97,1663858391,3960,39,NULL),(98,1663858421,4020,39,NULL),(99,1663858451,4080,39,NULL),(100,1663858481,4140,39,NULL),(101,1663858511,4200,39,NULL),(102,1663858541,4260,39,NULL),(103,1663858571,4320,39,NULL),(104,1663858601,4380,39,NULL),(105,1663858631,4440,39,NULL),(106,1663858661,4500,39,NULL),(107,1663858691,4560,39,NULL),(108,1663858721,4620,39,NULL),(109,1663858751,4680,39,NULL),(110,1663858781,4740,39,NULL),(111,1663858811,4800,39,NULL),(112,1663858841,4860,39,NULL),(113,1663858871,4920,39,NULL),(114,1663858901,4980,39,NULL),(115,1663858931,5040,39,NULL),(116,1663858961,5100,39,NULL),(117,1663858991,5160,39,NULL),(118,1663859021,5220,39,NULL),(119,1663859051,5280,39,NULL),(120,1663859081,5340,39,NULL),(121,1663859111,5400,39,NULL),(122,1663859141,5460,39,NULL),(123,1663859171,5520,39,NULL),(124,1663859201,5580,39,NULL),(125,1663859231,5640,39,NULL),(126,1663859261,5700,39,NULL),(127,1663859291,5760,39,NULL),(128,1663859321,5820,39,NULL),(129,1663859351,5880,39,NULL),(130,1663859381,5940,39,NULL),(131,1663859411,6000,39,NULL),(132,1663859441,6060,39,NULL),(133,1663859522,6120,39,NULL),(134,1663859650,6180,39,NULL),(135,1663859691,6240,39,NULL),(136,1663859721,6300,39,NULL),(137,1663859751,6360,39,NULL),(138,1663859781,6420,39,NULL),(139,1663859811,6480,39,NULL),(140,1663859841,6540,39,NULL),(141,1663859871,6600,39,NULL),(142,1663859901,6660,39,NULL),(143,1663859931,6720,39,NULL),(144,1663859961,6780,39,NULL),(145,1663859991,6840,39,NULL),(146,1663860021,6900,39,NULL),(147,1663860051,6960,39,NULL),(148,1663860081,7020,39,NULL),(149,1663860111,7080,39,NULL),(150,1663860141,7140,39,NULL),(151,1663860171,7200,39,NULL),(152,1663860201,7260,39,NULL),(153,1663860231,7320,39,NULL),(154,1663860261,7380,39,NULL),(155,1663860291,7440,39,NULL),(156,1663860321,7500,39,NULL),(157,1663860351,7560,39,NULL),(158,1663860381,7620,39,NULL),(159,1663860411,7680,39,NULL),(160,1663860441,7740,39,NULL),(161,1663860471,7800,39,NULL),(162,1663860501,7860,39,NULL),(163,1663860531,7920,39,NULL),(164,1663860561,7980,39,NULL),(165,1663860591,8040,39,NULL),(166,1663860621,8100,39,NULL),(167,1663860651,8160,39,NULL),(168,1663860681,8220,39,NULL),(169,1663860711,8280,39,NULL),(170,1663860741,8340,39,NULL),(171,1663860771,8400,39,NULL),(172,1663860801,8460,39,NULL),(173,1663860831,8520,39,NULL),(174,1663860861,8580,39,NULL),(175,1663860891,8640,39,NULL),(176,1663860921,8700,39,NULL),(177,1663860951,8760,39,NULL),(178,1663860981,8820,39,NULL),(179,1663861011,8880,39,NULL),(180,1663861041,8940,39,NULL),(181,1663861071,9000,39,NULL),(182,1663861101,9060,39,NULL),(183,1663861131,9120,39,NULL);
/*!40000 ALTER TABLE `mac_view30m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_visit`
--

DROP TABLE IF EXISTS `mac_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_visit`
--

LOCK TABLES `mac_visit` WRITE;
/*!40000 ALTER TABLE `mac_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_vlog`
--

DROP TABLE IF EXISTS `mac_vlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='APP播放记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_vlog`
--

LOCK TABLES `mac_vlog` WRITE;
/*!40000 ALTER TABLE `mac_vlog` DISABLE KEYS */;
INSERT INTO `mac_vlog` VALUES (1,42174,'2','腾讯视频','0.02',1663774738,7,279,1,0,0),(2,1366,'第1集','腾讯视频','0.0',1663818024,7,3898,0,0,0),(3,41746,'第19集','爱奇艺','0.0',1663850036,7,882,18,0,0),(4,89476,'1','腾讯视频','0.0',1663777886,7,2552,0,0,0),(5,41466,'第23集','腾讯视频','0.87',1663783008,29,2248060,22,0,0),(6,125601,'正片','红牛在线','0.0',1663809972,7,3562,0,0,0),(7,125360,'高清正片','芒果TV','0.6',1663810137,7,3581984,0,0,0),(8,1953,'第1集','爱奇艺','0.6',1663810194,7,512602,0,0,0),(9,124400,'1','腾讯视频','0.0',1663817729,7,656,0,0,0),(10,125615,'第1集','爱奇艺','0.0',1663817766,7,1146,0,0,0),(11,100635,'1','腾讯视频','0.02',1663818147,7,2144,0,0,0),(12,42058,'0 江西世界米粉之乡','爱奇艺','0.0',1663818496,7,507,0,0,0),(13,42662,'2020-06-06','芒果TV','0.0',1663823332,7,945,0,0,0),(14,41626,'14 炼体十万层都市篇第14集','爱奇艺','0.0',1663853960,7,848,13,0,0),(15,124782,'12','芒果TV','0.0',1663823720,7,1083,11,0,0),(16,4591,'第42集','红牛在线','0.0',1663823731,7,934,41,0,0),(17,9903,'第10集','红牛在线','0.0',1663823740,7,849,9,0,0),(18,96266,'第1集','爱奇艺','0.03',1663824428,7,809,0,0,0),(19,10910,'第01集','红牛在线','0.0',1663836418,14,1545,0,0,0),(20,96261,'第1集','乐视TV','0.0',1663843462,47,61,0,0,0),(21,1366,'第1集','腾讯视频','0.0',1663845626,47,2016,0,0,0),(22,115526,'第17集','爱奇艺','0.0',1663850342,7,1741,16,0,0),(25,124400,'8','腾讯视频','0.0',1663854841,6,1747,7,0,0),(23,96323,'第1集','爱奇艺','0.06',1663852736,7,1380,0,0,0),(24,126229,'第03集','腾讯视频','0.0',1663853357,7,636,2,0,0),(26,2538,'第04集','红牛在线','0.75',1663861131,39,910358,3,1,0);
/*!40000 ALTER TABLE `mac_vlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_vod`
--

DROP TABLE IF EXISTS `mac_vod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `vod_pic_screenshot` text,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_vod`
--

LOCK TABLES `mac_vod` WRITE;
/*!40000 ALTER TABLE `mac_vod` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_vod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_website`
--

DROP TABLE IF EXISTS `mac_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type_id_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `website_name` varchar(60) NOT NULL DEFAULT '',
  `website_sub` varchar(255) NOT NULL DEFAULT '',
  `website_en` varchar(255) NOT NULL DEFAULT '',
  `website_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `website_letter` char(1) NOT NULL DEFAULT '',
  `website_color` varchar(6) NOT NULL DEFAULT '',
  `website_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `website_sort` int(10) NOT NULL DEFAULT '0',
  `website_jumpurl` varchar(255) NOT NULL DEFAULT '',
  `website_pic` varchar(255) NOT NULL DEFAULT '',
  `website_logo` varchar(255) NOT NULL DEFAULT '',
  `website_area` varchar(20) NOT NULL DEFAULT '',
  `website_lang` varchar(10) NOT NULL DEFAULT '',
  `website_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `website_time` int(10) unsigned NOT NULL DEFAULT '0',
  `website_time_add` int(10) unsigned NOT NULL DEFAULT '0',
  `website_time_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `website_time_make` int(10) unsigned NOT NULL DEFAULT '0',
  `website_hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_hits_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_hits_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_hits_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0',
  `website_score_all` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_score_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_referer` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_referer_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_referer_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_referer_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `website_tag` varchar(100) NOT NULL DEFAULT '',
  `website_class` varchar(255) NOT NULL DEFAULT '',
  `website_remarks` varchar(100) NOT NULL DEFAULT '',
  `website_tpl` varchar(30) NOT NULL DEFAULT '',
  `website_blurb` varchar(255) NOT NULL DEFAULT '',
  `website_content` mediumtext NOT NULL,
  PRIMARY KEY (`website_id`),
  KEY `type_id` (`type_id`),
  KEY `type_id_1` (`type_id_1`),
  KEY `website_name` (`website_name`),
  KEY `website_en` (`website_en`),
  KEY `website_letter` (`website_letter`),
  KEY `website_sort` (`website_sort`),
  KEY `website_lock` (`website_lock`),
  KEY `website_time` (`website_time`),
  KEY `website_time_add` (`website_time_add`),
  KEY `website_hits` (`website_hits`),
  KEY `website_hits_day` (`website_hits_day`),
  KEY `website_hits_week` (`website_hits_week`),
  KEY `website_hits_month` (`website_hits_month`),
  KEY `website_time_make` (`website_time_make`),
  KEY `website_score` (`website_score`),
  KEY `website_score_all` (`website_score_all`),
  KEY `website_score_num` (`website_score_num`),
  KEY `website_up` (`website_up`),
  KEY `website_down` (`website_down`),
  KEY `website_level` (`website_level`),
  KEY `website_tag` (`website_tag`),
  KEY `website_class` (`website_class`),
  KEY `website_referer` (`website_referer`),
  KEY `website_referer_day` (`website_referer_day`),
  KEY `website_referer_week` (`website_referer_week`),
  KEY `website_referer_month` (`website_referer_month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_website`
--

LOCK TABLES `mac_website` WRITE;
/*!40000 ALTER TABLE `mac_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_youxi`
--

DROP TABLE IF EXISTS `mac_youxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_youxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='APP游戏页面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_youxi`
--

LOCK TABLES `mac_youxi` WRITE;
/*!40000 ALTER TABLE `mac_youxi` DISABLE KEYS */;
INSERT INTO `mac_youxi` VALUES (1,'游戏','1','http://m.lvdoui.cn');
/*!40000 ALTER TABLE `mac_youxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_zhibo`
--

DROP TABLE IF EXISTS `mac_zhibo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_zhibo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='直播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_zhibo`
--

LOCK TABLES `mac_zhibo` WRITE;
/*!40000 ALTER TABLE `mac_zhibo` DISABLE KEYS */;
INSERT INTO `mac_zhibo` VALUES (1,'虎牙电视轮播','http://img3.imgtn.bdimg.com/it/u=4071645708,1806944269&fm=26&gp=0.jpg','https://m.huya.com/g/2135?rso=huya_h5_395'),(2,'网络电视直播','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=820960115,2542239298&fm=26&gp=0.jpg','http://www.zhiboba.org/dianshitai'),(3,'游拍直播','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2274747463,4183354344&fm=26&gp=0.jpg','https://m.4399youpai.com/zhibo/game'),(4,'六间房直播','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2025620803,4212504364&fm=26&gp=0.jpg','http://m.v.6.cn/?referrer='),(5,'电视剧轮播','https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2102833997,2917410739&fm=26&gp=0.jpg','http://www.baidu.com'),(6,'虎牙游戏直播','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2866237030,2397668445&fm=26&gp=0.jpg','https://www.huya.com/g'),(7,'小说','http://img2.imgtn.bdimg.com/it/u=2059116237,2535882687&fm=26&gp=0.jpg','http://m.shuhai.com'),(8,'微赞','http://img4.imgtn.bdimg.com/it/u=628053479,3428469491&fm=26&gp=0.jpg','https://wx.vzan.com/live/tvchat-70010603#');
/*!40000 ALTER TABLE `mac_zhibo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wexns'
--

--
-- Dumping routines for database 'wexns'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-27  8:42:41
