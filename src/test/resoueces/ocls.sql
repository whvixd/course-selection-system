/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : ocls

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-06-08 15:54:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ocls_admin
-- ----------------------------
DROP TABLE IF EXISTS `ocls_admin`;
CREATE TABLE `ocls_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) NOT NULL,
  `anum` varchar(12) NOT NULL,
  `apwd` varchar(255) NOT NULL,
  `aemail` varchar(255) DEFAULT NULL,
  `aother` varchar(255) DEFAULT NULL,
  `aphoto` varchar(255) DEFAULT NULL,
  `apower` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_admin
-- ----------------------------
INSERT INTO `ocls_admin` VALUES ('1', '001', 'skdadmin001', '654321', 'kong', 'kong', 'kong', '1');
INSERT INTO `ocls_admin` VALUES ('2', '002', 'skdadmin002', '123456', 'kong', 'kong', 'kong', '1');
INSERT INTO `ocls_admin` VALUES ('3', '003', 'skdadmin003', '123456', 'kong', 'kong', 'kong', '1');
INSERT INTO `ocls_admin` VALUES ('4', '004', 'skdadmin004', '123456', 'kong', 'kong', 'kong', '2');
INSERT INTO `ocls_admin` VALUES ('5', '005', 'skdadmin005', '123456', 'kong', 'kong', 'kong', '2');
INSERT INTO `ocls_admin` VALUES ('6', '006', 'skdadmin006', '123456', 'kong', 'kong', 'kong', '2');
INSERT INTO `ocls_admin` VALUES ('7', '111', 'skdadmin111', '123456', 'kong', 'kong', 'kong', '3');

-- ----------------------------
-- Table structure for ocls_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `ocls_blacklist`;
CREATE TABLE `ocls_blacklist` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `bf1` (`sid`),
  KEY `bf2` (`tid`),
  KEY `bf3` (`cid`),
  CONSTRAINT `bf1` FOREIGN KEY (`sid`) REFERENCES `ocls_student` (`sid`),
  CONSTRAINT `bf2` FOREIGN KEY (`tid`) REFERENCES `ocls_teacher` (`tid`),
  CONSTRAINT `bf3` FOREIGN KEY (`cid`) REFERENCES `ocls_course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_blacklist
-- ----------------------------
INSERT INTO `ocls_blacklist` VALUES ('1', '4', '2', '2');
INSERT INTO `ocls_blacklist` VALUES ('3', '10', '5', '2');
INSERT INTO `ocls_blacklist` VALUES ('4', '30', '5', '2');
INSERT INTO `ocls_blacklist` VALUES ('5', '14', '5', '2');
INSERT INTO `ocls_blacklist` VALUES ('6', '41', '5', '2');

-- ----------------------------
-- Table structure for ocls_course
-- ----------------------------
DROP TABLE IF EXISTS `ocls_course`;
CREATE TABLE `ocls_course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  `tname` varchar(255) NOT NULL,
  `tid` int(11) NOT NULL,
  `cintro` varchar(255) DEFAULT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cphoto` varchar(255) DEFAULT NULL,
  `chot` int(11) DEFAULT NULL,
  `cfenlei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `cf1` (`tid`),
  CONSTRAINT `cf1` FOREIGN KEY (`tid`) REFERENCES `ocls_teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_course
-- ----------------------------
INSERT INTO `ocls_course` VALUES ('2', '网络技术', '任炳忠', '2', 'kong', '2017-05-06 19:04:58', 'kong', '0', '1');
INSERT INTO `ocls_course` VALUES ('5', '数据库系统', '杜小勇', '3', '大数据时代，数据库技术面临空前挑战。如何拓展研究和应用领域，使数据库技术在大数据浪潮中快速发展？ 本课程由中国人民大学数据库技术权威专家团队为你厘清大数据概念，并介绍数据库技术最前沿进展，让你一览大数据时代的数据库技术发展脉络。', '2017-05-06 19:05:00', 'shujukuxitong.png', '13', '1');
INSERT INTO `ocls_course` VALUES ('6', 'Python', '张丽', '4', '本课程主要面向非计算机专业学习者，不局限某个专业和学历层次，需要一些程序设计的基本概念', '2017-05-06 19:05:01', 'Python.png', '6', '1');
INSERT INTO `ocls_course` VALUES ('8', 'Java语言', '翁凯', '5', '用对象思考，用类来写作。Java语言是一种面向对象语言，是业界使用最为广泛的语言，十二年前就占据了1/4的编程语言份额，到今天仍然以1/5的比例站在编程语言排行榜的前列。Java是优秀的面向对象编程语言，特别适合构建多人协作的大型软件产品。', '2017-05-19 20:14:29', 'javayuyan.png', '3', '1');
INSERT INTO `ocls_course` VALUES ('9', '计算机专业导论', '杜小勇', '3', '计算机专业导论课程既是计算机专业的入门课程，又是计算机专业学习的指南。计算机专业是做什么的，仅仅是“用计算机语言编程序”吗？计算机专业学生毕业后将做什么样的工作？在计算机专业又能学到什么课程，为什么要学习这些课程，这些课程对学生毕业后会有什么影响？这些问题都将在本课程中为你回答！', '2017-05-06 19:05:02', 'jisuanjizhuanyedaolun.png', '7', '1');
INSERT INTO `ocls_course` VALUES ('10', '软件工程专业导论', '任炳忠', '2', '软件工程是研究或应用工程化方法创造、构建和维护高质量软件的学科。本课程以软件工程概念、问题、思维、理论与技术为主线，深入浅出地介绍了软件工程学科与知识体系、计算思维、程序与算法、软件系统构造、软件需求、软件设计、软件工程技术、软件管理等内容；还介绍了软件工程课程体系及其学习方法。', '2017-05-06 19:05:04', 'ruanjiangongchengzhuanyedaolun.png', '4', '1');
INSERT INTO `ocls_course` VALUES ('11', '大学计算机实验', '张丽', '4', '“大学计算机实验”是高等学校计算机公共教学的重要组成部分，是和计算思维理论教学相结合的实验课程，也可以作为计算机应用基础独立课程开设。课程以培养学生计算机应用能力为主线进行课程内容设置，内容分为六个模块，包括：计算机系统与虚拟化技术，办公软件的应用，多媒体处理，计算机编程，计算机网络配置与管理，互联网及其应用。课程的教学目标是：全面培养学生的计算机应用能力，培养学生的问题分析与求解能力，培养学生的计算思维与信息素养。最终提高学生的计算机问题求解能力和计算机应用水平。', '2017-05-06 19:05:04', 'daxuejisuanjishiyan.png', '7', '1');
INSERT INTO `ocls_course` VALUES ('12', '网络技术与应用', '杜小勇', '3', '《网络技术与应用》是一门应用型课程，课程完整系统地介绍计算机网络领域中的基本概念、基本知识和基本原理。教学内容紧密结合新版全国计算机等级考试三级——网络技术、CCNA路由和交换认证的考试要求。教学过程中引进Cisco Packet Tracer仿真平台，帮助学生掌握思科设备的配置方法和配置过程，采用案例牵引的教学方法，在实际的网络环境中讲解网络技术和议工作过程。', '2017-05-24 16:05:45', 'wangluojishuyuyingyong.png', '3', '1');
INSERT INTO `ocls_course` VALUES ('13', 'Python机器学习应用', '翁凯', '5', '人工智能（AI）如何建立呢？通过逻辑推理，还是通过学习模仿？近年来的发展看，机器学习似乎略胜一筹，机器学习建立智能，应用人工智能去解决问题吧！ ——“弹指之间·享受创新”，通过4周学习，你将掌握通过Python语言运用机器学习算法解决一般问题的基本能力。', '2017-05-20 16:55:38', 'pythonjiqi.png', '42', '1');
INSERT INTO `ocls_course` VALUES ('14', '“互联网+”时代教师个人知识管理', '翁凯', '5', '互联网时代，知识的半衰期越来越短。教师在面对海量的信息时，对信息进行快速搜索、收集、关联、加工、集成并在教学中应用的能力相对缺乏。本课程旨在为教师提供个人知识管理的解决思路、方法和工具，帮助老师快速建构自己的知识体系，并能在教学与科研中灵活应用。', '2017-05-20 16:54:01', '1495200710569hulianwangjia.png', '11', '1');
INSERT INTO `ocls_course` VALUES ('15', '数据结构', '翁凯', '5', '学了一门编程语言不知道能干啥？来学数据结构就对啦！ 学会编程相当于会砌猪圈的泥瓦匠，学完数据结构就会盖个双层小楼啦~ 同时还可以一窥构筑摩天大厦的奇门武功！ 欢迎勤奋的小白活泼乱入！十周修炼，得入门径，一代大侠，从此出发 —— 快来吧~ ^_^', '2017-05-20 16:54:05', '1495201467696shujujiegou.png', '12', '1');
INSERT INTO `ocls_course` VALUES ('16', '从自然世界到智能时代', '翁凯', '5', '\"道法自然”——借鉴自然界信息处理机制设计智能计算新方法，是智能科学与技术研究的重要的研究哲学思想。本课程从自然界丰富多彩的“自然智能”到模拟自然的“机器智能”，从形式多样的“智能系统”到日新月异的“智能前沿”，展开一幅横跨生物、医学、遗传、社会与智能科技等学科之间知识关联图。', '2017-05-20 16:54:07', '1495203811245zhinengshidai.png', '13', '1');
INSERT INTO `ocls_course` VALUES ('17', '高级语言程序设计', '翁凯', '5', '本课程面向无编程基础的学生，使其掌握程序设计的基本概念、思想和方法，并培养其计算思维能力。通过本课程的学习，学生能够掌握C语言的基本语法、结构化程序设计思想和方法，养成良好的程序设计风格；最终能在这些方法和思想的指导下，不受编程语言限制，随心写出解决实际问题的程序。', '2017-05-20 16:54:10', '1495203936035gaoji.png', '34', '1');
INSERT INTO `ocls_course` VALUES ('21', '计算机操作系统', '翁凯', '5', '1946年第一台计算机面世之后，科学家与工程师们一直致力于让计算机更好地为人类工作，一代又一代操作系统因此应运而生。操作系统是计算机系统的灵魂，它管理计算机系统的资源，提供友善的人机互动，对于每一位计算机用户来说，认知和理解操作系统非常重要。', '2017-05-20 16:54:12', '1495216938579jisuanjiczxt.png', '34', '1');
INSERT INTO `ocls_course` VALUES ('22', '计算机系统基础：程序的执行和存储访问', '翁凯', '5', '在“计算机系统基础（一）：程序的表示、转换与链接\"课程中，你学习了可执行文件的生成。接下来，你是否很想知道可执行文件是如何运行、指令和数据是如何存放和被访问的呢？如果是的话，那么就请你参加“计算机系统基础（二）：程序的执行和存储访问\"课程学习吧！', '2017-05-20 16:55:09', '1495267604273xitongjichu.png', '2', '1');
INSERT INTO `ocls_course` VALUES ('23', '数据库系统（下）：管理与技术', '翁凯', '5', '《数据库系统》不仅是计算机、软件工程等专业的核心课程，而且也是非计算机专业学生必修的信息技术课程。当前互联网+与大数据，一切都建立在数据库之上，以数据说话，首先需要聚集数据、需要分析和管理数据。数据库技术已成为各种计算系统的核心技术，数据库相关知识也已成为每个人必须掌握的知识。', '2017-05-20 16:54:16', '1495267728719shujukxia.png', '12', '1');
INSERT INTO `ocls_course` VALUES ('24', '信息系统与数据库技术', '翁凯', '5', '这门课融合了信息管理、数据库技术、软件工程、程序开发等相关知识，用解剖麻雀式的教学和实践案例带领学习者快速了解从信息需求发现到信息系统分析、设计和实现的全景过程，培养计算机综合应用能力。先学习盖个自己的信息小木屋吧，然后去探索互联网+的无限可能！', '2017-05-20 16:54:19', '1495267787619xinxixitongyushujukujishu.png', '23', '1');
INSERT INTO `ocls_course` VALUES ('25', '程序设计基础（C&C++）', '翁凯', '5', '本课程适合没有编程基础或者学习了Ｃ或者Ｃ＋＋语言，仍然不能根据问题独立编写程序的初学者。从理论到实践，从分析问题，寻找解题思路，到编程、调试、运行，都借助于实际案例进行展示。特别是初期的编译错误，后期的运行错误，通过视频一步步的演示学会编程方法与调试技术。', '2017-05-20 16:10:40', '1495267840863cxsjcacjj.png', '0', '1');

-- ----------------------------
-- Table structure for ocls_favorite
-- ----------------------------
DROP TABLE IF EXISTS `ocls_favorite`;
CREATE TABLE `ocls_favorite` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `ff1` (`sid`),
  KEY `ff2` (`cid`),
  CONSTRAINT `ff1` FOREIGN KEY (`sid`) REFERENCES `ocls_student` (`sid`),
  CONSTRAINT `ff2` FOREIGN KEY (`cid`) REFERENCES `ocls_course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_favorite
-- ----------------------------
INSERT INTO `ocls_favorite` VALUES ('3', '5', '网络技术', '2');
INSERT INTO `ocls_favorite` VALUES ('5', '4', '数据库系统', '5');
INSERT INTO `ocls_favorite` VALUES ('6', '4', 'Python', '6');
INSERT INTO `ocls_favorite` VALUES ('8', '4', 'Java语言', '8');
INSERT INTO `ocls_favorite` VALUES ('13', '4', '软件工程专业导论', '10');
INSERT INTO `ocls_favorite` VALUES ('30', '4', '网络技术与应用', '12');
INSERT INTO `ocls_favorite` VALUES ('31', '6', null, '25');
INSERT INTO `ocls_favorite` VALUES ('32', '7', null, '25');
INSERT INTO `ocls_favorite` VALUES ('33', '8', null, '25');
INSERT INTO `ocls_favorite` VALUES ('34', '9', null, '25');
INSERT INTO `ocls_favorite` VALUES ('35', '10', null, '25');
INSERT INTO `ocls_favorite` VALUES ('36', '11', null, '25');
INSERT INTO `ocls_favorite` VALUES ('37', '12', null, '25');
INSERT INTO `ocls_favorite` VALUES ('38', '13', null, '25');
INSERT INTO `ocls_favorite` VALUES ('39', '14', null, '25');
INSERT INTO `ocls_favorite` VALUES ('40', '15', null, '25');
INSERT INTO `ocls_favorite` VALUES ('41', '16', null, '25');
INSERT INTO `ocls_favorite` VALUES ('42', '17', null, '25');
INSERT INTO `ocls_favorite` VALUES ('43', '4', null, '13');
INSERT INTO `ocls_favorite` VALUES ('44', '5', null, '13');
INSERT INTO `ocls_favorite` VALUES ('45', '6', null, '12');
INSERT INTO `ocls_favorite` VALUES ('46', '7', null, '12');
INSERT INTO `ocls_favorite` VALUES ('47', '8', null, '13');
INSERT INTO `ocls_favorite` VALUES ('48', '9', null, '13');
INSERT INTO `ocls_favorite` VALUES ('49', '10', null, '13');
INSERT INTO `ocls_favorite` VALUES ('50', '11', null, '13');
INSERT INTO `ocls_favorite` VALUES ('51', '18', null, '16');
INSERT INTO `ocls_favorite` VALUES ('52', '19', null, '16');
INSERT INTO `ocls_favorite` VALUES ('53', '20', null, '25');
INSERT INTO `ocls_favorite` VALUES ('54', '21', null, '22');
INSERT INTO `ocls_favorite` VALUES ('55', '22', null, '25');
INSERT INTO `ocls_favorite` VALUES ('56', '23', null, '25');
INSERT INTO `ocls_favorite` VALUES ('57', '24', null, '25');
INSERT INTO `ocls_favorite` VALUES ('58', '25', null, '25');
INSERT INTO `ocls_favorite` VALUES ('59', '26', null, '25');
INSERT INTO `ocls_favorite` VALUES ('60', '27', null, '25');
INSERT INTO `ocls_favorite` VALUES ('61', '28', null, '25');
INSERT INTO `ocls_favorite` VALUES ('62', '29', null, '25');
INSERT INTO `ocls_favorite` VALUES ('63', '30', null, '25');
INSERT INTO `ocls_favorite` VALUES ('64', '31', null, '25');
INSERT INTO `ocls_favorite` VALUES ('65', '32', null, '25');
INSERT INTO `ocls_favorite` VALUES ('66', '32', null, '25');
INSERT INTO `ocls_favorite` VALUES ('67', '33', null, '25');
INSERT INTO `ocls_favorite` VALUES ('68', '34', null, '25');
INSERT INTO `ocls_favorite` VALUES ('69', '35', null, '25');
INSERT INTO `ocls_favorite` VALUES ('70', '36', null, '25');
INSERT INTO `ocls_favorite` VALUES ('71', '37', null, '25');
INSERT INTO `ocls_favorite` VALUES ('72', '38', null, '25');
INSERT INTO `ocls_favorite` VALUES ('73', '39', null, '25');
INSERT INTO `ocls_favorite` VALUES ('74', '40', null, '25');
INSERT INTO `ocls_favorite` VALUES ('75', '41', null, '25');
INSERT INTO `ocls_favorite` VALUES ('76', '42', null, '25');
INSERT INTO `ocls_favorite` VALUES ('77', '43', null, '25');
INSERT INTO `ocls_favorite` VALUES ('78', '44', null, '25');
INSERT INTO `ocls_favorite` VALUES ('79', '44', null, '25');
INSERT INTO `ocls_favorite` VALUES ('80', '45', null, '25');
INSERT INTO `ocls_favorite` VALUES ('81', '46', null, '25');
INSERT INTO `ocls_favorite` VALUES ('82', '47', null, '25');
INSERT INTO `ocls_favorite` VALUES ('83', '48', null, '25');
INSERT INTO `ocls_favorite` VALUES ('84', '49', null, '25');
INSERT INTO `ocls_favorite` VALUES ('85', '50', null, '25');
INSERT INTO `ocls_favorite` VALUES ('86', '51', null, '25');
INSERT INTO `ocls_favorite` VALUES ('87', '52', null, '25');
INSERT INTO `ocls_favorite` VALUES ('88', '53', null, '25');
INSERT INTO `ocls_favorite` VALUES ('90', '4', '计算机操作系统', '21');

-- ----------------------------
-- Table structure for ocls_infofteacher
-- ----------------------------
DROP TABLE IF EXISTS `ocls_infofteacher`;
CREATE TABLE `ocls_infofteacher` (
  `infid` int(11) NOT NULL AUTO_INCREMENT,
  `infname` varchar(255) NOT NULL,
  `infsex` varchar(255) NOT NULL,
  `infnation` varchar(255) NOT NULL,
  `infpolitical` varchar(255) NOT NULL,
  `infposition` varchar(255) NOT NULL,
  `infnum` varchar(12) NOT NULL,
  PRIMARY KEY (`infid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_infofteacher
-- ----------------------------
INSERT INTO `ocls_infofteacher` VALUES ('4', '任炳忠', '男', '汉', '党员', '讲师', 'sklaoshi001');
INSERT INTO `ocls_infofteacher` VALUES ('5', '杜小勇', '男', '汉', '党员', '讲师', 'sklaoshi002');
INSERT INTO `ocls_infofteacher` VALUES ('6', '张丽', '女', '汉', '党员', '讲师', 'sklaoshi003');
INSERT INTO `ocls_infofteacher` VALUES ('7', '翁凯', '男', '汉', '党员', '讲师', 'sklaoshi004');

-- ----------------------------
-- Table structure for ocls_message
-- ----------------------------
DROP TABLE IF EXISTS `ocls_message`;
CREATE TABLE `ocls_message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) NOT NULL,
  `sid` int(11) NOT NULL,
  `mcontent` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`),
  KEY `mf1` (`sid`),
  KEY `mf2` (`pid`),
  CONSTRAINT `mf1` FOREIGN KEY (`sid`) REFERENCES `ocls_student` (`sid`),
  CONSTRAINT `mf2` FOREIGN KEY (`pid`) REFERENCES `ocls_part` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_message
-- ----------------------------
INSERT INTO `ocls_message` VALUES ('1', '董世行', '4', '老师这个问题是为什么？', '2', '2017-05-09 12:23:59');
INSERT INTO `ocls_message` VALUES ('2', '董世行', '4', '中国人对茶与水、器的关系有诸多论述，明代许次纾言：“茶滋于水，水籍乎器，汤成于火，四者相须，缺一则废”。请结合课程讲述以及实践体验，老师有什么看法。', '11', '2017-05-09 12:51:20');
INSERT INTO `ocls_message` VALUES ('3', '董世行', '4', '\"茶滋于水，水籍乎器，汤成于火，四者相须，缺一则废。\"（明许次纾《茶疏》）茶、水、器、火四者是一个统一体，互为因果，互相作用，缺一不可。茶与水成为茶汤的过程是通过器完成的，汤的香气、色泽、味道是通过火（现在主要是水温）来完成的。', '4', '2017-05-09 12:51:39');
INSERT INTO `ocls_message` VALUES ('4', '董世行', '4', '品茶更多是展现良好器材，茶具能展示主人精神风貌，待客之道，身份地位象征，选好茶具更能让好茶发挥最大作用\r\n茶是欣赏的主体，水和器则能让茶更突出品质和美感。三者合一，可以说是相得益彰。', '5', '2017-05-09 12:51:57');
INSERT INTO `ocls_message` VALUES ('5', '董世行', '4', '如何理解美国民族的“大熔炉”与“色拉碗”？这两个词语所表达的含义有何区别？', '6', '2017-05-09 12:52:57');
INSERT INTO `ocls_message` VALUES ('6', '董世行', '4', '讨论印第安人的三大古老文明及其各自的特点。为何它们就迅速消失了?', '7', '2017-05-09 12:52:57');
INSERT INTO `ocls_message` VALUES ('7', '董世行', '4', '什么是联邦制？什么是邦联制？两者有何不同？独立后的美国为何最后确立联邦制？\r\n', '8', '2017-05-09 12:52:57');
INSERT INTO `ocls_message` VALUES ('8', '董世行', '4', '大熔炉的意思是来自世界各地的移民在美国不再有自己的传统和文化身份,就像进了熔炉一样,把不同金属熔炼到一起形成新的复合金属，但这是过去的说法；沙拉是各种食物混合的产物,但是又能比较清楚地分辨加入其中的各种食物,用来形容美国这种独特的移民文化，现在一般用沙拉碗形容。', '6', '2017-05-09 12:53:12');
INSERT INTO `ocls_message` VALUES ('9', '董世行', '4', '印加，与玛雅，阿兹特克并称美洲三大文明。', '9', '2017-05-09 12:53:49');
INSERT INTO `ocls_message` VALUES ('10', '董世行', '4', '斯特克人以农业为主，种植玉米、甘薯、棉花、番茄和豆类，还知道施肥和灌溉，产量较高。手工业发达，在制造铜器和陶器、铸造和压制金器以及用宝石和羽毛镶嵌装饰品方面显示的高超技艺，使16世纪的欧洲人感到惊异。擅长建筑。', '10', '2017-05-09 12:53:50');
INSERT INTO `ocls_message` VALUES ('11', '董世行', '4', '印加文明是在南美洲西部、中安第斯山区发展起来的又一著名的印第安古代文明。它的影响范围北起哥伦比亚南部的安卡斯马约河、南到智利中部的马乌莱河，全长4800公里，东西最宽处500公里，总面积达90多万平方公里，人口超过1000万。大体说来，它包括了现今厄瓜多尔山区部分、秘鲁山区部分、玻利维亚高原地区、半个智利和阿根廷西北部。', '6', '2017-05-09 12:53:50');
INSERT INTO `ocls_message` VALUES ('12', '董世行', '4', '范文芳大赛分为房贷首付为范围分为房贷是否违法电视访问', '17', '2017-05-10 00:38:24');
INSERT INTO `ocls_message` VALUES ('13', '董世行', '4', '斯特克人以农业为主，种植玉米、甘薯、棉花、番茄和豆类，还知道施肥和灌溉，产量较高。手工业发达，在制造铜器和陶器、铸造和压制金器以及用宝石和羽毛镶嵌装饰品方面显示的高超技艺，使16世纪的欧洲人感到惊异。擅长建筑', '17', '2017-05-10 00:38:50');
INSERT INTO `ocls_message` VALUES ('14', '董世行', '4', '为的是股份认购恒丰基于酷恶搞热吻否认绯闻啊额玩儿去收听如何违法问题日突然的风让我给他航天员', '17', '2017-05-10 11:12:08');
INSERT INTO `ocls_message` VALUES ('15', '董世行', '4', '斯蒂芬反而日给他任何恶搞反而', '17', '2017-05-10 11:12:21');
INSERT INTO `ocls_message` VALUES ('16', '董世行', '4', 'dfadf纷纷将饿哦i家owe敬佛i微积分分就分iowe敬佛恩哦就owe放假哦我foe文件owe积分哦额外iof我饿积分owe哦我i巨额浮哦我', '2', '2017-05-10 17:56:59');
INSERT INTO `ocls_message` VALUES ('17', '董世行', '4', '个人设置在哪，怎么找个人资料，求解', '3', '2017-05-10 17:58:53');
INSERT INTO `ocls_message` VALUES ('18', '董世行', '4', '都觉得哦对技能等级对你的看到你你的呢', '18', '2017-05-10 18:32:22');
INSERT INTO `ocls_message` VALUES ('19', '董世行', '4', '都觉得哦对技能等级对你的看到你你的呢', '18', '2017-05-10 18:32:27');
INSERT INTO `ocls_message` VALUES ('20', '董世行', '4', '防洪堤发酒疯烦恼俯瞰风景你放假放你飞机肥牛饭', '19', '2017-05-10 18:33:44');
INSERT INTO `ocls_message` VALUES ('21', '董世行', '4', '无线局域网怎么搭建？', '20', '2017-05-10 18:35:09');
INSERT INTO `ocls_message` VALUES ('22', '董世行', '4', '问题新年大吉大家觉得', '20', '2017-05-10 18:35:43');
INSERT INTO `ocls_message` VALUES ('23', '董世行', '4', '了解计算机系统结构，计算机软件，高级语言基础知识，C/C++语言的特点和计算机程序的基本设计过程。', '26', '2017-05-21 15:56:02');
INSERT INTO `ocls_message` VALUES ('24', '董世行', '4', '理解并熟悉C/C++程序的编写和执行过程，程序的编辑、编译、运行步骤，为今后上机实验做好全面准备。', '26', '2017-05-21 15:56:19');
INSERT INTO `ocls_message` VALUES ('25', '董世行', '4', '掌握C/C++语言程序的基本结构和基本语法单位。', '26', '2017-05-21 15:56:30');
INSERT INTO `ocls_message` VALUES ('26', '董世行', '4', '重点：高级语言丰富的数据类型，强有力的语句功能，种类丰富的运算符，灵活的表达方式，高效率的代码和程序可移植性。', '26', '2017-05-21 15:56:43');
INSERT INTO `ocls_message` VALUES ('27', '董世行', '4', '了解C语言基本类型的转换规则。', '26', '2017-05-21 15:56:56');
INSERT INTO `ocls_message` VALUES ('28', '董世行', '4', '理解运算的优先级和结合性。', '26', '2017-05-21 15:57:09');
INSERT INTO `ocls_message` VALUES ('29', '董世行', '4', '、掌握C语言中的基本数据基础，掌握数据的基本运算。', '26', '2017-05-21 15:57:24');
INSERT INTO `ocls_message` VALUES ('30', '董世行', '4', '才几点姐姐才能分开的才能打开', '50', '2017-06-03 22:35:15');
INSERT INTO `ocls_message` VALUES ('31', '董世行', '4', '放假发酒疯好方法', '50', '2017-06-03 22:35:35');
INSERT INTO `ocls_message` VALUES ('32', '董世行', '4', '滴滴滴记得记得哦看得开的', '50', '2017-06-03 22:36:00');

-- ----------------------------
-- Table structure for ocls_numofstudent
-- ----------------------------
DROP TABLE IF EXISTS `ocls_numofstudent`;
CREATE TABLE `ocls_numofstudent` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `nname` varchar(255) NOT NULL,
  `nsex` varchar(255) NOT NULL,
  `nnum` varchar(12) NOT NULL,
  `ndepartment` varchar(255) NOT NULL,
  `nclass` varchar(255) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_numofstudent
-- ----------------------------
INSERT INTO `ocls_numofstudent` VALUES ('8', '王铭', '男 ', '201303204421', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('9', '董世行', '男', '201303204402', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('11', '侯鑫磊', '男', '201303204404', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('12', '田兆壮', '男', '201303204422', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('13', '杨伟卿', '男', '201303204427', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('14', '尹健', '男', '201303204423', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('15', '姜继龙', '男', '201303204403', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('16', '唐尧鹏', '男', '201303204424', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('17', '刘天笑', '男', '201303204417', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('18', '高星宇', '男', '201303204404', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('19', '田雨', '男', '201303204416', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('20', '张线路', '男', '201303204428', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('21', '欧阳秀景', '男', '201303204424', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('22', '刘涵', '男', '201303204406', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('23', '张建功', '男', '201303204429', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('24', '王峰', '男', '201303204407', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('25', '李伟杰', '男', '201303204408', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('26', '王新', '女', '201303204409', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('27', '刘政建', '男', '201303204410', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('28', '王晓雨', '男', '201303204411', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('29', '戴菲菲', '女', '201303204401', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('30', '李晓', '女', '201303204412', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('31', '李雪', '女', '201303204413', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('32', '颜敏', '女', '201303204414', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('33', '杨晨', '女', '201303204415', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('34', '朱晨笛', '女', '201303204418', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('35', '李君鹏', '男', '201303204419', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('36', '许雅清', '女', '201303204420', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('37', '刘亦菲', '男', '201303204421', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('38', '邰丽媛', '女', '201303204422', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('39', '王静', '女', '201303204423', '电气信息系', '计算机13-4');
INSERT INTO `ocls_numofstudent` VALUES ('40', '李玉坤', '男', '201303204301', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('41', '张国政', '男', '201303204302', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('42', '曹机缘', '男', '201303204303', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('43', '郭美美', '女', '201303204304', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('44', '吴姓李', '男', '201303204305', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('45', '招文科', '男', '201303204306', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('46', '赵勇', '男', '201303204307', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('47', '潮红药', '男', '201303204308', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('48', '崔天天', '男', '201303204309', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('49', '黄蜂', '男', '201303204310', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('50', '网坛', '女', '201303204311', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('51', '李温泉', '男', '201303204312', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('52', '庞明远', '男', '201303204313', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('53', '请红尘', '女', '201303204314', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('54', '王一周', '男', '201303204315', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('55', '巡视要', '男', '201303204316', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('56', '张发发', '男', '201303204317', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('57', '张雨', '女', '201303204318', '电气信息系', '计算机13-3');
INSERT INTO `ocls_numofstudent` VALUES ('58', '张晓丽', '女', '201303204319', '电气信息系', '计算机13-3');

-- ----------------------------
-- Table structure for ocls_part
-- ----------------------------
DROP TABLE IF EXISTS `ocls_part`;
CREATE TABLE `ocls_part` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) NOT NULL,
  `pcontent1` varchar(255) DEFAULT NULL,
  `pcontent2` varchar(255) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `ptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  KEY `pf1` (`cid`),
  CONSTRAINT `pf1` FOREIGN KEY (`cid`) REFERENCES `ocls_course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_part
-- ----------------------------
INSERT INTO `ocls_part` VALUES ('2', '第一节', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '2', '2017-06-03 21:12:41');
INSERT INTO `ocls_part` VALUES ('3', '第一节： 数据库新技术概述', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '5', '2017-06-03 21:12:44');
INSERT INTO `ocls_part` VALUES ('4', '第二节：内存数据库', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '5', '2017-06-03 21:12:47');
INSERT INTO `ocls_part` VALUES ('5', '第三节：数据仓库和OLAP分析', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '5', '2017-06-03 21:12:48');
INSERT INTO `ocls_part` VALUES ('6', '第四节：数据库安全性新技术', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '5', '2017-06-03 21:12:50');
INSERT INTO `ocls_part` VALUES ('7', '第五节：大数据概述', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '5', '2017-06-03 21:12:51');
INSERT INTO `ocls_part` VALUES ('8', '第六节：大数据算法与分析', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '5', '2017-06-03 21:12:52');
INSERT INTO `ocls_part` VALUES ('9', '第七节： 理解大数据', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '8.mp4', '5', '2017-06-03 21:12:54');
INSERT INTO `ocls_part` VALUES ('10', '第八节：大数据思维和方法', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '9.mp4', '5', '2017-06-03 21:12:55');
INSERT INTO `ocls_part` VALUES ('11', '第九节：SQL on Hadoop Systems', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '10.mp4', '5', '2017-06-03 21:12:56');
INSERT INTO `ocls_part` VALUES ('12', '第十节：KEY-VALUE数据库', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '5', '2017-06-03 21:12:57');
INSERT INTO `ocls_part` VALUES ('13', '第十一节：流数据分析与处理', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '5', '2017-06-03 21:12:59');
INSERT INTO `ocls_part` VALUES ('14', '第十二节：图数据库', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '5', '2017-06-03 21:13:00');
INSERT INTO `ocls_part` VALUES ('15', '第十三节：大数据与机器学习', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '5', '2017-06-03 21:13:01');
INSERT INTO `ocls_part` VALUES ('16', '第十四节： 多媒体大数据分析', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '5', '2017-06-03 21:13:02');
INSERT INTO `ocls_part` VALUES ('17', '第1讲 概论', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '12', '2017-06-03 21:13:03');
INSERT INTO `ocls_part` VALUES ('18', '第2讲 数据通信基础', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '12', '2017-06-03 21:13:03');
INSERT INTO `ocls_part` VALUES ('19', '第3讲 以太网', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '8.mp4', '12', '2017-06-03 21:13:04');
INSERT INTO `ocls_part` VALUES ('20', '第4讲 无线局域网', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '9.mp4', '12', '2017-06-03 21:13:05');
INSERT INTO `ocls_part` VALUES ('21', '第5讲 IP和网络互连', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '10.mp4', '12', '2017-06-03 21:13:06');
INSERT INTO `ocls_part` VALUES ('22', '第6讲 Internet接入技术', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '12', '2017-06-03 21:13:07');
INSERT INTO `ocls_part` VALUES ('23', '第7讲 传输层', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '12', '2017-06-03 21:13:08');
INSERT INTO `ocls_part` VALUES ('24', '第8讲 应用层', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '12', '2017-06-03 21:13:08');
INSERT INTO `ocls_part` VALUES ('25', '第9讲 网络安全', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '12', '2017-06-03 21:13:09');
INSERT INTO `ocls_part` VALUES ('26', '第1章．程序设计概论(1周) ', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '14967597632741.mp4', '25', '2017-06-03 21:13:10');
INSERT INTO `ocls_part` VALUES ('27', '第2章．基本数据类型及运算(1周) ', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '25', '2017-06-03 21:13:11');
INSERT INTO `ocls_part` VALUES ('28', '第3章．控制语句(1周) ', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '25', '2017-06-03 21:13:12');
INSERT INTO `ocls_part` VALUES ('29', '第4章．数组和结构(1周) ', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '25', '2017-06-03 21:13:13');
INSERT INTO `ocls_part` VALUES ('30', '第5章．指针(2周) ', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '8.mp4', '25', '2017-06-03 21:13:14');
INSERT INTO `ocls_part` VALUES ('31', '第6章．函数(1周) ', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '9.mp4', '25', '2017-06-03 21:13:17');
INSERT INTO `ocls_part` VALUES ('32', '模块1：科学计算可视化及第一个三维展示实例（利用Mayavi绘制心形隐函数曲面）', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '10.mp4', '6', '2017-06-03 21:19:07');
INSERT INTO `ocls_part` VALUES ('33', '模块2：TVTK库介绍、流水线模型、数据加载', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '6', '2017-06-03 21:19:28');
INSERT INTO `ocls_part` VALUES ('34', ' 模块3：Mayavi2库介绍和入门基础，使用mlab绘制三维网格面效果', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '6', '2017-06-03 21:19:51');
INSERT INTO `ocls_part` VALUES ('35', '第1周 计算', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '8', '2017-06-03 21:38:01');
INSERT INTO `ocls_part` VALUES ('36', '第2周 判断', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '8', '2017-06-03 21:38:28');
INSERT INTO `ocls_part` VALUES ('37', '第3周 循环', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '8', '2017-06-03 21:38:47');
INSERT INTO `ocls_part` VALUES ('38', '第1讲计算机、计算与计算思维', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '9', '2017-06-03 21:39:40');
INSERT INTO `ocls_part` VALUES ('39', '第2讲符号化、计算化与自动化', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '9', '2017-06-03 22:36:56');
INSERT INTO `ocls_part` VALUES ('40', '第3讲程序与递归：组合、抽象与构造', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '8.mp4', '9', '2017-06-03 22:36:57');
INSERT INTO `ocls_part` VALUES ('41', '第1讲 软件工程之启蒙：初识软件工程专业', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '9.mp4', '10', '2017-06-03 22:36:58');
INSERT INTO `ocls_part` VALUES ('42', '第2讲 计算思维之起步：符号化-计算化与自动化', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '10.mp4', '10', '2017-06-03 22:36:59');
INSERT INTO `ocls_part` VALUES ('43', '第3讲 软件与程序思想：组合-抽象-重复-构造-递归', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '10', '2017-06-03 22:36:59');
INSERT INTO `ocls_part` VALUES ('44', '第1章 计算机系统与虚拟化技术', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '11', '2017-06-03 22:37:00');
INSERT INTO `ocls_part` VALUES ('45', '第2章 办公软件', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '11', '2017-06-03 22:37:01');
INSERT INTO `ocls_part` VALUES ('46', '第3章 多媒体处理', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '11', '2017-06-03 22:37:01');
INSERT INTO `ocls_part` VALUES ('47', '第1讲 概论', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '12', '2017-06-03 22:37:02');
INSERT INTO `ocls_part` VALUES ('48', '第2讲 数据通信基础', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '12', '2017-06-03 22:37:03');
INSERT INTO `ocls_part` VALUES ('49', '第3讲 以太网', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '12', '2017-06-03 22:37:03');
INSERT INTO `ocls_part` VALUES ('50', '单元1：NumPy库入门：一维、二维、N维、高维数据表示和操作', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '8.mp4', '13', '2017-06-03 22:37:04');
INSERT INTO `ocls_part` VALUES ('51', ' 单元2：NumPy数据存取与函数：多维数据存储、随机数函数、统计函数、梯度函数', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '9.mp4', '13', '2017-06-03 22:37:05');
INSERT INTO `ocls_part` VALUES ('52', '单元3：实战：图像的手绘效果', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '10.mp4', '13', '2017-06-03 22:37:06');
INSERT INTO `ocls_part` VALUES ('53', '模块1：游戏编程的基本概念和Pygame库基础知识', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '14', '2017-06-03 22:37:06');
INSERT INTO `ocls_part` VALUES ('54', '模块2：游戏场景构建和事件处理机制', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '14', '2017-06-03 22:37:07');
INSERT INTO `ocls_part` VALUES ('55', '模块3：位图的基本使用', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '14', '2017-06-03 22:37:09');
INSERT INTO `ocls_part` VALUES ('56', '第一讲 基本概念 [陈越]', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '15', '2017-06-03 22:37:08');
INSERT INTO `ocls_part` VALUES ('57', '第二讲 线性结构 [何钦铭]', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '15', '2017-06-03 22:37:10');
INSERT INTO `ocls_part` VALUES ('58', '第三讲 树(上) [何钦铭]', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '15', '2017-06-03 22:37:11');
INSERT INTO `ocls_part` VALUES ('59', '第一周 教师为什么要学习知识管理', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '16', '2017-06-03 22:37:13');
INSERT INTO `ocls_part` VALUES ('60', '第二周 如何高效获取与组织资源', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '8.mp4', '16', '2017-06-03 22:37:12');
INSERT INTO `ocls_part` VALUES ('61', '第三周 资源管理、同步与自我管理', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '9.mp4', '16', '2017-06-03 22:37:14');
INSERT INTO `ocls_part` VALUES ('62', '第1讲  初认识Visual Basic ', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '10.mp4', '17', '2017-06-03 22:37:15');
INSERT INTO `ocls_part` VALUES ('63', '第2讲  可视化编程基础', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '17', '2017-06-03 22:37:15');
INSERT INTO `ocls_part` VALUES ('64', '第3讲  VB语言基础和顺序结构', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '17', '2017-06-03 22:37:16');
INSERT INTO `ocls_part` VALUES ('65', '第一章 计算机操作系统概述', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '21', '2017-06-03 22:37:17');
INSERT INTO `ocls_part` VALUES ('66', '第二章 处理器管理', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '21', '2017-06-03 22:37:18');
INSERT INTO `ocls_part` VALUES ('67', '第三章 存储管理', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '21', '2017-06-03 22:37:19');
INSERT INTO `ocls_part` VALUES ('68', '第一周 程序执行概述', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '22', '2017-06-03 22:37:19');
INSERT INTO `ocls_part` VALUES ('69', '第二周 主存储器组织', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '22', '2017-06-03 22:37:20');
INSERT INTO `ocls_part` VALUES ('70', '第三周 磁盘存储器', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '8.mp4', '22', '2017-06-03 22:37:21');
INSERT INTO `ocls_part` VALUES ('71', '第一讲：初识数据库系统', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '9.mp4', '23', '2017-06-03 22:37:22');
INSERT INTO `ocls_part` VALUES ('72', '第二讲：数据库系统的核心：数据模型', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '10.mp4', '23', '2017-06-03 22:37:23');
INSERT INTO `ocls_part` VALUES ('73', '第三讲：数据库系统的结构', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '1.mp4', '23', '2017-06-03 22:37:24');
INSERT INTO `ocls_part` VALUES ('74', '第1章 信息系统基本知识', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '2.mp4', '24', '2017-06-03 22:37:24');
INSERT INTO `ocls_part` VALUES ('75', '第2章 关系数据库基本知识', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '3.mp4', '24', '2017-06-03 22:37:25');
INSERT INTO `ocls_part` VALUES ('76', '第3章 关系数据库的创建和维护', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '4.mp4', '24', '2017-06-03 22:37:26');
INSERT INTO `ocls_part` VALUES ('77', '第1周 计算机ABC(主讲：叶麟，赵玲玲)', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '5.mp4', '25', '2017-06-03 22:37:27');
INSERT INTO `ocls_part` VALUES ('78', '第2周 程序设计ABC（主讲：苏小红）', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '6.mp4', '25', '2017-06-03 22:37:27');
INSERT INTO `ocls_part` VALUES ('79', '第3周 程序设计方法ABC（主讲：苏小红，赵玲玲）', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：DONG4f', '7.mp4', '25', '2017-06-03 22:37:30');
INSERT INTO `ocls_part` VALUES ('80', '第四周', '链接: https://pan.baidu.com/s/1ge4ppK3 提取密码：wang', '1496757909851null', '25', '2017-06-06 22:05:09');

-- ----------------------------
-- Table structure for ocls_reply
-- ----------------------------
DROP TABLE IF EXISTS `ocls_reply`;
CREATE TABLE `ocls_reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rcontent` varchar(255) NOT NULL,
  `tid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `rtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rid`),
  KEY `rf1` (`tid`),
  KEY `rf2` (`mid`),
  CONSTRAINT `rf1` FOREIGN KEY (`tid`) REFERENCES `ocls_teacher` (`tid`),
  CONSTRAINT `rf2` FOREIGN KEY (`mid`) REFERENCES `ocls_message` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_reply
-- ----------------------------
INSERT INTO `ocls_reply` VALUES ('1', '你这个问题提的很好', '2', '1', '2017-04-17 19:47:41');
INSERT INTO `ocls_reply` VALUES ('2', '先简单说一下数据类型的作用。在C语言中，程序操作的最基本的元素叫做变量。编程的实质就是把变量中保存的内容进行处理，最终返回一个处理后的结果。', '5', '29', '2017-05-21 16:07:45');
INSERT INTO `ocls_reply` VALUES ('3', '你诶jfoejringorngJoe就哦哦放假哦哦饿哦积分哦', '5', '28', '2017-05-21 17:51:25');

-- ----------------------------
-- Table structure for ocls_student
-- ----------------------------
DROP TABLE IF EXISTS `ocls_student`;
CREATE TABLE `ocls_student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `snum` varchar(12) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `spwd` varchar(255) DEFAULT NULL,
  `spower` int(1) NOT NULL DEFAULT '0',
  `sphoto` varchar(255) DEFAULT NULL,
  `nid` int(11) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `fs1` (`nid`),
  CONSTRAINT `fs1` FOREIGN KEY (`nid`) REFERENCES `ocls_numofstudent` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_student
-- ----------------------------
INSERT INTO `ocls_student` VALUES ('4', '201303204402', '董世行', '123', '0', '1496377017838.png', '9');
INSERT INTO `ocls_student` VALUES ('5', '201303204421', '王铭', '123456', '0', 'kong', '8');
INSERT INTO `ocls_student` VALUES ('6', '201303204404', '侯鑫磊', '123', '0', null, '11');
INSERT INTO `ocls_student` VALUES ('7', '201303204422', '田兆壮', '123', '0', null, '12');
INSERT INTO `ocls_student` VALUES ('8', '201303204427', '杨伟卿', '123', '0', null, '13');
INSERT INTO `ocls_student` VALUES ('9', '201303204423', '尹健', '123', '0', null, '14');
INSERT INTO `ocls_student` VALUES ('10', '201303204403', null, '123', '0', null, '15');
INSERT INTO `ocls_student` VALUES ('11', '201303204424', null, '123', '0', null, '16');
INSERT INTO `ocls_student` VALUES ('12', '201303204417', null, '123', '0', null, '17');
INSERT INTO `ocls_student` VALUES ('13', null, null, null, '0', null, '18');
INSERT INTO `ocls_student` VALUES ('14', null, null, null, '0', null, '19');
INSERT INTO `ocls_student` VALUES ('15', null, null, null, '0', null, '20');
INSERT INTO `ocls_student` VALUES ('16', null, null, null, '0', null, '21');
INSERT INTO `ocls_student` VALUES ('17', null, null, null, '0', null, '22');
INSERT INTO `ocls_student` VALUES ('18', null, null, null, '0', null, '23');
INSERT INTO `ocls_student` VALUES ('19', null, null, null, '0', null, '24');
INSERT INTO `ocls_student` VALUES ('20', null, null, null, '0', null, '25');
INSERT INTO `ocls_student` VALUES ('21', null, null, null, '0', null, '26');
INSERT INTO `ocls_student` VALUES ('22', null, null, null, '0', null, '27');
INSERT INTO `ocls_student` VALUES ('23', null, null, null, '0', null, '28');
INSERT INTO `ocls_student` VALUES ('24', null, null, null, '0', null, '29');
INSERT INTO `ocls_student` VALUES ('25', null, null, null, '0', null, '30');
INSERT INTO `ocls_student` VALUES ('26', null, null, null, '0', null, '31');
INSERT INTO `ocls_student` VALUES ('27', null, null, null, '0', null, '32');
INSERT INTO `ocls_student` VALUES ('28', null, null, null, '0', null, '33');
INSERT INTO `ocls_student` VALUES ('29', null, null, null, '0', null, '34');
INSERT INTO `ocls_student` VALUES ('30', null, null, null, '0', null, '35');
INSERT INTO `ocls_student` VALUES ('31', null, null, null, '0', null, '36');
INSERT INTO `ocls_student` VALUES ('32', null, null, null, '0', null, '37');
INSERT INTO `ocls_student` VALUES ('33', null, null, null, '0', null, '38');
INSERT INTO `ocls_student` VALUES ('34', null, null, null, '0', null, '39');
INSERT INTO `ocls_student` VALUES ('35', null, null, null, '0', null, '40');
INSERT INTO `ocls_student` VALUES ('36', null, null, null, '0', null, '41');
INSERT INTO `ocls_student` VALUES ('37', null, null, null, '0', null, '42');
INSERT INTO `ocls_student` VALUES ('38', null, null, null, '0', null, '43');
INSERT INTO `ocls_student` VALUES ('39', null, null, null, '0', null, '44');
INSERT INTO `ocls_student` VALUES ('40', null, null, null, '0', null, '45');
INSERT INTO `ocls_student` VALUES ('41', null, null, null, '0', null, '46');
INSERT INTO `ocls_student` VALUES ('42', null, null, null, '0', null, '47');
INSERT INTO `ocls_student` VALUES ('43', null, null, null, '0', null, '48');
INSERT INTO `ocls_student` VALUES ('44', null, null, null, '0', null, '49');
INSERT INTO `ocls_student` VALUES ('45', null, null, null, '0', null, '50');
INSERT INTO `ocls_student` VALUES ('46', null, null, null, '0', null, '51');
INSERT INTO `ocls_student` VALUES ('47', null, null, null, '0', null, '52');
INSERT INTO `ocls_student` VALUES ('48', null, null, null, '0', null, '53');
INSERT INTO `ocls_student` VALUES ('49', null, null, null, '0', null, '54');
INSERT INTO `ocls_student` VALUES ('50', null, null, null, '0', null, '55');
INSERT INTO `ocls_student` VALUES ('51', null, null, null, '0', null, '56');
INSERT INTO `ocls_student` VALUES ('52', null, null, null, '0', null, '57');
INSERT INTO `ocls_student` VALUES ('53', null, null, null, '0', null, '58');

-- ----------------------------
-- Table structure for ocls_teacher
-- ----------------------------
DROP TABLE IF EXISTS `ocls_teacher`;
CREATE TABLE `ocls_teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tnum` varchar(12) NOT NULL,
  `tname` varchar(255) NOT NULL,
  `tpwd` varchar(255) NOT NULL,
  `tpower` int(1) NOT NULL DEFAULT '0',
  `tphoto` varchar(255) DEFAULT NULL,
  `infid` int(11) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `ft1` (`infid`),
  CONSTRAINT `ft1` FOREIGN KEY (`infid`) REFERENCES `ocls_infofteacher` (`infid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocls_teacher
-- ----------------------------
INSERT INTO `ocls_teacher` VALUES ('2', 'sklaoshi001', '任炳忠', '123456', '1', 'kong', '4');
INSERT INTO `ocls_teacher` VALUES ('3', 'sklaoshi002', '杜小勇', '123456', '1', 'kong', '5');
INSERT INTO `ocls_teacher` VALUES ('4', 'sklaoshi003', '张丽', '123456', '1', 'kong', '6');
INSERT INTO `ocls_teacher` VALUES ('5', 'sklaoshi004', '翁凯', '123456', '1', '1495441033493profile-photo.jpg', '7');
INSERT INTO `ocls_teacher` VALUES ('7', 'sklaoshi005', 'ææ', '123', '1', 'kong', '7');
