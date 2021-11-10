/*
 Navicat Premium Data Transfer

 Source Server         : mysql3307
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3307
 Source Schema         : asm

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 10/11/2021 18:37:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Điện thoại');
INSERT INTO `category` VALUES (2, 'Máy tính');
INSERT INTO `category` VALUES (3, 'Laptop');
INSERT INTO `category` VALUES (4, 'Phụ kiện');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `categoryId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_id`(`categoryId`) USING BTREE,
  CONSTRAINT `FK6i3ku5n5njmijfxwv43ktj2ki` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_category_id` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Iphone 12', 900.00, 1000, 1);
INSERT INTO `product` VALUES (2, 'Samsung Galaxy 21', 1000.00, 1000, 1);
INSERT INTO `product` VALUES (3, 'Samsung A51', 300.00, 1000, 1);
INSERT INTO `product` VALUES (4, 'Iphone X', 1100.00, 1000, 1);
INSERT INTO `product` VALUES (5, 'Hp workstation 100', 800.00, 1000, 2);
INSERT INTO `product` VALUES (6, 'Dell workstation', 850.00, 1000, 2);
INSERT INTO `product` VALUES (7, 'Hp pavilion 14', 600.00, 1000, 3);
INSERT INTO `product` VALUES (8, 'Hp pavilion 15', 650.00, 1000, 3);
INSERT INTO `product` VALUES (9, 'Mac M1', 2000.00, 1000, 3);
INSERT INTO `product` VALUES (10, 'Mac pro 2017', 600.00, 1000, 3);
INSERT INTO `product` VALUES (11, 'Tai nghe M1', 50.00, 1000, 4);
INSERT INTO `product` VALUES (12, 'Sạc không dây', 30.00, 1000, 4);
INSERT INTO `product` VALUES (13, 'Chuội không dây A2', 30.00, 1000, 4);
INSERT INTO `product` VALUES (15, 'Iphone 15', 2500.00, 99, 1);

SET FOREIGN_KEY_CHECKS = 1;
