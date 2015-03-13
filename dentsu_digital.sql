-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2015 at 07:31 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dentsu_digital`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_applicants`
--

CREATE TABLE IF NOT EXISTS `tbl_applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `marital_status` tinyint(1) NOT NULL,
  `id_number` varchar(128) NOT NULL,
  `phone` varchar(18) NOT NULL,
  `address` varchar(512) NOT NULL,
  `birth_date` int(11) NOT NULL,
  `birth_place` char(32) NOT NULL,
  `education_grade` varchar(128) NOT NULL,
  `education_name` varchar(128) NOT NULL,
  `education_major` varchar(128) NOT NULL,
  `education_from` varchar(11) NOT NULL,
  `education_to` varchar(11) NOT NULL,
  `employment_name` varchar(11) NOT NULL,
  `employment_position` varchar(11) NOT NULL,
  `employment_from` varchar(11) NOT NULL,
  `employment_to` varchar(11) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `cv_file` varchar(256) NOT NULL,
  `is_located` tinyint(1) NOT NULL,
  `is_related` tinyint(1) NOT NULL,
  `messages` text,
  `available_date` int(11) NOT NULL,
  `expected_salary` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_applicants`
--

INSERT INTO `tbl_applicants` (`id`, `career_id`, `user_id`, `name`, `email`, `gender`, `marital_status`, `id_number`, `phone`, `address`, `birth_date`, `birth_place`, `education_grade`, `education_name`, `education_major`, `education_from`, `education_to`, `employment_name`, `employment_position`, `employment_from`, `employment_to`, `photo`, `cv_file`, `is_located`, `is_related`, `messages`, `available_date`, `expected_salary`, `status`, `added`, `modified`) VALUES
(1, 6, 44, 'Dyarfi 20 Defrian Yarfi', 'dyarfi20@gmail.com', 1, 1, 'ASDAD12312312313', '647474747', '45745747', 4567457, '', '1', '', '', '', '', '', '', '', '', '20131013_142521a.jpg', 'AdMob Ad Specs.pdf', 0, 0, '457457457', 0, 0, 1, 0, 1425271008),
(2, 6, 45, 'Defrian Yarfi', 'defrian.yarfi@gmail.com', 1, 1, 'ASDAD12312312313', '647474747', '45745747', 4567457, '', '1', '', '', '', '', '', '', '', '', '3b394-1513781_10205610488526266_3600135193534162242_n.jpg', '976bd-export-2015-02-13_14_37_25.xls', 0, 0, '<p>\r\n	457457457</p>\r\n', 0, 0, 1, 0, 1425271011);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_captcha`
--

CREATE TABLE IF NOT EXISTS `tbl_captcha` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `word` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=328 ;

--
-- Dumping data for table `tbl_captcha`
--

INSERT INTO `tbl_captcha` (`id`, `time`, `ip_address`, `word`) VALUES
(327, 1425371391, '::1', 'nepqZ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_careers`
--

CREATE TABLE IF NOT EXISTS `tbl_careers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `division_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sent_to` varchar(32) DEFAULT NULL,
  `ref_no` varchar(12) DEFAULT NULL,
  `start_date` date DEFAULT '0000-00-00',
  `end_date` date DEFAULT '0000-00-00',
  `report_to` tinytext,
  `job_purpose` text,
  `responsibilities` text,
  `requirements` text,
  `location` varchar(128) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `ext_link1` varchar(324) DEFAULT NULL,
  `ext_link2` varchar(324) DEFAULT NULL,
  `allow_comment` tinyint(1) NOT NULL,
  `user_id` tinyint(3) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) unsigned DEFAULT NULL,
  `modified` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`ref_no`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_careers`
--

INSERT INTO `tbl_careers` (`id`, `division_id`, `name`, `subject`, `sent_to`, `ref_no`, `start_date`, `end_date`, `report_to`, `job_purpose`, `responsibilities`, `requirements`, `location`, `company`, `ext_link1`, `ext_link2`, `allow_comment`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(6, 12, 'backend-web-developer', 'Backend Web Developer', 'defrian.yarfi@gmail.com', 'wp002', '2013-07-23', '2013-07-23', 'Project Manager', '<p>\r\n	Senior Backend Web Developer</p>\r\n', '<p>\r\n	Senior Backend Web Developer</p>\r\n', '<p>\r\n	Senior Backend Web Developer</p>\r\n', 'Indonesia', 'Default', 'jobstreet.com', 'jobsdb.com', 0, 0, 0, 1, 1374560244, 1374561582),
(5, 12, 'frontend-web-developer', 'Frontend Web Developer', 'defrian.yarfi@gmail.com', 'wd001df', '2013-07-23', '2013-07-23', 'Project Manager', '<p>\r\n	Frontend Web Developer</p>\r\n', '<p>\r\n	Frontend Web Developer</p>\r\n', '<p>\r\n	Frontend Web Developer</p>\r\n', 'Jakarta', 'Default', 'jobstreet.com', 'jobstreet.com', 0, 0, 0, 1, 1374517350, 1374561700),
(4, 17, 'art-director', 'Art Director', 'defrian.yarfi@gmail.com', 'wd001df', '2013-07-23', '2013-07-23', 'Project Manager', '<p>\r\n	Art Director</p>\r\n', '<p>\r\n	Art Director</p>\r\n', '<p>\r\n	Art Director</p>\r\n', 'Jakarta', 'Default', 'jobstreet.com', 'jobstreet.com', 0, 0, 0, 1, 1374517303, 1374561707),
(7, 17, 'creative-director', 'Creative Director', 'defrian.yarfi@gmail.com', NULL, NULL, NULL, 'Project manager', '<p>\r\n	Creative Director</p>\r\n', '<p>\r\n	Creative Director</p>\r\n', '<p>\r\n	Creative Director</p>\r\n', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL),
(8, 17, 'social-media-executive', 'Social Media Executive', 'defrian.yarfi@gmail.com', NULL, NULL, NULL, 'Project Manager', '<p>\r\n	Social Media Executive</p>\r\n', '<p>\r\n	Social Media Executive</p>\r\n', '<p>\r\n	Social Media Executive</p>\r\n', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL),
(9, 17, 'digital-media-implementer', 'Digital Media Implementer', 'defrian.yarfi@gmail.com', NULL, NULL, NULL, 'Project Manager', '<p>\r\n	Digital Media Implementer</p>\r\n', '<p>\r\n	Digital Media Implementer</p>\r\n', '<p>\r\n	Digital Media Implementer</p>\r\n', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL),
(10, 17, 'copywriter', 'Copywriter', 'defrian.yarfi@gmail.com', NULL, NULL, NULL, 'Project Manager', '<p>\r\n	Copywriter</p>\r\n', '<p>\r\n	Copywriter</p>\r\n', '<p>\r\n	Copywriter</p>\r\n', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `tbl_ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ci_sessions`
--

INSERT INTO `tbl_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('499f6f8dd3d3be2cdfe5c4d23dbefe52', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:36.0) Gecko/20100101 Firefox/36.0', 1426235360, 'a:6:{s:9:"user_data";s:0:"";s:8:"curr_url";s:27:"admin-panel/dashboard/index";s:8:"prev_url";s:27:"admin-panel/dashboard/index";s:11:"module_list";s:530:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"Users","usergroup{{slash}}/index":"User Groups","language{{slash}}/index":"Languages","setting{{slash}}/index":"Settings","serverlog{{slash}}/index":"Server Logs"},"Module":{"modulelist{{slash}}/index":"Modules"},"Career":{"career{{slash}}/index":"Careers","division{{slash}}/index":"Divisions","applicant{{slash}}/index":"Applicants","employee{{slash}}/index":"Employees"},"Page":{"page{{slash}}/index":"Pages","pagemenu{{slash}}/index":"Page Menus"}}";s:20:"module_function_list";s:4215:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"Users","usergroup{{slash}}/index":"User Groups","language{{slash}}/index":"Languages","setting{{slash}}/index":"Settings","serverlog{{slash}}/index":"Server Logs","dashboard{{slash}}/add":"Add New Dashboard","dashboard{{slash}}/view":"View Dashboard","dashboard{{slash}}/edit":"Edit Dashboard","dashboard{{slash}}/delete":"Delete Dashboard","dashboard{{slash}}/change":"Change Dashboard Status","user{{slash}}/add":"Add User","user{{slash}}/view":"View User","user{{slash}}/edit":"Edit User","user{{slash}}/delete":"Delete User","user{{slash}}/change":"Change User Status","usergroup{{slash}}/add":"Add User Group","usergroup{{slash}}/view":"View User Group","usergroup{{slash}}/edit":"Edit User Group","usergroup{{slash}}/delete":"Delete User Group","usergroup{{slash}}/change":"Change User Group Status","language{{slash}}/add":"Add Language","language{{slash}}/view":"View Language","language{{slash}}/edit":"Edit Language","language{{slash}}/delete":"Delete Language","language{{slash}}/change":"Change Language Status","setting{{slash}}/add":"Add Setting","setting{{slash}}/view":"View Setting","setting{{slash}}/edit":"Edit Setting","setting{{slash}}/delete":"Delete Setting","setting{{slash}}/change":"Change Setting Status","serverlog{{slash}}/view":"View Server Log","serverlog{{slash}}/edit":"Edit Server Log","serverlog{{slash}}/delete":"Delete Server Log","serverlog{{slash}}/trash":"Trash Server Log"},"Module":{"modulelist{{slash}}/edit":"Edit Module"},"Career":{"career{{slash}}/index":"Careers","division{{slash}}/index":"Divisions","applicant{{slash}}/index":"Applicants","employee{{slash}}/index":"Employees","career{{slash}}/index{{slash}}/add":"Add Career","career{{slash}}/index{{slash}}/view":"View Career","career{{slash}}/index{{slash}}/edit":"Edit Career","career{{slash}}/index{{slash}}/delete":"Delete Career","career{{slash}}/index{{slash}}/change":"Change Career Status","career{{slash}}/index{{slash}}/export":"Export Career","career{{slash}}/index{{slash}}/print":"Print Career","division{{slash}}/index{{slash}}/add":"Add Division","division{{slash}}/index{{slash}}/view":"View Division","division{{slash}}/index{{slash}}/edit":"Edit Division","division{{slash}}/index{{slash}}/delete":"Delete Division","division{{slash}}/index{{slash}}/change":"Change Division Status","division{{slash}}/index{{slash}}/export":"Export Division","division{{slash}}/index{{slash}}/print":"Print Division","applicant{{slash}}/index{{slash}}/add":"Add Applicant","applicant{{slash}}/index{{slash}}/view":"View Applicant","applicant{{slash}}/index{{slash}}/edit":"Edit Applicant","applicant{{slash}}/index{{slash}}/delete":"Delete Applicant","applicant{{slash}}/index{{slash}}/change":"Change Applicant","applicant{{slash}}/index{{slash}}/export":"Export Applicant","applicant{{slash}}/index{{slash}}/print":"Print Applicant","employee{{slash}}/index{{slash}}/add":"Add Employee","employee{{slash}}/index{{slash}}/view":"View Employee","employee{{slash}}/index{{slash}}/edit":"Edit Employee","employee{{slash}}/index{{slash}}/delete":"Delete Employee","employee{{slash}}/set":"Set to Employee","employee{{slash}}/index{{slash}}/change":"Change Employee","employee{{slash}}/index{{slash}}/export":"Export Employee","employee{{slash}}/index{{slash}}/print":"Print Employee"},"Page":{"page{{slash}}/index":"Pages","pagemenu{{slash}}/index":"Page Menus","page{{slash}}/index{{slash}}/add":"Add Page","page{{slash}}/index{{slash}}/view":"View Page","page{{slash}}/index{{slash}}/edit":"Edit Page","page{{slash}}/index{{slash}}/delete":"Delete Page","page{{slash}}/index{{slash}}/change":"Change Page Status","page{{slash}}/index{{slash}}/export":"Export Page","page{{slash}}/index{{slash}}/print":"Print Page","pagemenu{{slash}}/index{{slash}}/add":"Add Page Menu","pagemenu{{slash}}/index{{slash}}/view":"View Page Menu","pagemenu{{slash}}/index{{slash}}/edit":"Edit Page Menu","pagemenu{{slash}}/index{{slash}}/delete":"Delete Page Menu","pagemenu{{slash}}/index{{slash}}/change":"Change Page Menu Status","pagemenu{{slash}}/index{{slash}}/export":"Export Page Menu","pagemenu{{slash}}/index{{slash}}/print":"Print Page Menu"}}";s:12:"user_session";O:8:"stdClass":9:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@admin.com";s:8:"password";s:8:"********";s:8:"group_id";s:1:"1";s:6:"status";s:1:"1";s:10:"last_login";s:10:"1426142067";s:9:"logged_in";b:1;s:4:"name";s:21:"Administrator Website";}}'),
('8b586723864cfe4fa4527b5cf064cb2a', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:36.0) Gecko/20100101 Firefox/36.0', 1426217220, 'a:3:{s:9:"user_data";s:0:"";s:8:"curr_url";s:30:"admin-panel/authenticate/login";s:8:"prev_url";b:0;}'),
('d4ab4acc6f4f01e6c7d0eb98032e3fd6', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426216954, 'a:2:{s:9:"user_data";s:0:"";s:8:"curr_url";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_configurations`
--

CREATE TABLE IF NOT EXISTS `tbl_configurations` (
  `parameter` varchar(150) NOT NULL DEFAULT '',
  `value` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`parameter`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_configurations`
--

INSERT INTO `tbl_configurations` (`parameter`, `value`) VALUES
('environment', '0'),
('install', '0'),
('maintenance', '0'),
('theme', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_divisions`
--

CREATE TABLE IF NOT EXISTS `tbl_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `tbl_divisions`
--

INSERT INTO `tbl_divisions` (`id`, `name`, `subject`, `description`, `is_system`, `status`, `added`, `modified`) VALUES
(12, 'developer', 'Developer', '<p>\r\n	Web Developer Division</p>\r\n', 1, 1, 1364610224, 1364610224),
(13, 'director', 'Director', '<p>\r\n	Director</p>\r\n', 1, 1, 1364610224, 1368369595),
(14, 'account', 'Account', '<p>\r\n	Account</p>\r\n', 1, 1, 0, 0),
(15, 'manager', 'Manager', '<p>\r\n	Manager</p>\r\n', 1, 1, 0, 0),
(16, 'strategist', 'Strategist', '<p>\r\n	Strategist</p>\r\n', 1, 1, 0, 0),
(17, 'creative', 'Creative', '<p>\r\n	Creative</p>\r\n', 1, 1, 0, 0),
(18, 'finance', 'Finance', '<p>\r\n	Finance</p>\r\n', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_division_files`
--

CREATE TABLE IF NOT EXISTS `tbl_division_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `division_id` int(11) unsigned DEFAULT NULL,
  `field_name` varchar(96) DEFAULT NULL,
  `file_name` varchar(64) DEFAULT NULL,
  `file_type` varchar(16) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`division_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_division_files`
--

INSERT INTO `tbl_division_files` (`id`, `division_id`, `field_name`, `file_name`, `file_type`, `caption`) VALUES
(1, 13, 'image_1', 'd0020c5505cc68f55446c109c352930d.jpg', 'image/jpeg', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group_permissions`
--

CREATE TABLE IF NOT EXISTS `tbl_group_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `value` smallint(1) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_languages`
--

CREATE TABLE IF NOT EXISTS `tbl_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `prefix` varchar(6) DEFAULT NULL,
  `default` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `added` int(11) unsigned NOT NULL,
  `modified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_languages`
--

INSERT INTO `tbl_languages` (`id`, `name`, `prefix`, `default`, `status`, `is_system`, `added`, `modified`) VALUES
(1, 'Indonesia', 'id', 0, 1, 0, 1425357221, 0),
(2, 'English', 'en', 1, 1, 0, 1425357221, 0),
(3, 'Arab', 'ar', 0, 0, 0, 1425357221, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_model_lists`
--

CREATE TABLE IF NOT EXISTS `tbl_model_lists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_module_lists`
--

CREATE TABLE IF NOT EXISTS `tbl_module_lists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_link` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_module_permissions`
--

CREATE TABLE IF NOT EXISTS `tbl_module_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_link` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pages`
--

CREATE TABLE IF NOT EXISTS `tbl_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `synopsis` text,
  `text` text,
  `attribute` text,
  `publish_date` date DEFAULT NULL,
  `unpublish_date` date DEFAULT NULL,
  `allow_comment` tinyint(1) DEFAULT NULL,
  `tags` text,
  `order` tinyint(3) DEFAULT NULL,
  `user_id` tinyint(3) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` enum('publish','unpublish','deleted') DEFAULT 'publish',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`menu_id`,`name`,`publish_date`,`unpublish_date`,`allow_comment`,`order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_pages`
--

INSERT INTO `tbl_pages` (`id`, `menu_id`, `name`, `subject`, `synopsis`, `text`, `attribute`, `publish_date`, `unpublish_date`, `allow_comment`, `tags`, `order`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, 1, 'test-page-one', 'Test page one sdfsf', '<p>\r\n	Test page one Test page one Test page one Test page one Test page one Test page one sdfsdf asdasd</p>\r\n', '<p>\r\n	Test page one Test page one Test page one Test page one sdfsdfsf cbxfx</p>\r\n', NULL, '2015-02-13', '2015-02-28', 1, NULL, NULL, NULL, NULL, 'publish', NULL, 1424073158),
(2, 1, 'test-page-two', 'Test Page Two', '<p>\r\n	Test Page Two Synopsis</p>\r\n', '<p>\r\n	Test Page Two Text sefsfdfsdf</p>\r\n', NULL, '2015-02-28', '2015-02-28', 1, NULL, NULL, NULL, NULL, 'publish', NULL, NULL),
(3, 2, 'test-three-page', 'Test three', '<p>\r\n	Test three</p>\r\n', '<p>\r\n	Test three</p>\r\n', NULL, '2015-02-28', '2015-03-31', 1, NULL, NULL, NULL, NULL, 'publish', NULL, 1424087137),
(4, 2, 'test-four-test', 'Test Four TEst', '<p>\r\n	Test Four TEst</p>\r\n', '<p>\r\n	Test Four TEst</p>\r\n', NULL, '2015-02-01', '2015-03-28', NULL, NULL, NULL, NULL, NULL, 'publish', NULL, 1424087155),
(5, 2, 'test-five-page-miss', 'Test Five Page', '<p>\r\n	Test Five Page</p>\r\n', '<p>\r\n	Test Five</p>\r\n', NULL, '2015-02-16', '2015-02-28', NULL, NULL, NULL, NULL, NULL, 'publish', NULL, 1424087170),
(6, 1, 'test-one-two-three-four-five-six-seven', 'Test one two three four five six seven', '<p>\r\n	Test one two three four five six seven</p>\r\n', '<p>\r\n	Test one two three four five six seven</p>\r\n', NULL, '2015-02-28', '2015-02-28', NULL, NULL, NULL, NULL, NULL, 'publish', 1424071240, 1424087187),
(7, 2, 'Test Page with Added', 'Test Page with Added', '<p>\r\n	Test Page with Added</p>\r\n', '<p>\r\n	Test Page with Added</p>\r\n', NULL, '2015-02-16', '2015-02-28', NULL, NULL, NULL, NULL, NULL, 'publish', 1424087227, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page_menus`
--

CREATE TABLE IF NOT EXISTS `tbl_page_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `sub_level` tinyint(3) DEFAULT NULL,
  `order` tinyint(3) DEFAULT NULL,
  `is_system` tinyint(3) DEFAULT NULL,
  `has_child` tinyint(3) DEFAULT NULL,
  `user_id` tinyint(3) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` enum('publish','unpublish','deleted') DEFAULT 'publish',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`name`,`sub_level`,`order`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_page_menus`
--

INSERT INTO `tbl_page_menus` (`id`, `parent_id`, `name`, `title`, `description`, `url`, `media`, `position`, `sub_level`, `order`, `is_system`, `has_child`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, NULL, 'Menu One', 'menu-one', '<p>\r\n	Menu One Description</p>\r\n', 'menu-one', NULL, 'top', NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL),
(2, NULL, 'Menu Two', 'menu-two', '<p>\r\n	Menu Two Description</p>\r\n', 'menu-two', NULL, 'top', NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_server_logs`
--

CREATE TABLE IF NOT EXISTS `tbl_server_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `status_code` varchar(160) DEFAULT NULL,
  `bytes_served` int(11) unsigned NOT NULL,
  `ip_address` varchar(45) DEFAULT '0',
  `http_code` int(11) unsigned NOT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` int(1) unsigned NOT NULL,
  `added` int(11) unsigned NOT NULL,
  `modified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_server_logs`
--

INSERT INTO `tbl_server_logs` (`id`, `url`, `user_id`, `status_code`, `bytes_served`, `ip_address`, `http_code`, `referrer`, `user_agent`, `status`, `added`, `modified`) VALUES
(1, 'http://localhost/dentsu.digital/', NULL, '200', 35, '::1', 200, 'http://localhost/dentsu.digital/', '	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1, 1417065898, 1417065898),
(2, 'http://localhost/dentsu.digital/', NULL, '200', 35, '::1', 200, 'http://localhost/dentsu.digital/', '	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1, 1417065898, 1417065898),
(3, 'http://localhost/dentsu.digital/', NULL, '200', 35, '::1', 200, 'http://localhost/dentsu.digital/', '	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1, 1417065898, 1417065898),
(4, 'http://localhost/dentsu.digital/', NULL, '200', 35, '::1', 200, 'http://localhost/dentsu.digital/', '	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1, 1417065898, 1417065898),
(5, 'http://localhost/dentsu.digital/', NULL, '200', 35, '::1', 200, 'http://localhost/dentsu.digital/', '	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1, 1417065898, 1417065898);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE IF NOT EXISTS `tbl_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parameter` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`parameter`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `parameter`, `alias`, `value`, `is_system`, `status`, `added`, `modified`) VALUES
(1, 'email_marketing', 'Email Marketing', 'marketing@', 1, 1, 1334835773, NULL),
(2, 'email_administrator', 'Email Administrator', 'administrator@', 1, 1, 1334835773, 1336122482),
(3, 'email_hrd', 'Email HRD', 'hrd@', 1, 1, 1334835773, NULL),
(4, 'email_info', 'Email Info', 'info@d3.dentsu.co.id', 1, 1, 1334835773, NULL),
(5, 'email_template', 'Email Template', '&dash;', 1, 1, 1334835773, NULL),
(6, 'maintenance_template', 'Maintenance Mode Template', '<h2>The site is off for <span><h1>MAINTENANCE</h1></span></h2>', 1, 1, 1334835773, NULL),
(7, 'contactus_address', 'Contact Address', '22nd Floor, Mandiri Tower Plaza Bapindo <br/>\nJl. Jend. Sudirman Kav. 54-55 <br/>\nJakarta 12190, Indonesia', 1, 1, 1334835773, NULL),
(8, 'contactus_gmap', 'GMaps Location', 'http://maps.google.com/maps?q=-6.217668,106.812992&num=1&t=m&z=18', 1, 1, 1334835773, NULL),
(9, 'no_phone', 'Number Phone', '(021) 299-501-10 / (021) 526-0286', 1, 1, 1334835773, NULL),
(10, 'no_fax', 'Number Fax', '(021) 522.3718', 1, 1, 1334835773, NULL),
(11, 'title_default', 'Website Title Default', 'Connecting you to your consumer', 1, 1, NULL, NULL),
(12, 'title_name', 'Company Title Name', 'PT. Default (Web Agency in Jakarta)', 1, 1, NULL, 1336118568),
(13, 'language', 'Default Language', 'en', 1, 1, NULL, 1336118568),
(14, 'counter', 'Site Counter', '123', 1, 1, NULL, 1336118568),
(15, 'copyright', 'Copyright', '© 2012 COMPANY NAME COPYRIGHT. All Rights Reserved.', 1, 1, NULL, 1336118568),
(16, 'site_name', 'Site Name', ' Default <br/> PT. Default (Web Agency in Jakarta).', 1, 1, NULL, 1336118568),
(17, 'site_quote', 'Quote', 'We provide solution for your Websites', 1, 1, NULL, 1336118568),
(18, 'site_description', 'Website Description', 'We provide solution for your Company Website ', 1, 1, NULL, 1336118568),
(19, 'socmed_facebook', 'Facebook', 'http://facebook.com', 1, 1, NULL, 1336118568),
(20, 'socmed_twitter', 'Twitter', 'http://twitter.com', 1, 1, NULL, 1336118568),
(21, 'socmed_gplus', 'Google Plus', 'http://plus.google.com', 1, 1, NULL, 1336118568),
(22, 'socmed_linkedin', 'LinkedIn', 'http://linkedin.com', 1, 1, NULL, 1424754067),
(23, 'socmed_pinterest', 'Pinterest', 'http://pinterest.com', 1, 1, NULL, 1336118568),
(24, 'registered_mark', 'Registered', 'We provide solution for your Websites', 1, 1, NULL, 1336118568),
(25, 'google_analytics', 'Analytics', 'Code Snippet', 1, 1, NULL, 1336118568),
(26, 'ext_link', 'Ext Link', 'http://www.apb-career.net', 1, 1, NULL, 1423732944);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` char(64) CHARACTER SET latin1 NOT NULL,
  `email` varchar(64) CHARACTER SET latin1 NOT NULL,
  `password` char(124) CHARACTER SET latin1 NOT NULL,
  `group_id` tinyint(1) unsigned NOT NULL,
  `last_login` int(11) NOT NULL,
  `logged_in` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `session_id` varchar(160) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `email`, `password`, `group_id`, `last_login`, `logged_in`, `status`, `session_id`, `added`, `modified`) VALUES
(1, 'admin', 'admin@admin.com', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 1, 1426142067, 1, 1, '499f6f8dd3d3be2cdfe5c4d23dbefe52', 0, 0),
(2, 'joni', 'admin1@admin.com', '9003d1df22eb4d3820015070385194c8', 2, 1417003004, 0, 1, '', 0, 1424687676),
(3, 'qc9080', 'asdf@asdf.com', 'fb00378895cf135de3b135f385c0012f3823e4fb', 116, 1417001008, 0, 1, '', 1425031512, 1424689343),
(29, 'dyarfi', 'dyarfi20@gmail.com', '647dc5d75f6ce3c6a859eb3b91fa6ccaab05b245', 116, 0, 0, 1, '', 1417065898, 0),
(7, 'gmp1234', 'defrian.yarfi@gmail.com', '4d60cf3ac1381a533090412a84466000437eee1f', 116, 1417003001, 0, 1, '', 1425031542, 0),
(42, 'dyarfi20@gmail.com', 'dyarfi20@gmail.com', '8f956a5c8346e1909dce9a2aea8839d6f05e8ce1', 100, 0, 0, 1, '', 1425270772, 0),
(43, 'defrian.yarfi@gmail.com', 'defrian.yarfi@gmail.com', 'a49c1b8e9e2b8d49e78194b07fcaa045204647d3', 100, 0, 0, 1, '', 1425270783, 0),
(45, 'defrian.yarfi@gmail.com', 'defrian.yarfi@gmail.com', 'a49c1b8e9e2b8d49e78194b07fcaa045204647d3', 100, 0, 0, 1, '', 1425271011, 0),
(44, 'dyarfi20@gmail.com', 'dyarfi20@gmail.com', '8f956a5c8346e1909dce9a2aea8839d6f05e8ce1', 100, 0, 0, 1, '', 1425271008, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_groups`
--

CREATE TABLE IF NOT EXISTS `tbl_user_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `backend_access` tinyint(1) DEFAULT NULL,
  `full_backend_access` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `added` int(11) unsigned NOT NULL,
  `modified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `tbl_user_groups`
--

INSERT INTO `tbl_user_groups` (`id`, `name`, `backend_access`, `full_backend_access`, `status`, `is_system`, `added`, `modified`) VALUES
(1, 'Super Administrator', 1, 1, 1, 1, 1416499923, 0),
(2, 'Administrator', 1, 1, 1, 1, 1416499923, 0),
(99, 'User', 0, 0, 1, 1, 1416499923, 0),
(111, 'Manager', 1, 1, 0, 0, 0, 1425371383),
(112, 'Executive', 0, 0, 1, 0, 0, 0),
(113, 'Director', 0, 0, 1, 0, 0, 0),
(114, 'General', 0, 0, 1, 0, 0, 1424689329),
(116, 'Publisher', 1, 1, 1, 0, 0, 0),
(100, 'Employee', 1, NULL, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_histories`
--

CREATE TABLE IF NOT EXISTS `tbl_user_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(24) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `controller` varchar(160) NOT NULL,
  `action` char(20) DEFAULT NULL,
  `time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`module`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_user_histories`
--

INSERT INTO `tbl_user_histories` (`id`, `module`, `user_id`, `controller`, `action`, `time`) VALUES
(1, 'user', 1, 'history', 'index', 1416281220),
(2, 'user', 1, 'history', 'index', 1416281220);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profiles`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profiles` (
  `user_id` int(11) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '1',
  `about` text,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `division` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `address` text,
  `postal_code` varchar(8) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `mobile_phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `file_type` varchar(64) DEFAULT NULL,
  `file_name` varchar(48) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `added` int(11) unsigned NOT NULL,
  `modified` int(11) unsigned NOT NULL,
  KEY `user_id` (`user_id`,`phone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user_profiles`
--

INSERT INTO `tbl_user_profiles` (`user_id`, `gender`, `about`, `first_name`, `last_name`, `division`, `country`, `state`, `city`, `address`, `postal_code`, `birthday`, `phone`, `mobile_phone`, `fax`, `website`, `file_type`, `file_name`, `status`, `added`, `modified`) VALUES
(1, 1, 'Top Administrator of this website and portal', 'Administrator', 'Website', 'Web Programmer', 'DKI Jakarta', 'Jakarta', 'Jl. Gading Putih 1 F2 No. 4', '14240', '', '2010-09-06', '1234', '081807244697', '0', 'http://google.com', 'image/jpeg', 'users_default.png', 1, 1283760138, 1283831030),
(2, 1, 'Administrator of this Website', '', '', 'Web Designer', 'DKI Jakarta', 'Jakarta', 'Jl. Gading Putih 1 F2 No. 4', '14240', '', '2010-09-06', '1234', '081807244697', '0', '', 'image/jpeg', '78d57b4b5a0c6048b75bb0c9d91a8392.jpg', 1, 1283760138, 1424687676),
(3, 1, 'User of this Website', 'Administrator', 'Viewers', 'Jakarta', '', '', 'Jl. Pulomas Barat 1 No. 31', '', '', '2012-02-12', '1234', NULL, NULL, NULL, 'image/jpeg', 'a8a484572c007e1e17648ae2c7ad629c.jpg', 1, 1425031512, 1424689343),
(28, 1, 'Test', 'Public', 'Viewers', 'Web Programmer', NULL, NULL, NULL, NULL, NULL, '0000-00-00', '909090090', '909090090', NULL, NULL, NULL, NULL, 1, 1424854403, 1424689343),
(29, 1, 'Web Programmer not a full stack', 'Defrian', 'Yarfi', 'Web Programmer', NULL, NULL, NULL, NULL, NULL, '0000-00-00', '081807244697', '081807244697', NULL, NULL, NULL, NULL, 1, 1417065898, 0),
(44, 1, NULL, 'Dyarfi 20 Defrian Yarfi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '647474747', NULL, NULL, NULL, NULL, '20131013_142521a.jpg', 1, 1425271008, 0),
(45, 1, NULL, 'Defrian Yarfi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '647474747', NULL, NULL, NULL, NULL, '3b394-1513781_10205610488526266_3600135193534162', 1, 1425271011, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
