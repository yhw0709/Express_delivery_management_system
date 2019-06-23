/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : EDMS

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 24/05/2019 12:57:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add goods info', 7, 'add_goodsinfo');
INSERT INTO `auth_permission` VALUES (20, 'Can change goods info', 7, 'change_goodsinfo');
INSERT INTO `auth_permission` VALUES (21, 'Can delete goods info', 7, 'delete_goodsinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can add order info', 8, 'add_orderinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can change order info', 8, 'change_orderinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can delete order info', 8, 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add signer address', 9, 'add_signeraddress');
INSERT INTO `auth_permission` VALUES (26, 'Can change signer address', 9, 'change_signeraddress');
INSERT INTO `auth_permission` VALUES (27, 'Can delete signer address', 9, 'delete_signeraddress');
INSERT INTO `auth_permission` VALUES (28, 'Can add user', 10, 'add_user');
INSERT INTO `auth_permission` VALUES (29, 'Can change user', 10, 'change_user');
INSERT INTO `auth_permission` VALUES (30, 'Can delete user', 10, 'delete_user');
INSERT INTO `auth_permission` VALUES (31, 'Can add user address', 11, 'add_useraddress');
INSERT INTO `auth_permission` VALUES (32, 'Can change user address', 11, 'change_useraddress');
INSERT INTO `auth_permission` VALUES (33, 'Can delete user address', 11, 'delete_useraddress');
INSERT INTO `auth_permission` VALUES (34, 'Can add courier', 12, 'add_courier');
INSERT INTO `auth_permission` VALUES (35, 'Can change courier', 12, 'change_courier');
INSERT INTO `auth_permission` VALUES (36, 'Can delete courier', 12, 'delete_courier');
INSERT INTO `auth_permission` VALUES (37, 'Can add courier reality', 13, 'add_courierreality');
INSERT INTO `auth_permission` VALUES (38, 'Can change courier reality', 13, 'change_courierreality');
INSERT INTO `auth_permission` VALUES (39, 'Can delete courier reality', 13, 'delete_courierreality');
INSERT INTO `auth_permission` VALUES (40, 'Can add ruler', 14, 'add_ruler');
INSERT INTO `auth_permission` VALUES (41, 'Can change ruler', 14, 'change_ruler');
INSERT INTO `auth_permission` VALUES (42, 'Can delete ruler', 14, 'delete_ruler');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for courier
-- ----------------------------
DROP TABLE IF EXISTS `courier`;
CREATE TABLE `courier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `role` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier
-- ----------------------------
BEGIN;
INSERT INTO `courier` VALUES (1, 'courier_1557238760', '456', 'pbkdf2_sha256$36000$2rgsFRYwdXZi$y6lRExmdL/sNuPZsu1XWJUZbbmcb2Kz/7+V8V6EPN6s=', NULL, NULL, '2');
COMMIT;

-- ----------------------------
-- Table structure for courier_reality
-- ----------------------------
DROP TABLE IF EXISTS `courier_reality`;
CREATE TABLE `courier_reality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `id_card` varchar(18) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `courier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_card` (`id_card`),
  KEY `courier_reality_courier_id_bee533a3_fk_courier_id` (`courier_id`),
  CONSTRAINT `courier_reality_courier_id_bee533a3_fk_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (12, 'courier', 'courier');
INSERT INTO `django_content_type` VALUES (13, 'courier', 'courierreality');
INSERT INTO `django_content_type` VALUES (7, 'goods', 'goodsinfo');
INSERT INTO `django_content_type` VALUES (8, 'order', 'orderinfo');
INSERT INTO `django_content_type` VALUES (14, 'ruler', 'ruler');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (9, 'user', 'signeraddress');
INSERT INTO `django_content_type` VALUES (10, 'user', 'user');
INSERT INTO `django_content_type` VALUES (11, 'user', 'useraddress');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-05-06 15:42:17.709962');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-05-06 15:42:17.957354');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-05-06 15:42:18.029603');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-05-06 15:42:18.053253');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2019-05-06 15:42:18.114468');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2019-05-06 15:42:18.142401');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2019-05-06 15:42:18.182382');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2019-05-06 15:42:18.191220');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2019-05-06 15:42:18.219903');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2019-05-06 15:42:18.222596');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2019-05-06 15:42:18.232807');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2019-05-06 15:42:18.271117');
INSERT INTO `django_migrations` VALUES (13, 'courier', '0001_initial', '2019-05-06 15:42:18.326002');
INSERT INTO `django_migrations` VALUES (14, 'user', '0001_initial', '2019-05-06 15:42:18.411130');
INSERT INTO `django_migrations` VALUES (15, 'goods', '0001_initial', '2019-05-06 15:42:18.448737');
INSERT INTO `django_migrations` VALUES (16, 'order', '0001_initial', '2019-05-06 15:42:18.544805');
INSERT INTO `django_migrations` VALUES (17, 'ruler', '0001_initial', '2019-05-06 15:42:18.560167');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-05-06 15:42:18.578993');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('1wae5beb1ootu70f6ralg62hnht60d4a', 'NjRlMDAwNjBiYWZhOTNkYzJiN2E0NjI5ZGE3NDNmZGY3ZjkxODVhNzp7InVzZXJfaWQiOiJ1c2VyXzE1NTYwMjU3NjQifQ==', '2019-05-23 12:57:41.977787');
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(20) NOT NULL,
  `goods_weight` varchar(10) DEFAULT NULL,
  `goods_volume` varchar(10) DEFAULT NULL,
  `goods_value` varchar(3) DEFAULT NULL,
  `goods_fast` varchar(3) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_user_id_02d98379_fk_user_id` (`user_id`),
  CONSTRAINT `goods_user_id_02d98379_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (2, '155602471', '9', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (3, '155602472', '2', '7', '', '', 2);
INSERT INTO `goods` VALUES (5, '155602474', '9', '4', '', 'on', 3);
INSERT INTO `goods` VALUES (6, '155602475', '4', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (8, '155602477', '10', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (9, '155602478', '2', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (10, '155602479', '1', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (11, '1556024710', '6', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (12, '1556024711', '9', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (13, '1556024712', '2', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (14, '1556024713', '4', '4', '', '', 3);
INSERT INTO `goods` VALUES (16, '1556024715', '3', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (17, '1556024716', '7', '3', 'on', 'on', 3);
INSERT INTO `goods` VALUES (20, '1556024719', '4', '6', '', 'on', 3);
INSERT INTO `goods` VALUES (21, '155602470', '4', '3', '', 'on', 2);
INSERT INTO `goods` VALUES (22, '155602471', '7', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (24, '155602473', '3', '6', '', '', 3);
INSERT INTO `goods` VALUES (25, '155602474', '4', '6', '', '', 3);
INSERT INTO `goods` VALUES (27, '155602476', '8', '5', 'on', '', 2);
INSERT INTO `goods` VALUES (30, '155602479', '2', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (31, '1556024710', '4', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (32, '1556024711', '9', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (33, '1556024712', '1', '7', '', 'on', 2);
INSERT INTO `goods` VALUES (34, '1556024713', '6', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (35, '1556024714', '9', '7', '', 'on', 2);
INSERT INTO `goods` VALUES (37, '1556024716', '7', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (39, '1556024718', '9', '6', '', 'on', 3);
INSERT INTO `goods` VALUES (41, '1556024720', '5', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (42, '1556024721', '8', '6', '', 'on', 3);
INSERT INTO `goods` VALUES (43, '1556024722', '8', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (44, '1556024723', '5', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (45, '1556024724', '1', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (47, '1556024726', '1', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (48, '1556024727', '2', '3', '', '', 2);
INSERT INTO `goods` VALUES (50, '1556024729', '8', '3', '', '', 3);
INSERT INTO `goods` VALUES (56, '1556024735', '7', '7', '', '', 3);
INSERT INTO `goods` VALUES (57, '1556024736', '7', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (58, '1556024737', '4', '3', 'on', '', 2);
INSERT INTO `goods` VALUES (59, '1556024738', '7', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (60, '1556024739', '3', '7', '', '', 2);
INSERT INTO `goods` VALUES (61, '1556024740', '7', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (62, '1556024741', '7', '6', '', '', 2);
INSERT INTO `goods` VALUES (63, '1556024742', '7', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (68, '1556024747', '4', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (74, '1556024753', '7', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (76, '1556024755', '10', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (77, '1556024756', '5', '3', 'on', 'on', 3);
INSERT INTO `goods` VALUES (78, '1556024757', '3', '3', 'on', 'on', 3);
INSERT INTO `goods` VALUES (79, '1556024758', '4', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (82, '1556024761', '2', '3', 'on', 'on', 3);
INSERT INTO `goods` VALUES (83, '1556024762', '9', '5', 'on', '', 3);
INSERT INTO `goods` VALUES (84, '1556024763', '1', '5', '', 'on', 3);
INSERT INTO `goods` VALUES (85, '1556024764', '8', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (87, '1556024766', '4', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (88, '1556024767', '9', '5', 'on', '', 2);
INSERT INTO `goods` VALUES (89, '1556024768', '9', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (90, '1556024769', '9', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (91, '1556024770', '6', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (92, '1556024771', '2', '4', '', '', 2);
INSERT INTO `goods` VALUES (93, '1556024772', '3', '7', '', 'on', 2);
INSERT INTO `goods` VALUES (94, '1556024773', '1', '3', '', '', 3);
INSERT INTO `goods` VALUES (95, '1556024774', '8', '6', '', '', 3);
INSERT INTO `goods` VALUES (96, '1556024775', '5', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (97, '1556024776', '6', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (98, '1556024777', '2', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (100, '1556024779', '10', '5', 'on', 'on', 3);
INSERT INTO `goods` VALUES (102, '1556024781', '10', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (104, '1556024783', '1', '3', '', 'on', 3);
INSERT INTO `goods` VALUES (105, '1556024784', '5', '7', 'on', 'on', 3);
INSERT INTO `goods` VALUES (106, '1556024785', '7', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (107, '1556024786', '6', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (108, '1556024787', '1', '6', '', '', 2);
INSERT INTO `goods` VALUES (109, '1556024788', '3', '3', '', '', 3);
INSERT INTO `goods` VALUES (110, '1556024789', '4', '7', '', 'on', 2);
INSERT INTO `goods` VALUES (114, '1556024793', '8', '5', 'on', '', 2);
INSERT INTO `goods` VALUES (116, '1556024795', '3', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (117, '1556024796', '3', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (118, '1556024797', '8', '7', '', '', 3);
INSERT INTO `goods` VALUES (121, '15560247100', '8', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (122, '15560247101', '8', '7', '', '', 3);
INSERT INTO `goods` VALUES (123, '15560247102', '3', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (124, '15560247103', '1', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (128, '15560247107', '9', '3', '', 'on', 2);
INSERT INTO `goods` VALUES (130, '15560247109', '5', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (132, '15560247111', '10', '3', '', '', 3);
INSERT INTO `goods` VALUES (134, '15560247113', '8', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (135, '15560247114', '9', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (136, '15560247115', '8', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (137, '15560247116', '1', '3', 'on', 'on', 3);
INSERT INTO `goods` VALUES (138, '15560247117', '7', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (139, '15560247118', '7', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (140, '15560247119', '3', '3', '', '', 3);
INSERT INTO `goods` VALUES (141, '15560247120', '2', '5', '', 'on', 3);
INSERT INTO `goods` VALUES (142, '15560247121', '9', '4', '', 'on', 3);
INSERT INTO `goods` VALUES (143, '15560247122', '10', '4', '', 'on', 3);
INSERT INTO `goods` VALUES (144, '15560247123', '8', '6', '', '', 3);
INSERT INTO `goods` VALUES (145, '15560247124', '2', '4', '', 'on', 3);
INSERT INTO `goods` VALUES (146, '15560247125', '3', '3', '', '', 3);
INSERT INTO `goods` VALUES (147, '15560247126', '7', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (148, '15560247127', '3', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (149, '15560247128', '10', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (150, '15560247129', '5', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (151, '15560247130', '4', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (152, '15560247131', '7', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (153, '15560247132', '5', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (154, '15560247133', '6', '6', '', 'on', 3);
INSERT INTO `goods` VALUES (155, '15560247134', '4', '3', '', '', 3);
INSERT INTO `goods` VALUES (157, '15560247136', '6', '7', '', '', 3);
INSERT INTO `goods` VALUES (158, '15560247137', '3', '5', '', 'on', 3);
INSERT INTO `goods` VALUES (160, '15560247139', '10', '6', '', 'on', 3);
INSERT INTO `goods` VALUES (161, '15560247140', '10', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (162, '15560247141', '10', '5', 'on', '', 2);
INSERT INTO `goods` VALUES (163, '15560247142', '8', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (164, '15560247143', '8', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (165, '15560247144', '7', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (167, '15560247146', '9', '6', 'on', 'on', 2);
INSERT INTO `goods` VALUES (168, '15560247147', '7', '5', '', '', 3);
INSERT INTO `goods` VALUES (169, '15560247148', '1', '6', '', '', 3);
INSERT INTO `goods` VALUES (170, '15560247149', '6', '3', '', '', 2);
INSERT INTO `goods` VALUES (173, '15560247152', '4', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (174, '15560247153', '1', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (175, '15560247154', '3', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (176, '15560247155', '6', '7', '', '', 2);
INSERT INTO `goods` VALUES (177, '15560247156', '4', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (179, '15560247158', '9', '6', 'on', 'on', 2);
INSERT INTO `goods` VALUES (180, '15560247159', '10', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (181, '15560247160', '7', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (182, '15560247161', '5', '5', '', 'on', 3);
INSERT INTO `goods` VALUES (187, '15560247166', '4', '6', '', '', 2);
INSERT INTO `goods` VALUES (188, '15560247167', '3', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (189, '15560247168', '7', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (190, '15560247169', '10', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (191, '15560247170', '5', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (192, '15560247171', '6', '6', '', '', 3);
INSERT INTO `goods` VALUES (193, '15560247172', '9', '3', '', '', 3);
INSERT INTO `goods` VALUES (194, '15560247173', '8', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (195, '15560247174', '8', '4', '', '', 3);
INSERT INTO `goods` VALUES (196, '15560247175', '1', '7', 'on', 'on', 3);
INSERT INTO `goods` VALUES (197, '15560247176', '6', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (198, '15560247177', '9', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (199, '15560247178', '10', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (200, '15560247179', '4', '5', '', '', 3);
INSERT INTO `goods` VALUES (201, '15560247180', '3', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (202, '15560247181', '2', '6', '', '', 3);
INSERT INTO `goods` VALUES (205, '15560247184', '8', '3', '', 'on', 2);
INSERT INTO `goods` VALUES (206, '15560247185', '3', '5', '', '', 2);
INSERT INTO `goods` VALUES (208, '15560247187', '4', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (210, '15560247189', '1', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (211, '15560247190', '10', '3', '', 'on', 3);
INSERT INTO `goods` VALUES (212, '15560247191', '10', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (213, '15560247192', '3', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (214, '15560247193', '10', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (215, '15560247194', '6', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (216, '15560247195', '7', '7', '', 'on', 2);
INSERT INTO `goods` VALUES (218, '15560247197', '4', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (220, '15560247199', '1', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (222, '155602471', '8', '5', '', '', 3);
INSERT INTO `goods` VALUES (223, '155602472', '9', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (229, '155602478', '8', '3', '', '', 2);
INSERT INTO `goods` VALUES (230, '155602479', '5', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (231, '1556024710', '10', '3', '', '', 2);
INSERT INTO `goods` VALUES (232, '1556024711', '7', '3', '', '', 3);
INSERT INTO `goods` VALUES (233, '1556024712', '3', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (235, '1556024714', '4', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (238, '1556024717', '4', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (240, '1556024719', '4', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (242, '1556024721', '4', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (244, '1556024723', '8', '5', 'on', '', 2);
INSERT INTO `goods` VALUES (245, '1556024724', '10', '3', '', '', 3);
INSERT INTO `goods` VALUES (246, '1556024725', '7', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (248, '1556024727', '9', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (251, '1556024730', '3', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (252, '1556024731', '7', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (253, '1556024732', '6', '7', 'on', 'on', 3);
INSERT INTO `goods` VALUES (254, '1556024733', '2', '3', '', 'on', 3);
INSERT INTO `goods` VALUES (255, '1556024734', '10', '3', 'on', 'on', 3);
INSERT INTO `goods` VALUES (257, '1556024736', '9', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (261, '1556024740', '7', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (263, '1556024742', '2', '3', '', 'on', 2);
INSERT INTO `goods` VALUES (265, '1556024744', '4', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (269, '1556024748', '8', '7', '', 'on', 2);
INSERT INTO `goods` VALUES (270, '1556024749', '4', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (272, '1556024751', '6', '6', '', '', 2);
INSERT INTO `goods` VALUES (273, '1556024752', '4', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (276, '1556024755', '9', '5', 'on', '', 3);
INSERT INTO `goods` VALUES (277, '1556024756', '10', '6', 'on', 'on', 2);
INSERT INTO `goods` VALUES (279, '1556024758', '10', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (280, '1556024759', '4', '4', '', 'on', 3);
INSERT INTO `goods` VALUES (281, '1556024760', '9', '5', 'on', '', 3);
INSERT INTO `goods` VALUES (282, '1556024761', '5', '3', '', 'on', 3);
INSERT INTO `goods` VALUES (287, '1556024766', '10', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (288, '1556024767', '2', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (289, '1556024768', '4', '3', 'on', '', 2);
INSERT INTO `goods` VALUES (291, '1556024770', '2', '3', 'on', '', 2);
INSERT INTO `goods` VALUES (293, '1556024772', '1', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (294, '1556024773', '2', '7', '', '', 2);
INSERT INTO `goods` VALUES (295, '1556024774', '6', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (296, '1556024775', '9', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (297, '1556024776', '5', '5', '', '', 3);
INSERT INTO `goods` VALUES (298, '1556024777', '10', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (300, '1556024779', '10', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (301, '1556024780', '8', '3', '', '', 2);
INSERT INTO `goods` VALUES (302, '1556024781', '2', '3', 'on', '', 2);
INSERT INTO `goods` VALUES (303, '1556024782', '6', '4', '', '', 2);
INSERT INTO `goods` VALUES (305, '1556024784', '7', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (307, '1556024786', '2', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (309, '1556024788', '2', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (310, '1556024789', '9', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (311, '1556024790', '8', '6', 'on', 'on', 2);
INSERT INTO `goods` VALUES (312, '1556024791', '9', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (313, '1556024792', '9', '3', '', '', 2);
INSERT INTO `goods` VALUES (314, '1556024793', '8', '5', '', 'on', 3);
INSERT INTO `goods` VALUES (316, '1556024795', '3', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (317, '1556024796', '1', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (318, '1556024797', '6', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (321, '15560247100', '7', '6', '', '', 2);
INSERT INTO `goods` VALUES (324, '15560247103', '2', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (325, '15560247104', '10', '3', '', '', 3);
INSERT INTO `goods` VALUES (326, '15560247105', '4', '4', '', '', 3);
INSERT INTO `goods` VALUES (328, '15560247107', '4', '5', 'on', 'on', 3);
INSERT INTO `goods` VALUES (329, '15560247108', '7', '7', 'on', '', 3);
INSERT INTO `goods` VALUES (330, '15560247109', '4', '3', 'on', '', 3);
INSERT INTO `goods` VALUES (332, '15560247111', '10', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (334, '15560247113', '4', '6', '', '', 2);
INSERT INTO `goods` VALUES (335, '15560247114', '3', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (336, '15560247115', '10', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (337, '15560247116', '3', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (338, '15560247117', '9', '6', '', '', 2);
INSERT INTO `goods` VALUES (340, '15560247119', '7', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (343, '15560247122', '8', '3', '', 'on', 3);
INSERT INTO `goods` VALUES (345, '15560247124', '1', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (346, '15560247125', '8', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (348, '15560247127', '5', '6', 'on', 'on', 2);
INSERT INTO `goods` VALUES (349, '15560247128', '9', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (350, '15560247129', '3', '4', '', '', 2);
INSERT INTO `goods` VALUES (351, '15560247130', '2', '3', 'on', '', 2);
INSERT INTO `goods` VALUES (352, '15560247131', '8', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (353, '15560247132', '3', '5', 'on', '', 3);
INSERT INTO `goods` VALUES (356, '15560247135', '5', '7', '', 'on', 2);
INSERT INTO `goods` VALUES (360, '15560247139', '5', '6', 'on', 'on', 2);
INSERT INTO `goods` VALUES (362, '15560247141', '8', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (363, '15560247142', '2', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (364, '15560247143', '1', '6', 'on', 'on', 2);
INSERT INTO `goods` VALUES (365, '15560247144', '2', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (367, '15560247146', '1', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (368, '15560247147', '4', '6', 'on', '', 2);
INSERT INTO `goods` VALUES (372, '15560247151', '5', '6', 'on', '', 3);
INSERT INTO `goods` VALUES (373, '15560247152', '3', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (374, '15560247153', '6', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (375, '15560247154', '7', '4', '', '', 3);
INSERT INTO `goods` VALUES (376, '15560247155', '1', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (378, '15560247157', '7', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (379, '15560247158', '4', '3', '', '', 2);
INSERT INTO `goods` VALUES (382, '15560247161', '8', '3', '', 'on', 2);
INSERT INTO `goods` VALUES (383, '15560247162', '5', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (384, '15560247163', '3', '4', 'on', 'on', 2);
INSERT INTO `goods` VALUES (387, '15560247166', '9', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (388, '15560247167', '10', '3', 'on', 'on', 2);
INSERT INTO `goods` VALUES (389, '15560247168', '7', '5', '', 'on', 3);
INSERT INTO `goods` VALUES (390, '15560247169', '8', '5', 'on', '', 2);
INSERT INTO `goods` VALUES (391, '15560247170', '8', '7', 'on', '', 2);
INSERT INTO `goods` VALUES (392, '15560247171', '5', '7', '', 'on', 3);
INSERT INTO `goods` VALUES (394, '15560247173', '7', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (395, '15560247174', '3', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (398, '15560247177', '9', '4', 'on', '', 2);
INSERT INTO `goods` VALUES (399, '15560247178', '7', '5', 'on', 'on', 2);
INSERT INTO `goods` VALUES (400, '15560247179', '8', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (401, '15560247180', '6', '4', 'on', '', 3);
INSERT INTO `goods` VALUES (402, '15560247181', '6', '7', 'on', 'on', 2);
INSERT INTO `goods` VALUES (403, '15560247182', '10', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (405, '15560247184', '9', '4', '', 'on', 3);
INSERT INTO `goods` VALUES (407, '15560247186', '9', '5', '', 'on', 2);
INSERT INTO `goods` VALUES (408, '15560247187', '8', '6', '', '', 3);
INSERT INTO `goods` VALUES (412, '15560247191', '3', '6', '', 'on', 2);
INSERT INTO `goods` VALUES (413, '15560247192', '3', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (416, '15560247195', '10', '4', '', 'on', 2);
INSERT INTO `goods` VALUES (417, '15560247196', '10', '6', 'on', 'on', 3);
INSERT INTO `goods` VALUES (418, '15560247197', '3', '4', 'on', 'on', 3);
INSERT INTO `goods` VALUES (419, '15560247198', '5', '4', '', '', 3);
INSERT INTO `goods` VALUES (420, '15560247199', '7', '7', '', '', 2);
INSERT INTO `goods` VALUES (421, '1557243846', '1', '1', 'on', NULL, 3);
INSERT INTO `goods` VALUES (422, '1557243869', '123', '123', 'on', NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `signer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_info_courier_id_a12cbef6_fk_courier_id` (`courier_id`),
  KEY `order_info_goods_id_d18767ad_fk_goods_id` (`goods_id`),
  KEY `order_info_signer_id_7b7b110a_fk_signer_address_id` (`signer_id`),
  KEY `order_info_user_id_f2004c3f_fk_user_id` (`user_id`),
  CONSTRAINT `order_info_courier_id_a12cbef6_fk_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`id`),
  CONSTRAINT `order_info_goods_id_d18767ad_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `order_info_signer_id_7b7b110a_fk_signer_address_id` FOREIGN KEY (`signer_id`) REFERENCES `signer_address` (`id`),
  CONSTRAINT `order_info_user_id_f2004c3f_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------
BEGIN;
INSERT INTO `order_info` VALUES (222, '2019-05-07 15:41:13.242242', 1, 222, 222, 3);
INSERT INTO `order_info` VALUES (223, '2019-05-07 15:41:13.249294', 1, 223, 223, 2);
INSERT INTO `order_info` VALUES (229, '2019-05-07 15:41:13.274734', NULL, 229, 229, 2);
INSERT INTO `order_info` VALUES (230, '2019-05-07 15:41:13.279038', NULL, 230, 230, 2);
INSERT INTO `order_info` VALUES (231, '2019-05-07 15:41:13.283394', NULL, 231, 231, 2);
INSERT INTO `order_info` VALUES (232, '2019-05-07 15:41:13.288276', NULL, 232, 232, 3);
INSERT INTO `order_info` VALUES (233, '2019-05-07 15:41:13.292610', NULL, 233, 233, 2);
INSERT INTO `order_info` VALUES (235, '2019-05-07 15:41:13.300711', NULL, 235, 235, 3);
INSERT INTO `order_info` VALUES (238, '2019-05-07 15:41:13.314242', NULL, 238, 238, 2);
INSERT INTO `order_info` VALUES (240, '2019-05-07 15:41:13.323497', NULL, 240, 240, 3);
INSERT INTO `order_info` VALUES (242, '2019-05-07 15:41:13.331772', NULL, 242, 242, 2);
INSERT INTO `order_info` VALUES (244, '2019-05-07 15:41:13.342274', NULL, 244, 244, 2);
INSERT INTO `order_info` VALUES (245, '2019-05-07 15:41:13.346728', NULL, 245, 245, 3);
INSERT INTO `order_info` VALUES (246, '2019-05-07 15:41:13.351286', NULL, 246, 246, 3);
INSERT INTO `order_info` VALUES (248, '2019-05-07 15:41:13.360103', NULL, 248, 248, 2);
INSERT INTO `order_info` VALUES (251, '2019-05-07 15:41:13.373465', NULL, 251, 251, 2);
INSERT INTO `order_info` VALUES (252, '2019-05-07 15:41:13.377865', NULL, 252, 252, 2);
INSERT INTO `order_info` VALUES (253, '2019-05-07 15:41:13.381895', NULL, 253, 253, 3);
INSERT INTO `order_info` VALUES (254, '2019-05-07 15:41:13.386259', NULL, 254, 254, 3);
INSERT INTO `order_info` VALUES (255, '2019-05-07 15:41:13.390201', NULL, 255, 255, 3);
INSERT INTO `order_info` VALUES (257, '2019-05-07 15:41:13.398879', NULL, 257, 257, 2);
INSERT INTO `order_info` VALUES (261, '2019-05-07 15:41:13.426839', NULL, 261, 261, 2);
INSERT INTO `order_info` VALUES (263, '2019-05-07 15:41:13.436022', NULL, 263, 263, 2);
INSERT INTO `order_info` VALUES (265, '2019-05-07 15:41:13.446766', NULL, 265, 265, 3);
INSERT INTO `order_info` VALUES (269, '2019-05-07 15:41:13.468681', NULL, 269, 269, 2);
INSERT INTO `order_info` VALUES (270, '2019-05-07 15:41:13.474998', NULL, 270, 270, 2);
INSERT INTO `order_info` VALUES (272, '2019-05-07 15:41:13.483886', NULL, 272, 272, 2);
INSERT INTO `order_info` VALUES (273, '2019-05-07 15:41:13.488871', NULL, 273, 273, 2);
INSERT INTO `order_info` VALUES (276, '2019-05-07 15:41:13.502997', NULL, 276, 276, 3);
INSERT INTO `order_info` VALUES (277, '2019-05-07 15:41:13.507752', NULL, 277, 277, 2);
INSERT INTO `order_info` VALUES (279, '2019-05-07 15:41:13.515696', NULL, 279, 279, 3);
INSERT INTO `order_info` VALUES (280, '2019-05-07 15:41:13.520401', NULL, 280, 280, 3);
INSERT INTO `order_info` VALUES (281, '2019-05-07 15:41:13.524858', NULL, 281, 281, 3);
INSERT INTO `order_info` VALUES (282, '2019-05-07 15:41:13.529397', NULL, 282, 282, 3);
INSERT INTO `order_info` VALUES (287, '2019-05-07 15:41:13.553108', NULL, 287, 287, 2);
INSERT INTO `order_info` VALUES (288, '2019-05-07 15:41:13.557684', NULL, 288, 288, 2);
INSERT INTO `order_info` VALUES (289, '2019-05-07 15:41:13.562261', NULL, 289, 289, 2);
INSERT INTO `order_info` VALUES (291, '2019-05-07 15:41:13.570538', NULL, 291, 291, 2);
INSERT INTO `order_info` VALUES (293, '2019-05-07 15:41:13.578731', NULL, 293, 293, 3);
INSERT INTO `order_info` VALUES (294, '2019-05-07 15:41:13.582515', NULL, 294, 294, 2);
INSERT INTO `order_info` VALUES (295, '2019-05-07 15:41:13.586923', NULL, 295, 295, 3);
INSERT INTO `order_info` VALUES (296, '2019-05-07 15:41:13.591424', NULL, 296, 296, 3);
INSERT INTO `order_info` VALUES (297, '2019-05-07 15:41:13.595168', NULL, 297, 297, 3);
INSERT INTO `order_info` VALUES (298, '2019-05-07 15:41:13.598946', NULL, 298, 298, 3);
INSERT INTO `order_info` VALUES (300, '2019-05-07 15:41:13.607748', NULL, 300, 300, 2);
INSERT INTO `order_info` VALUES (301, '2019-05-07 15:41:13.611475', NULL, 301, 301, 2);
INSERT INTO `order_info` VALUES (302, '2019-05-07 15:41:13.615455', NULL, 302, 302, 2);
INSERT INTO `order_info` VALUES (303, '2019-05-07 15:41:13.620014', NULL, 303, 303, 2);
INSERT INTO `order_info` VALUES (305, '2019-05-07 15:41:13.628819', NULL, 305, 305, 3);
INSERT INTO `order_info` VALUES (307, '2019-05-07 15:41:13.637128', NULL, 307, 307, 2);
INSERT INTO `order_info` VALUES (309, '2019-05-07 15:41:13.645345', NULL, 309, 309, 3);
INSERT INTO `order_info` VALUES (310, '2019-05-07 15:41:13.649137', NULL, 310, 310, 2);
INSERT INTO `order_info` VALUES (311, '2019-05-07 15:41:13.653584', NULL, 311, 311, 2);
INSERT INTO `order_info` VALUES (312, '2019-05-07 15:41:13.657710', NULL, 312, 312, 2);
INSERT INTO `order_info` VALUES (313, '2019-05-07 15:41:13.661336', NULL, 313, 313, 2);
INSERT INTO `order_info` VALUES (314, '2019-05-07 15:41:13.665409', NULL, 314, 314, 3);
INSERT INTO `order_info` VALUES (316, '2019-05-07 15:41:13.673534', NULL, 316, 316, 3);
INSERT INTO `order_info` VALUES (317, '2019-05-07 15:41:13.677462', NULL, 317, 317, 2);
INSERT INTO `order_info` VALUES (318, '2019-05-07 15:41:13.681811', NULL, 318, 318, 3);
INSERT INTO `order_info` VALUES (321, '2019-05-07 15:41:13.693904', NULL, 321, 321, 2);
INSERT INTO `order_info` VALUES (324, '2019-05-07 15:41:13.706699', NULL, 324, 324, 2);
INSERT INTO `order_info` VALUES (325, '2019-05-07 15:41:13.712288', NULL, 325, 325, 3);
INSERT INTO `order_info` VALUES (326, '2019-05-07 15:41:13.716808', NULL, 326, 326, 3);
INSERT INTO `order_info` VALUES (328, '2019-05-07 15:41:13.727160', NULL, 328, 328, 3);
INSERT INTO `order_info` VALUES (329, '2019-05-07 15:41:13.732006', NULL, 329, 329, 3);
INSERT INTO `order_info` VALUES (330, '2019-05-07 15:41:13.736274', NULL, 330, 330, 3);
INSERT INTO `order_info` VALUES (332, '2019-05-07 15:41:13.746902', NULL, 332, 332, 2);
INSERT INTO `order_info` VALUES (334, '2019-05-07 15:41:13.755643', NULL, 334, 334, 2);
INSERT INTO `order_info` VALUES (335, '2019-05-07 15:41:13.759214', NULL, 335, 335, 2);
INSERT INTO `order_info` VALUES (336, '2019-05-07 15:41:13.763653', NULL, 336, 336, 2);
INSERT INTO `order_info` VALUES (337, '2019-05-07 15:41:13.768606', NULL, 337, 337, 2);
INSERT INTO `order_info` VALUES (338, '2019-05-07 15:41:13.773202', NULL, 338, 338, 2);
INSERT INTO `order_info` VALUES (340, '2019-05-07 15:41:13.780996', NULL, 340, 340, 3);
INSERT INTO `order_info` VALUES (343, '2019-05-07 15:41:13.793861', NULL, 343, 343, 3);
INSERT INTO `order_info` VALUES (345, '2019-05-07 15:41:13.801984', NULL, 345, 345, 2);
INSERT INTO `order_info` VALUES (346, '2019-05-07 15:41:13.806133', NULL, 346, 346, 2);
INSERT INTO `order_info` VALUES (348, '2019-05-07 15:41:13.814062', NULL, 348, 348, 2);
INSERT INTO `order_info` VALUES (349, '2019-05-07 15:41:13.818351', NULL, 349, 349, 2);
INSERT INTO `order_info` VALUES (350, '2019-05-07 15:41:13.822521', NULL, 350, 350, 2);
INSERT INTO `order_info` VALUES (351, '2019-05-07 15:41:13.826559', NULL, 351, 351, 2);
INSERT INTO `order_info` VALUES (352, '2019-05-07 15:41:13.830253', NULL, 352, 352, 3);
INSERT INTO `order_info` VALUES (353, '2019-05-07 15:41:13.834009', NULL, 353, 353, 3);
INSERT INTO `order_info` VALUES (356, '2019-05-07 15:41:13.845475', NULL, 356, 356, 2);
INSERT INTO `order_info` VALUES (360, '2019-05-07 15:41:13.861368', NULL, 360, 360, 2);
INSERT INTO `order_info` VALUES (362, '2019-05-07 15:41:13.868775', NULL, 362, 362, 3);
INSERT INTO `order_info` VALUES (363, '2019-05-07 15:41:13.872635', NULL, 363, 363, 2);
INSERT INTO `order_info` VALUES (364, '2019-05-07 15:41:13.876689', NULL, 364, 364, 2);
INSERT INTO `order_info` VALUES (365, '2019-05-07 15:41:13.880407', NULL, 365, 365, 2);
INSERT INTO `order_info` VALUES (367, '2019-05-07 15:41:13.888685', NULL, 367, 367, 3);
INSERT INTO `order_info` VALUES (368, '2019-05-07 15:41:13.892182', NULL, 368, 368, 2);
INSERT INTO `order_info` VALUES (372, '2019-05-07 15:41:13.912964', NULL, 372, 372, 3);
INSERT INTO `order_info` VALUES (373, '2019-05-07 15:41:13.917228', NULL, 373, 373, 3);
INSERT INTO `order_info` VALUES (374, '2019-05-07 15:41:13.921200', NULL, 374, 374, 2);
INSERT INTO `order_info` VALUES (375, '2019-05-07 15:41:13.925033', NULL, 375, 375, 3);
INSERT INTO `order_info` VALUES (376, '2019-05-07 15:41:13.928655', NULL, 376, 376, 2);
INSERT INTO `order_info` VALUES (378, '2019-05-07 15:41:13.936398', NULL, 378, 378, 2);
INSERT INTO `order_info` VALUES (379, '2019-05-07 15:41:13.940181', NULL, 379, 379, 2);
INSERT INTO `order_info` VALUES (382, '2019-05-07 15:41:13.951889', NULL, 382, 382, 2);
INSERT INTO `order_info` VALUES (383, '2019-05-07 15:41:13.955804', NULL, 383, 383, 2);
INSERT INTO `order_info` VALUES (384, '2019-05-07 15:41:13.959622', NULL, 384, 384, 2);
INSERT INTO `order_info` VALUES (387, '2019-05-07 15:41:13.970930', NULL, 387, 387, 2);
INSERT INTO `order_info` VALUES (388, '2019-05-07 15:41:13.974907', NULL, 388, 388, 2);
INSERT INTO `order_info` VALUES (389, '2019-05-07 15:41:13.978611', NULL, 389, 389, 3);
INSERT INTO `order_info` VALUES (390, '2019-05-07 15:41:13.982520', NULL, 390, 390, 2);
INSERT INTO `order_info` VALUES (391, '2019-05-07 15:41:13.986425', NULL, 391, 391, 2);
INSERT INTO `order_info` VALUES (392, '2019-05-07 15:41:13.990684', NULL, 392, 392, 3);
INSERT INTO `order_info` VALUES (394, '2019-05-07 15:41:13.998521', NULL, 394, 394, 2);
INSERT INTO `order_info` VALUES (395, '2019-05-07 15:41:14.002878', NULL, 395, 395, 3);
INSERT INTO `order_info` VALUES (398, '2019-05-07 15:41:14.015145', NULL, 398, 398, 2);
INSERT INTO `order_info` VALUES (399, '2019-05-07 15:41:14.019131', NULL, 399, 399, 2);
INSERT INTO `order_info` VALUES (400, '2019-05-07 15:41:14.024941', NULL, 400, 400, 2);
INSERT INTO `order_info` VALUES (401, '2019-05-07 15:41:14.029124', NULL, 401, 401, 3);
INSERT INTO `order_info` VALUES (402, '2019-05-07 15:41:14.033090', NULL, 402, 402, 2);
INSERT INTO `order_info` VALUES (403, '2019-05-07 15:41:14.037791', NULL, 403, 403, 3);
INSERT INTO `order_info` VALUES (405, '2019-05-07 15:41:14.045136', NULL, 405, 405, 3);
INSERT INTO `order_info` VALUES (407, '2019-05-07 15:41:14.052893', NULL, 407, 407, 2);
INSERT INTO `order_info` VALUES (408, '2019-05-07 15:41:14.056798', NULL, 408, 408, 3);
INSERT INTO `order_info` VALUES (412, '2019-05-07 15:41:14.074559', NULL, 412, 412, 2);
INSERT INTO `order_info` VALUES (413, '2019-05-07 15:41:14.079475', NULL, 413, 413, 3);
INSERT INTO `order_info` VALUES (416, '2019-05-07 15:41:14.091801', NULL, 416, 416, 2);
INSERT INTO `order_info` VALUES (417, '2019-05-07 15:41:14.096068', NULL, 417, 417, 3);
INSERT INTO `order_info` VALUES (418, '2019-05-07 15:41:14.099891', NULL, 418, 418, 3);
INSERT INTO `order_info` VALUES (419, '2019-05-07 15:41:14.104093', NULL, 419, 419, 3);
INSERT INTO `order_info` VALUES (420, '2019-05-07 15:41:14.108071', NULL, 420, 420, 2);
INSERT INTO `order_info` VALUES (421, '2019-05-07 15:44:06.405622', NULL, 421, 421, 3);
INSERT INTO `order_info` VALUES (422, '2019-05-07 15:44:29.705829', NULL, 422, 422, 3);
COMMIT;

-- ----------------------------
-- Table structure for ruler
-- ----------------------------
DROP TABLE IF EXISTS `ruler`;
CREATE TABLE `ruler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `role` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ruler
-- ----------------------------
BEGIN;
INSERT INTO `ruler` VALUES (1, 'wuyufeng', 'pbkdf2_sha256$36000$IA8kkit65gd4$cw1DHCiwW2bpDAi7EUZSOoA1Qw1jJX5VxDiEGUcxS2s=', 'rtx2080ti', '1');
COMMIT;

-- ----------------------------
-- Table structure for signer_address
-- ----------------------------
DROP TABLE IF EXISTS `signer_address`;
CREATE TABLE `signer_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `signer_address_user_id_83110088_fk_user_id` (`user_id`),
  CONSTRAINT `signer_address_user_id_83110088_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of signer_address
-- ----------------------------
BEGIN;
INSERT INTO `signer_address` VALUES (222, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (223, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (229, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (230, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (231, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (232, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (233, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (235, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 3);
INSERT INTO `signer_address` VALUES (238, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (240, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (242, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (244, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (245, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (246, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (248, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (251, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (252, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (253, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (254, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (255, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (257, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (261, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (263, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (265, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (269, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (270, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (272, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (273, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (276, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (277, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 2);
INSERT INTO `signer_address` VALUES (279, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (280, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (281, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (282, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (287, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (288, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 2);
INSERT INTO `signer_address` VALUES (289, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (291, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (293, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (294, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (295, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (296, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (297, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (298, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (300, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (301, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (302, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (303, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (305, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (307, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 2);
INSERT INTO `signer_address` VALUES (309, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (310, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (311, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (312, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (313, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (314, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (316, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 3);
INSERT INTO `signer_address` VALUES (317, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (318, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (321, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (324, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (325, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 3);
INSERT INTO `signer_address` VALUES (326, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 3);
INSERT INTO `signer_address` VALUES (328, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (329, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 3);
INSERT INTO `signer_address` VALUES (330, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (332, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (334, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (335, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (336, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (337, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (338, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (340, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (343, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (345, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 2);
INSERT INTO `signer_address` VALUES (346, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (348, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (349, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (350, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (351, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (352, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (353, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 3);
INSERT INTO `signer_address` VALUES (356, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (360, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (362, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (363, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 2);
INSERT INTO `signer_address` VALUES (364, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (365, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (367, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (368, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (372, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (373, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 3);
INSERT INTO `signer_address` VALUES (374, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (375, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (376, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (378, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (379, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (382, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (383, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (384, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (387, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (388, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (389, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 3);
INSERT INTO `signer_address` VALUES (390, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (391, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (392, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (394, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (395, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (398, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 2);
INSERT INTO `signer_address` VALUES (399, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 2);
INSERT INTO `signer_address` VALUES (400, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (401, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 3);
INSERT INTO `signer_address` VALUES (402, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 2);
INSERT INTO `signer_address` VALUES (403, '四川', '泸州', '江阳', '诸子街1001号', '杨二', '12342343412', 3);
INSERT INTO `signer_address` VALUES (405, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 3);
INSERT INTO `signer_address` VALUES (407, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (408, '福建', '泉州', '江阴', '留下街343号', '黄流', '13423233551', 3);
INSERT INTO `signer_address` VALUES (412, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 2);
INSERT INTO `signer_address` VALUES (413, '四川', '成都', '龙泉驿', '迎晖路1080号', '张三', '13258230120', 3);
INSERT INTO `signer_address` VALUES (416, '广东', '广州', '海珠', '杏园大街2080号', '李四', '18628133324', 2);
INSERT INTO `signer_address` VALUES (417, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (418, '浙江', '宁波', '北仑', '大碶街道6324号', '王五', '15289044194', 3);
INSERT INTO `signer_address` VALUES (419, '四川', '德阳', '什邡', '回澜路12号', '蔡徐坤', '18913213132', 3);
INSERT INTO `signer_address` VALUES (420, '广东', '珠海', '哈口', '海天321号', '吴奇隆', '18623232123', 2);
INSERT INTO `signer_address` VALUES (421, '1', '1', '1', '1', '杨二', '1', 3);
INSERT INTO `signer_address` VALUES (422, '123', '123', '123', '123', '杨二', '123', 3);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `role` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (2, 'user_1556024764', '嘉哥', 'pbkdf2_sha256$36000$bwfGkB4VvKzn$hdPoFWIZnScYIOyvnmC19kU03UbhojYqbEF2PVTIOFo=', NULL, '3');
INSERT INTO `user` VALUES (3, 'user_1556025764', '珠珠', 'pbkdf2_sha256$36000$4ZV7RIxPGd0f$Z23/9RsqnPfKGB4x5HNMpzF35gHBNwOoI1V82I/uc2U=', NULL, '3');
COMMIT;

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_mobile` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_address_user_id_64deb2c7_fk_user_id` (`user_id`),
  CONSTRAINT `user_address_user_id_64deb2c7_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
