-- MySQL dump 10.13  Distrib 5.5.57, for Linux (x86_64)
--
-- Host: localhost    Database: bbs_guojiz_com
-- ------------------------------------------------------
-- Server version	5.5.57-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `my_addons`
--

DROP TABLE IF EXISTS `my_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) DEFAULT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pic` varchar(999) DEFAULT NULL COMMENT '图标封面',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_addons`
--

LOCK TABLES `my_addons` WRITE;
/*!40000 ALTER TABLE `my_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_banner`
--

DROP TABLE IF EXISTS `my_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `time` varchar(32) DEFAULT NULL COMMENT '时间',
  `title` varchar(9999) DEFAULT NULL COMMENT '标题',
  `links` varchar(100) DEFAULT NULL COMMENT '连接',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  `fl` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_banner`
--

LOCK TABLES `my_banner` WRITE;
/*!40000 ALTER TABLE `my_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_category`
--

DROP TABLE IF EXISTS `my_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL COMMENT '上级',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  `sidebar` tinyint(1) NOT NULL DEFAULT '1' COMMENT '侧栏',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `time` varchar(32) DEFAULT NULL COMMENT '时间',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键词',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='社区分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_category`
--

LOCK TABLES `my_category` WRITE;
/*!40000 ALTER TABLE `my_category` DISABLE KEYS */;
INSERT INTO `my_category` VALUES (1,0,'测试板块',1,1,1,1,'','1567041845','','');
/*!40000 ALTER TABLE `my_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_comment`
--

DROP TABLE IF EXISTS `my_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL COMMENT '上级评论',
  `uid` int(11) DEFAULT NULL COMMENT '所属会员',
  `fid` int(11) DEFAULT NULL COMMENT '所属帖子',
  `time` varchar(11) DEFAULT NULL COMMENT '时间',
  `praise` varchar(11) DEFAULT '0' COMMENT '赞',
  `reply` varchar(11) DEFAULT '0' COMMENT '回复',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_comment`
--

LOCK TABLES `my_comment` WRITE;
/*!40000 ALTER TABLE `my_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_forum`
--

DROP TABLE IF EXISTS `my_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL COMMENT '上级',
  `uid` int(11) DEFAULT NULL COMMENT '用户',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  `choice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '精贴',
  `settop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '顶置',
  `praise` varchar(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `view` varchar(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `time` varchar(11) DEFAULT NULL COMMENT '时间',
  `reply` varchar(11) NOT NULL DEFAULT '0' COMMENT '回复',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键词',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_forum`
--

LOCK TABLES `my_forum` WRITE;
/*!40000 ALTER TABLE `my_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_hooks`
--

DROP TABLE IF EXISTS `my_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_hooks`
--

LOCK TABLES `my_hooks` WRITE;
/*!40000 ALTER TABLE `my_hooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_links`
--

DROP TABLE IF EXISTS `my_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `links` varchar(100) DEFAULT NULL COMMENT '连接',
  `time` varchar(32) DEFAULT NULL COMMENT '时间',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_links`
--

LOCK TABLES `my_links` WRITE;
/*!40000 ALTER TABLE `my_links` DISABLE KEYS */;
INSERT INTO `my_links` VALUES (1,'免元素','http://www.mys360.com/','1566789451','',1);
/*!40000 ALTER TABLE `my_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_member`
--

DROP TABLE IF EXISTS `my_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_member` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `userip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `username` varchar(32) DEFAULT NULL COMMENT '名称',
  `password` varchar(32) NOT NULL DEFAULT '49ba59abbe56e057' COMMENT '密码',
  `kouling` varchar(32) DEFAULT NULL COMMENT '口令',
  `usermail` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `userhead` varchar(999) NOT NULL DEFAULT '/public/img/touxiang.jpg' COMMENT '头像',
  `regtime` varchar(32) DEFAULT NULL COMMENT '注册时间',
  `grades` tinyint(1) NOT NULL DEFAULT '0' COMMENT '等级',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '验证1表示正常2邮箱验证3手机认证5手机邮箱全部认证',
  `userhome` varchar(32) DEFAULT NULL COMMENT '家乡',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `last_login_time` varchar(20) DEFAULT '0' COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  `salt` varchar(20) DEFAULT NULL COMMENT 'salt',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `usermail` (`usermail`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_member`
--

LOCK TABLES `my_member` WRITE;
/*!40000 ALTER TABLE `my_member` DISABLE KEYS */;
INSERT INTO `my_member` VALUES (1,25,'223.104.96.42','admin','7a57a5a743894a0e','123456','admin@admin.com','/public/img/touxiang.jpg','1565319502',1,0,1,NULL,NULL,'1565319502','',NULL);
/*!40000 ALTER TABLE `my_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_point_note`
--

DROP TABLE IF EXISTS `my_point_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_point_note` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `pointid` int(10) unsigned DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_point_note`
--

LOCK TABLES `my_point_note` WRITE;
/*!40000 ALTER TABLE `my_point_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_point_note` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-01 20:50:58
