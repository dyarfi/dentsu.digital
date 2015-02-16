-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 16, 2015 at 06:39 PM
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
('d24a84256609efff4574bbec6fa73e64', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 1424086759, 'a:4:{s:9:"user_data";s:0:"";s:11:"module_list";s:546:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"User Listings","usergroup{{slash}}/index":"User Group Listings","setting{{slash}}/index":"Setting Listings","log{{slash}}/index":"Log Listings"},"Module":{"modulelist{{slash}}/index":"Module Listing"},"Career":{"career{{slash}}/index":"Career Listings","careerdivision{{slash}}/index":"Career Division Listings","careerapplicant{{slash}}/index":"Career Applicant Listings"},"Page":{"page{{slash}}/index":"Page Listings","pagemenu{{slash}}/index":"Page Menu Listings"}}";s:20:"module_function_list";s:2441:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"User Listings","usergroup{{slash}}/index":"User Group Listings","setting{{slash}}/index":"Setting Listings","log{{slash}}/index":"Log Listings","dashboard{{slash}}/add":"Add New Dashboard","dashboard{{slash}}/view":"View Dashboard Details","dashboard{{slash}}/edit":"Edit Dashboard Details","dashboard{{slash}}/delete":"Delete Dashboard","dashboard{{slash}}/change":"Change Dashboard Status","user{{slash}}/add":"Add User Details","user{{slash}}/view":"View User Details","user{{slash}}/edit":"Edit User Details","user{{slash}}/delete":"Delete User Details","user{{slash}}/change":"Change User Status","usergroup{{slash}}/add":"Add User Group Details","usergroup{{slash}}/view":"View User Group Details","usergroup{{slash}}/edit":"Edit User Group Details","usergroup{{slash}}/delete":"Delete User Group Details","usergroup{{slash}}/change":"Change User Group Status","setting{{slash}}/add":"Add Setting Details","setting{{slash}}/view":"View Setting Details","setting{{slash}}/edit":"Edit Setting Details","setting{{slash}}/delete":"Delete Setting Details","setting{{slash}}/change":"Change Setting Status","log{{slash}}/view":"View Log Details","log{{slash}}/edit":"Edit Log Details","log{{slash}}/delete":"Delete Log Details","log{{slash}}/empty":"Empty Log Details"},"Module":{"modulelist{{slash}}/edit":"Edit Module Details"},"Career":{"career{{slash}}/index":"Career Listings","careerdivision{{slash}}/index":"Career Division Listings","careerapplicant{{slash}}/index":"Career Applicant Listings","career{{slash}}/add":"Add Career Details","career{{slash}}/view":"View Career Details","career{{slash}}/edit":"Edit Career Details","career{{slash}}/delete":"Delete Career Details","career{{slash}}/change":"Change Career Status","careerapplicant{{slash}}/add":"Add Career Division Listings","careerapplicant{{slash}}/view":"View Career Division Listings","careerapplicant{{slash}}/edit":"Edit Career Division Listings","careerapplicant{{slash}}/delete":"Delete Career Division Listings","careerapplicant{{slash}}/change":"Change Career Division Listings"},"Page":{"page{{slash}}/index":"Page Listings","pagemenu{{slash}}/index":"Page Menu Listings","page{{slash}}/add":"Add Page Details","page{{slash}}/view":"View Page Details","page{{slash}}/edit":"Edit Page Details","page{{slash}}/delete":"Delete Page Details","page{{slash}}/change":"Change Page Status"}}";s:12:"user_session";O:8:"stdClass":9:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@admin.com";s:8:"password";s:8:"********";s:8:"group_id";s:1:"1";s:6:"status";s:1:"1";s:10:"last_login";s:10:"1418274077";s:9:"logged_in";b:1;s:4:"name";s:21:"Administrator Website";}}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=393 ;

--
-- Dumping data for table `tbl_group_permissions`
--

INSERT INTO `tbl_group_permissions` (`id`, `permission_id`, `group_id`, `value`, `added`, `modified`) VALUES
(1, 1, 1, 1, 1424082904, 0),
(2, 2, 1, 1, 1424082904, 0),
(3, 3, 1, 1, 1424082904, 0),
(4, 4, 1, 1, 1424082904, 0),
(5, 5, 1, 1, 1424082904, 0),
(6, 30, 1, 1, 1424082904, 0),
(7, 31, 1, 1, 1424082904, 0),
(8, 32, 1, 1, 1424082904, 0),
(9, 43, 1, 1, 1424082904, 0),
(10, 44, 1, 1, 1424082904, 0),
(11, 6, 1, 1, 1424082904, 0),
(12, 7, 1, 1, 1424082904, 0),
(13, 8, 1, 1, 1424082904, 0),
(14, 9, 1, 1, 1424082904, 0),
(15, 10, 1, 1, 1424082904, 0),
(16, 11, 1, 1, 1424082904, 0),
(17, 12, 1, 1, 1424082904, 0),
(18, 13, 1, 1, 1424082904, 0),
(19, 14, 1, 1, 1424082904, 0),
(20, 15, 1, 1, 1424082904, 0),
(21, 16, 1, 1, 1424082904, 0),
(22, 17, 1, 1, 1424082904, 0),
(23, 18, 1, 1, 1424082904, 0),
(24, 19, 1, 1, 1424082904, 0),
(25, 20, 1, 1, 1424082904, 0),
(26, 21, 1, 1, 1424082904, 0),
(27, 22, 1, 1, 1424082904, 0),
(28, 23, 1, 1, 1424082904, 0),
(29, 24, 1, 1, 1424082904, 0),
(30, 25, 1, 1, 1424082904, 0),
(31, 26, 1, 1, 1424082904, 0),
(32, 27, 1, 1, 1424082904, 0),
(33, 28, 1, 1, 1424082904, 0),
(34, 29, 1, 1, 1424082904, 0),
(35, 33, 1, 1, 1424082904, 0),
(36, 34, 1, 1, 1424082904, 0),
(37, 35, 1, 1, 1424082904, 0),
(38, 36, 1, 1, 1424082904, 0),
(39, 37, 1, 1, 1424082904, 0),
(40, 38, 1, 1, 1424082904, 0),
(41, 39, 1, 1, 1424082904, 0),
(42, 40, 1, 1, 1424082904, 0),
(43, 41, 1, 1, 1424082904, 0),
(44, 42, 1, 1, 1424082904, 0),
(45, 45, 1, 1, 1424082904, 0),
(46, 46, 1, 1, 1424082904, 0),
(47, 47, 1, 1, 1424082904, 0),
(48, 48, 1, 1, 1424082904, 0),
(49, 49, 1, 1, 1424082904, 0),
(50, 1, 2, 1, 1424082904, 0),
(51, 2, 2, 1, 1424082904, 0),
(52, 3, 2, 1, 1424082904, 0),
(53, 4, 2, 1, 1424082904, 0),
(54, 5, 2, 1, 1424082904, 0),
(55, 30, 2, 1, 1424082904, 0),
(56, 31, 2, 1, 1424082904, 0),
(57, 32, 2, 1, 1424082904, 0),
(58, 43, 2, 1, 1424082904, 0),
(59, 44, 2, 1, 1424082904, 0),
(60, 6, 2, 1, 1424082904, 0),
(61, 7, 2, 1, 1424082904, 0),
(62, 8, 2, 1, 1424082904, 0),
(63, 9, 2, 1, 1424082904, 0),
(64, 10, 2, 1, 1424082904, 0),
(65, 11, 2, 1, 1424082904, 0),
(66, 12, 2, 1, 1424082904, 0),
(67, 13, 2, 1, 1424082904, 0),
(68, 14, 2, 1, 1424082904, 0),
(69, 15, 2, 1, 1424082904, 0),
(70, 16, 2, 1, 1424082904, 0),
(71, 17, 2, 1, 1424082904, 0),
(72, 18, 2, 1, 1424082904, 0),
(73, 19, 2, 1, 1424082904, 0),
(74, 20, 2, 1, 1424082904, 0),
(75, 21, 2, 1, 1424082904, 0),
(76, 22, 2, 1, 1424082904, 0),
(77, 23, 2, 1, 1424082904, 0),
(78, 24, 2, 1, 1424082904, 0),
(79, 25, 2, 1, 1424082904, 0),
(80, 26, 2, 1, 1424082904, 0),
(81, 27, 2, 1, 1424082904, 0),
(82, 28, 2, 1, 1424082904, 0),
(83, 29, 2, 1, 1424082904, 0),
(84, 33, 2, 1, 1424082904, 0),
(85, 34, 2, 1, 1424082904, 0),
(86, 35, 2, 1, 1424082904, 0),
(87, 36, 2, 1, 1424082904, 0),
(88, 37, 2, 1, 1424082904, 0),
(89, 38, 2, 1, 1424082904, 0),
(90, 39, 2, 1, 1424082904, 0),
(91, 40, 2, 1, 1424082904, 0),
(92, 41, 2, 1, 1424082904, 0),
(93, 42, 2, 1, 1424082904, 0),
(94, 45, 2, 1, 1424082904, 0),
(95, 46, 2, 1, 1424082904, 0),
(96, 47, 2, 1, 1424082904, 0),
(97, 48, 2, 1, 1424082904, 0),
(98, 49, 2, 1, 1424082904, 0),
(99, 1, 99, 0, 1424082904, 0),
(100, 2, 99, 0, 1424082904, 0),
(101, 3, 99, 0, 1424082904, 0),
(102, 4, 99, 0, 1424082904, 0),
(103, 5, 99, 0, 1424082904, 0),
(104, 30, 99, 0, 1424082904, 0),
(105, 31, 99, 0, 1424082904, 0),
(106, 32, 99, 0, 1424082904, 0),
(107, 43, 99, 0, 1424082904, 0),
(108, 44, 99, 0, 1424082904, 0),
(109, 6, 99, 0, 1424082904, 0),
(110, 7, 99, 0, 1424082904, 0),
(111, 8, 99, 0, 1424082904, 0),
(112, 9, 99, 0, 1424082904, 0),
(113, 10, 99, 0, 1424082904, 0),
(114, 11, 99, 0, 1424082904, 0),
(115, 12, 99, 0, 1424082904, 0),
(116, 13, 99, 0, 1424082904, 0),
(117, 14, 99, 0, 1424082904, 0),
(118, 15, 99, 0, 1424082904, 0),
(119, 16, 99, 0, 1424082904, 0),
(120, 17, 99, 0, 1424082904, 0),
(121, 18, 99, 0, 1424082904, 0),
(122, 19, 99, 0, 1424082904, 0),
(123, 20, 99, 0, 1424082904, 0),
(124, 21, 99, 0, 1424082904, 0),
(125, 22, 99, 0, 1424082904, 0),
(126, 23, 99, 0, 1424082904, 0),
(127, 24, 99, 0, 1424082904, 0),
(128, 25, 99, 0, 1424082904, 0),
(129, 26, 99, 0, 1424082904, 0),
(130, 27, 99, 0, 1424082904, 0),
(131, 28, 99, 0, 1424082904, 0),
(132, 29, 99, 0, 1424082904, 0),
(133, 33, 99, 0, 1424082904, 0),
(134, 34, 99, 0, 1424082904, 0),
(135, 35, 99, 0, 1424082904, 0),
(136, 36, 99, 0, 1424082904, 0),
(137, 37, 99, 0, 1424082904, 0),
(138, 38, 99, 0, 1424082904, 0),
(139, 39, 99, 0, 1424082904, 0),
(140, 40, 99, 0, 1424082904, 0),
(141, 41, 99, 0, 1424082904, 0),
(142, 42, 99, 0, 1424082904, 0),
(143, 45, 99, 0, 1424082904, 0),
(144, 46, 99, 0, 1424082904, 0),
(145, 47, 99, 0, 1424082904, 0),
(146, 48, 99, 0, 1424082904, 0),
(147, 49, 99, 0, 1424082904, 0),
(148, 1, 111, 0, 1424082904, 0),
(149, 2, 111, 0, 1424082904, 0),
(150, 3, 111, 0, 1424082904, 0),
(151, 4, 111, 0, 1424082904, 0),
(152, 5, 111, 0, 1424082904, 0),
(153, 30, 111, 0, 1424082904, 0),
(154, 31, 111, 0, 1424082904, 0),
(155, 32, 111, 0, 1424082904, 0),
(156, 43, 111, 0, 1424082904, 0),
(157, 44, 111, 0, 1424082904, 0),
(158, 6, 111, 0, 1424082904, 0),
(159, 7, 111, 0, 1424082904, 0),
(160, 8, 111, 0, 1424082904, 0),
(161, 9, 111, 0, 1424082904, 0),
(162, 10, 111, 0, 1424082904, 0),
(163, 11, 111, 0, 1424082904, 0),
(164, 12, 111, 0, 1424082904, 0),
(165, 13, 111, 0, 1424082904, 0),
(166, 14, 111, 0, 1424082904, 0),
(167, 15, 111, 0, 1424082904, 0),
(168, 16, 111, 0, 1424082904, 0),
(169, 17, 111, 0, 1424082904, 0),
(170, 18, 111, 0, 1424082904, 0),
(171, 19, 111, 0, 1424082904, 0),
(172, 20, 111, 0, 1424082904, 0),
(173, 21, 111, 0, 1424082904, 0),
(174, 22, 111, 0, 1424082904, 0),
(175, 23, 111, 0, 1424082904, 0),
(176, 24, 111, 0, 1424082904, 0),
(177, 25, 111, 0, 1424082904, 0),
(178, 26, 111, 0, 1424082904, 0),
(179, 27, 111, 0, 1424082904, 0),
(180, 28, 111, 0, 1424082904, 0),
(181, 29, 111, 0, 1424082904, 0),
(182, 33, 111, 0, 1424082904, 0),
(183, 34, 111, 0, 1424082904, 0),
(184, 35, 111, 0, 1424082904, 0),
(185, 36, 111, 0, 1424082904, 0),
(186, 37, 111, 0, 1424082904, 0),
(187, 38, 111, 0, 1424082904, 0),
(188, 39, 111, 0, 1424082904, 0),
(189, 40, 111, 0, 1424082904, 0),
(190, 41, 111, 0, 1424082904, 0),
(191, 42, 111, 0, 1424082904, 0),
(192, 45, 111, 0, 1424082904, 0),
(193, 46, 111, 0, 1424082904, 0),
(194, 47, 111, 0, 1424082904, 0),
(195, 48, 111, 0, 1424082904, 0),
(196, 49, 111, 0, 1424082904, 0),
(197, 1, 112, 0, 1424082904, 0),
(198, 2, 112, 0, 1424082904, 0),
(199, 3, 112, 0, 1424082904, 0),
(200, 4, 112, 0, 1424082904, 0),
(201, 5, 112, 0, 1424082904, 0),
(202, 30, 112, 0, 1424082904, 0),
(203, 31, 112, 0, 1424082904, 0),
(204, 32, 112, 0, 1424082904, 0),
(205, 43, 112, 0, 1424082904, 0),
(206, 44, 112, 0, 1424082904, 0),
(207, 6, 112, 0, 1424082904, 0),
(208, 7, 112, 0, 1424082904, 0),
(209, 8, 112, 0, 1424082904, 0),
(210, 9, 112, 0, 1424082904, 0),
(211, 10, 112, 0, 1424082904, 0),
(212, 11, 112, 0, 1424082904, 0),
(213, 12, 112, 0, 1424082904, 0),
(214, 13, 112, 0, 1424082904, 0),
(215, 14, 112, 0, 1424082904, 0),
(216, 15, 112, 0, 1424082904, 0),
(217, 16, 112, 0, 1424082904, 0),
(218, 17, 112, 0, 1424082904, 0),
(219, 18, 112, 0, 1424082904, 0),
(220, 19, 112, 0, 1424082904, 0),
(221, 20, 112, 0, 1424082904, 0),
(222, 21, 112, 0, 1424082904, 0),
(223, 22, 112, 0, 1424082904, 0),
(224, 23, 112, 0, 1424082904, 0),
(225, 24, 112, 0, 1424082904, 0),
(226, 25, 112, 0, 1424082904, 0),
(227, 26, 112, 0, 1424082904, 0),
(228, 27, 112, 0, 1424082904, 0),
(229, 28, 112, 0, 1424082904, 0),
(230, 29, 112, 0, 1424082904, 0),
(231, 33, 112, 0, 1424082904, 0),
(232, 34, 112, 0, 1424082904, 0),
(233, 35, 112, 0, 1424082904, 0),
(234, 36, 112, 0, 1424082904, 0),
(235, 37, 112, 0, 1424082904, 0),
(236, 38, 112, 0, 1424082904, 0),
(237, 39, 112, 0, 1424082904, 0),
(238, 40, 112, 0, 1424082904, 0),
(239, 41, 112, 0, 1424082904, 0),
(240, 42, 112, 0, 1424082904, 0),
(241, 45, 112, 0, 1424082904, 0),
(242, 46, 112, 0, 1424082904, 0),
(243, 47, 112, 0, 1424082904, 0),
(244, 48, 112, 0, 1424082904, 0),
(245, 49, 112, 0, 1424082904, 0),
(246, 1, 113, 0, 1424082904, 0),
(247, 2, 113, 0, 1424082904, 0),
(248, 3, 113, 0, 1424082904, 0),
(249, 4, 113, 0, 1424082904, 0),
(250, 5, 113, 0, 1424082904, 0),
(251, 30, 113, 0, 1424082904, 0),
(252, 31, 113, 0, 1424082904, 0),
(253, 32, 113, 0, 1424082904, 0),
(254, 43, 113, 0, 1424082904, 0),
(255, 44, 113, 0, 1424082904, 0),
(256, 6, 113, 0, 1424082904, 0),
(257, 7, 113, 0, 1424082904, 0),
(258, 8, 113, 0, 1424082904, 0),
(259, 9, 113, 0, 1424082904, 0),
(260, 10, 113, 0, 1424082904, 0),
(261, 11, 113, 0, 1424082904, 0),
(262, 12, 113, 0, 1424082904, 0),
(263, 13, 113, 0, 1424082904, 0),
(264, 14, 113, 0, 1424082904, 0),
(265, 15, 113, 0, 1424082904, 0),
(266, 16, 113, 0, 1424082904, 0),
(267, 17, 113, 0, 1424082904, 0),
(268, 18, 113, 0, 1424082904, 0),
(269, 19, 113, 0, 1424082904, 0),
(270, 20, 113, 0, 1424082904, 0),
(271, 21, 113, 0, 1424082904, 0),
(272, 22, 113, 0, 1424082904, 0),
(273, 23, 113, 0, 1424082904, 0),
(274, 24, 113, 0, 1424082904, 0),
(275, 25, 113, 0, 1424082904, 0),
(276, 26, 113, 0, 1424082904, 0),
(277, 27, 113, 0, 1424082904, 0),
(278, 28, 113, 0, 1424082904, 0),
(279, 29, 113, 0, 1424082904, 0),
(280, 33, 113, 0, 1424082904, 0),
(281, 34, 113, 0, 1424082904, 0),
(282, 35, 113, 0, 1424082904, 0),
(283, 36, 113, 0, 1424082904, 0),
(284, 37, 113, 0, 1424082904, 0),
(285, 38, 113, 0, 1424082904, 0),
(286, 39, 113, 0, 1424082904, 0),
(287, 40, 113, 0, 1424082904, 0),
(288, 41, 113, 0, 1424082904, 0),
(289, 42, 113, 0, 1424082904, 0),
(290, 45, 113, 0, 1424082904, 0),
(291, 46, 113, 0, 1424082904, 0),
(292, 47, 113, 0, 1424082904, 0),
(293, 48, 113, 0, 1424082904, 0),
(294, 49, 113, 0, 1424082904, 0),
(295, 1, 114, 0, 1424082904, 0),
(296, 2, 114, 0, 1424082904, 0),
(297, 3, 114, 0, 1424082904, 0),
(298, 4, 114, 0, 1424082904, 0),
(299, 5, 114, 0, 1424082904, 0),
(300, 30, 114, 0, 1424082904, 0),
(301, 31, 114, 0, 1424082904, 0),
(302, 32, 114, 0, 1424082904, 0),
(303, 43, 114, 0, 1424082904, 0),
(304, 44, 114, 0, 1424082904, 0),
(305, 6, 114, 0, 1424082904, 0),
(306, 7, 114, 0, 1424082904, 0),
(307, 8, 114, 0, 1424082904, 0),
(308, 9, 114, 0, 1424082904, 0),
(309, 10, 114, 0, 1424082904, 0),
(310, 11, 114, 0, 1424082904, 0),
(311, 12, 114, 0, 1424082904, 0),
(312, 13, 114, 0, 1424082904, 0),
(313, 14, 114, 0, 1424082904, 0),
(314, 15, 114, 0, 1424082904, 0),
(315, 16, 114, 0, 1424082904, 0),
(316, 17, 114, 0, 1424082904, 0),
(317, 18, 114, 0, 1424082904, 0),
(318, 19, 114, 0, 1424082904, 0),
(319, 20, 114, 0, 1424082904, 0),
(320, 21, 114, 0, 1424082904, 0),
(321, 22, 114, 0, 1424082904, 0),
(322, 23, 114, 0, 1424082904, 0),
(323, 24, 114, 0, 1424082904, 0),
(324, 25, 114, 0, 1424082904, 0),
(325, 26, 114, 0, 1424082904, 0),
(326, 27, 114, 0, 1424082904, 0),
(327, 28, 114, 0, 1424082904, 0),
(328, 29, 114, 0, 1424082904, 0),
(329, 33, 114, 0, 1424082904, 0),
(330, 34, 114, 0, 1424082904, 0),
(331, 35, 114, 0, 1424082904, 0),
(332, 36, 114, 0, 1424082904, 0),
(333, 37, 114, 0, 1424082904, 0),
(334, 38, 114, 0, 1424082904, 0),
(335, 39, 114, 0, 1424082904, 0),
(336, 40, 114, 0, 1424082904, 0),
(337, 41, 114, 0, 1424082904, 0),
(338, 42, 114, 0, 1424082904, 0),
(339, 45, 114, 0, 1424082904, 0),
(340, 46, 114, 0, 1424082904, 0),
(341, 47, 114, 0, 1424082904, 0),
(342, 48, 114, 0, 1424082904, 0),
(343, 49, 114, 0, 1424082904, 0),
(344, 1, 116, 0, 1424082904, 0),
(345, 2, 116, 0, 1424082904, 0),
(346, 3, 116, 0, 1424082904, 0),
(347, 4, 116, 0, 1424082904, 0),
(348, 5, 116, 0, 1424082904, 0),
(349, 30, 116, 0, 1424082904, 0),
(350, 31, 116, 0, 1424082904, 0),
(351, 32, 116, 0, 1424082904, 0),
(352, 43, 116, 0, 1424082904, 0),
(353, 44, 116, 0, 1424082904, 0),
(354, 6, 116, 0, 1424082904, 0),
(355, 7, 116, 0, 1424082904, 0),
(356, 8, 116, 0, 1424082904, 0),
(357, 9, 116, 0, 1424082904, 0),
(358, 10, 116, 0, 1424082904, 0),
(359, 11, 116, 0, 1424082904, 0),
(360, 12, 116, 0, 1424082904, 0),
(361, 13, 116, 0, 1424082904, 0),
(362, 14, 116, 0, 1424082904, 0),
(363, 15, 116, 0, 1424082904, 0),
(364, 16, 116, 0, 1424082904, 0),
(365, 17, 116, 0, 1424082904, 0),
(366, 18, 116, 0, 1424082904, 0),
(367, 19, 116, 0, 1424082904, 0),
(368, 20, 116, 0, 1424082904, 0),
(369, 21, 116, 0, 1424082904, 0),
(370, 22, 116, 0, 1424082904, 0),
(371, 23, 116, 0, 1424082904, 0),
(372, 24, 116, 0, 1424082904, 0),
(373, 25, 116, 0, 1424082904, 0),
(374, 26, 116, 0, 1424082904, 0),
(375, 27, 116, 0, 1424082904, 0),
(376, 28, 116, 0, 1424082904, 0),
(377, 29, 116, 0, 1424082904, 0),
(378, 33, 116, 0, 1424082904, 0),
(379, 34, 116, 0, 1424082904, 0),
(380, 35, 116, 0, 1424082904, 0),
(381, 36, 116, 0, 1424082904, 0),
(382, 37, 116, 0, 1424082904, 0),
(383, 38, 116, 0, 1424082904, 0),
(384, 39, 116, 0, 1424082904, 0),
(385, 40, 116, 0, 1424082904, 0),
(386, 41, 116, 0, 1424082904, 0),
(387, 42, 116, 0, 1424082904, 0),
(388, 45, 116, 0, 1424082904, 0),
(389, 46, 116, 0, 1424082904, 0),
(390, 47, 116, 0, 1424082904, 0),
(391, 48, 116, 0, 1424082904, 0),
(392, 49, 116, 0, 1424082904, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

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
(7, 1, 'ServerLogs'),
(8, 7, 'Careers'),
(9, 7, 'CareerDivisions'),
(10, 7, 'CareerApplicants'),
(11, 11, 'Pages'),
(12, 11, 'PageMenus');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tbl_module_lists`
--

INSERT INTO `tbl_module_lists` (`id`, `parent_id`, `module_name`, `module_link`, `order`) VALUES
(1, 0, 'admin', '#', 0),
(2, 1, 'Dashboard Panel', 'dashboard/index', 0),
(3, 1, 'User Listings', 'user/index', 1),
(4, 1, 'User Group Listings', 'usergroup/index', 2),
(5, 1, 'Setting Listings', 'setting/index', 3),
(6, 1, 'Log Listings', 'log/index', 4),
(7, 0, 'career', '#', 1),
(8, 7, 'Career Listings', 'career/index', 0),
(9, 7, 'Career Division Listings', 'careerdivision/index', 1),
(10, 7, 'Career Applicant Listings', 'careerapplicant/index', 2),
(11, 0, 'page', '#', 2),
(12, 11, 'Page Listings', 'page/index', 0),
(13, 11, 'Page Menu Listings', 'pagemenu/index', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `tbl_module_permissions`
--

INSERT INTO `tbl_module_permissions` (`id`, `module_id`, `module_name`, `module_link`, `order`) VALUES
(1, 1, 'Dashboard Panel', 'dashboard/index', 0),
(2, 1, 'User Listings', 'user/index', 1),
(3, 1, 'User Group Listings', 'usergroup/index', 2),
(4, 1, 'Setting Listings', 'setting/index', 3),
(5, 1, 'Log Listings', 'log/index', 4),
(6, 1, 'Add New Dashboard', 'dashboard/add', 5),
(7, 1, 'View Dashboard Details', 'dashboard/view', 6),
(8, 1, 'Edit Dashboard Details', 'dashboard/edit', 7),
(9, 1, 'Delete Dashboard', 'dashboard/delete', 8),
(10, 1, 'Change Dashboard Status', 'dashboard/change', 9),
(11, 1, 'Add User Details', 'user/add', 10),
(12, 1, 'View User Details', 'user/view', 11),
(13, 1, 'Edit User Details', 'user/edit', 12),
(14, 1, 'Delete User Details', 'user/delete', 13),
(15, 1, 'Change User Status', 'user/change', 14),
(16, 1, 'Add User Group Details', 'usergroup/add', 15),
(17, 1, 'View User Group Details', 'usergroup/view', 16),
(18, 1, 'Edit User Group Details', 'usergroup/edit', 17),
(19, 1, 'Delete User Group Details', 'usergroup/delete', 18),
(20, 1, 'Change User Group Status', 'usergroup/change', 19),
(21, 1, 'Add Setting Details', 'setting/add', 20),
(22, 1, 'View Setting Details', 'setting/view', 21),
(23, 1, 'Edit Setting Details', 'setting/edit', 22),
(24, 1, 'Delete Setting Details', 'setting/delete', 23),
(25, 1, 'Change Setting Status', 'setting/change', 24),
(26, 1, 'View Log Details', 'log/view', 25),
(27, 1, 'Edit Log Details', 'log/edit', 26),
(28, 1, 'Delete Log Details', 'log/delete', 27),
(29, 1, 'Empty Log Details', 'log/empty', 28),
(30, 7, 'Career Listings', 'career/index', 0),
(31, 7, 'Career Division Listings', 'careerdivision/index', 1),
(32, 7, 'Career Applicant Listings', 'careerapplicant/index', 2),
(33, 7, 'Add Career Details', 'career/add', 3),
(34, 7, 'View Career Details', 'career/view', 4),
(35, 7, 'Edit Career Details', 'career/edit', 5),
(36, 7, 'Delete Career Details', 'career/delete', 6),
(37, 7, 'Change Career Status', 'career/change', 7),
(38, 7, 'Add Career Division Listings', 'careerapplicant/add', 8),
(39, 7, 'View Career Division Listings', 'careerapplicant/view', 9),
(40, 7, 'Edit Career Division Listings', 'careerapplicant/edit', 10),
(41, 7, 'Delete Career Division Listings', 'careerapplicant/delete', 11),
(42, 7, 'Change Career Division Listings', 'careerapplicant/change', 12),
(43, 11, 'Page Listings', 'page/index', 0),
(44, 11, 'Page Menu Listings', 'pagemenu/index', 1),
(45, 11, 'Add Page Details', 'page/add', 2),
(46, 11, 'View Page Details', 'page/view', 3),
(47, 11, 'Edit Page Details', 'page/edit', 4),
(48, 11, 'Delete Page Details', 'page/delete', 5),
(49, 11, 'Change Page Status', 'page/change', 6);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_pages`
--

INSERT INTO `tbl_pages` (`id`, `menu_id`, `name`, `subject`, `synopsis`, `text`, `attribute`, `publish_date`, `unpublish_date`, `allow_comment`, `tags`, `order`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, 1, 'test-page-one', 'Test page one sdfsf', '<p>\r\n	Test page one Test page one Test page one Test page one Test page one Test page one sdfsdf asdasd</p>\r\n', '<p>\r\n	Test page one Test page one Test page one Test page one sdfsdfsf cbxfx</p>\r\n', NULL, '2015-02-13', '2015-02-28', 1, NULL, NULL, NULL, NULL, 'publish', NULL, 1424073158),
(2, 1, 'test-page-two', 'Test Page Two', '<p>\r\n	Test Page Two Synopsis</p>\r\n', '<p>\r\n	Test Page Two Text sefsfdfsdf</p>\r\n', NULL, '2015-02-28', '2015-02-28', 1, NULL, NULL, NULL, NULL, 'publish', NULL, NULL),
(3, 2, 'Test three Page', 'Test three', '<p>\r\n	Test three</p>\r\n', '<p>\r\n	Test three</p>\r\n', NULL, '2015-02-28', '2015-03-31', 1, NULL, NULL, NULL, NULL, 'publish', NULL, NULL),
(4, 2, 'Test Four Test', 'Test Four TEst', '<p>\r\n	Test Four TEst</p>\r\n', '<p>\r\n	Test Four TEst</p>\r\n', NULL, '2015-02-01', '2015-03-28', NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL),
(5, 2, 'Test Five Page Miss', 'Test Five Page', '<p>\r\n	Test Five Page</p>\r\n', '<p>\r\n	Test Five</p>\r\n', NULL, '2015-02-16', '2015-02-28', NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL),
(6, 1, 'Test one two three four five six seven', 'Test one two three four five six seven', '<p>\r\n	Test one two three four five six seven</p>\r\n', '<p>\r\n	Test one two three four five six seven</p>\r\n', NULL, '2015-02-28', '2015-02-28', NULL, NULL, NULL, NULL, NULL, 'publish', 1424071240, NULL);

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
  `ip_address` int(11) DEFAULT '0',
  `http_code` int(11) unsigned NOT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` int(1) unsigned NOT NULL,
  `added` int(11) unsigned NOT NULL,
  `modified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_server_logs`
--


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
