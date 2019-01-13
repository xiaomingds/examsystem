/*
Navicat MySQL Data Transfer

Source Server         : exam
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : ssmexam

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-01-13 21:57:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `maid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `fk_maid` (`maid`),
  CONSTRAINT `fk_maid` FOREIGN KEY (`maid`) REFERENCES `major` (`maid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '1601312', '1');
INSERT INTO `class` VALUES ('2', '1701311', '2');
INSERT INTO `class` VALUES ('3', '1801313', '3');
INSERT INTO `class` VALUES ('5', '1601311', '1');
INSERT INTO `class` VALUES ('19', '1901911', '18');
INSERT INTO `class` VALUES ('20', '1901312', '18');
INSERT INTO `class` VALUES ('21', '2001811', '19');

-- ----------------------------
-- Table structure for `depart`
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depart` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('1', '计算机科学与技术');
INSERT INTO `depart` VALUES ('2', '信息管理');
INSERT INTO `depart` VALUES ('3', '软件工程');
INSERT INTO `depart` VALUES ('4', '大数据');
INSERT INTO `depart` VALUES ('5', '自动化');

-- ----------------------------
-- Table structure for `examhistory`
-- ----------------------------
DROP TABLE IF EXISTS `examhistory`;
CREATE TABLE `examhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `examid` (`examid`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `examhistory_ibfk_2` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examhistory
-- ----------------------------
INSERT INTO `examhistory` VALUES ('7', '19', '2', '20');
INSERT INTO `examhistory` VALUES ('8', '26', '2', '20');
INSERT INTO `examhistory` VALUES ('9', '26', '49', '20');
INSERT INTO `examhistory` VALUES ('10', '26', '8', '10');
INSERT INTO `examhistory` VALUES ('11', '28', '2', '10');
INSERT INTO `examhistory` VALUES ('12', '31', '8', '100');
INSERT INTO `examhistory` VALUES ('13', '31', '2', '60');

-- ----------------------------
-- Table structure for `exam_information`
-- ----------------------------
DROP TABLE IF EXISTS `exam_information`;
CREATE TABLE `exam_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examname` varchar(50) NOT NULL,
  `teacher` varchar(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `chaptertwo` varchar(50) DEFAULT NULL,
  `begindate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `examtime` float DEFAULT NULL,
  `choicenum` int(11) DEFAULT NULL,
  `choicescore` float DEFAULT NULL,
  `judgenum` int(11) DEFAULT NULL,
  `judgescore` float DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_information
-- ----------------------------
INSERT INTO `exam_information` VALUES ('19', '期末考试', 'root', '123456', '计算机与人', '2019-01-24', '2019-01-25', '120', '5', '10', '5', '10', null);
INSERT INTO `exam_information` VALUES ('21', '期中考试', 'root', '', '计算机与人', '2019-01-24', '2019-01-24', '120', '1', '50', '1', '50', null);
INSERT INTO `exam_information` VALUES ('26', '试卷添加测试0112', 'root', '', '计算机与人', '2019-01-11', '2019-01-13', '120', '5', '10', '5', '20', null);
INSERT INTO `exam_information` VALUES ('28', '测试难度', 'root', '', '计算机与人', '2019-01-24', '2019-01-24', '120', '5', '10', '5', '10', null);
INSERT INTO `exam_information` VALUES ('30', '测试003', 'dds', '', '计算机与人', '2019-01-24', '2019-01-24', '120', '5', '10', '5', '10', '5');
INSERT INTO `exam_information` VALUES ('31', '老师测试004', '方海诺', '123456', '计算机与人', '2019-01-12', '2019-01-15', '120', '5', '10', '5', '10', '5');

-- ----------------------------
-- Table structure for `exam_result`
-- ----------------------------
DROP TABLE IF EXISTS `exam_result`;
CREATE TABLE `exam_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) DEFAULT NULL,
  `examid` int(11) DEFAULT NULL,
  `stuanswer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_result
-- ----------------------------
INSERT INTO `exam_result` VALUES ('11', '2', '18', 'A');
INSERT INTO `exam_result` VALUES ('12', '2', '18', 'A');
INSERT INTO `exam_result` VALUES ('13', '2', '18', 'A');
INSERT INTO `exam_result` VALUES ('14', '2', '18', 'A');
INSERT INTO `exam_result` VALUES ('15', '2', '18', 'A');
INSERT INTO `exam_result` VALUES ('16', '2', '18', 'true');
INSERT INTO `exam_result` VALUES ('17', '2', '18', 'true');
INSERT INTO `exam_result` VALUES ('18', '2', '18', 'true');
INSERT INTO `exam_result` VALUES ('19', '2', '18', 'true');
INSERT INTO `exam_result` VALUES ('20', '2', '18', 'true');
INSERT INTO `exam_result` VALUES ('51', '2', '19', 'A');
INSERT INTO `exam_result` VALUES ('52', '2', '19', 'A');
INSERT INTO `exam_result` VALUES ('53', '2', '19', 'A');
INSERT INTO `exam_result` VALUES ('54', '2', '19', 'A');
INSERT INTO `exam_result` VALUES ('55', '2', '19', 'A');
INSERT INTO `exam_result` VALUES ('56', '2', '19', 'true');
INSERT INTO `exam_result` VALUES ('57', '2', '19', 'true');
INSERT INTO `exam_result` VALUES ('58', '2', '19', 'true');
INSERT INTO `exam_result` VALUES ('59', '2', '19', 'true');
INSERT INTO `exam_result` VALUES ('60', '2', '19', 'true');
INSERT INTO `exam_result` VALUES ('61', '2', '26', 'A');
INSERT INTO `exam_result` VALUES ('62', '2', '26', 'A');
INSERT INTO `exam_result` VALUES ('63', '2', '26', 'A');
INSERT INTO `exam_result` VALUES ('64', '2', '26', 'A');
INSERT INTO `exam_result` VALUES ('65', '2', '26', 'D');
INSERT INTO `exam_result` VALUES ('66', '2', '26', 'true');
INSERT INTO `exam_result` VALUES ('67', '2', '26', 'true');
INSERT INTO `exam_result` VALUES ('68', '2', '26', 'true');
INSERT INTO `exam_result` VALUES ('69', '2', '26', 'true');
INSERT INTO `exam_result` VALUES ('70', '2', '26', 'true');
INSERT INTO `exam_result` VALUES ('71', '49', '26', 'A');
INSERT INTO `exam_result` VALUES ('72', '49', '26', 'C');
INSERT INTO `exam_result` VALUES ('73', '49', '26', 'A');
INSERT INTO `exam_result` VALUES ('74', '49', '26', 'C');
INSERT INTO `exam_result` VALUES ('75', '49', '26', 'A');
INSERT INTO `exam_result` VALUES ('76', '49', '26', 'false');
INSERT INTO `exam_result` VALUES ('77', '49', '26', 'true');
INSERT INTO `exam_result` VALUES ('78', '49', '26', 'false');
INSERT INTO `exam_result` VALUES ('79', '49', '26', 'true');
INSERT INTO `exam_result` VALUES ('80', '49', '26', 'true');
INSERT INTO `exam_result` VALUES ('81', '8', '26', 'D');
INSERT INTO `exam_result` VALUES ('82', '8', '26', 'D');
INSERT INTO `exam_result` VALUES ('83', '8', '26', 'D');
INSERT INTO `exam_result` VALUES ('84', '8', '26', 'D');
INSERT INTO `exam_result` VALUES ('85', '8', '26', 'D');
INSERT INTO `exam_result` VALUES ('86', '8', '26', 'false');
INSERT INTO `exam_result` VALUES ('87', '8', '26', 'false');
INSERT INTO `exam_result` VALUES ('88', '8', '26', 'false');
INSERT INTO `exam_result` VALUES ('89', '8', '26', 'false');
INSERT INTO `exam_result` VALUES ('90', '8', '26', 'false');
INSERT INTO `exam_result` VALUES ('91', '2', '28', 'A');
INSERT INTO `exam_result` VALUES ('92', '2', '28', 'A');
INSERT INTO `exam_result` VALUES ('93', '2', '28', 'A');
INSERT INTO `exam_result` VALUES ('94', '2', '28', 'A');
INSERT INTO `exam_result` VALUES ('95', '2', '28', 'A');
INSERT INTO `exam_result` VALUES ('96', '2', '28', 'false');
INSERT INTO `exam_result` VALUES ('97', '2', '28', 'false');
INSERT INTO `exam_result` VALUES ('98', '2', '28', 'false');
INSERT INTO `exam_result` VALUES ('99', '2', '28', 'false');
INSERT INTO `exam_result` VALUES ('100', '2', '28', 'false');
INSERT INTO `exam_result` VALUES ('101', '8', '31', 'A');
INSERT INTO `exam_result` VALUES ('102', '8', '31', 'C');
INSERT INTO `exam_result` VALUES ('103', '8', '31', 'D');
INSERT INTO `exam_result` VALUES ('104', '8', '31', 'C');
INSERT INTO `exam_result` VALUES ('105', '8', '31', 'A');
INSERT INTO `exam_result` VALUES ('106', '8', '31', 'false');
INSERT INTO `exam_result` VALUES ('107', '8', '31', 'true');
INSERT INTO `exam_result` VALUES ('108', '8', '31', 'false');
INSERT INTO `exam_result` VALUES ('109', '8', '31', 'true');
INSERT INTO `exam_result` VALUES ('110', '8', '31', 'true');
INSERT INTO `exam_result` VALUES ('111', '2', '31', 'A');
INSERT INTO `exam_result` VALUES ('112', '2', '31', 'C');
INSERT INTO `exam_result` VALUES ('113', '2', '31', 'D');
INSERT INTO `exam_result` VALUES ('114', '2', '31', 'A');
INSERT INTO `exam_result` VALUES ('115', '2', '31', 'B');
INSERT INTO `exam_result` VALUES ('116', '2', '31', 'true');
INSERT INTO `exam_result` VALUES ('117', '2', '31', 'false');
INSERT INTO `exam_result` VALUES ('118', '2', '31', 'false');
INSERT INTO `exam_result` VALUES ('119', '2', '31', 'true');
INSERT INTO `exam_result` VALUES ('120', '2', '31', 'true');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `maid` int(11) NOT NULL AUTO_INCREMENT,
  `maname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `seid` int(11) NOT NULL,
  PRIMARY KEY (`maid`),
  KEY `fk_seid` (`seid`),
  KEY `maid` (`maid`),
  CONSTRAINT `fk_seid` FOREIGN KEY (`seid`) REFERENCES `semester` (`seid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '软件工程', '1');
INSERT INTO `major` VALUES ('2', '计算机科学与技术', '2');
INSERT INTO `major` VALUES ('3', '大数据', '3');
INSERT INTO `major` VALUES ('18', '人工智能', '8');
INSERT INTO `major` VALUES ('19', '物联连网', '9');

-- ----------------------------
-- Table structure for `paper_choice`
-- ----------------------------
DROP TABLE IF EXISTS `paper_choice`;
CREATE TABLE `paper_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `answer` varchar(500) DEFAULT NULL,
  `aoption` longtext,
  `boption` longtext,
  `coption` longtext,
  `doption` longtext,
  `examid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examid` (`examid`),
  CONSTRAINT `paper_choice_ibfk_1` FOREIGN KEY (`examid`) REFERENCES `exam_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_choice
-- ----------------------------
INSERT INTO `paper_choice` VALUES ('7', '若有定义：int a=7; float x=2.5; y=4.7;\r\n则表达式x+a%3*(int)(x+y)%2/4的值是：_________。', 'A', ' 2.500000', '2.750000', '3.500000', '0.000000', '19');
INSERT INTO `paper_choice` VALUES ('8', '以下叙述不正确的是：_________。', 'C', '在C程序中，语句之间必须要用分号\";\"分隔', '若a是实型变量，C程序中a=10是正确的，因为实型变量中允许存放整型数', '在C程序中，无论是整数还是实数都能正确无误地表示', '在C程序中，%是只能用于整数运算的运算符', '19');
INSERT INTO `paper_choice` VALUES ('9', '已知各变量的类型说明如下，则以下不符合C语言语法的表达式是：________。int k,a,b;\r\nunsigned long w=5;\r\ndouble x=1.422;', 'A', 'x%(-3)', 'w+=-2', ' k=(a=2,b=3,a+b)', 'a+=a=+(b=4)*(a=3)', '19');
INSERT INTO `paper_choice` VALUES ('10', '在C语言中，字符型数据在内存中以________形式存放。', 'D', '原码', 'BCD码', '反码', 'ASCII码', '19');
INSERT INTO `paper_choice` VALUES ('11', '设有说明：char w; int x; float y; double z;\r\n则表达式w*x+z-y值的数据类型为:_________。', 'D', 'float', 'char', 'int', 'double', '19');
INSERT INTO `paper_choice` VALUES ('18', '在C语言中，字符型数据在内存中以________形式存放。', 'D', '原码', 'BCD码', '反码', 'ASCII码', '21');
INSERT INTO `paper_choice` VALUES ('39', '已知各变量的类型说明如下，则以下不符合C语言语法的表达式是：________。int k,a,b;\r\nunsigned long w=5;\r\ndouble x=1.422;', 'A', 'x%(-3)', 'w+=-2', ' k=(a=2,b=3,a+b)', 'a+=a=+(b=4)*(a=3)', '26');
INSERT INTO `paper_choice` VALUES ('40', '以下叙述不正确的是：_________。', 'C', '在C程序中，语句之间必须要用分号\";\"分隔', '若a是实型变量，C程序中a=10是正确的，因为实型变量中允许存放整型数', '在C程序中，无论是整数还是实数都能正确无误地表示', '在C程序中，%是只能用于整数运算的运算符', '26');
INSERT INTO `paper_choice` VALUES ('41', '在C语言中，字符型数据在内存中以________形式存放。', 'D', '原码', 'BCD码', '反码', 'ASCII码', '26');
INSERT INTO `paper_choice` VALUES ('42', '若有定义：int a=7; float x=2.5; y=4.7;\r\n则表达式x+a%3*(int)(x+y)%2/4的值是：_________。', 'A', ' 2.500000', '2.750000', '3.500000', '0.000000', '26');
INSERT INTO `paper_choice` VALUES ('43', 'C语言的程序一行写不下时，可以___________。', 'C', '用逗号换行', ' 用分号换行', '在任意一空格处换行', '用回车符换行', '26');
INSERT INTO `paper_choice` VALUES ('45', '已知各变量的类型说明如下，则以下不符合C语言语法的表达式是：________。int k,a,b;\r\nunsigned long w=5;\r\ndouble x=1.422;', 'A', 'x%(-3)', 'w+=-2', ' k=(a=2,b=3,a+b)', 'a+=a=+(b=4)*(a=3)', '28');
INSERT INTO `paper_choice` VALUES ('46', '设有说明：char w; int x; float y; double z;\r\n则表达式w*x+z-y值的数据类型为:_________。', 'D', 'float', 'char', 'int', 'double', '28');
INSERT INTO `paper_choice` VALUES ('47', 'C语言的程序一行写不下时，可以___________。', 'C', '用逗号换行', ' 用分号换行', '在任意一空格处换行', '用回车符换行', '28');
INSERT INTO `paper_choice` VALUES ('48', '在C语言中，字符型数据在内存中以________形式存放。', 'D', '原码', 'BCD码', '反码', 'ASCII码', '28');
INSERT INTO `paper_choice` VALUES ('49', '以下叙述不正确的是：_________。', 'C', '在C程序中，语句之间必须要用分号\";\"分隔', '若a是实型变量，C程序中a=10是正确的，因为实型变量中允许存放整型数', '在C程序中，无论是整数还是实数都能正确无误地表示', '在C程序中，%是只能用于整数运算的运算符', '28');
INSERT INTO `paper_choice` VALUES ('51', 'C语言的程序一行写不下时，可以___________。', 'C', '用逗号换行', ' 用分号换行', '在任意一空格处换行', '用回车符换行', '30');
INSERT INTO `paper_choice` VALUES ('52', '设有说明：char w; int x; float y; double z;\r\n则表达式w*x+z-y值的数据类型为:_________。', 'D', 'float', 'char', 'int', 'double', '30');
INSERT INTO `paper_choice` VALUES ('53', '若有定义：int a=7; float x=2.5; y=4.7;\r\n则表达式x+a%3*(int)(x+y)%2/4的值是：_________。', 'A', ' 2.500000', '2.750000', '3.500000', '0.000000', '30');
INSERT INTO `paper_choice` VALUES ('54', '已知各变量的类型说明如下，则以下不符合C语言语法的表达式是：________。int k,a,b;\r\nunsigned long w=5;\r\ndouble x=1.422;', 'A', 'x%(-3)', 'w+=-2', ' k=(a=2,b=3,a+b)', 'a+=a=+(b=4)*(a=3)', '30');
INSERT INTO `paper_choice` VALUES ('55', '以下叙述不正确的是：_________。', 'C', '在C程序中，语句之间必须要用分号\";\"分隔', '若a是实型变量，C程序中a=10是正确的，因为实型变量中允许存放整型数', '在C程序中，无论是整数还是实数都能正确无误地表示', '在C程序中，%是只能用于整数运算的运算符', '30');
INSERT INTO `paper_choice` VALUES ('56', '已知各变量的类型说明如下，则以下不符合C语言语法的表达式是：________。int k,a,b;\r\nunsigned long w=5;\r\ndouble x=1.422;', 'A', 'x%(-3)', 'w+=-2', ' k=(a=2,b=3,a+b)', 'a+=a=+(b=4)*(a=3)', '31');
INSERT INTO `paper_choice` VALUES ('57', '以下叙述不正确的是：_________。', 'C', '在C程序中，语句之间必须要用分号\";\"分隔', '若a是实型变量，C程序中a=10是正确的，因为实型变量中允许存放整型数', '在C程序中，无论是整数还是实数都能正确无误地表示', '在C程序中，%是只能用于整数运算的运算符', '31');
INSERT INTO `paper_choice` VALUES ('58', '设有说明：char w; int x; float y; double z;\r\n则表达式w*x+z-y值的数据类型为:_________。', 'D', 'float', 'char', 'int', 'double', '31');
INSERT INTO `paper_choice` VALUES ('59', 'C语言的程序一行写不下时，可以___________。', 'C', '用逗号换行', ' 用分号换行', '在任意一空格处换行', '用回车符换行', '31');
INSERT INTO `paper_choice` VALUES ('60', '若有定义：int a=7; float x=2.5; y=4.7;\r\n则表达式x+a%3*(int)(x+y)%2/4的值是：_________。', 'A', ' 2.500000', '2.750000', '3.500000', '0.000000', '31');

-- ----------------------------
-- Table structure for `paper_judge`
-- ----------------------------
DROP TABLE IF EXISTS `paper_judge`;
CREATE TABLE `paper_judge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `answer` varchar(5) DEFAULT NULL,
  `examid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examid` (`examid`),
  CONSTRAINT `paper_judge_ibfk_1` FOREIGN KEY (`examid`) REFERENCES `exam_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_judge
-- ----------------------------
INSERT INTO `paper_judge` VALUES ('7', 'b', '错误', '19');
INSERT INTO `paper_judge` VALUES ('8', 'd', '正确', '19');
INSERT INTO `paper_judge` VALUES ('9', 'de', '错误', '19');
INSERT INTO `paper_judge` VALUES ('10', 'a', '正确', '19');
INSERT INTO `paper_judge` VALUES ('11', '这是一个判断？', '正确', '19');
INSERT INTO `paper_judge` VALUES ('17', 'b', '错误', '21');
INSERT INTO `paper_judge` VALUES ('26', '这是一个判断？', '正确', '26');
INSERT INTO `paper_judge` VALUES ('27', 'd', '正确', '26');
INSERT INTO `paper_judge` VALUES ('28', 'de', '错误', '26');
INSERT INTO `paper_judge` VALUES ('29', 'a', '正确', '26');
INSERT INTO `paper_judge` VALUES ('30', 'b', '错误', '26');
INSERT INTO `paper_judge` VALUES ('32', 'a', '正确', '28');
INSERT INTO `paper_judge` VALUES ('33', '这是一个判断？', '正确', '28');
INSERT INTO `paper_judge` VALUES ('34', 'de', '错误', '28');
INSERT INTO `paper_judge` VALUES ('35', 'd', '正确', '28');
INSERT INTO `paper_judge` VALUES ('36', 'b', '错误', '28');
INSERT INTO `paper_judge` VALUES ('37', '这是一个判断？', 'true', '30');
INSERT INTO `paper_judge` VALUES ('38', 'b', 'false', '30');
INSERT INTO `paper_judge` VALUES ('39', 'a', 'false', '30');
INSERT INTO `paper_judge` VALUES ('40', 'd', 'true', '30');
INSERT INTO `paper_judge` VALUES ('41', 'de', 'true', '30');
INSERT INTO `paper_judge` VALUES ('42', 'a', 'false', '31');
INSERT INTO `paper_judge` VALUES ('43', 'de', 'true', '31');
INSERT INTO `paper_judge` VALUES ('44', 'b', 'false', '31');
INSERT INTO `paper_judge` VALUES ('45', '这是一个判断？', 'true', '31');
INSERT INTO `paper_judge` VALUES ('46', 'd', 'true', '31');

-- ----------------------------
-- Table structure for `point1`
-- ----------------------------
DROP TABLE IF EXISTS `point1`;
CREATE TABLE `point1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of point1
-- ----------------------------
INSERT INTO `point1` VALUES ('1', '程序设计ABC');
INSERT INTO `point1` VALUES ('2', '数据类型、运算符与表达式');
INSERT INTO `point1` VALUES ('3', '键盘输入与屏幕输出');
INSERT INTO `point1` VALUES ('4', '程序的控制结构');
INSERT INTO `point1` VALUES ('5', '函数');
INSERT INTO `point1` VALUES ('6', '数组');
INSERT INTO `point1` VALUES ('7', '指针');
INSERT INTO `point1` VALUES ('8', '结构体与共用体');
INSERT INTO `point1` VALUES ('9', '文件操作');
INSERT INTO `point1` VALUES ('10', 'C程序设计常见错误与解决方案');
INSERT INTO `point1` VALUES ('12', 'pointname');

-- ----------------------------
-- Table structure for `point2`
-- ----------------------------
DROP TABLE IF EXISTS `point2`;
CREATE TABLE `point2` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE,
  KEY `fk_point_id` (`aid`) USING BTREE,
  CONSTRAINT `point2_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `point1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of point2
-- ----------------------------
INSERT INTO `point2` VALUES ('1', '计算机与人', '1');
INSERT INTO `point2` VALUES ('2', '计算机与程序设计语言', '1');
INSERT INTO `point2` VALUES ('3', '程序设计语言的故事', '1');
INSERT INTO `point2` VALUES ('4', 'C语言的故事', '1');
INSERT INTO `point2` VALUES ('5', '程序设计语言的工作原理', '1');
INSERT INTO `point2` VALUES ('7', 'C程序常见符号分类', '2');
INSERT INTO `point2` VALUES ('8', '数据类型', '2');
INSERT INTO `point2` VALUES ('9', '常量', '2');
INSERT INTO `point2` VALUES ('10', '变量', '2');
INSERT INTO `point2` VALUES ('11', '常用运算符及表达式', '2');
INSERT INTO `point2` VALUES ('12', 'C语句分类', '3');
INSERT INTO `point2` VALUES ('13', '表达式语句', '3');
INSERT INTO `point2` VALUES ('14', '复合语句和空语句', '3');
INSERT INTO `point2` VALUES ('15', '基本的输入/输出操作', '3');
INSERT INTO `point2` VALUES ('16', '算法及其描述方法', '4');
INSERT INTO `point2` VALUES ('17', '顺序结构', '4');
INSERT INTO `point2` VALUES ('18', '选择结构', '4');
INSERT INTO `point2` VALUES ('19', '循环结构', '4');
INSERT INTO `point2` VALUES ('20', '流程转与控制语句', '4');
INSERT INTO `point2` VALUES ('21', '程序调试与排错', '4');
INSERT INTO `point2` VALUES ('22', '结构化程序设计方法简介', '4');
INSERT INTO `point2` VALUES ('23', '程序设计的艺术', '5');
INSERT INTO `point2` VALUES ('24', '函数的定义与使用', '5');
INSERT INTO `point2` VALUES ('25', '变量的作用域和存储类型', '5');
INSERT INTO `point2` VALUES ('26', '函数封装', '5');
INSERT INTO `point2` VALUES ('27', '预处理指令', '5');
INSERT INTO `point2` VALUES ('28', '使用assert（）查错', '5');
INSERT INTO `point2` VALUES ('29', '模块和链接', '5');
INSERT INTO `point2` VALUES ('30', '模块化程序设计方法简介', '5');
INSERT INTO `point2` VALUES ('31', '递归', '5');
INSERT INTO `point2` VALUES ('32', '数组类型的应用场合', '6');
INSERT INTO `point2` VALUES ('33', '数组的定义、引用和初始化', '6');
INSERT INTO `point2` VALUES ('34', '向函数传递一维数组', '6');
INSERT INTO `point2` VALUES ('35', '向函数传递二维数组', '6');
INSERT INTO `point2` VALUES ('36', '字符数组', '6');
INSERT INTO `point2` VALUES ('37', '指针概念', '7');
INSERT INTO `point2` VALUES ('38', '指针和数组间的关系', '7');
INSERT INTO `point2` VALUES ('39', '指针数组', '7');
INSERT INTO `point2` VALUES ('40', '函数指针', '7');
INSERT INTO `point2` VALUES ('41', '带函数的main（）函数', '7');
INSERT INTO `point2` VALUES ('42', '动态数组的实现', '7');
INSERT INTO `point2` VALUES ('43', '使用const的修饰指针变量', '7');
INSERT INTO `point2` VALUES ('44', '代码风格', '7');
INSERT INTO `point2` VALUES ('45', '结构体的应用场合', '8');
INSERT INTO `point2` VALUES ('46', '结构体类型与结构体变量', '8');
INSERT INTO `point2` VALUES ('47', '结构体数组', '8');
INSERT INTO `point2` VALUES ('48', '向函数传递结构体', '8');
INSERT INTO `point2` VALUES ('49', '动态数组结构', '8');
INSERT INTO `point2` VALUES ('50', '共用体', '8');
INSERT INTO `point2` VALUES ('51', '计算机中流', '9');
INSERT INTO `point2` VALUES ('52', '文件', '9');
INSERT INTO `point2` VALUES ('53', '基本文件操作', '9');
INSERT INTO `point2` VALUES ('54', '高级文件操作', '9');

-- ----------------------------
-- Table structure for `semester`
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `sename` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`seid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES ('1', '2016级');
INSERT INTO `semester` VALUES ('2', '2017级');
INSERT INTO `semester` VALUES ('3', '2018级');
INSERT INTO `semester` VALUES ('8', '2019级');
INSERT INTO `semester` VALUES ('9', '2021级');

-- ----------------------------
-- Table structure for `sit`
-- ----------------------------
DROP TABLE IF EXISTS `sit`;
CREATE TABLE `sit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sit
-- ----------------------------
INSERT INTO `sit` VALUES ('1', '助教');
INSERT INTO `sit` VALUES ('2', '讲师');
INSERT INTO `sit` VALUES ('3', '副教授');
INSERT INTO `sit` VALUES ('4', '教授');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(16) NOT NULL,
  `classname` varchar(20) NOT NULL,
  `num` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2', 'root', 'root', '1601312', '1160131230');
INSERT INTO `student` VALUES ('8', '佩奇', '123456', '1601312', '1160131205');
INSERT INTO `student` VALUES ('17', '苏西', 'qqq', '1601311', '1160131131');
INSERT INTO `student` VALUES ('20', '猪妈妈', 'lalalal', '1601311', '1160131112');
INSERT INTO `student` VALUES ('23', 'ds', '1601311', 'ds', '1601311');
INSERT INTO `student` VALUES ('25', '乔治', '1601311', '134', '1601311');
INSERT INTO `student` VALUES ('27', 'luoming', '1601311', '123456', '1601311');
INSERT INTO `student` VALUES ('28', '实现啦', '1601311', 'lalalal', '1601311');
INSERT INTO `student` VALUES ('29', '马化腾', '1601312', 'root', '1601312');
INSERT INTO `student` VALUES ('30', '马云', '1601312', '123', '1601312');
INSERT INTO `student` VALUES ('40', '猪爸爸', '1160131250', '1601312', '1160131250');
INSERT INTO `student` VALUES ('41', '乔治', '1160131240', '1601312', '1160131240');
INSERT INTO `student` VALUES ('45', '苏西', '1160131203', '1601312', '1160131203');
INSERT INTO `student` VALUES ('47', '马化腾', '1160131201', '1601312', '1160131201');
INSERT INTO `student` VALUES ('48', '马云', '1160131240', '1601312', '1160131240');
INSERT INTO `student` VALUES ('49', '王思聪', '1190131125', '1901311', '1190131125');
INSERT INTO `student` VALUES ('61', '测试', '1160131232', '1601312', '1160131232');
INSERT INTO `student` VALUES ('64', '董珊珊', '190131201', '1901312', '190131201');
INSERT INTO `student` VALUES ('65', '丁一明', '190131202', '1901312', '190131202');
INSERT INTO `student` VALUES ('66', '丁钱', '190131203', '1901312', '190131203');
INSERT INTO `student` VALUES ('67', '刘天', '190131204', '1901312', '190131204');
INSERT INTO `student` VALUES ('68', '成文', '190131205', '1901312', '190131205');
INSERT INTO `student` VALUES ('69', '许聪', '190131206', '1901312', '190131206');
INSERT INTO `student` VALUES ('70', '王飞', '190131207', '1901312', '190131207');
INSERT INTO `student` VALUES ('71', '田九', '190131208', '1901312', '190131208');
INSERT INTO `student` VALUES ('72', '文天', '190131209', '1901312', '190131209');
INSERT INTO `student` VALUES ('73', '商鞅', '190131210', '1901312', '190131210');
INSERT INTO `student` VALUES ('74', '李白', '190131211', '1901312', '190131211');
INSERT INTO `student` VALUES ('75', '杜甫', '190131212', '1901312', '190131212');
INSERT INTO `student` VALUES ('76', '杜比', '190131213', '1901312', '190131213');
INSERT INTO `student` VALUES ('77', '钱五', '190131214', '1901312', '190131214');
INSERT INTO `student` VALUES ('78', '卓非凡', '190131215', '1901312', '190131215');
INSERT INTO `student` VALUES ('79', '明道', '190131216', '1901312', '190131216');
INSERT INTO `student` VALUES ('80', '盛连', '190131217', '1901312', '190131217');
INSERT INTO `student` VALUES ('81', '童博', '190131218', '1901312', '190131218');
INSERT INTO `student` VALUES ('82', '童江', '190131219', '1901312', '190131219');
INSERT INTO `student` VALUES ('83', '江山', '190131220', '1901312', '190131220');
INSERT INTO `student` VALUES ('84', '江文', '190131221', '1901312', '190131221');
INSERT INTO `student` VALUES ('85', '温夏', '190131222', '1901312', '190131222');
INSERT INTO `student` VALUES ('86', '夏侯', '190131223', '1901312', '190131223');
INSERT INTO `student` VALUES ('87', '唐道', '190131224', '1901312', '190131224');
INSERT INTO `student` VALUES ('88', '唐连', '190131225', '1901312', '190131225');
INSERT INTO `student` VALUES ('89', '钱飞宇', '190131226', '1901312', '190131226');
INSERT INTO `student` VALUES ('90', '刘当', '190131227', '1901312', '190131227');
INSERT INTO `student` VALUES ('91', '刘邦', '190131228', '1901312', '190131228');
INSERT INTO `student` VALUES ('92', '张飞', '190131229', '1901312', '190131229');
INSERT INTO `student` VALUES ('93', '关羽', '190131230', '1901312', '190131230');
INSERT INTO `student` VALUES ('94', '商夏', '190131231', '1901312', '190131231');
INSERT INTO `student` VALUES ('95', '刘强董', '190131232', '1901312', '190131232');
INSERT INTO `student` VALUES ('96', '宋波', '190131233', '1901312', '190131233');
INSERT INTO `student` VALUES ('97', '宋义', '190131234', '1901312', '190131234');
INSERT INTO `student` VALUES ('98', '万千', '190131235', '1901312', '190131235');
INSERT INTO `student` VALUES ('99', '程萍', '190131236', '1901312', '190131236');
INSERT INTO `student` VALUES ('100', '程米', '190131237', '1901312', '190131237');
INSERT INTO `student` VALUES ('101', '刘必', '190131238', '1901312', '190131238');
INSERT INTO `student` VALUES ('102', '万博', '190131239', '1901312', '190131239');
INSERT INTO `student` VALUES ('103', '吴成', '190131240', '1901312', '190131240');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'admin');
INSERT INTO `tb_user` VALUES ('2', 'a', 'a');
INSERT INTO `tb_user` VALUES ('3', 'root', 'root');
INSERT INTO `tb_user` VALUES ('4', '罗鸣', '123');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `major` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `level` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'root', '自动化', '讲师', '108375871@qq.com', 'root');
INSERT INTO `teacher` VALUES ('2', '方海诺', '软件工程', '助教', '1083758071@gmail.com', '123456');
INSERT INTO `teacher` VALUES ('4', 'dds', '计算机科学与技术', '教授', 'jiaoshou@firefox.com', '123456');
INSERT INTO `teacher` VALUES ('5', 'tch', '计算机科学与技术', '讲师', 'luomingds@163.com', '123456');
INSERT INTO `teacher` VALUES ('8', '苏西', '软件工程', '教授', 'luomingds@163.com', '123456');

-- ----------------------------
-- Table structure for `tk_choice`
-- ----------------------------
DROP TABLE IF EXISTS `tk_choice`;
CREATE TABLE `tk_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答题编号',
  `content` longtext NOT NULL COMMENT '试题内容',
  `aoption` longtext COMMENT '选项A',
  `boption` longtext COMMENT '选项B',
  `coption` longtext COMMENT '选项C',
  `doption` longtext COMMENT '选项D',
  `answer` longtext COMMENT '试题答案',
  `analysis` longtext COMMENT '试题解析',
  `chapter` varchar(255) DEFAULT NULL COMMENT '章节编号',
  `chaptertwo` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL COMMENT '试题难度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tk_choice
-- ----------------------------
INSERT INTO `tk_choice` VALUES ('3', 'C语言的程序一行写不下时，可以___________。', '用逗号换行', ' 用分号换行', '在任意一空格处换行', '用回车符换行', 'C', '还是基础', '1', '计算机与人', '5');
INSERT INTO `tk_choice` VALUES ('4', '以下叙述不正确的是：_________。', '在C程序中，语句之间必须要用分号\";\"分隔', '若a是实型变量，C程序中a=10是正确的，因为实型变量中允许存放整型数', '在C程序中，无论是整数还是实数都能正确无误地表示', '在C程序中，%是只能用于整数运算的运算符', 'C', '运算符', '1', '计算机与人', '5');
INSERT INTO `tk_choice` VALUES ('5', '以下不正确的C语言标识符是________。', 'ABC', 'abc', 'a_bc', 'ab.c', 'D', '基础题', '1', 'C程序常见符号分类', '5');
INSERT INTO `tk_choice` VALUES ('6', '下列字符串是标识符的是：_________。', '_HJ', '9_student', 'long', 'LINE 1', 'A', '难度上升', '1', '计算机与人', '5');
INSERT INTO `tk_choice` VALUES ('7', '以下说法中正确的是：________。', 'C语言程序总是从第一个定义的函数开始执行', '在C语言程序中，要调用的函数必须放在main()函数中定义', 'C语言程序总是从main()函数开始执行', 'C语言程序中的main()函数必须放在程序的开始部分', 'C', '难度上升', '1', 'C程序常见符号分类', '5');
INSERT INTO `tk_choice` VALUES ('8', '不合法的常量是：_______。', '‘\\2’', ' \"    \"', '‘3’', ' ‘\\483’', 'D', '基础题', '1', '计算机与人', '1');
INSERT INTO `tk_choice` VALUES ('9', '已知各变量的类型说明如下，则以下不符合C语言语法的表达式是：________。int k,a,b;\r\nunsigned long w=5;\r\ndouble x=1.422;', 'x%(-3)', 'w+=-2', ' k=(a=2,b=3,a+b)', 'a+=a=+(b=4)*(a=3)', 'A', '难度上升', '1', '计算机与人', '5');
INSERT INTO `tk_choice` VALUES ('10', '在C语言中，字符型数据在内存中以________形式存放。', '原码', 'BCD码', '反码', 'ASCII码', 'D', '难度上升', '1', '计算机与人', '5');
INSERT INTO `tk_choice` VALUES ('11', '若有定义：int a=7; float x=2.5; y=4.7;\r\n则表达式x+a%3*(int)(x+y)%2/4的值是：_________。', ' 2.500000', '2.750000', '3.500000', '0.000000', 'A', '难度上升', '1', '计算机与人', '5');
INSERT INTO `tk_choice` VALUES ('12', '设有说明：char w; int x; float y; double z;\r\n则表达式w*x+z-y值的数据类型为:_________。', 'float', 'char', 'int', 'double', 'D', '基础题', '1', '计算机与人', '5');
INSERT INTO `tk_choice` VALUES ('13', '以下_______是不正确的转义字符。', ' \'\\\\\'', '\'\\\'', '\'081\'', ' \'\\0\'', 'BC', '难度上升', '2', '常用运算符及表达式', '4');
INSERT INTO `tk_choice` VALUES ('14', '若x为int型变量,则执行以下语句后,x的值为___________。\r\n    		x=6; x+=x-=x*x;', '36', '-60', '60', '-24', 'B', '题目有些难', '2', '数据类型', '3');
INSERT INTO `tk_choice` VALUES ('15', '字符串\"\\\\\\\"ABC\\\"\\\\\"的长度是__________ 。', '11', '7', '5', '3', 'B', '题目有些难', '2', '数据类型', '2');
INSERT INTO `tk_choice` VALUES ('16', '若x,y,z均为int型变量,则执行以下语句后的输出为__________。\r\n    		x=(y=(z=10)+5)-5;\r\n    		printf(\"x=%d,y=%d,z=%d\\n\",x,y,z);\r\n    		y=(z=x=0,x+10);\r\n    		printf(\"x=%d,y=%d,z=%d\\n\",x,y,z);', 'X=10,Y=15,Z=10<回车> X=0, Y=10, Z=0', 'X=10, Y=10,Z=10<回车> X=0,Y =10, Z=10', 'X=10,Y=15,Z=10 <回车>X=10, Y=10, Z=0', 'X=10,Y=10,Z=10 <回车>X=0, Y=10, Z=0', 'A', '题目有些难', '2', '常用运算符及表达式', '2');
INSERT INTO `tk_choice` VALUES ('17', '若x是int型变量,y是float型变量,所用的scanf调用语句格式为:scanf(\"x=%d,y=%f\",&x,&y);则为了将数据10和66.6分别赋给x和y,正确的输入应是:________________。', 'x=10,y=66.6<回车>', '10 66.6<回车>', '10<回车>66.6<回车>', 'x=10<回车>y=66.6<回车>', 'A', '难度上升', '2', '数据类型', '3');
INSERT INTO `tk_choice` VALUES ('18', '已知有变量定义：int a;char c;用scanf(“%d%c”,&a,&c);语句给a和c输入数据，使30存入a，字符‘b’存入c，则正确的输入是：________________。', '30’b’<回车>', ' 30  b<回车>', '30<回车>b<回车>', '30b<回车>', 'D', '难度上升', '2', '数据类型', '4');
INSERT INTO `tk_choice` VALUES ('19', '已知有变量定义：double x;long a; 要给a和x输入数据，正确的输入语句是___________。若要输出a和x的值，正确的输出语句_____________。', 'scanf(“%d%f”,&a,&x);   printf(“%d,%f”,a,x);', 'scanf(“%ld%f”,&a,&x);     printf(“%ld,%f”,a,x);', 'scanf(“%ld%lf”,&a,&x);     printf(“%ld,%lf”,a,x);', 'scanf(“%ld%lf”,&a,&x);     printf(“%ld,%f”,a,x);', 'C', '难度上升', '2', '数据类型', '5');
INSERT INTO `tk_choice` VALUES ('20', '若有定义double x=1，y；则以下的语句执行的结果是_____________。\r\ny=x+3/2; printf(“%f”,y); ', '2.500000', '2.5', '2.000000', '2', 'C', '难度上升', '2', '数据类型', '2');
INSERT INTO `tk_choice` VALUES ('21', '若a为整型变量，则以下语句____________。\r\na=-2L;  printf(\"%d\\n\",a);', ' 赋值不合法', '输出为不确定的值', '输出值为-2', '输出值为2', 'C', '基础题', '2', '常用运算符及表达式', '1');
INSERT INTO `tk_choice` VALUES ('22', '若x=0，y=3，z=3,以下表达式值为0的是___________。', '!x', 'x<y? 1:0', 'x%2&&y==z', 'y=x||z/3', 'C', '题目有些难', '2', '数据类型', '3');
INSERT INTO `tk_choice` VALUES ('23', '若w=1,x=2,y=3,z=4,则条件表达式w<x?w:y<z?y:z的结果为__________。', '4', '3', '2', '1', 'D', '题目有些难', '2', '常用运算符及表达式', '4');
INSERT INTO `tk_choice` VALUES ('24', '分析以下程序, 下列说法正确的是___________。\r\nmain()\r\n  { int x=5,a=0,b=0;\r\nif(x=a+b) printf(\"* * * *\\n\");\r\nelse   printf(\"# # # #\\n\");\r\n  }', '有语法错，不能通过编译', '通过编译，但不能连接', '输出* * * *', '输出# # # #', 'D', '难度上升', '3', '表达式语句', '4');
INSERT INTO `tk_choice` VALUES ('25', '分析以下程序, 下列说法正确的是       。\r\nmain()\r\n  { int x=5,a=0,b=3;\r\nif(x=a+b) printf(\"* * * *\\n\");\r\nelse   printf(\"# # # #\\n\");\r\n			  }', '有语法错，不能通过编译', '通过编译，但不能连接', '输出* * * *', '输出# # # #', 'C', '基础题', '3', '表达式语句', '5');
INSERT INTO `tk_choice` VALUES ('26', '程序段如下：则以下说法中正确的是_________。\r\nint k=5;\r\ndo{\r\n    k--;\r\n}while(k<=0);', '循环执行5次 ', '循环是无限循环', '循环体语句一次也不执行', '循环体语句执行一次', 'D', '题目有些难', '3', '表达式语句', '2');
INSERT INTO `tk_choice` VALUES ('27', '设i和x都是int类型，则for循环语句____________。for(i=0,x=0;i<=9&&x!=876;i++) scanf(\"%d\",&x);', '最多执行10次', '最多执行9次', '是无限循环', '循环体一次也不执行', 'A', '题目有些难', '3', 'C语句分类', '3');
INSERT INTO `tk_choice` VALUES ('28', '下述for循环语句__________。int i,k;\r\nfor(i=0,k=-1;k=1;i++,k++)  printf(\"* * * *\");', '判断循环结束的条件非法', '是无限循环', '只循环一次', ' 一次也不循环', 'B', '难度上升', '3', 'C语句分类', '1');
INSERT INTO `tk_choice` VALUES ('29', '程序段如下：则以下说法中正确的是：__________。int k=-20;\r\nwhile(k=0) k=k+1;', 'while循环执行20次', '循环是无限循环', '循环体语句一次也不执行', '循环体语句执行一次', 'C', '难度上升', '3', 'C语句分类', '3');
INSERT INTO `tk_choice` VALUES ('30', '下列程序段执行后k值为_____________。int k=0,i,j;\r\nfor(i=0;i<5;i++)\r\nfor(j=0;j<3;j++)\r\n   k=k+1 ;', '15', '3', '5', '8', 'A', '难度上升', '3', '表达式语句', '3');
INSERT INTO `tk_choice` VALUES ('31', '程序段如下：则以下说法中不正确的是：___________。#include <stdio.h>\r\nmain()\r\n{\r\nint k=2,;\r\nwhile(k<7) \r\n{\r\nif(k%2) {k=k+3; printf(“k=%d\\n”,k);continue;}\r\nk=k+1;\r\nprintf(“k=%d\\n”,k);\r\n}\r\n}', 'k=k+3;执行一次', 'k=k+1;执行2次', '执行后k值为7', '循环体只执行一次', 'D', '难度上升', '3', 'C语句分类', '1');
INSERT INTO `tk_choice` VALUES ('32', '以下关于数组的描述正确的是_______________。', '数组的大小是固定的，但可以有不同的类型的数组元素。', '数组的大小是可变的，但所有数组元素的类型必须相同。', '数组的大小是固定的，但所有数组元素的类型必须相同。', '数组的大小是可变的，但可以有不同的类型的数组元素。C', 'C', '基础题', '3', 'C语句分类', '5');
INSERT INTO `tk_choice` VALUES ('33', '在定义int a[10];之后，对a的引用正确的是___________。', 'a[10]', 'a[6.3]', 'a(6)', 'a[10-10]', 'D', '题目有些难', '3', 'C语句分类', '1');
INSERT INTO `tk_choice` VALUES ('34', '以下能正确定义数组并正确赋初值的语句是____________。', 'int n=5,b[n][n];', 'int a[1][2]={{1},{3}};', 'int c[2][]={{1,2},{3,4}}', ' int a[3][2]={{1,2},{3,4}}', 'D', '难度上升', '3', '表达式语句', '2');
INSERT INTO `tk_choice` VALUES ('35', '以下不能正确赋值的是_____________。', 'char s1[10];s1=\"test\";', 'char s2[]={’t’,’e’,’s’,’t’}', 'char s3[20]= \"test\";', 'char s4[4]={ ’t’,’e’,’s’,’t’}', 'A', '难度上升', '3', 'C语句分类', '3');
INSERT INTO `tk_choice` VALUES ('36', '下面程序段运行时输出结果是______________。char s[18]= \"a book! \";\r\nprintf(\"%.4s\",s);', 'a book!', '     a book!', 'a bo', '格式描述不正确，没有确定输出', 'C', '题目有些难', '3', 'C语句分类', '3');
INSERT INTO `tk_choice` VALUES ('37', '下面程序段运行时输出结果是__________。char s[12]= \"A book\";\r\nprintf(\"%d\\n\",strlen(s));', '12', '8', '7', '6', 'D', '难度上升', '3', 'C语句分类', '4');
INSERT INTO `tk_choice` VALUES ('38', '在执行int a[][3]={1,2,3,4,5,6};语句后，a[1][0]的值是_________。', '4', '1', '2', '5', 'A', '难度上升', '3', '表达式语句', '2');
INSERT INTO `tk_choice` VALUES ('39', '在C语言中，当函数调用时____________。', '实参和形参各占一个独立的存储单元', '实参和形参共用存储单元', '可以由用户指定实参和形参是否共用存储单元', '由系统自动确定实参和形参是否共用存储单元', 'A', '基础题', '3', 'C语句分类', '3');
INSERT INTO `tk_choice` VALUES ('40', '以下函数调用语句中实参的个数为_________。exce((v1,v2),(v3,v4,v5),v6);', '3', '4', '5', '6', 'A', '难度上升', '3', '表达式语句', '2');
INSERT INTO `tk_choice` VALUES ('41', '如果在一个函数的复合语句中定义了一个变量，则该变量___________。', '只在该符合语句中有效，在该符合语句外无效', '在该函数中任何位置都有效', '在本程序的原文件范围内均有效', ' 此定义方法错误，其变量为非法变量', 'A', '难度上升', '3', '表达式语句', '1');
INSERT INTO `tk_choice` VALUES ('42', 'C语言允许函数值类型缺省定义，此时该函数值隐含的类型是____________。', 'float型', 'int型', 'long型', 'double型', 'B', '题目有些难', '3', '表达式语句', '5');
INSERT INTO `tk_choice` VALUES ('43', 'C语言规定，函数返回值的类型是由______________.', ' return语句中的表达式类型所决定', '调用该函数时的主调函数类型所决定', '调用该函数时系统临时决定', '在定义该函数时所指定的函数类型决定', 'D', '难度上升', '3', '表达式语句', '5');
INSERT INTO `tk_choice` VALUES ('44', '在C语言程序中，以下描述正确的是___________。', '函数的定义可以嵌套，但函数的调用不可以嵌套', '函数的定义不可以嵌套，但函数的调用可以嵌套', '函数的定义和函数的调用均不可以嵌套', '函数的定义和函数的调用均可以嵌套', 'B', '难度上升', '3', '表达式语句', '4');
INSERT INTO `tk_choice` VALUES ('45', '#include<stdio_h>\r\nvoid sub(int s[]，int y)\r\n{ static int t=3；\r\ny=s[t]；t--；\r\n}\r\nmain()\r\n{ int a[]={1,2，3，4}，i，x=0；\r\nfor(i=0；i<4；i++){\r\nsub(a,x)；printf(＂％d＂，x)；}\r\nprintf(＂＼n＂)；\r\n}', '1234', '4321', '0000', '4444', 'C', '基础题', '3', '表达式语句', '1');
INSERT INTO `tk_choice` VALUES ('46', '以下程序的运行结果是：__________。main()\r\n{ int w=5；fun(w)；printf(＂＼n＂)；}\r\nfun(int k)\r\n{ if(k>O) fun(k-1)；\r\nprintf(＂ %d＂，k)；\r\n}', '5 4 3 2 1', '0 1 2 3 4 5', '1 2 3 4 5', '5 4 3 2 1 0', 'B', '难度上升', '2', '数据类型', '3');
INSERT INTO `tk_choice` VALUES ('47', '以下所列的各函数首部中，正确的是_______。', 'void play(vat a：Integer,var b：Integer)', 'void play(int a,b)', 'void play(int a,int b', 'Sub play(a as integer,b as integer)', 'C', '题目有些难', '2', '数据类型', '2');
INSERT INTO `tk_choice` VALUES ('48', '当调用函数时，实参是一个数组名，则向函数传送的是_______。', '数组的长度 ', '数组的首地址', '数组每一个元素的地址', '数组每个元素中的值', 'B', '难度上升', '2', '数据类型', '4');
INSERT INTO `tk_choice` VALUES ('49', '在调用函数时，如果实参是简单变量，它与对应形参之间的数据传递方式是_______。', '地址传递', '单向值传递', '由实参传给形，再由形参传回实参 	', '传递方式由用户指定', 'B', '题目有些难', '3', '数据类型', '5');
INSERT INTO `tk_choice` VALUES ('50', '以下函数值的类型是_______。fun(float x)\r\n{ float y；\r\ny=3*x-4；\r\nreturn y；\r\n}', 'int', '不确定', 'void', 'float', 'A', '难度上升', '3', '变量', '2');
INSERT INTO `tk_choice` VALUES ('51', '以下选项中不是常量的是__________。', '15', '0xff', '\'\\t\'', 'x', 'D', '题目有些难', '3', '数据类型', '3');
INSERT INTO `tk_choice` VALUES ('52', '以下各组标识符中都为合法标识符的一组是____________。', 'int		xy		    hello!		    bye', ' Abc		No		    _china		    Char', 'hh		22	    	H_2			    2_H	', 's-t		sit		    s_t			    s*t', 'B', '难度上升', '2', '变量', '3');
INSERT INTO `tk_choice` VALUES ('53', '能正确表示逻辑关系：“a≥10或a≤0”的C语言表达式是___________。', ' a>=10 or a<=0', ' a>=0|a<=10', ' a>=10 &&a<=0', ' a>=10‖a<=0', 'D', '基础题', '2', '变量', '3');
INSERT INTO `tk_choice` VALUES ('54', '以下初始化操作正确的是_________。', ' int a=b=5;', 'char c=“a”;', ' float b[]={1.1};', 'int *p=5;', 'C', '难度上升', '2', '数据类型', '4');
INSERT INTO `tk_choice` VALUES ('55', '设a=0,b=2,c=3,则表达式a+=b*3/c计算的结果是__________。', '6', '4', '2', '0', 'C', '题目有些难', '2', '变量', '1');
INSERT INTO `tk_choice` VALUES ('56', '以下数组定义不正确的是____________。', ' int a[2][3]; ', 'int b[][3]={1,2,3,4};', ' int c[10][10]={0};', 'int d[3][]={{1,2},{1,2,3},{1,2,4,5}};', 'D', '难度上升', '2', '数据类型', '4');
INSERT INTO `tk_choice` VALUES ('57', '设有如下程序段，若要求输出c1=M,c2=N ,则正确的输入是__________。char c1,c2;\r\nscanf(“%c%c”,&c1,&c2);\r\nprintf(“c1=%c,c2=%c\\n”,c1,c2);', 'MN', 'M<回车>N', '. M<空格>N', 'M<Tab>N', 'B', '难度上升', '2', '变量', '2');
INSERT INTO `tk_choice` VALUES ('58', '设x 和y均为 int 型变量，则执行下面的循环后，x的值为_____________。for (y=1,x=1;y<=20;y++)  \r\n{  if (y>5 ) break; \r\n   x+=3; \r\n}', '1', '6', '16', ' 不能确定', 'C', '难度上升', '2', '数据类型', '2');
INSERT INTO `tk_choice` VALUES ('59', ' 有如下程序，该程序的执行结果是____________。main() \r\n{  int x=3; \r\ndo { printf(“%d”,x--);}while(!x); \r\n} ', '陷入死循环', '3', '32', '321', 'B', '基础题', '2', '常用运算符及表达式', '3');
INSERT INTO `tk_choice` VALUES ('60', '以下对 C语言函数调用时实参与形参的值传递有关描述中，正确的是__________。', '值的传递与对应位置有关，与变量名无关', '值的传递与对应位置无关，与变量名有关', '值的传递与对应位置有关，也与变量名有关', '无法传递', 'A', '难度上升', '2', '数据类型', '2');
INSERT INTO `tk_choice` VALUES ('61', '以下说法中正确的是___________。', 'C语言程序总是从第一个函数开始执行', 'C语言程序中，要调用的函数必须在main()函数中定义', 'C语言程序总是从main( )函数开始执行', 'C语言程序中的main( )函数必须放在程序的开始部分', 'C', '题目有些难', '2', '常用运算符及表达式', '2');
INSERT INTO `tk_choice` VALUES ('62', '下列为字符常量的是______________。', '“a”', '‘ab’ ', '‘\\n’', '‘\\084’', 'D', '难度上升', '2', '数据类型', '1');
INSERT INTO `tk_choice` VALUES ('63', '在C语言中运算对象必须是整型的运算符是____________。', '%', '/', '==', '<=', 'A', '题目有些难', '2', '数据类型', '2');
INSERT INTO `tk_choice` VALUES ('64', '设a=1,b=2,c=3,则表达式a+b>c&&b==c计算的结果是__________。', '3', '2', '1', '0', 'D', '难度上升', '5', '程序设计的艺术', '5');
INSERT INTO `tk_choice` VALUES ('65', '设int类型的数据长度为2字节，则int类型数据的取值范围是________________。', ' 0～255', '-32768～32767', '-256～255', '0～65535', 'B', '基础题', '5', '程序设计的艺术', '4');
INSERT INTO `tk_choice` VALUES ('66', '能够判断字符变量c是大写字母的表达式是____________。', ' c>=’A’&&c<=’Z \'', 'c>=’A’||c<=’Z’', '’A’<=c<=’Z’', '’A’>=c>=’Z’', 'A', '难度上升', '5', '程序设计的艺术', '2');
INSERT INTO `tk_choice` VALUES ('67', '下面程序的输出结果是_______。main（）\r\n{ int i=10；\r\n switch（i）\r\n{\r\ncase 9：i+=1；\r\n case 10：i+=1；\r\n case 11：i+=1；\r\n case 12：i+=1；\r\n } \r\nprintf（“i=%d\\n”，i）；\r\n }', '10', '11', '12', '13', 'D', '难度上升', '5', '程序设计的艺术', '1');
INSERT INTO `tk_choice` VALUES ('68', '语句int i=3;k=(i++)+ (i++)+ (++i);则执行过后k,i的值是___________。', '12,6', '12,5', '18,6', '15,5', 'A', '难度上升', '5', '程序设计的艺术', '3');
INSERT INTO `tk_choice` VALUES ('69', 'C 语言中，有关函数的说法，以下正确的是___________。', '函数可嵌套定义，也可嵌套调用 ', '函数可嵌套定义，但不可嵌套调用', '函数不可嵌套定义，但可嵌套调用', '函数不可嵌套定义，也不可嵌套调用', 'C', '题目有些难', '5', '程序设计的艺术', '2');
INSERT INTO `tk_choice` VALUES ('70', '以下不正确的定义语句是__________。', 'double x[5]={2.0,4.0,6.0,8.0,10.0};', ' int y[5]={0,1,3,5,7};', 'char c1[]={‘1’,‘2’,‘3’,‘4’,‘5’};', ' char c2[3]={‘\\x10’, ‘\\xa’, ‘\\x8’ ,‘\\x8’};', 'D', '难度上升', '2', '常用运算符及表达式', '4');
INSERT INTO `tk_choice` VALUES ('71', '下列说法中错误的是___________。', ' 程序可以从任何非主函数开始执行', '主函数可以调用任何非主函数的其他函数', '任何非主函数可以调用其他任何非主函数 ', '函数可以分为两个部分：函数说明部分和函数体', 'A', '基础题', '5', '程序设计的艺术', '2');
INSERT INTO `tk_choice` VALUES ('72', '标识符和关键字间，要用__________隔开。', '回车符', '冒号', '空格', '分好', 'C', '难度上升', '5', '程序设计的艺术', '1');
INSERT INTO `tk_choice` VALUES ('73', '下列运算符中优先级最高的是___________。', '<', '+', '&&', '!=', 'B', '难度上升', '5', '程序设计的艺术', '1');
INSERT INTO `tk_choice` VALUES ('74', '若int x=2,y=3,z=4 则表达式x<z?y:z的结果是______________。', '3', '2', '1', '0', 'A', '难度上升', '5', '程序设计的艺术', '3');
INSERT INTO `tk_choice` VALUES ('75', '语句printf(\"%c,%d\",\'c\', \'c\')；的输出结果是__________。', ' c,c', 'c,99', ' 99,c', '99,99', 'B', '题目有些难', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('76', '用数组名作为函数的实参时，传递给形参的是__________。', '数组的首地址', '数组的第一个元素', '数组中的全部元素', '数组的元素个数', 'A', '难度上升', '2', '常用运算符及表达式', '2');
INSERT INTO `tk_choice` VALUES ('77', '下列各语句序列中，能够且仅输出整型变量a、b 中最小值的是__________。', ' if(a<b) printf(\"%d\\n\",a); printf(\"%d\\n\",b);', ' if(a<b) printf(\"%d\\n\",a); else printf(\"%d\\n\",b);', 'if(a>b) printf(\"%d\\n\",a); printf(\"%d\\n\",b);', ' if(a>b) printf(\"%d\\n\",a); else printf(\"%d\\n\",b);', 'B', '题目有些难', '2', '常用运算符及表达式', '3');
INSERT INTO `tk_choice` VALUES ('78', '执行完循环 for(i=1;i<10;i++){}后，i 的值为___________。', '9', '10', '11', '12', 'B', '基础题', '5', '函数的定义与使用', '4');
INSERT INTO `tk_choice` VALUES ('79', '复合语句中定义的变量的作用范围是________。', '整个源文件', '整个函数', '整个程序', '所定义的复合语句', 'D', '难度上升', '5', '函数的定义与使用', '1');
INSERT INTO `tk_choice` VALUES ('80', '在函数调用时，以下说法正确的是____________。', '函数调用后必须带回返回值', '实际参数和形式参数可以同名 ', '函数间的数据传递不可以使用全局变量', '主调函数和被调函数总是在同一个文件里', 'B', '难度上升', '5', '函数的定义与使用', '2');
INSERT INTO `tk_choice` VALUES ('81', '若m为float型变量,则执行以下语句后的输出为__________。m=1234.123;\r\n    		printf(\"%-8.3f\\n\",m);\r\n    		printf(\"%10.3f\\n\",m);', '1234.123<回车>1234.123', '     1234.123<回车>1234.123', '1234.123<回车>     1234.123', '-1234.123<回车>001234.123', 'C', '题目有些难', '5', '函数的定义与使用', '2');
INSERT INTO `tk_choice` VALUES ('82', '若w,x,z均为int型变量,则执行以下语句后的输出为__________。w=3;z=7;x=10;\r\n    		printf(\"%d\\n\",x>10?x+100:x-10);\r\n    		printf(\"%d\\n\",w++||z++);\r\n    		printf(\"%d\\n\",!w>z);\r\n    		printf(\"%d\\n\",w&&z);', '0<回车>1<回车>1<回车>1<回车>1', '1<回车>1<回车>1<回车>1<回车>1', '0<回车>1<回车>0<回车>1', '0<回车>1<回车>0<回车>0', 'C', '难度上升', '5', '函数的定义与使用', '1');
INSERT INTO `tk_choice` VALUES ('83', '这是实验试题', '实验一', '实验二', '实验三', '实验四', 'C', '非常难', '5', '函数的定义与使用', '4');
INSERT INTO `tk_choice` VALUES ('84', '执行以下程序段后，输出结果和a的值是____。int a=10;printf=(\"%d\",a++);', '11和10', '11和11', '10和11', '10和10', 'C', '难度上升', '5', '函数的定义与使用', '2');
INSERT INTO `tk_choice` VALUES ('85', '相同结构体类型的变量之间，可以____。', '比较大小', '地址相同', '赋值', '相加', 'C', '难度上升', '5', '函数的定义与使用', '3');
INSERT INTO `tk_choice` VALUES ('86', 'int a[10];合法的数组元素的最小下标值为____。', '1', '0', '10', '9', 'B', '基础题', '5', '函数的定义与使用', '3');
INSERT INTO `tk_choice` VALUES ('87', '能正确表示逻辑关系:\"a>=10或a<=0\"的C语言表达式是', 'a>=10||a<=0', 'a>=0|a<=10', 'a>=10 or a<=0', 'a>=10&&a<=0', 'A', '题目有些难', '2', '常用运算符及表达式', '2');
INSERT INTO `tk_choice` VALUES ('88', '若有char c=\'\\72\';则变量C', '说明不合法，C的值不确定', '包含3个字符', '包含1个字符', '包含2个字符', 'C', '难度上升', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('89', '下列定义变量的语句错误的是_____。', 'int_int', 'double int__', 'char for', 'float US$', 'D', '常量，变量和标识符', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('90', '以下不合法的用户标识符是_____。', 'j2_KEY', 'Double', '4d', '_8_', 'C', '常量，变量和标识符', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('91', '以下4组用户定义标识符中，全部合法的一组是___。', '_main enclud sin', 'if -max turbo', 'txt REAL 3COM', 'int k_2_001???', 'A', '常量，变量和标识符', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('92', 'C语言中最简单的数据类型包括______。', '整型  实型 逻辑型', '整型 实型 字符型', '整型 字符型 逻辑型', '整型 字符型 逻辑型 实型', 'B', '常量，变量和标识符', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('93', '下列选项中，合法的C语言关键字是', 'VAR', 'cher', 'integer', 'default', 'D', '常量，变量和标识符', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('94', '下列叙述中正确的是______。', 'C语言中既有逻辑类型也有集合类型', 'C语言中没有逻辑类型，但有集合类型', 'C语言中有逻辑类型，但没有集合类型', 'C语言中既没有逻辑类型也没有集合类型', 'D', '常量，变量和标识符', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('95', '当C的值不为0时，在下列选项中能正确将C的值赋给变量a,b的是_______。', 'c=b=a', '(a=c)||(b=c)', '(a=c)&&(b=c)', 'a=c=b', 'C', '赋值表达式', '2', '常用运算符及表达式', '5');
INSERT INTO `tk_choice` VALUES ('96', '以下选中非法的表达式是______。', 'x+1=x+1', '0<=x<100', 'i=j==0', '(char 65+3)', 'A', '赋值表达式', '2', '常量', '5');
INSERT INTO `tk_choice` VALUES ('97', '若有以下定义和语句，且0≤i<10则对数组元素的错误引用是        。\r\n	int a[10]={1,2,3,4,5,6,7,8,9,10},*p,i;\r\np=a;', '*(a+i)', 'a[p-a]', 'p+i', '*(&a[i])', 'C', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('98', '若有定义：int a[3][4]; ，        不能表示数组元素a[1][1]。', '*(a[1]+1)', '*(&a[1][1])', '(*(a+1)[1])', '*(a+5)', 'D', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('99', '对如下定义，以下说法中正确的是____。', 'char *a[2]={ \"abcd\",\"ABCD\"};', '数组a的元素值分别为\"abcd\"和\"ABCD\"', 'a是指针变量，它指向含有两个数组元素的字符型数组', '数组a的两个元素分别存放的是含有4个字符的一维数组的首地址', 'D', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('100', '数组a的两个元素中各自存放了字符’a’、’A’的地址，char *s=\"\\t\\\\Name\\\\Address\\n\";指针s所指字符串的长度为______ 。', '说明不合法 ', '19', '18', '15', 'D', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('101', '分析下面函数，以下说法正确的是        。\r\n		swap(int *p1,int *p2)\r\n		{ int *p;\r\n		  *p=*p1; *p1=*p2; *p2=*p;\r\n		}\r\n', '交换*p1和*p2的值', '正确，但无法改变*p1和*p2的值', '交换*p1和*p2的地址 ', '可能造成系统故障，因为使用了空指针', 'D', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('102', '设有说明int (*ptr)[M]; 其中ptr是          ', 'M个指向整型变量的指针', '指向M个整型变量的函数指针', '一个指向具有M个整型元素的一维数组的指针', '具有M个指针元素的一维指针数组，每个元素都只能指向整型量', 'C', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('103', '在说明语句：int *f(); 中，标识符代表的是：         ', '一个用于指向整型数据的指针变量', '一个用于指向一维数组的指针', '一个用于指向函数的指针变量', '一个返回值为指针型的函数名', 'D', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('104', '若int x ，*pb； ，则正确的赋值表达式是', 'pb=&x', 'pb=x', '*pb=&x；', '*pb=*x', 'A', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('105', '有如下程序段\r\n		int *p ，a=10 ，b=1 ；\r\n		p=&a ； a=*p+b ；\r\n	执行该程序段后，a 的值为\r\n', '12', '11', '10', '编译出错', 'B', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('106', '若有以下定义和语句：\r\n		double r=99 ， *p=&r ；\r\n		*p=r ；\r\n	则以下正确的叙述是\r\n', '以下两处的*p 含义相同，都说明给指针变量p 赋值', '在\"double r=99,*p=&r；\"中，把r 的地址赋值给了p 所指的存储单元', '语句\"*p=r；\"把变量r 的值赋给指针变量p', '语句\"*p=r；\"取变量r 的值放回r 中', 'D', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('107', '要求函数的功能是交换x 和y 中的值，且通过正确调用返回交换结果.能正确执行\r\n	此功能的函数是\r\n', 'funa （int *x，int *y） { int *p； *p=*x； *x=*y；*y=*p； }', 'fund （int x，int y） { int t； t=x；x=y；y=t； }', 'func （int *x，int *y） { *x=*y；*y=*x；}', 'fund （int *x，int *y） { *x=*x+*y；*y=*x-*y；*x=*x-*y； }', 'D', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('108', '若有说明：long *p ，a；则不能通过scanf 语句正确给输入项读入数据的程序段\r\n	是\r\n', '*p=&a； scanf（\"%ld\"，p）;', ' p=（long *）malloc（8）; scanf（\"%ld\"，p）;', 'scanf（\"%ld\"，p=&a）;', 'scanf（\"%ld\"，&a）;', 'A', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('109', '若已定义：int a[9] ，*p=a；并在以后的语句中未改变p 的值，不能表示a[1] 地\r\n	址的表达式是\r\n', 'p+1', 'a+1', 'a++', '++p', 'C', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('110', '设P1 和P2 是指向同一个int 型一维数组的指针变量，k 为int 型变量，则不能正\r\n	确执行的语句是\r\n', 'k=*P1 * （*P2）;', 'k=*P1+*P2;', 'p2=k;', 'P1=P2;', 'B', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('111', '若有以下的定义：\r\n		int a[ ]={1 ，2 ，3 ，4 ，5 ，6 ，7 ，8 ，9 ，10} ， *p=a ；\r\n	则值为3 的表式是\r\n', 'p+=2 ， *（p++）', 'p+=2 ，*++p', 'p+=3 ， *p++', 'p+=2 ，++*p', 'A', '指针', '7', '函数指针', '5');
INSERT INTO `tk_choice` VALUES ('112', '若有以下定义和语句：\r\n		int a[10]={1 ，2 ，3 ，4 ，5 ，6 ，7 ，8 ，9 ，10} ，*p=a ；\r\n	则不能表示a 数组元素的表达式是         \r\n', '*p', 'a[10]', '*a', 'a[p-a]', 'B', '指针', '7', '函数指针', '5');

-- ----------------------------
-- Table structure for `tk_judge`
-- ----------------------------
DROP TABLE IF EXISTS `tk_judge`;
CREATE TABLE `tk_judge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `answer` varchar(10) NOT NULL,
  `analysis` longtext NOT NULL,
  `chapter` int(11) NOT NULL,
  `chaptertwo` varchar(50) NOT NULL,
  `difficulty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tk_judge
-- ----------------------------
INSERT INTO `tk_judge` VALUES ('1', '这是一个判断？', 'true', '分析', '1', '计算机与人', '5');
INSERT INTO `tk_judge` VALUES ('2', 'a', 'false', 'a', '1', '计算机与人', '5');
INSERT INTO `tk_judge` VALUES ('3', 'b', 'false', 'b', '1', '计算机与人', '5');
INSERT INTO `tk_judge` VALUES ('4', 'd', 'true', 'd', '1', '计算机与人', '5');
INSERT INTO `tk_judge` VALUES ('5', 'de', 'true', 'e', '1', '计算机与人', '5');
INSERT INTO `tk_judge` VALUES ('8', '小猪佩奇', 'false', '啦啦啦', '1', '计算机与人', '4');
