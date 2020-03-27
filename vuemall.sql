/*
Navicat MySQL Data Transfer

Source Server         : company
Source Server Version : 50553
Source Host           : 192.168.42.1:3306
Source Database       : vuemall

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-03-27 13:55:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'gao', 'admin');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `goodsId` bigint(20) NOT NULL,
  `goodsDetailId` bigint(20) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '2', '2', '26', '55555', '80', '2020-03-26');
INSERT INTO `comments` VALUES ('2', '1', '2', '2', '25', '564566', '80', '2020-03-26');
INSERT INTO `comments` VALUES ('3', '1', '2', '2', '25', '555', '100', '2020-03-26');
INSERT INTO `comments` VALUES ('4', '1', '1', '1', '29', '666', '80', '2020-03-26');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `typeId` bigint(20) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `desc` text,
  `createtime` date NOT NULL,
  `updatetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'EB001积木', '1', 'http://www.muwan.com/uploads/180309/1-1P309115209619.jpg', '木玩商城产品', '2020-03-24', '2020-03-24');
INSERT INTO `goods` VALUES ('2', '恐龙学习架', '1', 'http://www.muwan.com/uploads/180309/1-1P30915545Q14.jpg', '恐龙算珠翻板架，数学字母木制玩具。', '2020-03-25', '2020-03-25');
INSERT INTO `goods` VALUES ('3', '漫威铁盒拼图', '1', 'http://www.muwan.com/uploads/200114/1-200114153955416.jpg', '漫威超级英雄拼图', '2020-03-26', '2020-03-26');
INSERT INTO `goods` VALUES ('4', '早餐切切看', '1', 'http://www.muwan.com/uploads/180302/1-1P3021R23O56.jpg', '早切切看', '2020-03-27', '2020-03-27');
INSERT INTO `goods` VALUES ('5', '恐龙拼装玩具', '2', 'http://www.muwan.com/uploads/180302/1-1P3021S054233.jpg', '锻炼动手能力，儿童拼装玩具。', '2020-03-28', '2020-03-28');
INSERT INTO `goods` VALUES ('6', '怪怪小镇', '3', 'http://www.muwan.com/uploads/180302/1-1P302164JR44.jpg', '怪怪积木，儿童木制玩具。', '2020-03-29', '2020-03-29');

-- ----------------------------
-- Table structure for `goodsdetails`
-- ----------------------------
DROP TABLE IF EXISTS `goodsdetails`;
CREATE TABLE `goodsdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsId` bigint(20) NOT NULL,
  `specName` varchar(500) NOT NULL,
  `stockNum` int(11) NOT NULL,
  `unitPrice` float NOT NULL,
  `createtime` date NOT NULL,
  `updatetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsdetails
-- ----------------------------
INSERT INTO `goodsdetails` VALUES ('1', '1', '哈哈哈哈', '3', '15', '2020-03-25', '2020-03-26');
INSERT INTO `goodsdetails` VALUES ('2', '2', '恐龙算珠翻板架，数学字母木制玩具。', '34', '10', '2020-03-25', '2020-03-25');
INSERT INTO `goodsdetails` VALUES ('3', '3', '漫威拼图', '7', '100', '2020-03-25', '2020-03-25');
INSERT INTO `goodsdetails` VALUES ('4', '4', '成婚后', '17', '50', '2020-03-25', '2020-03-25');
INSERT INTO `goodsdetails` VALUES ('5', '5', '哈哈', '13', '51', '2020-03-25', '2020-03-25');
INSERT INTO `goodsdetails` VALUES ('6', '6', '哈哈', '3', '30', '2020-03-25', '2020-03-25');

-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `goodsId` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `state` enum('1','0') NOT NULL DEFAULT '0',
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('5', '1', '1', 'sdsd', '0', '0000-00-00');
INSERT INTO `messages` VALUES ('6', '1', '1', '你有病吧', '0', '2020-03-26');
INSERT INTO `messages` VALUES ('7', '1', '2', '你们这产品', '', '2020-03-26');
INSERT INTO `messages` VALUES ('8', '1', '2', 'hape是吧', '', '2020-03-26');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `goodsDetailId` bigint(20) NOT NULL,
  `goodsNum` int(11) NOT NULL,
  `amount` float NOT NULL,
  `state` enum('3','2','1','0') NOT NULL DEFAULT '0',
  `createtime` date NOT NULL,
  `updatetime` date DEFAULT NULL,
  PRIMARY KEY (`id`,`amount`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('38', '1', '6', '1', '30', '3', '2020-03-26', '2020-03-26');
INSERT INTO `orders` VALUES ('39', '1', '4', '2', '100', '0', '2020-03-26', '2020-03-26');
INSERT INTO `orders` VALUES ('40', '1', '6', '1', '30', '0', '2020-03-26', '2020-03-26');

-- ----------------------------
-- Table structure for `replies`
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `messageId` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replies
-- ----------------------------

-- ----------------------------
-- Table structure for `types`
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES ('1', '木玩');
INSERT INTO `types` VALUES ('2', '爱木');
INSERT INTO `types` VALUES ('3', '费雪');
INSERT INTO `types` VALUES ('4', '木木部落');
INSERT INTO `types` VALUES ('5', '管乐');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `sex` enum('2','1','0') DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '3499606002@qq.com', '$2a$10$WewI/7bnay2t7MNU7I6lBOtMOvk0khmep.PVj85JK3BCwkpIuXvnK', 'gaodashuai', '', '高耀智', '浙江兰溪', '17858902112', 'http://tvax4.sinaimg.cn/crop.0.0.480.480.180/768c39d5ly8fjje1d0teej20dc0dcq35.jpg', '2020-03-25 13:17:49', '2020-03-25 13:17:49');
