/*
Navicat MySQL Data Transfer

Source Server         : 111111
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : db_ghxtx1267

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-05-05 19:39:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_gonggao`
-- ----------------------------
DROP TABLE IF EXISTS `t_gonggao`;
CREATE TABLE `t_gonggao` (
  `id` int(11) NOT NULL,
  `biaoti` varchar(255) DEFAULT NULL,
  `neirong` varchar(5000) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gonggao
-- ----------------------------
INSERT INTO `t_gonggao` VALUES ('1', '潮阳社区医院将举行建院11周年大型专家义诊活动', '我院将在2019年5月11日举行专家义诊活动，为广大患者进行“三免”，即免费测量血压、心率等；免费进行咨询与健康指导并提供个性化治疗方案。', '2019-03-05 18:13');
INSERT INTO `t_gonggao` VALUES ('4', '讲座通知！潮阳顶级耳再造专家来啦！', '潮阳社区医院本着“关爱、参与、援助”的核心价值观，向社会更多的人们普及有关小耳疾病的相关知识，让这类群体能够拥有足够的信心和勇气理性看待小耳病症，也帮助上千个小耳畸形患者家庭实现正常耳廓梦。', '2019-03-05 17:39');
INSERT INTO `t_gonggao` VALUES ('6', '潮阳社区医院召开2019年医院发展规划研讨会', '春回大地，万象更新。3月27日至28日，2019年“把握机遇，勇攀高峰”医院发展规划研讨会在汕头潮阳疗养院成功召开。医院领导班子、全体中层干部、柔性引进、双聘专家教授等参加会议。会议由院党委副书记郑道城主持。', '2019-03-05 17:40');
INSERT INTO `t_gonggao` VALUES ('7', '潮阳社区医院开展义诊', '为贯彻落实党的十九大报告提出的“健康中国”基本方略，给辖区居民提供优质的健康服务，10月11日上午，城南街社区携手县医院，开展了中医健康讲座和健康进小区义诊活动。健康讲座，让健康理念深入人心', '2019-03-28 01:08');

-- ----------------------------
-- Table structure for `t_guahao`
-- ----------------------------
DROP TABLE IF EXISTS `t_guahao`;
CREATE TABLE `t_guahao` (
  `id` int(11) NOT NULL DEFAULT '0',
  `muid` int(11) DEFAULT NULL,
  `cuid` int(11) DEFAULT NULL,
  `riqi` varchar(255) DEFAULT NULL,
  `jibing` varchar(255) DEFAULT NULL,
  `xingming` varchar(255) DEFAULT NULL,
  `lianxi` varchar(255) DEFAULT NULL,
  `zt` varchar(255) DEFAULT NULL,
  `huifu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guahao
-- ----------------------------
INSERT INTO `t_guahao` VALUES ('6', '8', '5', '2019-05-03', '喉咙痛', '郑棉芬', '13192257216', '预约成功', '成功');
INSERT INTO `t_guahao` VALUES ('8', '10', '5', '2019-05-06', '喉咙痛', 'zmf', '2222', '预约成功', '成功');

-- ----------------------------
-- Table structure for `t_keshi`
-- ----------------------------
DROP TABLE IF EXISTS `t_keshi`;
CREATE TABLE `t_keshi` (
  `keshi_id` int(11) NOT NULL,
  `keshi_anme` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`keshi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_keshi
-- ----------------------------
INSERT INTO `t_keshi` VALUES ('2', '内科', 'no');
INSERT INTO `t_keshi` VALUES ('3', '外科', 'no');
INSERT INTO `t_keshi` VALUES ('4', '胸科', 'no');
INSERT INTO `t_keshi` VALUES ('5', '骨科', 'no');
INSERT INTO `t_keshi` VALUES ('6', '儿科', 'no');
INSERT INTO `t_keshi` VALUES ('7', '眼科', 'no');
INSERT INTO `t_keshi` VALUES ('8', '整容科', 'yes');
INSERT INTO `t_keshi` VALUES ('9', '骨外科', 'yes');

-- ----------------------------
-- Table structure for `t_lianjie`
-- ----------------------------
DROP TABLE IF EXISTS `t_lianjie`;
CREATE TABLE `t_lianjie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lianjie
-- ----------------------------
INSERT INTO `t_lianjie` VALUES ('1', '潮阳第一医院', 'http://www.hrbwsj.gov.cn', 'no');

-- ----------------------------
-- Table structure for `t_liuyan`
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyan`;
CREATE TABLE `t_liuyan` (
  `id` int(11) NOT NULL,
  `neirong` varchar(4000) DEFAULT NULL,
  `liuyanshi` varchar(55) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `huifu` varchar(4000) DEFAULT NULL,
  `huifushi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liuyan
-- ----------------------------
INSERT INTO `t_liuyan` VALUES ('1', '喉咙经常发炎怎么办', '2019-03-05 19:25', '2', '常用盐水漱口，注意饮食清淡，多喝热水', '2019-03-05 17:33');
INSERT INTO `t_liuyan` VALUES ('2', '头疼怎么办', '2019-03-05 19:25', '2', '睡觉', '2019-03-05 20:36');
INSERT INTO `t_liuyan` VALUES ('3', '感冒可以吃什么', '2019-03-05 19:25', '2', '999感冒灵颗粒', '2019-03-05 19:25');
INSERT INTO `t_liuyan` VALUES ('4', '肚子痛怎么办', '2019-03-05 19:25', '2', '', '');
INSERT INTO `t_liuyan` VALUES ('5', '挂号能预约多少天的', '2019-03-05 19:25', '2', '', '');
INSERT INTO `t_liuyan` VALUES ('6', '腰酸背痛', '2019-03-05 19:25', '6', '', '');
INSERT INTO `t_liuyan` VALUES ('7', '医院门诊时间', '2019-03-05 19:25', '5', '', '');
INSERT INTO `t_liuyan` VALUES ('8', '门诊儿科几楼', '2019-03-05 19:26', '5', '', '');
INSERT INTO `t_liuyan` VALUES ('9', '在这留言会回复吗', '2019-03-05 20:29', '5', '', '');
INSERT INTO `t_liuyan` VALUES ('10', '潮阳社区医院就诊环境如何', '2019-03-05 21:23', '5', '', '');
INSERT INTO `t_liuyan` VALUES ('11', '烫伤应该挂什么科？', '2019-03-27 23:40', '5', '', '');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpw` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(50) DEFAULT NULL,
  `nianling` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `dianhua` varchar(255) DEFAULT NULL,
  `shenhe` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `typename` varchar(50) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL,
  `jifen` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `shenfenzheng` varchar(50) DEFAULT NULL,
  `touxiang` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `chushengnianyue` varchar(50) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `beizhu` varchar(50) DEFAULT NULL,
  `beizhu2` varchar(50) DEFAULT NULL,
  `beizhu3` varchar(50) DEFAULT NULL,
  `beizhu4` varchar(50) DEFAULT NULL,
  `beizhu5` varchar(50) DEFAULT NULL,
  `beizhu6` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'admin', 'admin', '周迅', '女', '25', '广东省汕头市潮阳区', '13666666666', 'yes', '0', '管理员', '11', '11', '12345678', '420581234567898765', '/upload/1556962019682.jpg', '12345678@qq.com', '199410', '199410', '3', '2', null, null, null, null);
INSERT INTO `t_user` VALUES ('5', 'zmf', '000000', 'zmf', '女', '20', '广东省汕头市潮阳区金浦镇', '17688832132', 'yes', '2', '患者', '19960', '4', '26441186', '410422111111111111', '/upload/1555851302416.jpe', '26441186@qq.com', null, null, '5', '2', null, null, null, null);
INSERT INTO `t_user` VALUES ('6', '26441186', '26441186', '26441186', '男', '22', '广东省汕头市潮阳区', '26441186', 'yes', '2', '普通用户', '0', '0', '26441186', '410422111111111111', null, '26441186@qq.com', null, null, '3', '2', null, null, null, null);
INSERT INTO `t_user` VALUES ('8', 'zcf', '000000', '郑财发', '男', '58', '广东省汕头市潮阳区金浦寨外路口', '13192257216', 'yes', '1', '医生', '0', '0', null, null, '/upload/1554211297798.jpg', null, null, null, '7', '2', null, null, null, null);
INSERT INTO `t_user` VALUES ('9', 'zjs', '000000', '郑坚胜', '男', '37', '广东省汕头市潮阳区', '13192257214', 'yes', '1', '医生', '0', '0', null, null, '/upload/1556498400078.jpg', null, null, null, '7', '2', null, null, null, null);
INSERT INTO `t_user` VALUES ('10', 'pyy', '000000', '彭于晏', '男', '41', '广东省汕头市潮南区峡山镇', '13192257211', 'yes', '1', '医生', '0', '0', null, null, '/upload/1556498489274.jpg', null, null, null, '7', '2', null, null, null, null);
INSERT INTO `t_user` VALUES ('11', 'wtq', '000000', '吴铁强', '男', '57', '广东省汕头市金平区', '13192257217', 'yes', '1', '医生', '0', '0', null, null, '/upload/1556498587371.jpg', null, null, null, '7', '3', null, null, null, null);
INSERT INTO `t_user` VALUES ('12', 'lxr', '000000', '李欣如', '女', '32', '广东省汕头市潮阳区', '12393357216', 'yes', '1', '医生', '0', '0', null, null, '/upload/1556498694713.jpg', null, null, null, '7', '4', null, null, null, null);
INSERT INTO `t_user` VALUES ('14', 'lxy', '000000', '李心怡', '女', '34', '广东省汕头市潮阳区', '13188723415', 'yes', '1', '医生', '0', '0', null, null, '/upload/1556498794773.jpg', null, null, null, '7', '6', null, null, null, null);
INSERT INTO `t_user` VALUES ('15', 'cmz', '000000', '陈铭钊', '男', '39', '广东省汕头市潮南区两英', '13897712534', 'yes', '1', '医生', '0', '0', null, null, '/upload/1556498855729.jpg', null, null, null, '7', '7', null, null, null, null);

-- ----------------------------
-- Table structure for `t_yiyuan`
-- ----------------------------
DROP TABLE IF EXISTS `t_yiyuan`;
CREATE TABLE `t_yiyuan` (
  `id` int(11) NOT NULL,
  `mingcheng` varchar(50) DEFAULT NULL,
  `dizhi` varchar(50) DEFAULT NULL,
  `dianhua` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_yiyuan
-- ----------------------------
INSERT INTO `t_yiyuan` VALUES ('5', '潮阳社区医院', '广东省汕头市潮阳区金浦街道寨外路口', '0754-88000000', 'yes');
INSERT INTO `t_yiyuan` VALUES ('6', '潮阳社区医院', '广东省汕头市潮阳区金浦', '0754-86651223', 'yes');
INSERT INTO `t_yiyuan` VALUES ('7', '潮阳社区医院', '广东省汕头市潮阳区金浦镇11号', '0754-88000000', 'no');
