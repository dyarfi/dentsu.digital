-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 06, 2015 at 07:07 PM
-- Server version: 5.5.40
-- PHP Version: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `tbl_captcha`
--

CREATE TABLE IF NOT EXISTS `tbl_captcha` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `word` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=263 ;

--
-- Dumping data for table `tbl_captcha`
--

INSERT INTO `tbl_captcha` (`id`, `time`, `ip_address`, `word`) VALUES
(262, 1418275929, '::1', 'FouAT');

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
(2, 6, 'Defrian Yarfi', 'defrian.yarfi@gmail.com', 1, 1, 'ASDAD12312312313', '647474747', '45745747', 4567457, '', '1', '', '', '', '', '', '', '', '', '', '', 0, 0, '457457457', 0, 0, 'publish', 0, 0);

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
(13, 'Creative', 'Creative', '<p>\n	Lorem Ipsum Dolor Sit Amet</p>\n', 1, 'publish', 1364610224, 1368369595);

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
('5b8c8a5b374be4f7d56166452a40562c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:35.0) Gecko/20100101 Firefox/35.0', 1423191342, '');

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
(1, 1, 1, 1, 1418295539, 0),
(2, 2, 1, 1, 1418295539, 0),
(3, 3, 1, 1, 1418295539, 0),
(4, 19, 1, 1, 1418295539, 0),
(5, 20, 1, 1, 1418295539, 0),
(6, 21, 1, 1, 1418295539, 0),
(7, 32, 1, 1, 1418295539, 0),
(8, 38, 1, 1, 1418295539, 0),
(9, 4, 1, 1, 1418295539, 0),
(10, 5, 1, 1, 1418295539, 0),
(11, 6, 1, 1, 1418295539, 0),
(12, 7, 1, 1, 1418295539, 0),
(13, 8, 1, 1, 1418295539, 0),
(14, 9, 1, 1, 1418295539, 0),
(15, 10, 1, 1, 1418295539, 0),
(16, 11, 1, 1, 1418295539, 0),
(17, 12, 1, 1, 1418295539, 0),
(18, 13, 1, 1, 1418295539, 0),
(19, 14, 1, 1, 1418295539, 0),
(20, 15, 1, 1, 1418295539, 0),
(21, 16, 1, 1, 1418295539, 0),
(22, 17, 1, 1, 1418295539, 0),
(23, 18, 1, 1, 1418295539, 0),
(24, 22, 1, 1, 1418295539, 0),
(25, 23, 1, 1, 1418295539, 0),
(26, 24, 1, 1, 1418295539, 0),
(27, 25, 1, 1, 1418295539, 0),
(28, 26, 1, 1, 1418295539, 0),
(29, 27, 1, 1, 1418295539, 0),
(30, 28, 1, 1, 1418295539, 0),
(31, 29, 1, 1, 1418295539, 0),
(32, 30, 1, 1, 1418295539, 0),
(33, 31, 1, 1, 1418295539, 0),
(34, 33, 1, 1, 1418295539, 0),
(35, 34, 1, 1, 1418295539, 0),
(36, 35, 1, 1, 1418295539, 0),
(37, 36, 1, 1, 1418295539, 0),
(38, 37, 1, 1, 1418295539, 0),
(39, 39, 1, 1, 1418295539, 0),
(40, 40, 1, 1, 1418295539, 0),
(41, 41, 1, 1, 1418295539, 0),
(42, 42, 1, 1, 1418295540, 0),
(43, 43, 1, 1, 1418295540, 0),
(44, 1, 2, 1, 1418295540, 0),
(45, 2, 2, 1, 1418295540, 0),
(46, 3, 2, 1, 1418295540, 0),
(47, 19, 2, 1, 1418295540, 0),
(48, 20, 2, 1, 1418295540, 0),
(49, 21, 2, 1, 1418295540, 0),
(50, 32, 2, 1, 1418295540, 0),
(51, 38, 2, 1, 1418295540, 0),
(52, 4, 2, 1, 1418295540, 0),
(53, 5, 2, 1, 1418295540, 0),
(54, 6, 2, 1, 1418295540, 0),
(55, 7, 2, 1, 1418295540, 0),
(56, 8, 2, 1, 1418295540, 0),
(57, 9, 2, 1, 1418295540, 0),
(58, 10, 2, 1, 1418295540, 0),
(59, 11, 2, 1, 1418295540, 0),
(60, 12, 2, 1, 1418295540, 0),
(61, 13, 2, 1, 1418295540, 0),
(62, 14, 2, 1, 1418295540, 0),
(63, 15, 2, 1, 1418295540, 0),
(64, 16, 2, 1, 1418295540, 0),
(65, 17, 2, 1, 1418295540, 0),
(66, 18, 2, 1, 1418295540, 0),
(67, 22, 2, 1, 1418295540, 0),
(68, 23, 2, 1, 1418295540, 0),
(69, 24, 2, 1, 1418295540, 0),
(70, 25, 2, 1, 1418295540, 0),
(71, 26, 2, 1, 1418295540, 0),
(72, 27, 2, 1, 1418295540, 0),
(73, 28, 2, 1, 1418295540, 0),
(74, 29, 2, 1, 1418295540, 0),
(75, 30, 2, 1, 1418295540, 0),
(76, 31, 2, 1, 1418295540, 0),
(77, 33, 2, 1, 1418295540, 0),
(78, 34, 2, 1, 1418295540, 0),
(79, 35, 2, 1, 1418295540, 0),
(80, 36, 2, 1, 1418295540, 0),
(81, 37, 2, 1, 1418295540, 0),
(82, 39, 2, 1, 1418295540, 0),
(83, 40, 2, 1, 1418295540, 0),
(84, 41, 2, 1, 1418295540, 0),
(85, 42, 2, 1, 1418295540, 0),
(86, 43, 2, 1, 1418295540, 0),
(87, 1, 99, 0, 1418295540, 0),
(88, 2, 99, 0, 1418295540, 0),
(89, 3, 99, 0, 1418295540, 0),
(90, 19, 99, 0, 1418295540, 0),
(91, 20, 99, 0, 1418295540, 0),
(92, 21, 99, 0, 1418295540, 0),
(93, 32, 99, 0, 1418295540, 0),
(94, 38, 99, 0, 1418295540, 0),
(95, 4, 99, 0, 1418295540, 0),
(96, 5, 99, 0, 1418295540, 0),
(97, 6, 99, 0, 1418295540, 0),
(98, 7, 99, 0, 1418295540, 0),
(99, 8, 99, 0, 1418295540, 0),
(100, 9, 99, 0, 1418295540, 0),
(101, 10, 99, 0, 1418295540, 0),
(102, 11, 99, 0, 1418295540, 0),
(103, 12, 99, 0, 1418295540, 0),
(104, 13, 99, 0, 1418295540, 0),
(105, 14, 99, 0, 1418295540, 0),
(106, 15, 99, 0, 1418295540, 0),
(107, 16, 99, 0, 1418295540, 0),
(108, 17, 99, 0, 1418295540, 0),
(109, 18, 99, 0, 1418295540, 0),
(110, 22, 99, 0, 1418295540, 0),
(111, 23, 99, 0, 1418295540, 0),
(112, 24, 99, 0, 1418295540, 0),
(113, 25, 99, 0, 1418295540, 0),
(114, 26, 99, 0, 1418295540, 0),
(115, 27, 99, 0, 1418295540, 0),
(116, 28, 99, 0, 1418295540, 0),
(117, 29, 99, 0, 1418295540, 0),
(118, 30, 99, 0, 1418295540, 0),
(119, 31, 99, 0, 1418295540, 0),
(120, 33, 99, 0, 1418295540, 0),
(121, 34, 99, 0, 1418295540, 0),
(122, 35, 99, 0, 1418295540, 0),
(123, 36, 99, 0, 1418295540, 0),
(124, 37, 99, 0, 1418295540, 0),
(125, 39, 99, 0, 1418295540, 0),
(126, 40, 99, 0, 1418295540, 0),
(127, 41, 99, 0, 1418295540, 0),
(128, 42, 99, 0, 1418295540, 0),
(129, 43, 99, 0, 1418295540, 0),
(130, 1, 111, 0, 1418295540, 0),
(131, 2, 111, 0, 1418295540, 0),
(132, 3, 111, 0, 1418295540, 0),
(133, 19, 111, 0, 1418295540, 0),
(134, 20, 111, 0, 1418295540, 0),
(135, 21, 111, 0, 1418295540, 0),
(136, 32, 111, 0, 1418295540, 0),
(137, 38, 111, 0, 1418295540, 0),
(138, 4, 111, 0, 1418295540, 0),
(139, 5, 111, 0, 1418295540, 0),
(140, 6, 111, 0, 1418295540, 0),
(141, 7, 111, 0, 1418295540, 0),
(142, 8, 111, 0, 1418295540, 0),
(143, 9, 111, 0, 1418295540, 0),
(144, 10, 111, 0, 1418295540, 0),
(145, 11, 111, 0, 1418295540, 0),
(146, 12, 111, 0, 1418295540, 0),
(147, 13, 111, 0, 1418295540, 0),
(148, 14, 111, 0, 1418295540, 0),
(149, 15, 111, 0, 1418295540, 0),
(150, 16, 111, 0, 1418295540, 0),
(151, 17, 111, 0, 1418295540, 0),
(152, 18, 111, 0, 1418295540, 0),
(153, 22, 111, 0, 1418295540, 0),
(154, 23, 111, 0, 1418295540, 0),
(155, 24, 111, 0, 1418295540, 0),
(156, 25, 111, 0, 1418295540, 0),
(157, 26, 111, 0, 1418295540, 0),
(158, 27, 111, 0, 1418295540, 0),
(159, 28, 111, 0, 1418295540, 0),
(160, 29, 111, 0, 1418295540, 0),
(161, 30, 111, 0, 1418295540, 0),
(162, 31, 111, 0, 1418295540, 0),
(163, 33, 111, 0, 1418295540, 0),
(164, 34, 111, 0, 1418295540, 0),
(165, 35, 111, 0, 1418295540, 0),
(166, 36, 111, 0, 1418295540, 0),
(167, 37, 111, 0, 1418295540, 0),
(168, 39, 111, 0, 1418295540, 0),
(169, 40, 111, 0, 1418295540, 0),
(170, 41, 111, 0, 1418295540, 0),
(171, 42, 111, 0, 1418295540, 0),
(172, 43, 111, 0, 1418295540, 0),
(173, 1, 112, 0, 1418295540, 0),
(174, 2, 112, 0, 1418295540, 0),
(175, 3, 112, 0, 1418295540, 0),
(176, 19, 112, 0, 1418295540, 0),
(177, 20, 112, 0, 1418295540, 0),
(178, 21, 112, 0, 1418295540, 0),
(179, 32, 112, 0, 1418295540, 0),
(180, 38, 112, 0, 1418295540, 0),
(181, 4, 112, 0, 1418295540, 0),
(182, 5, 112, 0, 1418295540, 0),
(183, 6, 112, 0, 1418295540, 0),
(184, 7, 112, 0, 1418295540, 0),
(185, 8, 112, 0, 1418295540, 0),
(186, 9, 112, 0, 1418295540, 0),
(187, 10, 112, 0, 1418295540, 0),
(188, 11, 112, 0, 1418295540, 0),
(189, 12, 112, 0, 1418295540, 0),
(190, 13, 112, 0, 1418295540, 0),
(191, 14, 112, 0, 1418295540, 0),
(192, 15, 112, 0, 1418295540, 0),
(193, 16, 112, 0, 1418295540, 0),
(194, 17, 112, 0, 1418295540, 0),
(195, 18, 112, 0, 1418295540, 0),
(196, 22, 112, 0, 1418295540, 0),
(197, 23, 112, 0, 1418295540, 0),
(198, 24, 112, 0, 1418295540, 0),
(199, 25, 112, 0, 1418295540, 0),
(200, 26, 112, 0, 1418295540, 0),
(201, 27, 112, 0, 1418295540, 0),
(202, 28, 112, 0, 1418295540, 0),
(203, 29, 112, 0, 1418295540, 0),
(204, 30, 112, 0, 1418295540, 0),
(205, 31, 112, 0, 1418295540, 0),
(206, 33, 112, 0, 1418295540, 0),
(207, 34, 112, 0, 1418295540, 0),
(208, 35, 112, 0, 1418295540, 0),
(209, 36, 112, 0, 1418295540, 0),
(210, 37, 112, 0, 1418295540, 0),
(211, 39, 112, 0, 1418295540, 0),
(212, 40, 112, 0, 1418295540, 0),
(213, 41, 112, 0, 1418295540, 0),
(214, 42, 112, 0, 1418295540, 0),
(215, 43, 112, 0, 1418295540, 0),
(216, 1, 113, 0, 1418295540, 0),
(217, 2, 113, 0, 1418295540, 0),
(218, 3, 113, 0, 1418295540, 0),
(219, 19, 113, 0, 1418295540, 0),
(220, 20, 113, 0, 1418295540, 0),
(221, 21, 113, 0, 1418295540, 0),
(222, 32, 113, 0, 1418295540, 0),
(223, 38, 113, 0, 1418295540, 0),
(224, 4, 113, 0, 1418295540, 0),
(225, 5, 113, 0, 1418295540, 0),
(226, 6, 113, 0, 1418295540, 0),
(227, 7, 113, 0, 1418295540, 0),
(228, 8, 113, 0, 1418295540, 0),
(229, 9, 113, 0, 1418295540, 0),
(230, 10, 113, 0, 1418295540, 0),
(231, 11, 113, 0, 1418295540, 0),
(232, 12, 113, 0, 1418295540, 0),
(233, 13, 113, 0, 1418295540, 0),
(234, 14, 113, 0, 1418295540, 0),
(235, 15, 113, 0, 1418295540, 0),
(236, 16, 113, 0, 1418295540, 0),
(237, 17, 113, 0, 1418295540, 0),
(238, 18, 113, 0, 1418295540, 0),
(239, 22, 113, 0, 1418295540, 0),
(240, 23, 113, 0, 1418295540, 0),
(241, 24, 113, 0, 1418295540, 0),
(242, 25, 113, 0, 1418295540, 0),
(243, 26, 113, 0, 1418295540, 0),
(244, 27, 113, 0, 1418295540, 0),
(245, 28, 113, 0, 1418295540, 0),
(246, 29, 113, 0, 1418295540, 0),
(247, 30, 113, 0, 1418295540, 0),
(248, 31, 113, 0, 1418295540, 0),
(249, 33, 113, 0, 1418295540, 0),
(250, 34, 113, 0, 1418295540, 0),
(251, 35, 113, 0, 1418295540, 0),
(252, 36, 113, 0, 1418295540, 0),
(253, 37, 113, 0, 1418295540, 0),
(254, 39, 113, 0, 1418295540, 0),
(255, 40, 113, 0, 1418295540, 0),
(256, 41, 113, 0, 1418295540, 0),
(257, 42, 113, 0, 1418295540, 0),
(258, 43, 113, 0, 1418295540, 0),
(259, 1, 114, 0, 1418295540, 0),
(260, 2, 114, 0, 1418295540, 0),
(261, 3, 114, 0, 1418295540, 0),
(262, 19, 114, 0, 1418295540, 0),
(263, 20, 114, 0, 1418295540, 0),
(264, 21, 114, 0, 1418295540, 0),
(265, 32, 114, 0, 1418295540, 0),
(266, 38, 114, 0, 1418295540, 0),
(267, 4, 114, 0, 1418295540, 0),
(268, 5, 114, 0, 1418295540, 0),
(269, 6, 114, 0, 1418295540, 0),
(270, 7, 114, 0, 1418295540, 0),
(271, 8, 114, 0, 1418295540, 0),
(272, 9, 114, 0, 1418295540, 0),
(273, 10, 114, 0, 1418295540, 0),
(274, 11, 114, 0, 1418295540, 0),
(275, 12, 114, 0, 1418295540, 0),
(276, 13, 114, 0, 1418295540, 0),
(277, 14, 114, 0, 1418295540, 0),
(278, 15, 114, 0, 1418295540, 0),
(279, 16, 114, 0, 1418295540, 0),
(280, 17, 114, 0, 1418295540, 0),
(281, 18, 114, 0, 1418295540, 0),
(282, 22, 114, 0, 1418295540, 0),
(283, 23, 114, 0, 1418295540, 0),
(284, 24, 114, 0, 1418295540, 0),
(285, 25, 114, 0, 1418295540, 0),
(286, 26, 114, 0, 1418295540, 0),
(287, 27, 114, 0, 1418295540, 0),
(288, 28, 114, 0, 1418295540, 0),
(289, 29, 114, 0, 1418295540, 0),
(290, 30, 114, 0, 1418295540, 0),
(291, 31, 114, 0, 1418295540, 0),
(292, 33, 114, 0, 1418295540, 0),
(293, 34, 114, 0, 1418295540, 0),
(294, 35, 114, 0, 1418295540, 0),
(295, 36, 114, 0, 1418295540, 0),
(296, 37, 114, 0, 1418295540, 0),
(297, 39, 114, 0, 1418295540, 0),
(298, 40, 114, 0, 1418295540, 0),
(299, 41, 114, 0, 1418295540, 0),
(300, 42, 114, 0, 1418295540, 0),
(301, 43, 114, 0, 1418295540, 0),
(302, 1, 116, 0, 1418295540, 0),
(303, 2, 116, 0, 1418295540, 0),
(304, 3, 116, 0, 1418295540, 0),
(305, 19, 116, 0, 1418295540, 0),
(306, 20, 116, 0, 1418295540, 0),
(307, 21, 116, 0, 1418295540, 0),
(308, 32, 116, 0, 1418295540, 0),
(309, 38, 116, 0, 1418295540, 0),
(310, 4, 116, 0, 1418295540, 0),
(311, 5, 116, 0, 1418295540, 0),
(312, 6, 116, 0, 1418295540, 0),
(313, 7, 116, 0, 1418295540, 0),
(314, 8, 116, 0, 1418295540, 0),
(315, 9, 116, 0, 1418295540, 0),
(316, 10, 116, 0, 1418295540, 0),
(317, 11, 116, 0, 1418295540, 0),
(318, 12, 116, 0, 1418295540, 0),
(319, 13, 116, 0, 1418295540, 0),
(320, 14, 116, 0, 1418295540, 0),
(321, 15, 116, 0, 1418295540, 0),
(322, 16, 116, 0, 1418295540, 0),
(323, 17, 116, 0, 1418295540, 0),
(324, 18, 116, 0, 1418295540, 0),
(325, 22, 116, 0, 1418295540, 0),
(326, 23, 116, 0, 1418295540, 0),
(327, 24, 116, 0, 1418295540, 0),
(328, 25, 116, 0, 1418295540, 0),
(329, 26, 116, 0, 1418295540, 0),
(330, 27, 116, 0, 1418295540, 0),
(331, 28, 116, 0, 1418295540, 0),
(332, 29, 116, 0, 1418295540, 0),
(333, 30, 116, 0, 1418295540, 0),
(334, 31, 116, 0, 1418295540, 0),
(335, 33, 116, 0, 1418295540, 0),
(336, 34, 116, 0, 1418295540, 0),
(337, 35, 116, 0, 1418295540, 0),
(338, 36, 116, 0, 1418295540, 0),
(339, 37, 116, 0, 1418295540, 0),
(340, 39, 116, 0, 1418295540, 0),
(341, 40, 116, 0, 1418295540, 0),
(342, 41, 116, 0, 1418295540, 0),
(343, 42, 116, 0, 1418295540, 0),
(344, 43, 116, 0, 1418295540, 0);

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
(6, 5, 'Careers'),
(7, 5, 'CareerDivisions'),
(8, 5, 'CareerApplicants'),
(9, 9, 'Pages'),
(10, 9, 'PageMenus'),
(11, 11, 'Settings');

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
(5, 0, 'career', '#', 1),
(6, 5, 'Career Listings', 'career/index', 0),
(7, 5, 'Career Division Listings', 'careerdivision/index', 1),
(8, 5, 'Career Applicant Listings', 'careerapplicant/index', 2),
(9, 0, 'page', '#', 2),
(10, 9, 'Page Listings', 'page/index', 0),
(11, 0, 'setting', '#', 3),
(12, 11, 'Setting Listings', 'setting/index', 0);

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
(4, 1, 'Add New Dashboard', 'dashboard/add', 3),
(5, 1, 'View Dashboard Details', 'dashboard/view', 4),
(6, 1, 'Edit Dashboard Details', 'dashboard/edit', 5),
(7, 1, 'Delete Dashboard', 'dashboard/delete', 6),
(8, 1, 'Change Dashboard Status', 'dashboard/change', 7),
(9, 1, 'Add User Details', 'user/add', 8),
(10, 1, 'View User Details', 'user/view', 9),
(11, 1, 'Edit User Details', 'user/edit', 10),
(12, 1, 'Delete User Details', 'user/delete', 11),
(13, 1, 'Change User Status', 'user/change', 12),
(14, 1, 'Add User Group Details', 'usergroup/add', 13),
(15, 1, 'View User Group Details', 'usergroup/view', 14),
(16, 1, 'Edit User Group Details', 'usergroup/edit', 15),
(17, 1, 'Delete User Group Details', 'usergroup/delete', 16),
(18, 1, 'Change User Group Status', 'usergroup/change', 17),
(19, 5, 'Career Listings', 'career/index', 0),
(20, 5, 'Career Division Listings', 'careerdivision/index', 1),
(21, 5, 'Career Applicant Listings', 'careerapplicant/index', 2),
(22, 5, 'Add Career Details', 'career/add', 3),
(23, 5, 'View Career Details', 'career/view', 4),
(24, 5, 'Edit Career Details', 'career/edit', 5),
(25, 5, 'Delete Career Details', 'career/delete', 6),
(26, 5, 'Change Career Status', 'career/change', 7),
(27, 5, 'Add Career Division Listings', 'careerapplicant/add', 8),
(28, 5, 'View Career Division Listings', 'careerapplicant/view', 9),
(29, 5, 'Edit Career Division Listings', 'careerapplicant/edit', 10),
(30, 5, 'Delete Career Division Listings', 'careerapplicant/delete', 11),
(31, 5, 'Change Career Division Listings', 'careerapplicant/change', 12),
(32, 9, 'Page Listings', 'page/index', 0),
(33, 9, 'Add Page Details', 'page/add', 1),
(34, 9, 'View Page Details', 'page/view', 2),
(35, 9, 'Edit Page Details', 'page/edit', 3),
(36, 9, 'Delete Page Details', 'page/delete', 4),
(37, 9, 'Change Page Status', 'page/change', 5),
(38, 11, 'Setting Listings', 'setting/index', 0),
(39, 11, 'Add Setting Details', 'setting/add', 1),
(40, 11, 'View Setting Details', 'setting/view', 2),
(41, 11, 'Edit Setting Details', 'setting/edit', 3),
(42, 11, 'Delete Setting Details', 'setting/delete', 4),
(43, 11, 'Change Setting Status', 'setting/change', 5);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

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
(26, 'ext_link', 'Ext Link', 'http://www.apb-career.net', 1, 1, NULL, 1336118568);

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
