-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 13, 2015 at 05:26 PM
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
('9520df50974deccc3634863ae5aa363c', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1423814370, 'a:4:{s:9:"user_data";s:0:"";s:11:"module_list";s:463:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"User Listings","usergroup{{slash}}/index":"User Group Listings","setting{{slash}}/index":"Setting Listings"},"Module":{"modulelist{{slash}}/index":"Module Listing"},"Career":{"career{{slash}}/index":"Career Listings","careerdivision{{slash}}/index":"Career Division Listings","careerapplicant{{slash}}/index":"Career Applicant Listings"},"Page":{"page{{slash}}/index":"Page Listings"}}";s:20:"module_function_list";s:2196:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"User Listings","usergroup{{slash}}/index":"User Group Listings","setting{{slash}}/index":"Setting Listings","dashboard{{slash}}/add":"Add New Dashboard","dashboard{{slash}}/view":"View Dashboard Details","dashboard{{slash}}/edit":"Edit Dashboard Details","dashboard{{slash}}/delete":"Delete Dashboard","dashboard{{slash}}/change":"Change Dashboard Status","user{{slash}}/add":"Add User Details","user{{slash}}/view":"View User Details","user{{slash}}/edit":"Edit User Details","user{{slash}}/delete":"Delete User Details","user{{slash}}/change":"Change User Status","usergroup{{slash}}/add":"Add User Group Details","usergroup{{slash}}/view":"View User Group Details","usergroup{{slash}}/edit":"Edit User Group Details","usergroup{{slash}}/delete":"Delete User Group Details","usergroup{{slash}}/change":"Change User Group Status","setting{{slash}}/add":"Add Setting Details","setting{{slash}}/view":"View Setting Details","setting{{slash}}/edit":"Edit Setting Details","setting{{slash}}/delete":"Delete Setting Details","setting{{slash}}/change":"Change Setting Status"},"Module":{"modulelist{{slash}}/edit":"Edit Module Details"},"Career":{"career{{slash}}/index":"Career Listings","careerdivision{{slash}}/index":"Career Division Listings","careerapplicant{{slash}}/index":"Career Applicant Listings","career{{slash}}/add":"Add Career Details","career{{slash}}/view":"View Career Details","career{{slash}}/edit":"Edit Career Details","career{{slash}}/delete":"Delete Career Details","career{{slash}}/change":"Change Career Status","careerapplicant{{slash}}/add":"Add Career Division Listings","careerapplicant{{slash}}/view":"View Career Division Listings","careerapplicant{{slash}}/edit":"Edit Career Division Listings","careerapplicant{{slash}}/delete":"Delete Career Division Listings","careerapplicant{{slash}}/change":"Change Career Division Listings"},"Page":{"page{{slash}}/index":"Page Listings","page{{slash}}/add":"Add Page Details","page{{slash}}/view":"View Page Details","page{{slash}}/edit":"Edit Page Details","page{{slash}}/delete":"Delete Page Details","page{{slash}}/change":"Change Page Status"}}";s:12:"user_session";O:8:"stdClass":9:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@admin.com";s:8:"password";s:8:"********";s:8:"group_id";s:1:"1";s:6:"status";s:1:"1";s:10:"last_login";s:10:"1418274077";s:9:"logged_in";b:1;s:4:"name";s:21:"Administrator Website";}}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=345 ;

--
-- Dumping data for table `tbl_group_permissions`
--

INSERT INTO `tbl_group_permissions` (`id`, `permission_id`, `group_id`, `value`, `added`, `modified`) VALUES
(1, 1, 1, 1, 1423734550, 0),
(2, 2, 1, 1, 1423734550, 0),
(3, 3, 1, 1, 1423734550, 0),
(4, 4, 1, 1, 1423734550, 0),
(5, 25, 1, 1, 1423734550, 0),
(6, 26, 1, 1, 1423734550, 0),
(7, 27, 1, 1, 1423734550, 0),
(8, 38, 1, 1, 1423734550, 0),
(9, 5, 1, 1, 1423734550, 0),
(10, 6, 1, 1, 1423734550, 0),
(11, 7, 1, 1, 1423734550, 0),
(12, 8, 1, 1, 1423734550, 0),
(13, 9, 1, 1, 1423734550, 0),
(14, 10, 1, 1, 1423734550, 0),
(15, 11, 1, 1, 1423734550, 0),
(16, 12, 1, 1, 1423734550, 0),
(17, 13, 1, 1, 1423734550, 0),
(18, 14, 1, 1, 1423734550, 0),
(19, 15, 1, 1, 1423734550, 0),
(20, 16, 1, 1, 1423734550, 0),
(21, 17, 1, 1, 1423734550, 0),
(22, 18, 1, 1, 1423734550, 0),
(23, 19, 1, 1, 1423734550, 0),
(24, 20, 1, 1, 1423734550, 0),
(25, 21, 1, 1, 1423734550, 0),
(26, 22, 1, 1, 1423734550, 0),
(27, 23, 1, 1, 1423734550, 0),
(28, 24, 1, 1, 1423734550, 0),
(29, 28, 1, 1, 1423734550, 0),
(30, 29, 1, 1, 1423734550, 0),
(31, 30, 1, 1, 1423734550, 0),
(32, 31, 1, 1, 1423734550, 0),
(33, 32, 1, 1, 1423734550, 0),
(34, 33, 1, 1, 1423734550, 0),
(35, 34, 1, 1, 1423734550, 0),
(36, 35, 1, 1, 1423734550, 0),
(37, 36, 1, 1, 1423734550, 0),
(38, 37, 1, 1, 1423734550, 0),
(39, 39, 1, 1, 1423734550, 0),
(40, 40, 1, 1, 1423734550, 0),
(41, 41, 1, 1, 1423734550, 0),
(42, 42, 1, 1, 1423734550, 0),
(43, 43, 1, 1, 1423734550, 0),
(44, 1, 2, 1, 1423734550, 0),
(45, 2, 2, 1, 1423734550, 0),
(46, 3, 2, 1, 1423734550, 0),
(47, 4, 2, 1, 1423734550, 0),
(48, 25, 2, 1, 1423734550, 0),
(49, 26, 2, 1, 1423734550, 0),
(50, 27, 2, 1, 1423734550, 0),
(51, 38, 2, 1, 1423734550, 0),
(52, 5, 2, 1, 1423734550, 0),
(53, 6, 2, 1, 1423734550, 0),
(54, 7, 2, 1, 1423734550, 0),
(55, 8, 2, 1, 1423734550, 0),
(56, 9, 2, 1, 1423734550, 0),
(57, 10, 2, 1, 1423734550, 0),
(58, 11, 2, 1, 1423734550, 0),
(59, 12, 2, 1, 1423734550, 0),
(60, 13, 2, 1, 1423734550, 0),
(61, 14, 2, 1, 1423734550, 0),
(62, 15, 2, 1, 1423734550, 0),
(63, 16, 2, 1, 1423734550, 0),
(64, 17, 2, 1, 1423734550, 0),
(65, 18, 2, 1, 1423734550, 0),
(66, 19, 2, 1, 1423734550, 0),
(67, 20, 2, 1, 1423734550, 0),
(68, 21, 2, 1, 1423734550, 0),
(69, 22, 2, 1, 1423734550, 0),
(70, 23, 2, 1, 1423734550, 0),
(71, 24, 2, 1, 1423734550, 0),
(72, 28, 2, 1, 1423734550, 0),
(73, 29, 2, 1, 1423734550, 0),
(74, 30, 2, 1, 1423734550, 0),
(75, 31, 2, 1, 1423734550, 0),
(76, 32, 2, 1, 1423734550, 0),
(77, 33, 2, 1, 1423734550, 0),
(78, 34, 2, 1, 1423734550, 0),
(79, 35, 2, 1, 1423734550, 0),
(80, 36, 2, 1, 1423734550, 0),
(81, 37, 2, 1, 1423734550, 0),
(82, 39, 2, 1, 1423734550, 0),
(83, 40, 2, 1, 1423734550, 0),
(84, 41, 2, 1, 1423734550, 0),
(85, 42, 2, 1, 1423734550, 0),
(86, 43, 2, 1, 1423734550, 0),
(87, 1, 99, 0, 1423734550, 0),
(88, 2, 99, 0, 1423734550, 0),
(89, 3, 99, 0, 1423734550, 0),
(90, 4, 99, 0, 1423734550, 0),
(91, 25, 99, 0, 1423734550, 0),
(92, 26, 99, 0, 1423734550, 0),
(93, 27, 99, 0, 1423734550, 0),
(94, 38, 99, 0, 1423734550, 0),
(95, 5, 99, 0, 1423734550, 0),
(96, 6, 99, 0, 1423734550, 0),
(97, 7, 99, 0, 1423734550, 0),
(98, 8, 99, 0, 1423734550, 0),
(99, 9, 99, 0, 1423734550, 0),
(100, 10, 99, 0, 1423734550, 0),
(101, 11, 99, 0, 1423734550, 0),
(102, 12, 99, 0, 1423734550, 0),
(103, 13, 99, 0, 1423734550, 0),
(104, 14, 99, 0, 1423734550, 0),
(105, 15, 99, 0, 1423734550, 0),
(106, 16, 99, 0, 1423734550, 0),
(107, 17, 99, 0, 1423734550, 0),
(108, 18, 99, 0, 1423734550, 0),
(109, 19, 99, 0, 1423734550, 0),
(110, 20, 99, 0, 1423734550, 0),
(111, 21, 99, 0, 1423734550, 0),
(112, 22, 99, 0, 1423734550, 0),
(113, 23, 99, 0, 1423734550, 0),
(114, 24, 99, 0, 1423734550, 0),
(115, 28, 99, 0, 1423734550, 0),
(116, 29, 99, 0, 1423734550, 0),
(117, 30, 99, 0, 1423734550, 0),
(118, 31, 99, 0, 1423734550, 0),
(119, 32, 99, 0, 1423734550, 0),
(120, 33, 99, 0, 1423734550, 0),
(121, 34, 99, 0, 1423734550, 0),
(122, 35, 99, 0, 1423734550, 0),
(123, 36, 99, 0, 1423734550, 0),
(124, 37, 99, 0, 1423734550, 0),
(125, 39, 99, 0, 1423734550, 0),
(126, 40, 99, 0, 1423734550, 0),
(127, 41, 99, 0, 1423734550, 0),
(128, 42, 99, 0, 1423734550, 0),
(129, 43, 99, 0, 1423734550, 0),
(130, 1, 111, 0, 1423734550, 0),
(131, 2, 111, 0, 1423734550, 0),
(132, 3, 111, 0, 1423734550, 0),
(133, 4, 111, 0, 1423734550, 0),
(134, 25, 111, 0, 1423734550, 0),
(135, 26, 111, 0, 1423734550, 0),
(136, 27, 111, 0, 1423734550, 0),
(137, 38, 111, 0, 1423734550, 0),
(138, 5, 111, 0, 1423734550, 0),
(139, 6, 111, 0, 1423734550, 0),
(140, 7, 111, 0, 1423734550, 0),
(141, 8, 111, 0, 1423734550, 0),
(142, 9, 111, 0, 1423734550, 0),
(143, 10, 111, 0, 1423734550, 0),
(144, 11, 111, 0, 1423734550, 0),
(145, 12, 111, 0, 1423734550, 0),
(146, 13, 111, 0, 1423734550, 0),
(147, 14, 111, 0, 1423734550, 0),
(148, 15, 111, 0, 1423734550, 0),
(149, 16, 111, 0, 1423734550, 0),
(150, 17, 111, 0, 1423734550, 0),
(151, 18, 111, 0, 1423734550, 0),
(152, 19, 111, 0, 1423734550, 0),
(153, 20, 111, 0, 1423734550, 0),
(154, 21, 111, 0, 1423734550, 0),
(155, 22, 111, 0, 1423734550, 0),
(156, 23, 111, 0, 1423734550, 0),
(157, 24, 111, 0, 1423734550, 0),
(158, 28, 111, 0, 1423734550, 0),
(159, 29, 111, 0, 1423734550, 0),
(160, 30, 111, 0, 1423734550, 0),
(161, 31, 111, 0, 1423734550, 0),
(162, 32, 111, 0, 1423734550, 0),
(163, 33, 111, 0, 1423734550, 0),
(164, 34, 111, 0, 1423734550, 0),
(165, 35, 111, 0, 1423734550, 0),
(166, 36, 111, 0, 1423734550, 0),
(167, 37, 111, 0, 1423734550, 0),
(168, 39, 111, 0, 1423734550, 0),
(169, 40, 111, 0, 1423734550, 0),
(170, 41, 111, 0, 1423734550, 0),
(171, 42, 111, 0, 1423734550, 0),
(172, 43, 111, 0, 1423734550, 0),
(173, 1, 112, 0, 1423734550, 0),
(174, 2, 112, 0, 1423734550, 0),
(175, 3, 112, 0, 1423734551, 0),
(176, 4, 112, 0, 1423734551, 0),
(177, 25, 112, 0, 1423734551, 0),
(178, 26, 112, 0, 1423734551, 0),
(179, 27, 112, 0, 1423734551, 0),
(180, 38, 112, 0, 1423734551, 0),
(181, 5, 112, 0, 1423734551, 0),
(182, 6, 112, 0, 1423734551, 0),
(183, 7, 112, 0, 1423734551, 0),
(184, 8, 112, 0, 1423734551, 0),
(185, 9, 112, 0, 1423734551, 0),
(186, 10, 112, 0, 1423734551, 0),
(187, 11, 112, 0, 1423734551, 0),
(188, 12, 112, 0, 1423734551, 0),
(189, 13, 112, 0, 1423734551, 0),
(190, 14, 112, 0, 1423734551, 0),
(191, 15, 112, 0, 1423734551, 0),
(192, 16, 112, 0, 1423734551, 0),
(193, 17, 112, 0, 1423734551, 0),
(194, 18, 112, 0, 1423734551, 0),
(195, 19, 112, 0, 1423734551, 0),
(196, 20, 112, 0, 1423734551, 0),
(197, 21, 112, 0, 1423734551, 0),
(198, 22, 112, 0, 1423734551, 0),
(199, 23, 112, 0, 1423734551, 0),
(200, 24, 112, 0, 1423734551, 0),
(201, 28, 112, 0, 1423734551, 0),
(202, 29, 112, 0, 1423734551, 0),
(203, 30, 112, 0, 1423734551, 0),
(204, 31, 112, 0, 1423734551, 0),
(205, 32, 112, 0, 1423734551, 0),
(206, 33, 112, 0, 1423734551, 0),
(207, 34, 112, 0, 1423734551, 0),
(208, 35, 112, 0, 1423734551, 0),
(209, 36, 112, 0, 1423734551, 0),
(210, 37, 112, 0, 1423734551, 0),
(211, 39, 112, 0, 1423734551, 0),
(212, 40, 112, 0, 1423734551, 0),
(213, 41, 112, 0, 1423734551, 0),
(214, 42, 112, 0, 1423734551, 0),
(215, 43, 112, 0, 1423734551, 0),
(216, 1, 113, 0, 1423734551, 0),
(217, 2, 113, 0, 1423734551, 0),
(218, 3, 113, 0, 1423734551, 0),
(219, 4, 113, 0, 1423734551, 0),
(220, 25, 113, 0, 1423734551, 0),
(221, 26, 113, 0, 1423734551, 0),
(222, 27, 113, 0, 1423734551, 0),
(223, 38, 113, 0, 1423734551, 0),
(224, 5, 113, 0, 1423734551, 0),
(225, 6, 113, 0, 1423734551, 0),
(226, 7, 113, 0, 1423734551, 0),
(227, 8, 113, 0, 1423734551, 0),
(228, 9, 113, 0, 1423734551, 0),
(229, 10, 113, 0, 1423734551, 0),
(230, 11, 113, 0, 1423734551, 0),
(231, 12, 113, 0, 1423734551, 0),
(232, 13, 113, 0, 1423734551, 0),
(233, 14, 113, 0, 1423734551, 0),
(234, 15, 113, 0, 1423734551, 0),
(235, 16, 113, 0, 1423734551, 0),
(236, 17, 113, 0, 1423734551, 0),
(237, 18, 113, 0, 1423734551, 0),
(238, 19, 113, 0, 1423734551, 0),
(239, 20, 113, 0, 1423734551, 0),
(240, 21, 113, 0, 1423734551, 0),
(241, 22, 113, 0, 1423734551, 0),
(242, 23, 113, 0, 1423734551, 0),
(243, 24, 113, 0, 1423734551, 0),
(244, 28, 113, 0, 1423734551, 0),
(245, 29, 113, 0, 1423734551, 0),
(246, 30, 113, 0, 1423734551, 0),
(247, 31, 113, 0, 1423734551, 0),
(248, 32, 113, 0, 1423734551, 0),
(249, 33, 113, 0, 1423734551, 0),
(250, 34, 113, 0, 1423734551, 0),
(251, 35, 113, 0, 1423734551, 0),
(252, 36, 113, 0, 1423734551, 0),
(253, 37, 113, 0, 1423734551, 0),
(254, 39, 113, 0, 1423734551, 0),
(255, 40, 113, 0, 1423734551, 0),
(256, 41, 113, 0, 1423734551, 0),
(257, 42, 113, 0, 1423734551, 0),
(258, 43, 113, 0, 1423734551, 0),
(259, 1, 114, 0, 1423734551, 0),
(260, 2, 114, 0, 1423734551, 0),
(261, 3, 114, 0, 1423734551, 0),
(262, 4, 114, 0, 1423734551, 0),
(263, 25, 114, 0, 1423734551, 0),
(264, 26, 114, 0, 1423734551, 0),
(265, 27, 114, 0, 1423734551, 0),
(266, 38, 114, 0, 1423734551, 0),
(267, 5, 114, 0, 1423734551, 0),
(268, 6, 114, 0, 1423734551, 0),
(269, 7, 114, 0, 1423734551, 0),
(270, 8, 114, 0, 1423734551, 0),
(271, 9, 114, 0, 1423734551, 0),
(272, 10, 114, 0, 1423734551, 0),
(273, 11, 114, 0, 1423734551, 0),
(274, 12, 114, 0, 1423734551, 0),
(275, 13, 114, 0, 1423734551, 0),
(276, 14, 114, 0, 1423734551, 0),
(277, 15, 114, 0, 1423734551, 0),
(278, 16, 114, 0, 1423734551, 0),
(279, 17, 114, 0, 1423734551, 0),
(280, 18, 114, 0, 1423734551, 0),
(281, 19, 114, 0, 1423734551, 0),
(282, 20, 114, 0, 1423734551, 0),
(283, 21, 114, 0, 1423734551, 0),
(284, 22, 114, 0, 1423734551, 0),
(285, 23, 114, 0, 1423734551, 0),
(286, 24, 114, 0, 1423734551, 0),
(287, 28, 114, 0, 1423734551, 0),
(288, 29, 114, 0, 1423734551, 0),
(289, 30, 114, 0, 1423734551, 0),
(290, 31, 114, 0, 1423734551, 0),
(291, 32, 114, 0, 1423734551, 0),
(292, 33, 114, 0, 1423734551, 0),
(293, 34, 114, 0, 1423734551, 0),
(294, 35, 114, 0, 1423734551, 0),
(295, 36, 114, 0, 1423734551, 0),
(296, 37, 114, 0, 1423734551, 0),
(297, 39, 114, 0, 1423734551, 0),
(298, 40, 114, 0, 1423734551, 0),
(299, 41, 114, 0, 1423734551, 0),
(300, 42, 114, 0, 1423734551, 0),
(301, 43, 114, 0, 1423734551, 0),
(302, 1, 116, 0, 1423734551, 0),
(303, 2, 116, 0, 1423734551, 0),
(304, 3, 116, 0, 1423734551, 0),
(305, 4, 116, 0, 1423734551, 0),
(306, 25, 116, 0, 1423734551, 0),
(307, 26, 116, 0, 1423734551, 0),
(308, 27, 116, 0, 1423734551, 0),
(309, 38, 116, 0, 1423734551, 0),
(310, 5, 116, 0, 1423734551, 0),
(311, 6, 116, 0, 1423734551, 0),
(312, 7, 116, 0, 1423734551, 0),
(313, 8, 116, 0, 1423734551, 0),
(314, 9, 116, 0, 1423734551, 0),
(315, 10, 116, 0, 1423734551, 0),
(316, 11, 116, 0, 1423734551, 0),
(317, 12, 116, 0, 1423734551, 0),
(318, 13, 116, 0, 1423734551, 0),
(319, 14, 116, 0, 1423734551, 0),
(320, 15, 116, 0, 1423734551, 0),
(321, 16, 116, 0, 1423734551, 0),
(322, 17, 116, 0, 1423734551, 0),
(323, 18, 116, 0, 1423734551, 0),
(324, 19, 116, 0, 1423734551, 0),
(325, 20, 116, 0, 1423734551, 0),
(326, 21, 116, 0, 1423734551, 0),
(327, 22, 116, 0, 1423734551, 0),
(328, 23, 116, 0, 1423734551, 0),
(329, 24, 116, 0, 1423734551, 0),
(330, 28, 116, 0, 1423734551, 0),
(331, 29, 116, 0, 1423734551, 0),
(332, 30, 116, 0, 1423734551, 0),
(333, 31, 116, 0, 1423734551, 0),
(334, 32, 116, 0, 1423734551, 0),
(335, 33, 116, 0, 1423734551, 0),
(336, 34, 116, 0, 1423734551, 0),
(337, 35, 116, 0, 1423734551, 0),
(338, 36, 116, 0, 1423734551, 0),
(339, 37, 116, 0, 1423734551, 0),
(340, 39, 116, 0, 1423734551, 0),
(341, 40, 116, 0, 1423734551, 0),
(342, 41, 116, 0, 1423734551, 0),
(343, 42, 116, 0, 1423734551, 0),
(344, 43, 116, 0, 1423734551, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

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
(11, 10, 'Page Listings', 'page/index', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

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
(39, 10, 'Add Page Details', 'page/add', 1),
(40, 10, 'View Page Details', 'page/view', 2),
(41, 10, 'Edit Page Details', 'page/edit', 3),
(42, 10, 'Delete Page Details', 'page/delete', 4),
(43, 10, 'Change Page Status', 'page/change', 5);

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
