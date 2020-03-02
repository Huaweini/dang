/*
Navicat MySQL Data Transfer

Source Server         : project
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : dang

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2020-03-02 15:57:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '党建类别文章标题', '党建类别分别是：类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，类别1，', '1', '0');
INSERT INTO `t_article` VALUES ('2', '党建要闻文章标题', '今天是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是：是2020年几月几号，党建要闻是', '2', '0');
INSERT INTO `t_article` VALUES ('3', '党史人物文章标题', '我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物主要有：我党的党史人物', '3', '0');
INSERT INTO `t_article` VALUES ('4', '党史日记文章标题', '党史日记：今天是1900年几月几号，我党正式成立党史日记：今天是1900年几月几号，我党正式成立今天是1900年几月几号，我党正式成立今天是1900年几月几号，我党正式成立今天是1900年几月几号，我党正式成立今天是1900年几月几号，我党正式成立今天是1900年几月几号，我党正式成立今天是1900年几月几号，我党正式成立今天是1900年几月几号，我党正式成立', '4', '0');
INSERT INTO `t_article` VALUES ('5', '理论解读文章标题', '读者朋友们大家好，这次我们要解读的是著名作家的《啦啦啦》，这次我们要解读的是著名作家的《啦啦啦》，这次我们要解读的是著名作家的《啦啦啦》，这次我们要解读的是著名作家的《啦啦啦》，这次我们要解读的是著名作家的《啦啦啦》，这次我们要解读的是著名作家的《啦啦啦》', '5', '0');
INSERT INTO `t_article` VALUES ('6', '学习文选文章标题', '今天我们要学习的文选是鲁迅先生的《这些话一句都是我说的》，鲁迅先生的《这些话一句都是我说的》，鲁迅先生的《这些话一句都是我说的》，鲁迅先生的《这些话一句都是我说的》，鲁迅先生的《这些话一句都是我说的》，鲁迅先生的《这些话一句都是我说的》，鲁迅先生的《这些话一句都是我说的》', '6', '0');
INSERT INTO `t_article` VALUES ('7', '反腐事件文章标题', '北京时间5月几号上午9点，谁谁谁落网，为XXX事件画上了完美的句号谁谁谁落网，为XXX事件画上了完美的句号谁谁谁落网，为XXX事件画上了完美的句号谁谁谁落网，为XXX事件画上了完美的句号谁谁谁落网，为XXX事件画上了完美的句号', '7', '0');
INSERT INTO `t_article` VALUES ('8', '党代会议信息文章标题', '伟大的某某某于2020年几月几号在某某地举办了党代会，伟大的某某某于2020年几月几号在某某地举办了党代会，伟大的某某某于2020年几月几号在某某地举办了党代会，伟大的某某某于2020年几月几号在某某地举办了党代会，伟大的某某某于2020年几月几号在某某地举办了党代会，伟大的某某某于2020年几月几号在某某地举办了党代会，伟大的某某某于2020年几月几号在某某地举办了党代会，伟大的某某某于2020年几月几号在某某地举办了党代会', '8', '0');
INSERT INTO `t_article` VALUES ('9', '琴院活动文章标题', '几月几号我院隆重举行了春季运动会，各代表团发挥出色，为我院争得了2金1银的优异成绩为我院争得了2金1银的优异成绩各代表团发挥出色，为我院争得了2金1银的优异成绩为我院争得了2金1银的优异成绩各代表团发挥出色，为我院争得了2金1银的优异成绩为我院争得了2金1银的优异成绩', '9', '0');
INSERT INTO `t_article` VALUES ('10', '琴院组织文章标题', '我校学生会组织与几月几号正式调整，学生部部长为：某某某，纪检部部长为：某某某学生部部长为：某某某，纪检部部长为：某某某学生部部长为：某某某，纪检部部长为：某某某学生部部长为：某某某，纪检部部长为：某某某学生部部长为：某某某，纪检部部长为：某某某', '10', '0');

-- ----------------------------
-- Table structure for t_parent_article
-- ----------------------------
DROP TABLE IF EXISTS `t_parent_article`;
CREATE TABLE `t_parent_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0' COMMENT '0-未删除，1-已删除',
  `english_name` varchar(255) DEFAULT NULL COMMENT '跳转链接时使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_parent_article
-- ----------------------------
INSERT INTO `t_parent_article` VALUES ('1', '党建类别', '0', 'dangJianLeiBie');
INSERT INTO `t_parent_article` VALUES ('2', '党建要闻', '0', 'dangJianYaoWen');
INSERT INTO `t_parent_article` VALUES ('3', '党史人物', '0', 'dangShiRenWu');
INSERT INTO `t_parent_article` VALUES ('4', '党史日记', '0', 'dangShiRiJi');
INSERT INTO `t_parent_article` VALUES ('5', '理论解读', '0', 'liLunJieDu');
INSERT INTO `t_parent_article` VALUES ('6', '学习文选', '0', 'xueXiWenXuan');
INSERT INTO `t_parent_article` VALUES ('7', '反腐事件', '0', 'fanFuShiJian');
INSERT INTO `t_parent_article` VALUES ('8', '党代会议信息', '0', 'dangDaiHuiYiXinXi');
INSERT INTO `t_parent_article` VALUES ('9', '琴院活动信息', '0', 'qinYuanHuoDongXinXi');
INSERT INTO `t_parent_article` VALUES ('10', '琴院组织信息', '0', 'qinYuanZuZhiXinXi');
