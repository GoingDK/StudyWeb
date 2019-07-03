/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : studyweb

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 27/06/2019 00:23:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `claid` int(10) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` int(10) NOT NULL,
  `cpass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`claid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '上午班', 1, '000000');
INSERT INTO `class` VALUES (2, '下午班', 2, '000000');
INSERT INTO `class` VALUES (3, '晚上12-14', 3, '000000');
INSERT INTO `class` VALUES (4, '下午8-9', 1, '111111');
INSERT INTO `class` VALUES (5, '上午班', 3, '0');

-- ----------------------------
-- Table structure for clastu
-- ----------------------------
DROP TABLE IF EXISTS `clastu`;
CREATE TABLE `clastu`  (
  `csid` int(10) NOT NULL AUTO_INCREMENT,
  `suser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `claid` int(10) NOT NULL,
  PRIMARY KEY (`csid`) USING BTREE,
  INDEX `suser`(`suser`) USING BTREE,
  INDEX `claid`(`claid`) USING BTREE,
  CONSTRAINT `claid` FOREIGN KEY (`claid`) REFERENCES `class` (`claid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suser` FOREIGN KEY (`suser`) REFERENCES `student` (`suser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clastu
-- ----------------------------
INSERT INTO `clastu` VALUES (1, 'gy1234', 1);
INSERT INTO `clastu` VALUES (2, 'gy1234', 2);
INSERT INTO `clastu` VALUES (3, 'gy1234', 3);
INSERT INTO `clastu` VALUES (4, 'gy1234', 4);
INSERT INTO `clastu` VALUES (5, 'qweqwe', 1);
INSERT INTO `clastu` VALUES (6, 'test1', 3);
INSERT INTO `clastu` VALUES (7, 'qwerty', 1);
INSERT INTO `clastu` VALUES (8, 'ASDFGH', 1);
INSERT INTO `clastu` VALUES (9, 'ASDFGH', 4);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cpic` int(10) NOT NULL DEFAULT 0,
  `cintroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `tuser`(`tuser`) USING BTREE,
  CONSTRAINT `tuser` FOREIGN KEY (`tuser`) REFERENCES `teacher` (`tuser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '软件项目管理', 'LXJ', 0, '《软件项目管理》是计算机、软件工程专业的一门核心课程， 其教学目的是通过本课程的学习，使学生系统地掌握软件项目管理的基本概念、方法和原理；');
INSERT INTO `course` VALUES (2, '测试', 'GY1234', 9, '测试测试');
INSERT INTO `course` VALUES (3, '软件测试', 'LXJ', 10, '无');
INSERT INTO `course` VALUES (4, '软件项目管理', 'GY1234', 0, '无');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `wid` int(10) NOT NULL,
  `suser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `suser1`(`suser`) USING BTREE,
  INDEX `wid`(`wid`) USING BTREE,
  CONSTRAINT `wid` FOREIGN KEY (`wid`) REFERENCES `homework` (`wid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (6, 1, 'gy1234', '90acf04c-0655-44fe-96cc-de5ad8c30cad.jpg');
INSERT INTO `file` VALUES (7, 2, 'gy1234', 'a7c91e2c-3a42-42dd-b5c4-e7a6f6a4faa1.jpg');
INSERT INTO `file` VALUES (8, 1, 'qwerty', 'ad6319eb-a553-425f-83f4-5f5e2b37f06f.jpg');
INSERT INTO `file` VALUES (9, 1, 'ASDFGH', 'fe8b9858-ffc6-42f3-b3dd-1a4d6b5f11c8.jpg');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `wid` int(10) NOT NULL AUTO_INCREMENT,
  `stitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deadtime` datetime(0) NOT NULL,
  `claid` int(10) NOT NULL,
  PRIMARY KEY (`wid`) USING BTREE,
  INDEX `claid1`(`claid`) USING BTREE,
  CONSTRAINT `claid1` FOREIGN KEY (`claid`) REFERENCES `class` (`claid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES (1, '作业1', '2019-06-30 23:59:59', 1);
INSERT INTO `homework` VALUES (2, '作业2', '2019-06-30 14:57:53', 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `suser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spsd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sschool` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`suser`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('ASDFGH', 'ZXCVBN', '212121212@qq.com', NULL, '零零', NULL);
INSERT INTO `student` VALUES ('gy1234', '123123', '871832704@qq.com', '中山大学南方学院', '郭莹', 162011089);
INSERT INTO `student` VALUES ('qweqwe', '123123', '2222@qq.com', NULL, '全球', NULL);
INSERT INTO `student` VALUES ('qwerty', 'zxcvbn', '81818118@qq.com', NULL, '城市', NULL);
INSERT INTO `student` VALUES ('test1', '123123', '123123', '123123', 'test1', 123123);
INSERT INTO `student` VALUES ('test2', '123123', '123123', '123123', 'tset2', 123123);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpsd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tmailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tschool` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`tuser`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('GY1234', '123123', '871832704@qq.com', '中山大学南方学院', '郭莹', 666666);
INSERT INTO `teacher` VALUES ('LXJ', '123123', 'SSS', 'SSS', '吕老师', 123123);

SET FOREIGN_KEY_CHECKS = 1;
