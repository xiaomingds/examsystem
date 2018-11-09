/*
Navicat MySQL Data Transfer

Source Server         : exam
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-10-28 20:44:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `choicequestion`
-- ----------------------------
DROP TABLE IF EXISTS `choicequestion`;
CREATE TABLE `choicequestion` (
  `id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(254) NOT NULL,
  `Aoption` varchar(254) NOT NULL,
  `Boption` varchar(254) NOT NULL,
  `Coption` varchar(254) NOT NULL,
  `Doption` varchar(254) NOT NULL,
  `answer` varchar(254) NOT NULL,
  `analysis` varchar(254) DEFAULT NULL,
  `chapter` int(11) NOT NULL,
  `difficulty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of choicequestion
-- ----------------------------

-- ----------------------------
-- Table structure for `point1`
-- ----------------------------
DROP TABLE IF EXISTS `point1`;
CREATE TABLE `point1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of point1
-- ----------------------------
INSERT INTO `point1` VALUES ('1', '程序的设计结构');
INSERT INTO `point1` VALUES ('2', '函数');
INSERT INTO `point1` VALUES ('3', '数组');
INSERT INTO `point1` VALUES ('4', 'for循环');
INSERT INTO `point1` VALUES ('5', 'while循环');
INSERT INTO `point1` VALUES ('6', '指针');

-- ----------------------------
-- Table structure for `point2`
-- ----------------------------
DROP TABLE IF EXISTS `point2`;
CREATE TABLE `point2` (
  `bid` int(11) NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `fk_point_id` (`aid`),
  CONSTRAINT `fk_point_id` FOREIGN KEY (`aid`) REFERENCES `point1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of point2
-- ----------------------------
INSERT INTO `point2` VALUES ('1', 'aaa', '1');
INSERT INTO `point2` VALUES ('2', 'bbb', '1');
INSERT INTO `point2` VALUES ('3', 'ccc', '2');
INSERT INTO `point2` VALUES ('4', 'ffff', '3');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1170131143', '1170131143');
INSERT INTO `student` VALUES ('2', 'stu', 'stu');
INSERT INTO `student` VALUES ('3', '学生', '123456');

-- ----------------------------
-- Table structure for `tb_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('2', '逗瓜', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('3', '愤青', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('5', '小白', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('6', '菜鸡', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('7', '罗鸣', '1884681325', '啦啦啦', 'student');
INSERT INTO `tb_customer` VALUES ('8', '', '', '', '');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'admin');
INSERT INTO `tb_user` VALUES ('2', 'a', 'a');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'root', 'root');
INSERT INTO `teacher` VALUES ('2', '方海诺', '123456');
INSERT INTO `teacher` VALUES ('4', 'dds', 'dds');
