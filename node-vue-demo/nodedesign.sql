/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : nodedesign

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 02/07/2021 17:11:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for persons
-- ----------------------------
DROP TABLE IF EXISTS `persons`;
CREATE TABLE `persons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persons
-- ----------------------------
INSERT INTO `persons` VALUES (11, '陈奕耿', '男', '2000-4-29', '17827100179', '广东省汕尾市');
INSERT INTO `persons` VALUES (12, '黄史培', '男', '2000-4-26', '1578889961', '广东省佛山市');
INSERT INTO `persons` VALUES (13, '曾泽楷', '男', '1999-6-28', '13543139985', '浙江省杭州市');
INSERT INTO `persons` VALUES (14, '刘文卓', '男', '2000-9-29', '15820317818', '广东省广州市');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, '', 'C:\\Users\\15225\\AppData\\Local\\Temp\\3ffe788014e884e53624cdf921a559f9');
INSERT INTO `picture` VALUES (2, '', 'C:\\Users\\15225\\AppData\\Local\\Temp\\ecb8d0874d3ca74438396d3b7745fc99');
INSERT INTO `picture` VALUES (3, '', 'C:\\Users\\15225\\AppData\\Local\\Temp\\b24b3ee70277941589525565f8b6a93b');
INSERT INTO `picture` VALUES (8, '', 'C:\\Users\\15225\\AppData\\Local\\Temp\\9fb0240d636cadf405f3f29883be161c');
INSERT INTO `picture` VALUES (9, '3333', 'C:\\Users\\15225\\AppData\\Local\\Temp\\2daf2fee252a28cf1383637979e132f8');
INSERT INTO `picture` VALUES (10, '123', 'C:\\Users\\15225\\AppData\\Local\\Temp\\87563000a4f3c16c372d675e72c923bd');
INSERT INTO `picture` VALUES (11, '1111', 'C:\\Users\\15225\\AppData\\Local\\Temp\\4edb2e578ea470dbb4aceff0663aa1c3');
INSERT INTO `picture` VALUES (12, '测试333', 'C:\\Users\\15225\\AppData\\Local\\Temp\\51631880642f812f99485722e26be7ec');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '123', '123');

SET FOREIGN_KEY_CHECKS = 1;
