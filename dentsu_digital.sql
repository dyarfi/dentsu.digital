-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 13, 2015 at 07:55 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dentsu_digital`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=266 ;

--
-- Dumping data for table `tbl_captcha`
--

INSERT INTO `tbl_captcha` (`id`, `time`, `ip_address`, `word`) VALUES
(265, 1423734814, '::1', 'zwQyh');

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
  `job_purpose` tinytext,
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_careers`
--

INSERT INTO `tbl_careers` (`id`, `division_id`, `name`, `subject`, `sent_to`, `ref_no`, `start_date`, `end_date`, `report_to`, `job_purpose`, `responsibilities`, `requirements`, `location`, `company`, `ext_link1`, `ext_link2`, `allow_comment`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(6, 13, 'web-programmer', 'Web Programmer', 'defrian.yarfi@gmail.com', 'wp002', '2013-07-23', '2013-07-23', 'Project Manager', '<p>\n	&nbsp;Web Programmer</p>\n', '<p>\n	&nbsp;Web Programmer</p>\n', '<p>\n	&nbsp;Web Programmer</p>\n', 'Indonesia', 'Default', 'jobstreet.com', 'jobsdb.com', 0, 0, 0, 1, 1374560244, 1374561582),
(5, 13, 'web-developer', 'Web Developer', 'defrian.yarfi@gmail.com', 'wd001df', '2013-07-23', '2013-07-23', 'Project Manager', '<p>\n	Web Developer</p>\n', '<p>\n	Web Developer</p>\n', '<p>\n	Web Developer</p>\n', 'Jakarta', 'Default', 'jobstreet.com', 'jobstreet.com', 0, 0, 0, 1, 1374517350, 1374561700),
(4, 13, 'web-designer', 'Web Designer', 'defrian.yarfi@gmail.com', 'wd001df', '2013-07-23', '2013-07-23', 'Project Manager', '<p>\n	Web Designer</p>\n', '<p>\n	Web Designer</p>\n', '<p>\n	Web Designer</p>\n', 'Jakarta', 'Default', 'jobstreet.com', 'jobstreet.com', 0, 0, 0, 1, 1374517303, 1374561707);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_career_applicants`
--

CREATE TABLE IF NOT EXISTS `tbl_career_applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(11) NOT NULL,
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
  `status` enum('publish','unpublish','deleted') DEFAULT 'publish',
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_career_applicants`
--

INSERT INTO `tbl_career_applicants` (`id`, `career_id`, `name`, `email`, `gender`, `marital_status`, `id_number`, `phone`, `address`, `birth_date`, `birth_place`, `education_grade`, `education_name`, `education_major`, `education_from`, `education_to`, `employment_name`, `employment_position`, `employment_from`, `employment_to`, `photo`, `cv_file`, `is_located`, `is_related`, `messages`, `available_date`, `expected_salary`, `status`, `added`, `modified`) VALUES
(1, 6, 'Defrian Yarfi', 'defrian.yarfi@ymail.com', 1, 1, 'ASDAD12312312313', '647474747', '45745747', 4567457, '', '1', '', '', '', '', '', '', '', '', '20131013_142521a.jpg', 'AdMob Ad Specs.pdf', 0, 0, '457457457', 0, 0, 'publish', 0, 0),
(2, 6, 'Defrian Yarfi', 'defrian.yarfi@gmail.com', 1, 1, 'ASDAD12312312313', '647474747', '45745747', 4567457, '', '1', '', '', '', '', '', '', '', '', '3b394-1513781_10205610488526266_3600135193534162242_n.jpg', '976bd-export-2015-02-13_14_37_25.xls', 0, 0, '<p>\r\n	457457457</p>\r\n', 0, 0, 'publish', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_career_divisions`
--

CREATE TABLE IF NOT EXISTS `tbl_career_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('publish','unpublish','deleted') DEFAULT 'publish',
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tbl_career_divisions`
--

INSERT INTO `tbl_career_divisions` (`id`, `name`, `subject`, `description`, `is_system`, `status`, `added`, `modified`) VALUES
(12, 'human-resources', 'Human Resources', 'Lorem Ipsum Dolor Sit Amet', 1, 'publish', 1364610224, 0),
(13, 'creative', 'Creative', '<p>\n	Lorem Ipsum Dolor Sit Amet</p>\n', 1, 'publish', 1364610224, 1368369595);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_career_division_files`
--

CREATE TABLE IF NOT EXISTS `tbl_career_division_files` (
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
-- Dumping data for table `tbl_career_division_files`
--

INSERT INTO `tbl_career_division_files` (`id`, `division_id`, `field_name`, `file_name`, `file_type`, `caption`) VALUES
(1, 13, 'image_1', 'd0020c5505cc68f55446c109c352930d.jpg', 'image/jpeg', '');

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
('703d5a57e9e80d4e51300a550bf7191f', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1423832070, 'a:4:{s:9:"user_data";s:0:"";s:11:"module_list";s:510:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"User Listings","usergroup{{slash}}/index":"User Group Listings","setting{{slash}}/index":"Setting Listings"},"Module":{"modulelist{{slash}}/index":"Module Listing"},"Career":{"career{{slash}}/index":"Career Listings","careerdivision{{slash}}/index":"Career Division Listings","careerapplicant{{slash}}/index":"Career Applicant Listings"},"Page":{"page{{slash}}/index":"Page Listings","pagemenu{{slash}}/index":"Page Menu Listings"}}";s:20:"module_function_list";s:2243:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"User Listings","usergroup{{slash}}/index":"User Group Listings","setting{{slash}}/index":"Setting Listings","dashboard{{slash}}/add":"Add New Dashboard","dashboard{{slash}}/view":"View Dashboard Details","dashboard{{slash}}/edit":"Edit Dashboard Details","dashboard{{slash}}/delete":"Delete Dashboard","dashboard{{slash}}/change":"Change Dashboard Status","user{{slash}}/add":"Add User Details","user{{slash}}/view":"View User Details","user{{slash}}/edit":"Edit User Details","user{{slash}}/delete":"Delete User Details","user{{slash}}/change":"Change User Status","usergroup{{slash}}/add":"Add User Group Details","usergroup{{slash}}/view":"View User Group Details","usergroup{{slash}}/edit":"Edit User Group Details","usergroup{{slash}}/delete":"Delete User Group Details","usergroup{{slash}}/change":"Change User Group Status","setting{{slash}}/add":"Add Setting Details","setting{{slash}}/view":"View Setting Details","setting{{slash}}/edit":"Edit Setting Details","setting{{slash}}/delete":"Delete Setting Details","setting{{slash}}/change":"Change Setting Status"},"Module":{"modulelist{{slash}}/edit":"Edit Module Details"},"Career":{"career{{slash}}/index":"Career Listings","careerdivision{{slash}}/index":"Career Division Listings","careerapplicant{{slash}}/index":"Career Applicant Listings","career{{slash}}/add":"Add Career Details","career{{slash}}/view":"View Career Details","career{{slash}}/edit":"Edit Career Details","career{{slash}}/delete":"Delete Career Details","career{{slash}}/change":"Change Career Status","careerapplicant{{slash}}/add":"Add Career Division Listings","careerapplicant{{slash}}/view":"View Career Division Listings","careerapplicant{{slash}}/edit":"Edit Career Division Listings","careerapplicant{{slash}}/delete":"Delete Career Division Listings","careerapplicant{{slash}}/change":"Change Career Division Listings"},"Page":{"page{{slash}}/index":"Page Listings","pagemenu{{slash}}/index":"Page Menu Listings","page{{slash}}/add":"Add Page Details","page{{slash}}/view":"View Page Details","page{{slash}}/edit":"Edit Page Details","page{{slash}}/delete":"Delete Page Details","page{{slash}}/change":"Change Page Status"}}";s:12:"user_session";O:8:"stdClass":9:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@admin.com";s:8:"password";s:8:"********";s:8:"group_id";s:1:"1";s:6:"status";s:1:"1";s:10:"last_login";s:10:"1418274077";s:9:"logged_in";b:1;s:4:"name";s:21:"Administrator Website";}}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=353 ;

--
-- Dumping data for table `tbl_group_permissions`
--

INSERT INTO `tbl_group_permissions` (`id`, `permission_id`, `group_id`, `value`, `added`, `modified`) VALUES
(1, 1, 1, 1, 1423831705, 0),
(2, 2, 1, 1, 1423831705, 0),
(3, 3, 1, 1, 1423831705, 0),
(4, 4, 1, 1, 1423831705, 0),
(5, 25, 1, 1, 1423831705, 0),
(6, 26, 1, 1, 1423831705, 0),
(7, 27, 1, 1, 1423831705, 0),
(8, 38, 1, 1, 1423831705, 0),
(9, 39, 1, 1, 1423831705, 0),
(10, 5, 1, 1, 1423831705, 0),
(11, 6, 1, 1, 1423831705, 0),
(12, 7, 1, 1, 1423831705, 0),
(13, 8, 1, 1, 1423831705, 0),
(14, 9, 1, 1, 1423831705, 0),
(15, 10, 1, 1, 1423831705, 0),
(16, 11, 1, 1, 1423831705, 0),
(17, 12, 1, 1, 1423831705, 0),
(18, 13, 1, 1, 1423831705, 0),
(19, 14, 1, 1, 1423831705, 0),
(20, 15, 1, 1, 1423831705, 0),
(21, 16, 1, 1, 1423831705, 0),
(22, 17, 1, 1, 1423831705, 0),
(23, 18, 1, 1, 1423831705, 0),
(24, 19, 1, 1, 1423831705, 0),
(25, 20, 1, 1, 1423831705, 0),
(26, 21, 1, 1, 1423831705, 0),
(27, 22, 1, 1, 1423831705, 0),
(28, 23, 1, 1, 1423831705, 0),
(29, 24, 1, 1, 1423831705, 0),
(30, 28, 1, 1, 1423831705, 0),
(31, 29, 1, 1, 1423831705, 0),
(32, 30, 1, 1, 1423831705, 0),
(33, 31, 1, 1, 1423831705, 0),
(34, 32, 1, 1, 1423831705, 0),
(35, 33, 1, 1, 1423831705, 0),
(36, 34, 1, 1, 1423831705, 0),
(37, 35, 1, 1, 1423831705, 0),
(38, 36, 1, 1, 1423831705, 0),
(39, 37, 1, 1, 1423831705, 0),
(40, 40, 1, 1, 1423831705, 0),
(41, 41, 1, 1, 1423831705, 0),
(42, 42, 1, 1, 1423831705, 0),
(43, 43, 1, 1, 1423831705, 0),
(44, 44, 1, 1, 1423831705, 0),
(45, 1, 2, 1, 1423831705, 0),
(46, 2, 2, 1, 1423831705, 0),
(47, 3, 2, 1, 1423831705, 0),
(48, 4, 2, 1, 1423831705, 0),
(49, 25, 2, 1, 1423831705, 0),
(50, 26, 2, 1, 1423831705, 0),
(51, 27, 2, 1, 1423831705, 0),
(52, 38, 2, 1, 1423831705, 0),
(53, 39, 2, 1, 1423831705, 0),
(54, 5, 2, 1, 1423831705, 0),
(55, 6, 2, 1, 1423831705, 0),
(56, 7, 2, 1, 1423831705, 0),
(57, 8, 2, 1, 1423831705, 0),
(58, 9, 2, 1, 1423831705, 0),
(59, 10, 2, 1, 1423831705, 0),
(60, 11, 2, 1, 1423831705, 0),
(61, 12, 2, 1, 1423831705, 0),
(62, 13, 2, 1, 1423831705, 0),
(63, 14, 2, 1, 1423831705, 0),
(64, 15, 2, 1, 1423831705, 0),
(65, 16, 2, 1, 1423831705, 0),
(66, 17, 2, 1, 1423831705, 0),
(67, 18, 2, 1, 1423831705, 0),
(68, 19, 2, 1, 1423831705, 0),
(69, 20, 2, 1, 1423831705, 0),
(70, 21, 2, 1, 1423831705, 0),
(71, 22, 2, 1, 1423831705, 0),
(72, 23, 2, 1, 1423831705, 0),
(73, 24, 2, 1, 1423831705, 0),
(74, 28, 2, 1, 1423831705, 0),
(75, 29, 2, 1, 1423831705, 0),
(76, 30, 2, 1, 1423831705, 0),
(77, 31, 2, 1, 1423831705, 0),
(78, 32, 2, 1, 1423831705, 0),
(79, 33, 2, 1, 1423831705, 0),
(80, 34, 2, 1, 1423831705, 0),
(81, 35, 2, 1, 1423831705, 0),
(82, 36, 2, 1, 1423831705, 0),
(83, 37, 2, 1, 1423831705, 0),
(84, 40, 2, 1, 1423831705, 0),
(85, 41, 2, 1, 1423831705, 0),
(86, 42, 2, 1, 1423831705, 0),
(87, 43, 2, 1, 1423831705, 0),
(88, 44, 2, 1, 1423831705, 0),
(89, 1, 99, 0, 1423831705, 0),
(90, 2, 99, 0, 1423831705, 0),
(91, 3, 99, 0, 1423831705, 0),
(92, 4, 99, 0, 1423831705, 0),
(93, 25, 99, 0, 1423831705, 0),
(94, 26, 99, 0, 1423831705, 0),
(95, 27, 99, 0, 1423831705, 0),
(96, 38, 99, 0, 1423831705, 0),
(97, 39, 99, 0, 1423831705, 0),
(98, 5, 99, 0, 1423831705, 0),
(99, 6, 99, 0, 1423831705, 0),
(100, 7, 99, 0, 1423831705, 0),
(101, 8, 99, 0, 1423831705, 0),
(102, 9, 99, 0, 1423831705, 0),
(103, 10, 99, 0, 1423831705, 0),
(104, 11, 99, 0, 1423831705, 0),
(105, 12, 99, 0, 1423831705, 0),
(106, 13, 99, 0, 1423831705, 0),
(107, 14, 99, 0, 1423831705, 0),
(108, 15, 99, 0, 1423831705, 0),
(109, 16, 99, 0, 1423831705, 0),
(110, 17, 99, 0, 1423831705, 0),
(111, 18, 99, 0, 1423831705, 0),
(112, 19, 99, 0, 1423831705, 0),
(113, 20, 99, 0, 1423831705, 0),
(114, 21, 99, 0, 1423831705, 0),
(115, 22, 99, 0, 1423831705, 0),
(116, 23, 99, 0, 1423831705, 0),
(117, 24, 99, 0, 1423831705, 0),
(118, 28, 99, 0, 1423831705, 0),
(119, 29, 99, 0, 1423831705, 0),
(120, 30, 99, 0, 1423831705, 0),
(121, 31, 99, 0, 1423831705, 0),
(122, 32, 99, 0, 1423831705, 0),
(123, 33, 99, 0, 1423831705, 0),
(124, 34, 99, 0, 1423831705, 0),
(125, 35, 99, 0, 1423831705, 0),
(126, 36, 99, 0, 1423831705, 0),
(127, 37, 99, 0, 1423831705, 0),
(128, 40, 99, 0, 1423831705, 0),
(129, 41, 99, 0, 1423831705, 0),
(130, 42, 99, 0, 1423831705, 0),
(131, 43, 99, 0, 1423831705, 0),
(132, 44, 99, 0, 1423831705, 0),
(133, 1, 111, 0, 1423831705, 0),
(134, 2, 111, 0, 1423831705, 0),
(135, 3, 111, 0, 1423831705, 0),
(136, 4, 111, 0, 1423831705, 0),
(137, 25, 111, 0, 1423831705, 0),
(138, 26, 111, 0, 1423831705, 0),
(139, 27, 111, 0, 1423831705, 0),
(140, 38, 111, 0, 1423831705, 0),
(141, 39, 111, 0, 1423831705, 0),
(142, 5, 111, 0, 1423831705, 0),
(143, 6, 111, 0, 1423831705, 0),
(144, 7, 111, 0, 1423831705, 0),
(145, 8, 111, 0, 1423831705, 0),
(146, 9, 111, 0, 1423831705, 0),
(147, 10, 111, 0, 1423831705, 0),
(148, 11, 111, 0, 1423831705, 0),
(149, 12, 111, 0, 1423831705, 0),
(150, 13, 111, 0, 1423831705, 0),
(151, 14, 111, 0, 1423831705, 0),
(152, 15, 111, 0, 1423831705, 0),
(153, 16, 111, 0, 1423831705, 0),
(154, 17, 111, 0, 1423831705, 0),
(155, 18, 111, 0, 1423831705, 0),
(156, 19, 111, 0, 1423831705, 0),
(157, 20, 111, 0, 1423831705, 0),
(158, 21, 111, 0, 1423831705, 0),
(159, 22, 111, 0, 1423831705, 0),
(160, 23, 111, 0, 1423831705, 0),
(161, 24, 111, 0, 1423831705, 0),
(162, 28, 111, 0, 1423831705, 0),
(163, 29, 111, 0, 1423831705, 0),
(164, 30, 111, 0, 1423831705, 0),
(165, 31, 111, 0, 1423831705, 0),
(166, 32, 111, 0, 1423831705, 0),
(167, 33, 111, 0, 1423831705, 0),
(168, 34, 111, 0, 1423831705, 0),
(169, 35, 111, 0, 1423831705, 0),
(170, 36, 111, 0, 1423831705, 0),
(171, 37, 111, 0, 1423831705, 0),
(172, 40, 111, 0, 1423831705, 0),
(173, 41, 111, 0, 1423831705, 0),
(174, 42, 111, 0, 1423831705, 0),
(175, 43, 111, 0, 1423831705, 0),
(176, 44, 111, 0, 1423831705, 0),
(177, 1, 112, 0, 1423831705, 0),
(178, 2, 112, 0, 1423831705, 0),
(179, 3, 112, 0, 1423831705, 0),
(180, 4, 112, 0, 1423831705, 0),
(181, 25, 112, 0, 1423831705, 0),
(182, 26, 112, 0, 1423831705, 0),
(183, 27, 112, 0, 1423831705, 0),
(184, 38, 112, 0, 1423831705, 0),
(185, 39, 112, 0, 1423831705, 0),
(186, 5, 112, 0, 1423831705, 0),
(187, 6, 112, 0, 1423831705, 0),
(188, 7, 112, 0, 1423831705, 0),
(189, 8, 112, 0, 1423831705, 0),
(190, 9, 112, 0, 1423831705, 0),
(191, 10, 112, 0, 1423831705, 0),
(192, 11, 112, 0, 1423831705, 0),
(193, 12, 112, 0, 1423831705, 0),
(194, 13, 112, 0, 1423831705, 0),
(195, 14, 112, 0, 1423831705, 0),
(196, 15, 112, 0, 1423831705, 0),
(197, 16, 112, 0, 1423831705, 0),
(198, 17, 112, 0, 1423831705, 0),
(199, 18, 112, 0, 1423831705, 0),
(200, 19, 112, 0, 1423831705, 0),
(201, 20, 112, 0, 1423831705, 0),
(202, 21, 112, 0, 1423831705, 0),
(203, 22, 112, 0, 1423831705, 0),
(204, 23, 112, 0, 1423831705, 0),
(205, 24, 112, 0, 1423831705, 0),
(206, 28, 112, 0, 1423831705, 0),
(207, 29, 112, 0, 1423831705, 0),
(208, 30, 112, 0, 1423831705, 0),
(209, 31, 112, 0, 1423831705, 0),
(210, 32, 112, 0, 1423831705, 0),
(211, 33, 112, 0, 1423831705, 0),
(212, 34, 112, 0, 1423831705, 0),
(213, 35, 112, 0, 1423831705, 0),
(214, 36, 112, 0, 1423831705, 0),
(215, 37, 112, 0, 1423831705, 0),
(216, 40, 112, 0, 1423831705, 0),
(217, 41, 112, 0, 1423831705, 0),
(218, 42, 112, 0, 1423831705, 0),
(219, 43, 112, 0, 1423831705, 0),
(220, 44, 112, 0, 1423831705, 0),
(221, 1, 113, 0, 1423831705, 0),
(222, 2, 113, 0, 1423831705, 0),
(223, 3, 113, 0, 1423831705, 0),
(224, 4, 113, 0, 1423831705, 0),
(225, 25, 113, 0, 1423831705, 0),
(226, 26, 113, 0, 1423831705, 0),
(227, 27, 113, 0, 1423831705, 0),
(228, 38, 113, 0, 1423831705, 0),
(229, 39, 113, 0, 1423831705, 0),
(230, 5, 113, 0, 1423831705, 0),
(231, 6, 113, 0, 1423831705, 0),
(232, 7, 113, 0, 1423831705, 0),
(233, 8, 113, 0, 1423831705, 0),
(234, 9, 113, 0, 1423831705, 0),
(235, 10, 113, 0, 1423831705, 0),
(236, 11, 113, 0, 1423831705, 0),
(237, 12, 113, 0, 1423831705, 0),
(238, 13, 113, 0, 1423831705, 0),
(239, 14, 113, 0, 1423831705, 0),
(240, 15, 113, 0, 1423831705, 0),
(241, 16, 113, 0, 1423831705, 0),
(242, 17, 113, 0, 1423831705, 0),
(243, 18, 113, 0, 1423831705, 0),
(244, 19, 113, 0, 1423831705, 0),
(245, 20, 113, 0, 1423831705, 0),
(246, 21, 113, 0, 1423831705, 0),
(247, 22, 113, 0, 1423831705, 0),
(248, 23, 113, 0, 1423831705, 0),
(249, 24, 113, 0, 1423831705, 0),
(250, 28, 113, 0, 1423831705, 0),
(251, 29, 113, 0, 1423831705, 0),
(252, 30, 113, 0, 1423831705, 0),
(253, 31, 113, 0, 1423831705, 0),
(254, 32, 113, 0, 1423831705, 0),
(255, 33, 113, 0, 1423831705, 0),
(256, 34, 113, 0, 1423831705, 0),
(257, 35, 113, 0, 1423831705, 0),
(258, 36, 113, 0, 1423831705, 0),
(259, 37, 113, 0, 1423831705, 0),
(260, 40, 113, 0, 1423831705, 0),
(261, 41, 113, 0, 1423831705, 0),
(262, 42, 113, 0, 1423831705, 0),
(263, 43, 113, 0, 1423831705, 0),
(264, 44, 113, 0, 1423831705, 0),
(265, 1, 114, 0, 1423831705, 0),
(266, 2, 114, 0, 1423831705, 0),
(267, 3, 114, 0, 1423831705, 0),
(268, 4, 114, 0, 1423831705, 0),
(269, 25, 114, 0, 1423831705, 0),
(270, 26, 114, 0, 1423831705, 0),
(271, 27, 114, 0, 1423831705, 0),
(272, 38, 114, 0, 1423831705, 0),
(273, 39, 114, 0, 1423831705, 0),
(274, 5, 114, 0, 1423831705, 0),
(275, 6, 114, 0, 1423831705, 0),
(276, 7, 114, 0, 1423831705, 0),
(277, 8, 114, 0, 1423831705, 0),
(278, 9, 114, 0, 1423831705, 0),
(279, 10, 114, 0, 1423831705, 0),
(280, 11, 114, 0, 1423831705, 0),
(281, 12, 114, 0, 1423831705, 0),
(282, 13, 114, 0, 1423831705, 0),
(283, 14, 114, 0, 1423831705, 0),
(284, 15, 114, 0, 1423831705, 0),
(285, 16, 114, 0, 1423831705, 0),
(286, 17, 114, 0, 1423831705, 0),
(287, 18, 114, 0, 1423831705, 0),
(288, 19, 114, 0, 1423831705, 0),
(289, 20, 114, 0, 1423831705, 0),
(290, 21, 114, 0, 1423831705, 0),
(291, 22, 114, 0, 1423831705, 0),
(292, 23, 114, 0, 1423831705, 0),
(293, 24, 114, 0, 1423831705, 0),
(294, 28, 114, 0, 1423831705, 0),
(295, 29, 114, 0, 1423831705, 0),
(296, 30, 114, 0, 1423831705, 0),
(297, 31, 114, 0, 1423831705, 0),
(298, 32, 114, 0, 1423831705, 0),
(299, 33, 114, 0, 1423831705, 0),
(300, 34, 114, 0, 1423831705, 0),
(301, 35, 114, 0, 1423831705, 0),
(302, 36, 114, 0, 1423831705, 0),
(303, 37, 114, 0, 1423831705, 0),
(304, 40, 114, 0, 1423831705, 0),
(305, 41, 114, 0, 1423831705, 0),
(306, 42, 114, 0, 1423831705, 0),
(307, 43, 114, 0, 1423831705, 0),
(308, 44, 114, 0, 1423831705, 0),
(309, 1, 116, 0, 1423831705, 0),
(310, 2, 116, 0, 1423831705, 0),
(311, 3, 116, 0, 1423831705, 0),
(312, 4, 116, 0, 1423831705, 0),
(313, 25, 116, 0, 1423831705, 0),
(314, 26, 116, 0, 1423831705, 0),
(315, 27, 116, 0, 1423831705, 0),
(316, 38, 116, 0, 1423831705, 0),
(317, 39, 116, 0, 1423831705, 0),
(318, 5, 116, 0, 1423831705, 0),
(319, 6, 116, 0, 1423831705, 0),
(320, 7, 116, 0, 1423831705, 0),
(321, 8, 116, 0, 1423831705, 0),
(322, 9, 116, 0, 1423831705, 0),
(323, 10, 116, 0, 1423831705, 0),
(324, 11, 116, 0, 1423831705, 0),
(325, 12, 116, 0, 1423831705, 0),
(326, 13, 116, 0, 1423831705, 0),
(327, 14, 116, 0, 1423831705, 0),
(328, 15, 116, 0, 1423831705, 0),
(329, 16, 116, 0, 1423831705, 0),
(330, 17, 116, 0, 1423831705, 0),
(331, 18, 116, 0, 1423831705, 0),
(332, 19, 116, 0, 1423831705, 0),
(333, 20, 116, 0, 1423831705, 0),
(334, 21, 116, 0, 1423831705, 0),
(335, 22, 116, 0, 1423831705, 0),
(336, 23, 116, 0, 1423831705, 0),
(337, 24, 116, 0, 1423831705, 0),
(338, 28, 116, 0, 1423831705, 0),
(339, 29, 116, 0, 1423831705, 0),
(340, 30, 116, 0, 1423831705, 0),
(341, 31, 116, 0, 1423831705, 0),
(342, 32, 116, 0, 1423831705, 0),
(343, 33, 116, 0, 1423831705, 0),
(344, 34, 116, 0, 1423831705, 0),
(345, 35, 116, 0, 1423831705, 0),
(346, 36, 116, 0, 1423831705, 0),
(347, 37, 116, 0, 1423831705, 0),
(348, 40, 116, 0, 1423831705, 0),
(349, 41, 116, 0, 1423831705, 0),
(350, 42, 116, 0, 1423831705, 0),
(351, 43, 116, 0, 1423831705, 0),
(352, 44, 116, 0, 1423831705, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbl_model_lists`
--

INSERT INTO `tbl_model_lists` (`id`, `module_id`, `model`) VALUES
(1, 1, 'Users'),
(2, 1, 'UserGroups'),
(3, 1, 'UserProfiles'),
(4, 1, 'UserHistories'),
(5, 1, 'ModulePermissions'),
(6, 1, 'Settings'),
(7, 6, 'Careers'),
(8, 6, 'CareerDivisions'),
(9, 6, 'CareerApplicants'),
(10, 10, 'Pages'),
(11, 10, 'PageMenus');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tbl_module_lists`
--

INSERT INTO `tbl_module_lists` (`id`, `parent_id`, `module_name`, `module_link`, `order`) VALUES
(1, 0, 'admin', '#', 0),
(2, 1, 'Dashboard Panel', 'dashboard/index', 0),
(3, 1, 'User Listings', 'user/index', 1),
(4, 1, 'User Group Listings', 'usergroup/index', 2),
(5, 1, 'Setting Listings', 'setting/index', 3),
(6, 0, 'career', '#', 1),
(7, 6, 'Career Listings', 'career/index', 0),
(8, 6, 'Career Division Listings', 'careerdivision/index', 1),
(9, 6, 'Career Applicant Listings', 'careerapplicant/index', 2),
(10, 0, 'page', '#', 2),
(11, 10, 'Page Listings', 'page/index', 0),
(12, 10, 'Page Menu Listings', 'pagemenu/index', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `tbl_module_permissions`
--

INSERT INTO `tbl_module_permissions` (`id`, `module_id`, `module_name`, `module_link`, `order`) VALUES
(1, 1, 'Dashboard Panel', 'dashboard/index', 0),
(2, 1, 'User Listings', 'user/index', 1),
(3, 1, 'User Group Listings', 'usergroup/index', 2),
(4, 1, 'Setting Listings', 'setting/index', 3),
(5, 1, 'Add New Dashboard', 'dashboard/add', 4),
(6, 1, 'View Dashboard Details', 'dashboard/view', 5),
(7, 1, 'Edit Dashboard Details', 'dashboard/edit', 6),
(8, 1, 'Delete Dashboard', 'dashboard/delete', 7),
(9, 1, 'Change Dashboard Status', 'dashboard/change', 8),
(10, 1, 'Add User Details', 'user/add', 9),
(11, 1, 'View User Details', 'user/view', 10),
(12, 1, 'Edit User Details', 'user/edit', 11),
(13, 1, 'Delete User Details', 'user/delete', 12),
(14, 1, 'Change User Status', 'user/change', 13),
(15, 1, 'Add User Group Details', 'usergroup/add', 14),
(16, 1, 'View User Group Details', 'usergroup/view', 15),
(17, 1, 'Edit User Group Details', 'usergroup/edit', 16),
(18, 1, 'Delete User Group Details', 'usergroup/delete', 17),
(19, 1, 'Change User Group Status', 'usergroup/change', 18),
(20, 1, 'Add Setting Details', 'setting/add', 19),
(21, 1, 'View Setting Details', 'setting/view', 20),
(22, 1, 'Edit Setting Details', 'setting/edit', 21),
(23, 1, 'Delete Setting Details', 'setting/delete', 22),
(24, 1, 'Change Setting Status', 'setting/change', 23),
(25, 6, 'Career Listings', 'career/index', 0),
(26, 6, 'Career Division Listings', 'careerdivision/index', 1),
(27, 6, 'Career Applicant Listings', 'careerapplicant/index', 2),
(28, 6, 'Add Career Details', 'career/add', 3),
(29, 6, 'View Career Details', 'career/view', 4),
(30, 6, 'Edit Career Details', 'career/edit', 5),
(31, 6, 'Delete Career Details', 'career/delete', 6),
(32, 6, 'Change Career Status', 'career/change', 7),
(33, 6, 'Add Career Division Listings', 'careerapplicant/add', 8),
(34, 6, 'View Career Division Listings', 'careerapplicant/view', 9),
(35, 6, 'Edit Career Division Listings', 'careerapplicant/edit', 10),
(36, 6, 'Delete Career Division Listings', 'careerapplicant/delete', 11),
(37, 6, 'Change Career Division Listings', 'careerapplicant/change', 12),
(38, 10, 'Page Listings', 'page/index', 0),
(39, 10, 'Page Menu Listings', 'pagemenu/index', 1),
(40, 10, 'Add Page Details', 'page/add', 2),
(41, 10, 'View Page Details', 'page/view', 3),
(42, 10, 'Edit Page Details', 'page/edit', 4),
(43, 10, 'Delete Page Details', 'page/delete', 5),
(44, 10, 'Change Page Status', 'page/change', 6);

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
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`menu_id`,`name`,`publish_date`,`unpublish_date`,`allow_comment`,`order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_pages`
--

INSERT INTO `tbl_pages` (`id`, `menu_id`, `name`, `subject`, `synopsis`, `text`, `attribute`, `publish_date`, `unpublish_date`, `allow_comment`, `tags`, `order`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, 1, 'Test page one', 'test-page-one', '<p>\r\n	Test page one</p>\r\n', '<p>\r\n	Test page one</p>\r\n', NULL, '2015-02-13', '2015-02-28', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_page_menus`
--

INSERT INTO `tbl_page_menus` (`id`, `parent_id`, `name`, `title`, `description`, `url`, `media`, `position`, `sub_level`, `order`, `is_system`, `has_child`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, NULL, 'Menu One', 'menu-one', '<p>\r\n	Menu One Description</p>\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL);

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
(22, 'socmed_linkedin', 'LinkedIn', 'http://linkedin.com', 1, 1, NULL, 1336118568),
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
  `username` char(8) CHARACTER SET latin1 NOT NULL,
  `email` varchar(64) CHARACTER SET latin1 NOT NULL,
  `password` char(124) CHARACTER SET latin1 NOT NULL,
  `group_id` tinyint(1) unsigned NOT NULL,
  `last_login` int(11) NOT NULL,
  `logged_in` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `session` varchar(160) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `email`, `password`, `group_id`, `last_login`, `logged_in`, `status`, `session`, `added`, `modified`) VALUES
(1, 'admin', 'admin@admin.com', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 1, 1418274077, 1, 1, '', 0, 0),
(2, 'joni', 'admin1@admin.com', '9003d1df22eb4d3820015070385194c8', 2, 1417003004, 0, 1, '', 0, 0),
(3, 'qc', 'asdf@asdf.com', 'fb00378895cf135de3b135f385c0012f3823e4fb', 3, 1417001008, 0, 1, '', 0, 0),
(29, 'dyarfi', 'dyarfi20@gmail.com', '647dc5d75f6ce3c6a859eb3b91fa6ccaab05b245', 116, 0, 0, 1, '', 1417065898, 0),
(7, 'gmp', 'defrian.yarfi@gmail.com', '4d60cf3ac1381a533090412a84466000437eee1f', 4, 1417003001, 0, 1, '', 0, 0),
(28, 'public', 'defrian.yarfi@yahoo.com', '616eae925a4c10a70f2675d13d5c9e909f4d60c6', 110, 1417001002, 1, 1, '', 1416993998, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

--
-- Dumping data for table `tbl_user_groups`
--

INSERT INTO `tbl_user_groups` (`id`, `name`, `backend_access`, `full_backend_access`, `status`, `is_system`, `added`, `modified`) VALUES
(1, 'Super Administrator', 1, 1, 1, 1, 1416499923, 0),
(2, 'Administrator', 1, 1, 1, 1, 1416499923, 0),
(99, 'User', 0, 0, 1, 1, 1416499923, 0),
(111, 'Manager', 0, 0, 1, 0, 0, 0),
(112, 'Executive', 0, 0, 1, 0, 0, 0),
(113, 'Director', 0, 0, 1, 0, 0, 0),
(114, 'General', 0, 0, 1, 0, 0, 0),
(116, 'Publisher', 1, 1, 1, 0, 0, 0);

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
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
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
(1, 'male', 'Top Administrator of this website and portal', 'Administrator', 'Website', 'Web Programmer', 'DKI Jakarta', 'Jakarta', 'Jl. Gading Putih 1 F2 No. 4', '14240', '', '2010-09-06', '1234', '081807244697', '0', 'http://google.com', 'image/jpeg', 'users_default.png', 1, 1283760138, 1283831030),
(2, 'male', 'Administrator of this Website', '', '', 'Web Designer', 'DKI Jakarta', 'Jakarta', 'Jl. Gading Putih 1 F2 No. 4', '14240', '', '2010-09-06', '1234', '081807244697', '0', '', 'image/jpeg', '78d57b4b5a0c6048b75bb0c9d91a8392.jpg', 1, 1283760138, 1283831030),
(3, 'male', 'User of this Website', '', '', 'Jakarta', '', '', 'Jl. Pulomas Barat 1 No. 31', '', '', '0000-00-00', '1234', '', '', '', 'image/jpeg', 'a8a484572c007e1e17648ae2c7ad629c.jpg', 1, 1285152397, 0),
(28, 'male', 'Test', 'Public', 'Viewers', 'Web Programmer', NULL, NULL, NULL, NULL, NULL, '0000-00-00', '909090090', '909090090', NULL, NULL, NULL, NULL, 1, 1416993998, 0),
(29, 'male', 'Web Programmer not a full stack', 'Defrian', 'Yarfi', 'Web Programmer', NULL, NULL, NULL, NULL, NULL, '0000-00-00', '081807244697', '081807244697', NULL, NULL, NULL, NULL, 1, 1417065898, 0),
(111, 'male', '', 'Web Developer', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', 1, 1333442128, 1333442192),
(110, 'male', '', 'Web Developer', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', 1, 1333441986, 1333442058);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
