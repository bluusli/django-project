/*
 Navicat Premium Data Transfer

 Source Server         : 176.209.102.17
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : gmooc

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 25/01/2019 14:09:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (17, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (19, 'Can add 轮播图', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (20, 'Can change 轮播图', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 轮播图', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (22, 'Can add 邮箱验证码', 8, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (23, 'Can change 邮箱验证码', 8, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 邮箱验证码', 8, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (25, 'Can add 章节', 9, 'add_video');
INSERT INTO `auth_permission` VALUES (26, 'Can change 章节', 9, 'change_video');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 章节', 9, 'delete_video');
INSERT INTO `auth_permission` VALUES (28, 'Can add 课程', 10, 'add_courses');
INSERT INTO `auth_permission` VALUES (29, 'Can change 课程', 10, 'change_courses');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 课程', 10, 'delete_courses');
INSERT INTO `auth_permission` VALUES (31, 'Can add 课程资源', 11, 'add_courseresource');
INSERT INTO `auth_permission` VALUES (32, 'Can change 课程资源', 11, 'change_courseresource');
INSERT INTO `auth_permission` VALUES (33, 'Can delete 课程资源', 11, 'delete_courseresource');
INSERT INTO `auth_permission` VALUES (34, 'Can add 课程', 12, 'add_lesson');
INSERT INTO `auth_permission` VALUES (35, 'Can change 课程', 12, 'change_lesson');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 课程', 12, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (37, 'Can add 教师', 13, 'add_teacher');
INSERT INTO `auth_permission` VALUES (38, 'Can change 教师', 13, 'change_teacher');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 教师', 13, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (40, 'Can add city dict', 14, 'add_citydict');
INSERT INTO `auth_permission` VALUES (41, 'Can change city dict', 14, 'change_citydict');
INSERT INTO `auth_permission` VALUES (42, 'Can delete city dict', 14, 'delete_citydict');
INSERT INTO `auth_permission` VALUES (43, 'Can add 课程机构', 15, 'add_courseorg');
INSERT INTO `auth_permission` VALUES (44, 'Can change 课程机构', 15, 'change_courseorg');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 课程机构', 15, 'delete_courseorg');
INSERT INTO `auth_permission` VALUES (46, 'Can add 用户咨询', 16, 'add_userask');
INSERT INTO `auth_permission` VALUES (47, 'Can change 用户咨询', 16, 'change_userask');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 用户咨询', 16, 'delete_userask');
INSERT INTO `auth_permission` VALUES (49, 'Can add 用户收藏', 17, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (50, 'Can change 用户收藏', 17, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 用户收藏', 17, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (52, 'Can add 课程评论', 18, 'add_coursecomments');
INSERT INTO `auth_permission` VALUES (53, 'Can change 课程评论', 18, 'change_coursecomments');
INSERT INTO `auth_permission` VALUES (54, 'Can delete 课程评论', 18, 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES (55, 'Can add 用户课程', 19, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (56, 'Can change 用户课程', 19, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (57, 'Can delete 用户课程', 19, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (58, 'Can add 用户消息', 20, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (59, 'Can change 用户消息', 20, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (60, 'Can delete 用户消息', 20, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (61, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (62, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (63, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (64, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (65, 'Can view 课程资源', 11, 'view_courseresource');
INSERT INTO `auth_permission` VALUES (66, 'Can view 课程', 10, 'view_courses');
INSERT INTO `auth_permission` VALUES (67, 'Can view 课程', 12, 'view_lesson');
INSERT INTO `auth_permission` VALUES (68, 'Can view 章节', 9, 'view_video');
INSERT INTO `auth_permission` VALUES (69, 'Can view 课程评论', 18, 'view_coursecomments');
INSERT INTO `auth_permission` VALUES (70, 'Can view 用户咨询', 16, 'view_userask');
INSERT INTO `auth_permission` VALUES (71, 'Can view 用户课程', 19, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (72, 'Can view 用户收藏', 17, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (73, 'Can view 用户消息', 20, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (74, 'Can view city dict', 14, 'view_citydict');
INSERT INTO `auth_permission` VALUES (75, 'Can view 课程机构', 15, 'view_courseorg');
INSERT INTO `auth_permission` VALUES (76, 'Can view 教师', 13, 'view_teacher');
INSERT INTO `auth_permission` VALUES (77, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (78, 'Can view 轮播图', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (79, 'Can view 邮箱验证码', 8, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (80, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (81, 'Can add Bookmark', 21, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can change Bookmark', 21, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (83, 'Can delete Bookmark', 21, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (84, 'Can add User Setting', 22, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (85, 'Can change User Setting', 22, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (86, 'Can delete User Setting', 22, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (87, 'Can add User Widget', 23, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (88, 'Can change User Widget', 23, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (89, 'Can delete User Widget', 23, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (90, 'Can add log entry', 24, 'add_log');
INSERT INTO `auth_permission` VALUES (91, 'Can change log entry', 24, 'change_log');
INSERT INTO `auth_permission` VALUES (92, 'Can delete log entry', 24, 'delete_log');
INSERT INTO `auth_permission` VALUES (93, 'Can view Bookmark', 21, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (94, 'Can view log entry', 24, 'view_log');
INSERT INTO `auth_permission` VALUES (95, 'Can view User Setting', 22, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (96, 'Can view User Widget', 23, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (97, 'Can add captcha store', 25, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (98, 'Can change captcha store', 25, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (99, 'Can delete captcha store', 25, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (100, 'Can view captcha store', 25, 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (39, 'JDRC', 'jdrc', '2a0ca97783df5f1b0e282c7ecd3e0c68d511d1e4', '2019-01-25 11:28:25.194397');
INSERT INTO `captcha_captchastore` VALUES (40, 'ASFJ', 'asfj', '6260cd8d5c949a4b8188af20299aabef3cd3ac44', '2019-01-25 11:28:29.663020');
INSERT INTO `captcha_captchastore` VALUES (41, 'GHON', 'ghon', '722172b948a920a1db5a8bb133f688fece8d2ea4', '2019-01-25 11:28:34.585417');
INSERT INTO `captcha_captchastore` VALUES (42, 'PUYF', 'puyf', 'f2da320fcc4e32a479add88aab727b6ede48d210', '2019-01-25 11:28:47.373915');
INSERT INTO `captcha_captchastore` VALUES (43, 'KUHX', 'kuhx', '5111ccab5bf6ef200a9042686605aea0f40bc959', '2019-01-25 11:28:51.083063');
INSERT INTO `captcha_captchastore` VALUES (44, 'WZQM', 'wzqm', '65953164fb5682430409236a0bbaa1a64a214837', '2019-01-25 11:30:55.294170');
INSERT INTO `captcha_captchastore` VALUES (46, 'CCFF', 'ccff', '33742e15cf142e311c280bcf5425bd974a95a53a', '2019-01-25 11:32:09.949416');
INSERT INTO `captcha_captchastore` VALUES (47, 'WFLU', 'wflu', 'f50751430dc91a0e0d63e0351ce142574c4564c0', '2019-01-25 11:34:02.509233');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresource_course_id_5eba1332_fk_courses_courses_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_courses_id` FOREIGN KEY (`course_id`) REFERENCES `courses_courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES (1, '前端资料', 'course/resource/media.zip', '2019-01-21 15:16:00.000000', 13);

-- ----------------------------
-- Table structure for courses_courses
-- ----------------------------
DROP TABLE IF EXISTS `courses_courses`;
CREATE TABLE `courses_courses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degree` int(11) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) NULL DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `teacher_tell` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `youneed_know` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courses_course_org_id_c2604c80_fk_organizat`(`course_org_id`) USING BTREE,
  INDEX `courses_courses_teacher_id_b26c5f4a_fk_organization_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_courses_course_org_id_c2604c80_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_courses_teacher_id_b26c5f4a_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_courses
-- ----------------------------
INSERT INTO `courses_courses` VALUES (1, 'django', 'python-django', '入门学习', 1, 40, 7, 0, 'courses/2019/01/540e57300001d6d906000338-240-135.jpg', 22, '2019-01-14 19:36:00.000000', 1, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (2, 'Java入门(一)', '向Java初学者讲述了如何才能真正理解和掌握Java语言', '本书是一本与众不同的Java入门好书。作者以独特的视角，向Java初学者讲述了如何才能真正理解和掌握Java语言。另外，作者专门录制了近16小时的多媒体语音教学视频帮助读者直观地学习。这些视频和书中的源代码一起收录于本书的DVD光盘中。\r\n《Java入门》是臧萌编著的一本图书。该书适合广大想学习一门编程语言的读者、没有任何基础的Java入门读者、Java自学人员、从其他语言转向Java语言的读者、大中专院校的学生和社会培训学生。', 1, 60, 0, 0, 'courses/2019/01/57035ff200014b8a06000338-240-135.jpg', 0, '2019-01-18 16:32:00.000000', 2, '后端开发', '', NULL, '', '', 1);
INSERT INTO `courses_courses` VALUES (3, 'MySQL复制功能', 'MySQL是一种关系数据库管理系统，关系数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。', 'MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件。\r\nMySQL是一种关系数据库管理系统，关系数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。\r\nMySQL所使用的 SQL 语言是用于访问数据库的最常用标准化语言。MySQL 软件采用了双授权政策，分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，尤其是开放源码这一特点，一般中小型网站的开发都选择 MySQL 作为网站数据库。', 2, 120, 0, 0, 'courses/2019/01/mysql.jpg', 0, '2019-01-18 16:38:00.000000', 5, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (4, 'Python入门(一)', 'Python是一种计算机程序设计语言。是一种动态的、面向对象的脚本语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越来越多被用于独立的、大型项目的开发。', 'Python在执行时，首先会将.py文件中的源代码编译成Python的byte code（字节码），然后再由Python Virtual Machine（Python虚拟机）来执行这些编译好的byte code。这种机制的基本思想跟Java，.NET\r\n是一致的。然而，Python Virtual Machine与Java或.NET的Virtual Machine不同的是，Python的Virtual Machine是一种更高级的Virtual Machine。这里的高级并不是通常意义上的高级，不是说Python的Virtual Machine比Java或.NET的功能更强大，而是说和Java 或.NET相比，Python的Virtual Machine距离真实机器的距离更远。或者可以这么说，Python的Virtual Machine是一种抽象层次更高的Virtual Machine。', 3, 120, 0, 0, 'courses/2019/01/540e57300001d6d906000338-240-135_WcjtG9o.jpg', 5, '2019-01-18 16:41:00.000000', 6, '后端开发', 'Python', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (5, 'Python入门(二)', 'Python是一种计算机程序设计语言。是一种动态的、面向对象的脚本语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越来越多被用于独立的、大型项目的开发。', 'Python在执行时，首先会将.py文件中的源代码编译成Python的byte code（字节码），然后再由Python Virtual Machine（Python虚拟机）来执行这些编译好的byte code。这种机制的基本思想跟Java，.NET\r\n是一致的。然而，Python Virtual Machine与Java或.NET的Virtual Machine不同的是，Python的Virtual Machine是一种更高级的Virtual Machine。这里的高级并不是通常意义上的高级，不是说Python的Virtual Machine比Java或.NET的功能更强大，而是说和Java 或.NET相比，Python的Virtual Machine距离真实机器的距离更远。或者可以这么说，Python的Virtual Machine是一种抽象层次更高的Virtual Machine。', 3, 120, 1, 0, 'courses/2019/01/540e57300001d6d906000338-240-135_MSIqfvw.jpg', 1, '2019-01-18 16:43:00.000000', 6, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (6, 'Python入门(三)', 'Python是一种计算机程序设计语言。是一种动态的、面向对象的脚本语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越来越多被用于独立的、大型项目的开发。', 'Python在执行时，首先会将.py文件中的源代码编译成Python的byte code（字节码），然后再由Python Virtual Machine（Python虚拟机）来执行这些编译好的byte code。这种机制的基本思想跟Java，.NET\r\n是一致的。然而，Python Virtual Machine与Java或.NET的Virtual Machine不同的是，Python的Virtual Machine是一种更高级的Virtual Machine。这里的高级并不是通常意义上的高级，不是说Python的Virtual Machine比Java或.NET的功能更强大，而是说和Java 或.NET相比，Python的Virtual Machine距离真实机器的距离更远。或者可以这么说，Python的Virtual Machine是一种抽象层次更高的Virtual Machine。', 3, 120, 0, 0, 'courses/2019/01/540e57300001d6d906000338-240-135_mvvGYHL.jpg', 0, '2019-01-18 16:43:00.000000', 6, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (7, 'Python入门(四)', 'Python是一种计算机程序设计语言。是一种动态的、面向对象的脚本语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越来越多被用于独立的、大型项目的开发。', 'Python在执行时，首先会将.py文件中的源代码编译成Python的byte code（字节码），然后再由Python Virtual Machine（Python虚拟机）来执行这些编译好的byte code。这种机制的基本思想跟Java，.NET\r\n是一致的。然而，Python Virtual Machine与Java或.NET的Virtual Machine不同的是，Python的Virtual Machine是一种更高级的Virtual Machine。这里的高级并不是通常意义上的高级，不是说Python的Virtual Machine比Java或.NET的功能更强大，而是说和Java 或.NET相比，Python的Virtual Machine距离真实机器的距离更远。或者可以这么说，Python的Virtual Machine是一种抽象层次更高的Virtual Machine。', 3, 120, 1, 0, 'courses/2019/01/540e57300001d6d906000338-240-135_n0L8vbw.jpg', 1, '2019-01-18 16:44:00.000000', 6, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (8, 'Python入门(五)', 'Python是一种计算机程序设计语言。是一种动态的、面向对象的脚本语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越来越多被用于独立的、大型项目的开发。', 'Python在执行时，首先会将.py文件中的源代码编译成Python的byte code（字节码），然后再由Python Virtual Machine（Python虚拟机）来执行这些编译好的byte code。这种机制的基本思想跟Java，.NET\r\n是一致的。然而，Python Virtual Machine与Java或.NET的Virtual Machine不同的是，Python的Virtual Machine是一种更高级的Virtual Machine。这里的高级并不是通常意义上的高级，不是说Python的Virtual Machine比Java或.NET的功能更强大，而是说和Java 或.NET相比，Python的Virtual Machine距离真实机器的距离更远。或者可以这么说，Python的Virtual Machine是一种抽象层次更高的Virtual Machine。', 3, 120, 1, 0, 'courses/2019/01/540e57300001d6d906000338-240-135_wH52IED.jpg', 10, '2019-01-18 16:45:00.000000', 6, '后端开发', '', NULL, '', '', 1);
INSERT INTO `courses_courses` VALUES (9, 'Java入门(二)', 'ava具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点 [2]  。Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等', 'Java看起来设计得很像C++，但是为了使语言小和容易熟悉，设计者们把C++语言中许多可用的特征去掉了，这些特征是一般程序员很少使用的。例如，Java不支持go to语句，代之以提供break和continue语句以及异常处理。Java还剔除了C++的操作符过载（overload）和多继承特征，并且不使用主文件，免去了预处理程序。因为Java没有结构，数组和串都是对象，所以不需要指针。Java能够自动处理对象的引用和间接引用，实现自动的无用单元收集，使用户不必为存储管理问题烦恼，能更多的时间和精力花在研发上。', 2, 120, 1, 1, 'courses/2019/01/57035ff200014b8a06000338-240-135_0nFiBSI.jpg', 1, '2019-01-18 16:45:00.000000', 2, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (10, 'Java入门(三)', 'Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点 [2]  。Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等', 'Java看起来设计得很像C++，但是为了使语言小和容易熟悉，设计者们把C++语言中许多可用的特征去掉了，这些特征是一般程序员很少使用的。例如，Java不支持go to语句，代之以提供break和continue语句以及异常处理。Java还剔除了C++的操作符过载（overload）和多继承特征，并且不使用主文件，免去了预处理程序。因为Java没有结构，数组和串都是对象，所以不需要指针。Java能够自动处理对象的引用和间接引用，实现自动的无用单元收集，使用户不必为存储管理问题烦恼，能更多的时间和精力花在研发上。', 2, 120, 5, 0, 'courses/2019/01/57035ff200014b8a06000338-240-135_dHfj8Nq.jpg', 7, '2019-01-18 16:48:00.000000', 2, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (11, 'Python面向对象', 'Python是一种面向对象、解释型的程序设计语言，它已经被成功应用于科学计算、数据分析以及游戏开发等诸多领域。', '本书深入介绍Python语言的面向对象特性，全书分3个部分共18章。第1部分讲述用特殊方法实现Python风格的类，分别介绍了__init__()方法、与Python无缝集成—基本特殊方法、属性访问和特性及修饰符、抽象基类设计的一致性、可调用对象和上下文的使用、创建容器和集合、创建数值类型、装饰器和mixin—横切方面；第2部分讲述持久化和序列化，分别介绍了序列化和保存、用Shelve保存和获取对象、用SQLite保存和获取对象、传输和共享对象、配置文件和持久化；第3部分讲述测试、调试、部署和维护，分别介绍了Logging和Warning模块、可测试性的设计、使用命令行、模块和包的设计、质量和文档。', 3, 180, 1, 0, 'courses/2019/01/python面向对象.jpg', 1, '2019-01-18 16:48:00.000000', 4, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (12, 'Python文件处理', 'ython是一种计算机程序设计语言。是一种动态的、面向对象的脚本语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越来越多被用于独立的、大型项目的开发', '系统编程：提供API（Application Programming Interface应用程序编程接口），能方便进行系统维护和管理，Linux下标志性语言之一，是很多系统管理员理想的编程工具。\r\n图形处理：有PIL、Tkinter等图形库支持，能方便进行图形处理。\r\n数学处理：NumPy扩展提供大量与许多标准数学库的接口。\r\n文本处理：python提供的re模块能支持正则表达式，还提供SGML，XML分析模块，许多程序员利用python进行XML程序的开发。\r\n数据库编程：程序员可通过遵循Python DB-API（数据库应用程序编程接口）规范的模块与Microsoft SQL Server，Oracle，Sybase，DB2，MySQL、SQLite等数据库通信。python自带有一个Gadfly模块，提供了一个完整的SQL环境。\r\n网络编程：提供丰富的模块支持sockets编程，能方便快速地开发分布式应用程序。很多大规模软件开发计划例如Zope，Mnet 及BitTorrent. Google都在广泛地使用它。\r\nWeb编程：应用的开发语言，支持最新的XML技术。\r\n多媒体应用：Python的PyOpenGL模块封装了“OpenGL应用程序编程接口”，能进行二维和三维图像处理。PyGame模块可用于编写游戏软件。\r\npymo引擎：PYMO全称为python memories off，是一款运行于Symbian S60V3,Symbian3,S60V5, Symbian3, Android系统上的AVG游戏引擎。因其基于python2.0平台开发，并且适用于创建秋之回忆（memories off）风格的AVG游戏，故命名为PYMO。\r\n黑客编程：python有一个hack的库,内置了你熟悉的或不熟悉的函数，但是缺少成就感。', 3, 240, 2, 0, 'courses/2019/01/python文件处理.jpg', 10, '2019-01-18 16:50:00.000000', 3, '后端开发', '', NULL, '', '', 0);
INSERT INTO `courses_courses` VALUES (13, 'Python的错误和异常', 'Python是一种计算机程序设计语言。是一种动态的、面向对象的脚本语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越来越多被用于独立的、大型项目的开发。', 'Python在执行时，首先会将.py文件中的源代码编译成Python的byte code（字节码），然后再由Python Virtual Machine（Python虚拟机）来执行这些编译好的byte code。这种机制的基本思想跟Java，.NET\r\n是一致的。然而，Python Virtual Machine与Java或.NET的Virtual Machine不同的是，Python的Virtual Machine是一种更高级的Virtual Machine。这里的高级并不是通常意义上的高级，不是说Python的Virtual Machine比Java或.NET的功能更强大，而是说和Java 或.NET相比，Python的Virtual Machine距离真实机器的距离更远。或者可以这么说，Python的Virtual Machine是一种抽象层次更高的Virtual Machine。\r\n基于C的Python编译出的字节码文件，通常是.pyc格式。\r\n除此之外，Python还可以以交互模式运行，比如主流操作系统Unix/Linux、Mac、Windows都可以直接在命令模式下直接运行Python交互环境。直接下达操作指令即可实现交互操作。', 3, 120, 7, 1, 'courses/2019/01/python错误和异常.jpg', 101, '2019-01-18 16:51:00.000000', 7, '后端开发', 'Python', 1, 'python的进阶开发', 'python基础你需要有', 1);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_courses_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_courses_id` FOREIGN KEY (`course_id`) REFERENCES `courses_courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (1, '第一章 基础知识', '2019-01-21 14:51:00.000000', 13);
INSERT INTO `courses_lesson` VALUES (2, '第二章 进阶开发', '2019-01-21 14:52:00.000000', 13);

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_video_lesson_id_59f2396e_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES (1, '1.1 hello world', '2019-01-21 14:55:00.000000', 1, 'http://www.imooc.com/video/1430', 30);
INSERT INTO `courses_video` VALUES (2, '1.1 hello 1', '2019-01-21 14:56:00.000000', 1, 'http://www.imooc.com/video/1430', 30);
INSERT INTO `courses_video` VALUES (3, '2.1 test', '2019-01-21 14:57:00.000000', 2, 'http://www.imooc.com/video/1430', 20);
INSERT INTO `courses_video` VALUES (4, '2.2 test2', '2019-01-21 14:57:00.000000', 2, 'http://www.imooc.com/video/1430', 20);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (25, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES (10, 'courses', 'courses');
INSERT INTO `django_content_type` VALUES (12, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (9, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (18, 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES (16, 'operation', 'userask');
INSERT INTO `django_content_type` VALUES (19, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (17, 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES (20, 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES (14, 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES (15, 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES (13, 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (8, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-01-14 03:04:40.381733');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-01-14 03:04:41.536645');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-01-14 03:04:45.548926');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-01-14 03:04:47.040931');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-01-14 03:04:47.089803');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-01-14 03:04:47.130723');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-01-14 03:04:47.172610');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-01-14 03:04:47.207490');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-01-14 03:04:47.249410');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-01-14 03:04:47.293289');
INSERT INTO `django_migrations` VALUES (11, 'users', '0001_initial', '2019-01-14 03:04:53.419881');
INSERT INTO `django_migrations` VALUES (12, 'admin', '0001_initial', '2019-01-14 03:04:56.526609');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0002_logentry_remove_auto_add', '2019-01-14 03:04:56.605367');
INSERT INTO `django_migrations` VALUES (14, 'sessions', '0001_initial', '2019-01-14 03:04:57.737342');
INSERT INTO `django_migrations` VALUES (15, 'users', '0002_banner_emailverifyrecord', '2019-01-14 03:36:59.995148');
INSERT INTO `django_migrations` VALUES (16, 'courses', '0001_initial', '2019-01-14 03:59:46.864516');
INSERT INTO `django_migrations` VALUES (17, 'operation', '0001_initial', '2019-01-14 07:42:52.934733');
INSERT INTO `django_migrations` VALUES (18, 'organization', '0001_initial', '2019-01-14 07:42:55.844952');
INSERT INTO `django_migrations` VALUES (19, 'xadmin', '0001_initial', '2019-01-14 17:31:15.115725');
INSERT INTO `django_migrations` VALUES (20, 'xadmin', '0002_log', '2019-01-14 17:31:16.975725');
INSERT INTO `django_migrations` VALUES (21, 'xadmin', '0003_auto_20160715_0100', '2019-01-14 17:31:18.056863');
INSERT INTO `django_migrations` VALUES (22, 'captcha', '0001_initial', '2019-01-15 15:59:33.455003');
INSERT INTO `django_migrations` VALUES (23, 'courses', '0002_auto_20190115_1559', '2019-01-15 15:59:33.494896');
INSERT INTO `django_migrations` VALUES (24, 'organization', '0002_auto_20190115_1559', '2019-01-15 15:59:33.529802');
INSERT INTO `django_migrations` VALUES (25, 'users', '0003_auto_20190115_1559', '2019-01-15 15:59:33.579668');
INSERT INTO `django_migrations` VALUES (26, 'organization', '0003_auto_20190117_1018', '2019-01-17 10:18:48.033415');
INSERT INTO `django_migrations` VALUES (27, 'organization', '0004_auto_20190117_1447', '2019-01-17 14:47:20.799714');
INSERT INTO `django_migrations` VALUES (28, 'courses', '0003_courses_course_org', '2019-01-18 10:19:30.408429');
INSERT INTO `django_migrations` VALUES (29, 'organization', '0005_teacher_image', '2019-01-18 12:02:40.063856');
INSERT INTO `django_migrations` VALUES (30, 'courses', '0004_courses_category', '2019-01-21 10:27:47.969822');
INSERT INTO `django_migrations` VALUES (31, 'courses', '0005_courses_tag', '2019-01-21 10:55:09.689960');
INSERT INTO `django_migrations` VALUES (32, 'courses', '0006_video_url', '2019-01-21 14:55:02.569060');
INSERT INTO `django_migrations` VALUES (33, 'organization', '0006_auto_20190121_1454', '2019-01-21 14:55:02.625934');
INSERT INTO `django_migrations` VALUES (34, 'courses', '0007_video_learn_time', '2019-01-21 15:09:15.205426');
INSERT INTO `django_migrations` VALUES (35, 'courses', '0008_courses_teacher', '2019-01-21 15:26:57.376541');
INSERT INTO `django_migrations` VALUES (36, 'courses', '0009_auto_20190121_1532', '2019-01-21 15:32:10.297875');
INSERT INTO `django_migrations` VALUES (37, 'organization', '0007_teacher_age', '2019-01-22 10:56:31.091016');
INSERT INTO `django_migrations` VALUES (38, 'courses', '0010_courses_is_banner', '2019-01-25 10:14:40.835055');
INSERT INTO `django_migrations` VALUES (39, 'users', '0004_auto_20190125_1014', '2019-01-25 10:14:40.895894');
INSERT INTO `django_migrations` VALUES (40, 'organization', '0008_courseorg_tag', '2019-01-25 10:37:03.650133');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_coursecomm_course_id_c88f1b6a_fk_courses_c`(`course_id`) USING BTREE,
  INDEX `operation_coursecomm_user_id_f5ff70b3_fk_users_use`(`user_id`) USING BTREE,
  CONSTRAINT `operation_coursecomm_course_id_c88f1b6a_fk_courses_c` FOREIGN KEY (`course_id`) REFERENCES `courses_courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES (1, 'as大叔大婶多', '2019-01-21 16:15:35.742391', 13, 1);
INSERT INTO `operation_coursecomments` VALUES (2, 'good', '2019-01-21 16:21:51.204566', 13, 1);

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES (1, '凤姐', '12345678910', '慕课', '2019-01-17 16:31:16.063034');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usercourse_course_id_9f1eab2e_fk_courses_courses_id`(`course_id`) USING BTREE,
  INDEX `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_courses_id` FOREIGN KEY (`course_id`) REFERENCES `courses_courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES (1, '2019-01-21 10:34:00.000000', 13, 1);
INSERT INTO `operation_usercourse` VALUES (2, '2019-01-21 16:47:42.390251', 12, 1);
INSERT INTO `operation_usercourse` VALUES (3, '2019-01-22 10:37:07.390729', 4, 1);
INSERT INTO `operation_usercourse` VALUES (4, '2019-01-22 15:46:22.176162', 1, 1);
INSERT INTO `operation_usercourse` VALUES (5, '2019-01-24 20:20:58.451004', 10, 1);
INSERT INTO `operation_usercourse` VALUES (6, '2019-01-24 20:21:07.804962', 8, 1);
INSERT INTO `operation_usercourse` VALUES (7, '2019-01-24 20:21:27.561136', 11, 1);
INSERT INTO `operation_usercourse` VALUES (8, '2019-01-25 10:02:39.885668', 9, 1);
INSERT INTO `operation_usercourse` VALUES (9, '2019-01-25 10:30:07.061003', 7, 1);
INSERT INTO `operation_usercourse` VALUES (10, '2019-01-25 10:31:17.028694', 5, 1);

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES (19, 1, 3, '2019-01-24 16:45:35.446536', 1);
INSERT INTO `operation_userfavorite` VALUES (25, 1, 1, '2019-01-24 19:12:53.077092', 1);
INSERT INTO `operation_userfavorite` VALUES (26, 1, 2, '2019-01-24 19:12:54.498289', 1);
INSERT INTO `operation_userfavorite` VALUES (27, 13, 1, '2019-01-25 09:57:22.618230', 1);
INSERT INTO `operation_userfavorite` VALUES (28, 7, 2, '2019-01-25 09:57:36.142984', 1);
INSERT INTO `operation_userfavorite` VALUES (29, 9, 1, '2019-01-25 10:02:38.974807', 1);

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES (1, 1, '欢迎注册', 1, '2019-01-24 17:36:00.000000');
INSERT INTO `operation_usermessage` VALUES (3, 1, '算得上是', 1, '2019-01-24 20:05:00.000000');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES (1, '北京市', '北京市', '2019-01-17 09:51:00.000000');
INSERT INTO `organization_citydict` VALUES (2, '上海市', '上海市', '2019-01-17 09:51:00.000000');
INSERT INTO `organization_citydict` VALUES (3, '广州市', '广州市', '2019-01-17 09:51:00.000000');
INSERT INTO `organization_citydict` VALUES (4, '天津市', '天津市', '2019-01-17 09:52:00.000000');
INSERT INTO `organization_citydict` VALUES (5, '成都市', '成都市', '2019-01-17 09:52:00.000000');
INSERT INTO `organization_citydict` VALUES (6, '南京市', '南京市', '2019-01-17 10:12:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `catgory` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_courseo_city_id_4a842f85_fk_organizat`(`city_id`) USING BTREE,
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES (1, '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。\r\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2019/01/imooc_PVa3rYn.png', '北京市海淀区中关村北大街', '2019-01-17 09:52:00.000000', 1, 'pxjg', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (2, '慕课网3', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\\r\\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \\r\\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 1, 0, 'org/2019/01/imooc_klgAUn5.png', '广州市慕课网', '2019-01-17 10:06:00.000000', 3, 'pxjg', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (3, '慕课网2', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\\r\\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \\r\\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2019/01/imooc_Gn1sRjp_PZLxlSY.png', '上海市慕课网', '2019-01-17 10:08:00.000000', 2, 'gr', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (4, '慕课网4', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\\r\\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \\r\\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2019/01/imooc_OO2ykYP.png', '天津市慕课网', '2019-01-17 10:08:00.000000', 4, 'pxjg', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (5, '慕课网5', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\\r\\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \\r\\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 1, 0, 'org/2019/01/imooc_V0TJOyb.png', '成都市慕课网', '2019-01-17 10:09:00.000000', 5, 'pxjg', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (6, '北京大学', '北京大学（Peking University），简称“北大”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、京港大学联盟、亚洲大学联盟、东亚研究型大学协会、国际研究型大学联盟、环太平洋大学联盟、东亚四大学论坛、国际公立大学论坛、中俄综合性大学联盟成员。\r\n北京大学创立于1898年维新变法之际，初名京师大学堂，是中国近现代第一所国立综合性大学，创办之初也是国家最高教育行政机关。1912年改为国立北京大学。1937年南迁至长沙，与国立清华大学和私立南开大学组成国立长沙临时大学，1938年迁至昆明，更名为国立西南联合大学。1946年复员返回北平。1952年经全国高校院系调整，成为以文理基础学科为主的综合性大学，并自北京城内沙滩等地迁至现址。2000年与原北京医科大学合并，组建为新的北京大学。', 0, 0, 'org/2019/01/bjdx.jpg', '北京市海淀区颐和园路5号', '2019-01-17 10:09:00.000000', 1, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (7, '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、东亚研究型大学协会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉为“红色工程师的摇篮”。\r\n清华大学的前身清华学堂始建于1911年，因水木清华而得名，是清政府设立的留美预备学校，其建校的资金源于1908年美国退还的部分庚子赔款。1912年更名为清华学校。1928年更名为国立清华大学。1937年抗日战争全面爆发后南迁长沙，与北京大学、南开大学组建国立长沙临时大学，1938年迁至昆明改名为国立西南联合大学。1946年迁回清华园。1949年中华人民共和国成立，清华大学进入了新的发展阶段。1952年全国高等学校院系调整后成为多科性工业大学。1978年以来逐步恢复和发展为综合性的研究型大学。', 1, 1, 'org/2019/01/qhdx-logo.png', '北京市海淀区清华大学', '2019-01-17 10:10:00.000000', 1, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (8, '南京大学', '南京大学（Nanjing University），简称“南大”，是中华人民共和国教育部直属、中央直管副部级建制的综合性全国重点大学，是历史悠久、声誉卓著的百年名校。位列首批国家“双一流“世界一流大学A类建设高校、”211工程“、”985工程”，入选“珠峰计划”、“111计划”、“2011计划”、“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“卓越法律人才教育培养计划”，是九校联盟、中国大学校长联谊会、环太平洋大学联盟、21世纪学术联盟和东亚研究型大学协会成员。 [1] \r\n南京大学其学脉可追溯自孙吴永安元年（258年）的南京太学，近代校史肇始于1902年创建的三江师范学堂，此后历经两江师范学堂、南京高等师范学校、国立东南大学等历史时期，1949年由民国时期中国最高学府“国立中央大学”易名“国立南京大学”，1950年径称“南京大学”并沿用至今。1920年在中国国立高等学府中首开“女禁”，引领男女同校之风。最早在中国开展现代学术研究，建立中国最早的现代科学研究实验室，成为中国第一所以大学自治、学术自由、文理为基本兼有农工商等专门应用科、集教学和研究于一体的现代大学，被国际上誉为“东方教育的中心”', 0, 0, 'org/2019/01/njdx.jpg', '南京市鼓楼区汉口路22号', '2019-01-17 10:11:00.000000', 6, 'pxjg', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (9, '慕课网6', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\\r\\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \\r\\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2019/01/imooc_Y2Tonsq.png', '南京市慕课网', '2019-01-17 10:13:00.000000', 6, 'pxjg', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (10, '慕课网1', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\\r\\n    慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \\r\\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。', 0, 0, 'org/2019/01/imooc_Gn1sRjp_INE1Mxh.png', '北京市海淀区中关村北大街', '2019-01-17 10:13:00.000000', 1, 'pxjg', 0, 0, '全国知名');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_teacher_org_id_cd000a1a_fk_organizat`(`org_id`) USING BTREE,
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES (1, 'bluusli', 5, 'xxx', 'xxx', 'xxx', 2, 0, '2019-01-18 09:50:00.000000', 1, 'teacher/2019/01/default_middile_1.png', 20);
INSERT INTO `organization_teacher` VALUES (2, 'bobby', 3, '北京慕课', '讲师', 'xxx', 4, 0, '2019-01-18 09:51:00.000000', 2, 'teacher/2019/01/aobama.png', 20);

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES (1, '第一个', 'banner/2019/01/57a801860001c34b12000460.jpg', 'http://www.imooc.com', 1, '2019-01-25 10:17:00.000000');
INSERT INTO `users_banner` VALUES (2, '第二个', 'banner/2019/01/57aa86a0000145c512000460.jpg', 'http://www.imooc.com', 2, '2019-01-25 10:19:00.000000');
INSERT INTO `users_banner` VALUES (3, '第三个', 'banner/2019/01/57aa86a0000145c512000460_nMwvoQD.jpg', 'http://www.imooc.com', 3, '2019-01-25 10:19:00.000000');
INSERT INTO `users_banner` VALUES (4, '第四个', 'banner/2019/01/57a801860001c34b12000460_z4Vb8zl.jpg', 'http://www.imooc.com', 4, '2019-01-25 10:19:00.000000');
INSERT INTO `users_banner` VALUES (5, '第五个', 'banner/2019/01/57aa86a0000145c512000460_s3w2EtL.jpg', 'http://www.imooc.com', 5, '2019-01-25 10:20:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` int(11) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES (1, 'admin', '123@qq.com', 1, '2019-01-14 19:10:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES (2, 'fuck', '321@qq.com', 1, '2019-01-14 19:20:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES (3, '', 'bluus_li@vip.sina.com', 1, '2019-01-15 17:50:27.161519');
INSERT INTO `users_emailverifyrecord` VALUES (4, '', 'bluus_li@vip.sina.com', 1, '2019-01-15 19:27:52.798368');
INSERT INTO `users_emailverifyrecord` VALUES (5, '', 'bluus_li@sina.com', 1, '2019-01-15 19:38:13.409483');
INSERT INTO `users_emailverifyrecord` VALUES (6, '', '2@2.com', 1, '2019-01-15 19:47:39.872417');
INSERT INTO `users_emailverifyrecord` VALUES (7, '', 'bluus_li@sina.com', 1, '2019-01-16 09:50:01.468800');
INSERT INTO `users_emailverifyrecord` VALUES (8, 'ZsHsFMZPnqaoRtBF', 'bluus_li@sina.com', 1, '2019-01-16 10:00:42.554383');
INSERT INTO `users_emailverifyrecord` VALUES (9, '1CVoio3nLngjGoFg', 'bluus_li@sina.com', 1, '2019-01-16 10:03:18.203155');
INSERT INTO `users_emailverifyrecord` VALUES (10, '74cJk0ol4ezjjIGZ', 'bluus_li@sina.com', 1, '2019-01-16 10:05:42.945122');
INSERT INTO `users_emailverifyrecord` VALUES (11, '0Pqp4FGptXOYHCNR', 'bluus_li@sina.com', 2, '2019-01-16 11:44:17.692881');
INSERT INTO `users_emailverifyrecord` VALUES (12, 'd10okDay7J7nQPdT', 'bluus_li@sina.com', 2, '2019-01-16 17:31:55.202555');
INSERT INTO `users_emailverifyrecord` VALUES (13, 'UFPoGrwcA2Ggzc4S', 'bluus_li@sina.com', 3, '2019-01-24 11:43:40.568206');
INSERT INTO `users_emailverifyrecord` VALUES (14, 'miqz', 'bluus_li@sina.com', 3, '2019-01-24 11:45:07.876747');
INSERT INTO `users_emailverifyrecord` VALUES (15, 'f8SkwozkpheF4qt7', 'bluus_li@sina.com', 2, '2019-01-25 11:26:29.806923');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birday` date NULL DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$36000$6LJrZFs0hx6y$Z9uzKIILbfaIXwwJ2FYuzabvIH/DBfE6Y4kd/mkhIp4=', '2019-01-25 10:45:11.138856', 1, 'bluusli', '', '', '', 1, 1, '2019-01-14 08:06:03.522705', '管理员', '1998-01-01', 1, '四川成都', NULL, 'image/2019/01/default_middile_7.png');
INSERT INTO `users_userprofile` VALUES (2, 'pbkdf2_sha256$36000$YZMCwTPXAQ2X$o0SqVGxAALnR9xuVJOntgvd3TqT2r94A0eIz0d/zcgE=', '2019-01-25 10:44:35.920791', 0, 'bluus_li@sina.com', '', '', 'bluus_li@sina.com', 0, 1, '2019-01-16 10:05:42.854391', 'bluusli', '2013-01-07', 2, '四川成都', NULL, 'image/2019/01/default_middile_8_zeQCfFT.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2019-01-14 19:10:31.848102', '127.0.0.1', '1', 'EmailVerifyRecord object', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (2, '2019-01-14 19:20:37.865258', '127.0.0.1', '2', 'fuck(321@qq.com)', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (3, '2019-01-14 19:37:53.441286', '127.0.0.1', '1', 'Courses object', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (4, '2019-01-17 09:51:38.507697', '127.0.0.1', '1', '北京市', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (5, '2019-01-17 09:51:52.814304', '127.0.0.1', '2', '上海市', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (6, '2019-01-17 09:52:05.609257', '127.0.0.1', '3', '广州市', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (7, '2019-01-17 09:52:19.676397', '127.0.0.1', '4', '天津市', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (8, '2019-01-17 09:52:28.725804', '127.0.0.1', '5', '成都市', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (9, '2019-01-17 09:58:21.112734', '127.0.0.1', '1', '慕课网', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (10, '2019-01-17 10:05:20.092612', '127.0.0.1', '1', '慕课网', 'change', '修改 image 和 address', 15, 1);
INSERT INTO `xadmin_log` VALUES (11, '2019-01-17 10:07:25.482367', '127.0.0.1', '2', '慕课网2', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (12, '2019-01-17 10:07:46.771561', '127.0.0.1', '2', '慕课网3', 'change', '修改 name，image 和 address', 15, 1);
INSERT INTO `xadmin_log` VALUES (13, '2019-01-17 10:08:38.288639', '127.0.0.1', '3', '慕课网2', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (14, '2019-01-17 10:09:18.320590', '127.0.0.1', '4', '慕课网4', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (15, '2019-01-17 10:09:31.893768', '127.0.0.1', '5', '慕课网5', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (16, '2019-01-17 10:10:49.172674', '127.0.0.1', '6', '北京大学', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (17, '2019-01-17 10:11:45.917045', '127.0.0.1', '7', '清华大学', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (18, '2019-01-17 10:12:47.632409', '127.0.0.1', '6', '南京市', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (19, '2019-01-17 10:12:49.711372', '127.0.0.1', '8', '南京大学', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (20, '2019-01-17 10:13:46.062409', '127.0.0.1', '9', '慕课网6', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (21, '2019-01-17 10:14:32.913948', '127.0.0.1', '10', '慕课网1', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (22, '2019-01-18 09:51:13.363203', '127.0.0.1', '1', 'Teacher object', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (23, '2019-01-18 09:52:38.310988', '127.0.0.1', '2', 'bobby', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (24, '2019-01-18 09:56:25.328037', '127.0.0.1', '1', 'django', 'change', '修改 image', 10, 1);
INSERT INTO `xadmin_log` VALUES (25, '2019-01-18 14:10:49.416212', '127.0.0.1', '2', 'bobby', 'change', '修改 image', 13, 1);
INSERT INTO `xadmin_log` VALUES (26, '2019-01-18 14:11:05.513857', '127.0.0.1', '1', 'bluusli', 'change', '修改 image', 13, 1);
INSERT INTO `xadmin_log` VALUES (27, '2019-01-18 16:38:55.337355', '127.0.0.1', '2', 'Java入门', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (28, '2019-01-18 16:40:50.573942', '127.0.0.1', '3', 'MySQL复制功能', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (29, '2019-01-18 16:43:04.005000', '127.0.0.1', '4', 'Python入门(一)', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (30, '2019-01-18 16:43:54.651922', '127.0.0.1', '5', 'Python入门(二)', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (31, '2019-01-18 16:44:28.873547', '127.0.0.1', '6', 'Python入门(三)', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (32, '2019-01-18 16:45:02.558545', '127.0.0.1', '7', 'Python入门(四)', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (33, '2019-01-18 16:45:38.983892', '127.0.0.1', '8', 'Python入门(五)', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (34, '2019-01-18 16:48:02.771018', '127.0.0.1', '9', 'Java入门(二)', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (35, '2019-01-18 16:48:37.920887', '127.0.0.1', '10', 'Java入门(三)', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (36, '2019-01-18 16:50:01.156962', '127.0.0.1', '11', 'Python面向对象', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (37, '2019-01-18 16:51:47.777837', '127.0.0.1', '12', 'Python文件处理', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (38, '2019-01-18 16:53:06.007783', '127.0.0.1', '13', 'Python的错误和异常', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (39, '2019-01-21 10:36:06.321256', '127.0.0.1', '1', 'UserCourse object', 'create', '已添加。', 19, 1);
INSERT INTO `xadmin_log` VALUES (40, '2019-01-21 14:52:33.539511', '127.0.0.1', '1', '第一章 基础知识', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (41, '2019-01-21 14:52:46.212629', '127.0.0.1', '2', '第二章 进阶开发', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (42, '2019-01-21 14:56:11.073903', '127.0.0.1', '1', 'Video object', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (43, '2019-01-21 14:57:20.363646', '127.0.0.1', '2', 'Video object', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (44, '2019-01-21 14:57:31.872875', '127.0.0.1', '3', 'Video object', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (45, '2019-01-21 14:57:42.929316', '127.0.0.1', '4', 'Video object', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (46, '2019-01-21 15:09:49.719148', '127.0.0.1', '4', 'Video object', 'change', '修改 learn_time', 9, 1);
INSERT INTO `xadmin_log` VALUES (47, '2019-01-21 15:09:55.030945', '127.0.0.1', '3', 'Video object', 'change', '修改 learn_time', 9, 1);
INSERT INTO `xadmin_log` VALUES (48, '2019-01-21 15:09:59.307507', '127.0.0.1', '2', 'Video object', 'change', '修改 learn_time', 9, 1);
INSERT INTO `xadmin_log` VALUES (49, '2019-01-21 15:10:03.789529', '127.0.0.1', '1', 'Video object', 'change', '修改 learn_time', 9, 1);
INSERT INTO `xadmin_log` VALUES (50, '2019-01-21 15:18:08.723986', '127.0.0.1', '1', 'CourseResource object', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (51, '2019-01-24 17:37:47.151477', '127.0.0.1', '1', 'UserMessage object', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (52, '2019-01-24 20:05:13.239430', '127.0.0.1', '3', 'UserMessage object', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (53, '2019-01-25 10:19:19.757184', '127.0.0.1', '1', 'Banner object', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (54, '2019-01-25 10:19:37.204700', '127.0.0.1', '2', 'Banner object', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (55, '2019-01-25 10:19:52.355591', '127.0.0.1', '3', 'Banner object', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (56, '2019-01-25 10:20:02.553621', '127.0.0.1', '4', 'Banner object', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (57, '2019-01-25 10:20:12.107584', '127.0.0.1', '5', 'Banner object', 'create', '已添加。', 7, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
INSERT INTO `xadmin_usersettings` VALUES (2, 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
