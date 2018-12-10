/*
Navicat MySQL Data Transfer

Source Server         : exam
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-12-10 19:56:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(50) NOT NULL,
  `blank_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `blank_id` (`blank_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`blank_id`) REFERENCES `blank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('2', 'asd', '2');
INSERT INTO `answer` VALUES ('3', '12', '2');

-- ----------------------------
-- Table structure for `blank`
-- ----------------------------
DROP TABLE IF EXISTS `blank`;
CREATE TABLE `blank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `chapter` varchar(11) NOT NULL,
  `chaptertwo` varchar(50) NOT NULL,
  `difficult` int(11) NOT NULL,
  `analysis` longtext,
  `answer` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blank
-- ----------------------------
INSERT INTO `blank` VALUES ('2', '1．	定义  int x=10,y,z;执行y=z=x;x=y==z后,变量x的值为          。', '1', 'qew', '1', 'afeef', '10,25');

-- ----------------------------
-- Table structure for `choicequestion`
-- ----------------------------
DROP TABLE IF EXISTS `choicequestion`;
CREATE TABLE `choicequestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(254) CHARACTER SET utf8 NOT NULL,
  `Aoption` varchar(254) CHARACTER SET utf8 NOT NULL,
  `Boption` varchar(254) CHARACTER SET utf8 NOT NULL,
  `Coption` varchar(254) CHARACTER SET utf8 NOT NULL,
  `Doption` varchar(254) CHARACTER SET utf8 NOT NULL,
  `answer` varchar(254) CHARACTER SET utf8 NOT NULL,
  `analysis` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `chapter` varchar(20) CHARACTER SET utf8 NOT NULL,
  `chaptertwo` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `difficulty` varchar(11) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of choicequestion
-- ----------------------------
INSERT INTO `choicequestion` VALUES ('1', '一个C语言程序总是从_____\r\n开始执行。', '主过程', '主函数', '子程序', '主程序', 'A', '~!@#$%^&*', '4', '循环结构', '热血青铜');
INSERT INTO `choicequestion` VALUES ('2', '设有说明：char w; int x; float y; double z;则表达式w*x+z-y值的数据类型为___', 'float', 'char', 'int', 'double', 'A', 'double', '2', '常量', '热血青铜');
INSERT INTO `choicequestion` VALUES ('3', '题目', 'A', 'B', 'C', 'D', 'A', '~!@#$%^&*', '11', 'qwe', '超级王牌');
INSERT INTO `choicequestion` VALUES ('4', '这是一个测试：\r\n你说呢？', 'A', 'B', 'C', 'D', 'C', '我就试试', '2', 'C程序常见符号分类', '超级王牌');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `cname` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `maid` int(11) DEFAULT NULL,
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  KEY `fk_maid` (`maid`),
  CONSTRAINT `fk_maid` FOREIGN KEY (`maid`) REFERENCES `major` (`maid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1601312', '1', '1');
INSERT INTO `class` VALUES ('1601311', '2', '2');
INSERT INTO `class` VALUES ('1601313', '3', '3');

-- ----------------------------
-- Table structure for `exam_info`
-- ----------------------------
DROP TABLE IF EXISTS `exam_info`;
CREATE TABLE `exam_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examname` varchar(100) NOT NULL,
  `exnumber` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_info
-- ----------------------------
INSERT INTO `exam_info` VALUES ('1', '测试', '5', '20');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `maid` int(11) NOT NULL AUTO_INCREMENT,
  `maname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `seid` int(11) DEFAULT NULL,
  PRIMARY KEY (`maid`),
  KEY `fk_seid` (`seid`),
  KEY `maid` (`maid`),
  CONSTRAINT `fk_seid` FOREIGN KEY (`seid`) REFERENCES `semester` (`seid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '软件工程', '1');
INSERT INTO `major` VALUES ('2', '计算机科学与技术', '2');
INSERT INTO `major` VALUES ('3', '大数据', '3');
INSERT INTO `major` VALUES ('4', '软件工程', '3');

-- ----------------------------
-- Table structure for `point1`
-- ----------------------------
DROP TABLE IF EXISTS `point1`;
CREATE TABLE `point1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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
INSERT INTO `point1` VALUES ('11', 'qwe');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of point2
-- ----------------------------
INSERT INTO `point2` VALUES ('1', '计算机与人', '1');
INSERT INTO `point2` VALUES ('2', '计算机与程序设计语言', '1');
INSERT INTO `point2` VALUES ('3', '程序设计语言的故事', '1');
INSERT INTO `point2` VALUES ('4', 'C语言的故事', '1');
INSERT INTO `point2` VALUES ('5', '程序设计语言的工作原理', '1');
INSERT INTO `point2` VALUES ('6', '一个简单的C程序列子', '2');
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
INSERT INTO `point2` VALUES ('55', 'qwe', '11');

-- ----------------------------
-- Table structure for `program_blank`
-- ----------------------------
DROP TABLE IF EXISTS `program_blank`;
CREATE TABLE `program_blank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `analysis` longtext,
  `chapter` varchar(10) DEFAULT NULL,
  `chaptertwo` varchar(100) DEFAULT NULL,
  `difficult` int(11) DEFAULT NULL,
  `answer` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of program_blank
-- ----------------------------
INSERT INTO `program_blank` VALUES ('1', '    (1)  \r\n  main()\r\n  {\r\n      (2)  ;\r\n    printf(\"Please enter 3 reals:\\n\");\r\n    scanf(\"%f%f%f\",&a,&b,&c);\r\n    if(  (3)  )\r\n      { s=(a+b+c)*0.5;\r\n        s1=s*(s-a)*(s-b)*(s-c);\r\n        s=  (4)  ;\r\n        printf(\"\\nArea of the triangle is %f\\n\",s);\r\n       }\r\n______\r\n     printf(\"It is not triangle!\\n\");\r\n  }\r\n', '嗯，就是这样', '1', '输出', '2', '#include<stdio>');

-- ----------------------------
-- Table structure for `readprogram`
-- ----------------------------
DROP TABLE IF EXISTS `readprogram`;
CREATE TABLE `readprogram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `answer` varchar(255) DEFAULT NULL,
  `analysis` varchar(255) DEFAULT NULL,
  `chapter` varchar(255) DEFAULT NULL,
  `chaptertwo` varchar(255) DEFAULT NULL,
  `difficulty` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of readprogram
-- ----------------------------
INSERT INTO `readprogram` VALUES ('3', '#include<stdio.h>\r\nint main()\r\n{        \r\nint a,b;\r\n        while(~scanf(\"%d%d\",&a,&b))\r\n        {\r\n                printf(\"%d\\n\",a+b);\r\n}', '*\r\n* *\r\n* &nbsp;*\r\n******', 'qew', '1', 'eqr', '1');

-- ----------------------------
-- Table structure for `semester`
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `sename` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`seid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES ('1', '16级');
INSERT INTO `semester` VALUES ('2', '17级');
INSERT INTO `semester` VALUES ('3', '18级');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(10) NOT NULL,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(16) NOT NULL,
  `classname` varchar(20) NOT NULL,
  `num` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'root', 'root', '160', '312');

-- ----------------------------
-- Table structure for `stu_score`
-- ----------------------------
DROP TABLE IF EXISTS `stu_score`;
CREATE TABLE `stu_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examname` varchar(50) NOT NULL,
  `allscore` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_score
-- ----------------------------
INSERT INTO `stu_score` VALUES ('2', '测试', '40');
INSERT INTO `stu_score` VALUES ('3', '测试', '20');
INSERT INTO `stu_score` VALUES ('4', '测试', '20');
INSERT INTO `stu_score` VALUES ('5', '测试', '20');
INSERT INTO `stu_score` VALUES ('6', '测试', '0');
INSERT INTO `stu_score` VALUES ('7', '测试', '0');
INSERT INTO `stu_score` VALUES ('8', '测试', '0');
INSERT INTO `stu_score` VALUES ('9', '测试', '80');
INSERT INTO `stu_score` VALUES ('10', '测试', '80');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('2', '逗瓜', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('3', '愤青', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('5', '小白', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('6', '菜鸡', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES ('7', '罗鸣', '1884681325', '啦啦啦', 'student');
INSERT INTO `tb_customer` VALUES ('8', '', '', '', '');
INSERT INTO `tb_customer` VALUES ('9', null, null, null, null);
INSERT INTO `tb_customer` VALUES ('10', null, null, null, null);
INSERT INTO `tb_customer` VALUES ('11', null, null, '', null);

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'admin');
INSERT INTO `tb_user` VALUES ('2', 'a', 'a');
INSERT INTO `tb_user` VALUES ('3', 'root', 'root');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'root', 'root');
INSERT INTO `teacher` VALUES ('2', '方海诺', '123456');
INSERT INTO `teacher` VALUES ('4', 'dds', 'ds');
INSERT INTO `teacher` VALUES ('5', 'a', 'a');
