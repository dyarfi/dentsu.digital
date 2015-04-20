-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2015 at 09:23 PM
-- Server version: 5.5.40
-- PHP Version: 5.4.38

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_applicants`
--

INSERT INTO `tbl_applicants` (`id`, `career_id`, `user_id`, `name`, `email`, `gender`, `marital_status`, `id_number`, `phone`, `address`, `birth_date`, `birth_place`, `education_grade`, `education_name`, `education_major`, `education_from`, `education_to`, `employment_name`, `employment_position`, `employment_from`, `employment_to`, `photo`, `cv_file`, `is_located`, `is_related`, `messages`, `available_date`, `expected_salary`, `status`, `added`, `modified`) VALUES
(1, 1, NULL, 'asdfsadfasd', 'asdfsadfasdf', 1, 1, 'asdasdad', 'asdasd', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, NULL, 0, 0, 1, 0, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=600 ;

--
-- Dumping data for table `tbl_captcha`
--

INSERT INTO `tbl_captcha` (`id`, `time`, `ip_address`, `word`) VALUES
(599, 1428349890, '::1', 'sVLcu'),
(598, 1428349875, '::1', 'orMmn');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_careers`
--

INSERT INTO `tbl_careers` (`id`, `division_id`, `name`, `subject`, `sent_to`, `ref_no`, `start_date`, `end_date`, `report_to`, `job_purpose`, `responsibilities`, `requirements`, `location`, `company`, `ext_link1`, `ext_link2`, `allow_comment`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, 17, 'Web Developer', 'Web Developer', 'Project Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL);

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
('a37b200608c2fa1845f84deb3ec8db93', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1', 1429366970, 'a:6:{s:9:"user_data";s:0:"";s:8:"curr_url";s:27:"admin-panel/dashboard/index";s:8:"prev_url";s:27:"admin-panel/dashboard/index";s:11:"module_list";s:369:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"Users","usergroup{{slash}}/index":"User Groups","language{{slash}}/index":"Languages","setting{{slash}}/index":"Settings","serverlog{{slash}}/index":"Server Logs"},"Module":{"modulelist{{slash}}/index":"Modules"},"Page":{"page{{slash}}/index":"Pages","pagemenu{{slash}}/index":"Page Menus"}}";s:20:"module_function_list";s:2534:"{"Admin":{"dashboard{{slash}}/index":"Dashboard Panel","user{{slash}}/index":"Users","usergroup{{slash}}/index":"User Groups","language{{slash}}/index":"Languages","setting{{slash}}/index":"Settings","serverlog{{slash}}/index":"Server Logs","dashboard{{slash}}/add":"Add New Dashboard","dashboard{{slash}}/view":"View Dashboard","dashboard{{slash}}/edit":"Edit Dashboard","dashboard{{slash}}/delete":"Delete Dashboard","dashboard{{slash}}/change":"Change Dashboard Status","user{{slash}}/add":"Add User","user{{slash}}/view":"View User","user{{slash}}/edit":"Edit User","user{{slash}}/delete":"Delete User","user{{slash}}/change":"Change User Status","user{{slash}}/image":"Change User Image","user{{slash}}/upload":"Upload User Image","usergroup{{slash}}/add":"Add User Group","usergroup{{slash}}/view":"View User Group","usergroup{{slash}}/edit":"Edit User Group","usergroup{{slash}}/delete":"Delete User Group","usergroup{{slash}}/change":"Change User Group Status","language{{slash}}/add":"Add Language","language{{slash}}/view":"View Language","language{{slash}}/edit":"Edit Language","language{{slash}}/delete":"Delete Language","language{{slash}}/change":"Change Language Status","setting{{slash}}/add":"Add Setting","setting{{slash}}/view":"View Setting","setting{{slash}}/edit":"Edit Setting","setting{{slash}}/delete":"Delete Setting","setting{{slash}}/change":"Change Setting Status","serverlog{{slash}}/view":"View Server Log","serverlog{{slash}}/edit":"Edit Server Log","serverlog{{slash}}/delete":"Delete Server Log","serverlog{{slash}}/trash":"Trash Server Log"},"Module":{"modulelist{{slash}}/edit":"Edit Module","modulelist{{slash}}/trash":"Delete User Permission"},"Page":{"page{{slash}}/index":"Pages","pagemenu{{slash}}/index":"Page Menus","page{{slash}}/index{{slash}}/add":"Add Page","page{{slash}}/index{{slash}}/view":"View Page","page{{slash}}/index{{slash}}/edit":"Edit Page","page{{slash}}/index{{slash}}/delete":"Delete Page","page{{slash}}/index{{slash}}/change":"Change Page Status","page{{slash}}/index{{slash}}/export":"Export Page","page{{slash}}/index{{slash}}/print":"Print Page","pagemenu{{slash}}/index{{slash}}/add":"Add Page Menu","pagemenu{{slash}}/index{{slash}}/view":"View Page Menu","pagemenu{{slash}}/index{{slash}}/edit":"Edit Page Menu","pagemenu{{slash}}/index{{slash}}/delete":"Delete Page Menu","pagemenu{{slash}}/index{{slash}}/change":"Change Page Menu Status","pagemenu{{slash}}/index{{slash}}/export":"Export Page Menu","pagemenu{{slash}}/index{{slash}}/print":"Print Page Menu"}}";s:12:"user_session";O:8:"stdClass":8:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@admin.com";s:8:"group_id";s:1:"1";s:6:"status";s:1:"1";s:10:"last_login";s:10:"1429366970";s:9:"logged_in";b:1;s:4:"name";s:21:"Administrator Website";}}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_colorcontents`
--

CREATE TABLE IF NOT EXISTS `tbl_colorcontents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `color_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `serial` text,
  `file_name` varchar(512) DEFAULT NULL,
  `colorcontent_url` varchar(512) DEFAULT NULL,
  `order` tinyint(3) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tbl_colorcontents`
--

INSERT INTO `tbl_colorcontents` (`id`, `color_id`, `name`, `text`, `serial`, `file_name`, `colorcontent_url`, `order`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, 4, 'Atasan Merah', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427961416, 1427961961),
(2, 10, 'Atasan Kuning', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427961812, 1427961968),
(3, 4, 'Bawahan Merah', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427961852, NULL),
(4, 10, 'Bawahan Kuning', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427961873, 1427961904),
(5, 8, 'Atasan Hijau', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427961918, NULL),
(6, 8, 'Bawahan Hijau', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427961935, NULL),
(7, 24, 'Atasan Abu Abu', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427961987, NULL),
(8, 24, 'Bawahan Abu Abu', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962020, NULL),
(9, 12, 'Atasan Ungu', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962049, NULL),
(10, 12, 'Bawahan Ungu', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962076, NULL),
(11, 25, 'Atasan Hitam', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962122, NULL),
(12, 25, 'Bawahan Hitam', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962136, NULL),
(13, 15, 'Atasan Putih', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962156, NULL),
(14, 15, 'Bawahan Putih', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962170, NULL),
(15, 2, 'Atasan Biru', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962188, NULL),
(16, 2, 'Bawahan Biru', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1427962200, 1427962210);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_colorpersonals`
--

CREATE TABLE IF NOT EXISTS `tbl_colorpersonals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `colorcontent_id` int(11) DEFAULT NULL,
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_colors`
--

CREATE TABLE IF NOT EXISTS `tbl_colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `serial` text,
  `file_name` varchar(512) DEFAULT NULL,
  `color_url` varchar(512) DEFAULT NULL,
  `order` tinyint(3) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `tbl_colors`
--

INSERT INTO `tbl_colors` (`id`, `name`, `text`, `serial`, `file_name`, `color_url`, `order`, `user_id`, `count`, `status`, `added`, `modified`) VALUES
(1, NULL, NULL, 'FF5938', NULL, NULL, NULL, NULL, NULL, 1, 1427959090, NULL),
(2, NULL, NULL, '3068FF', NULL, NULL, NULL, NULL, NULL, 1, 1427959236, NULL),
(3, NULL, NULL, 'EEFFA8', NULL, NULL, NULL, NULL, NULL, 1, 1427959243, NULL),
(4, NULL, NULL, 'FF0D15', NULL, NULL, NULL, NULL, NULL, 1, 1427959251, NULL),
(5, NULL, NULL, 'FFD95C', NULL, NULL, NULL, NULL, NULL, 1, 1427959257, NULL),
(6, NULL, NULL, '17FFE0', NULL, NULL, NULL, NULL, NULL, 1, 1427959262, NULL),
(7, NULL, NULL, 'E2FF9E', NULL, NULL, NULL, NULL, NULL, 1, 1427959268, NULL),
(8, NULL, NULL, '1AFF12', NULL, NULL, NULL, NULL, NULL, 1, 1427959273, NULL),
(9, NULL, NULL, 'E9E6FF', NULL, NULL, NULL, NULL, NULL, 1, 1427959279, NULL),
(10, NULL, NULL, 'F8FF36', NULL, NULL, NULL, NULL, NULL, 1, 1427959287, NULL),
(11, NULL, NULL, 'FFF2E8', NULL, NULL, NULL, NULL, NULL, 1, 1427959293, NULL),
(12, NULL, NULL, '9C08FF', NULL, NULL, NULL, NULL, NULL, 1, 1427959299, NULL),
(13, NULL, NULL, 'FFD8B5', NULL, NULL, NULL, NULL, NULL, 1, 1427959303, NULL),
(14, NULL, NULL, '8EFF78', NULL, NULL, NULL, NULL, NULL, 1, 1427959308, NULL),
(15, NULL, NULL, 'FFFFFF', NULL, NULL, NULL, NULL, NULL, 1, 1427959317, NULL),
(16, NULL, NULL, '570101', NULL, NULL, NULL, NULL, NULL, 1, 1427959323, NULL),
(17, NULL, NULL, 'FFBF29', NULL, NULL, NULL, NULL, NULL, 1, 1427959330, NULL),
(18, NULL, NULL, '26FF26', NULL, NULL, NULL, NULL, NULL, 1, 1427959336, NULL),
(19, NULL, NULL, 'FFF017', NULL, NULL, NULL, NULL, NULL, 1, 1427959341, NULL),
(20, NULL, NULL, '08F7FF', NULL, NULL, NULL, NULL, NULL, 1, 1427959348, NULL),
(21, NULL, NULL, 'EFFFBA', NULL, NULL, NULL, NULL, NULL, 1, 1427959353, NULL),
(22, NULL, NULL, 'A5D6C4', NULL, NULL, NULL, NULL, NULL, 1, 1427959358, NULL),
(23, NULL, NULL, 'C7BF4E', NULL, NULL, NULL, NULL, NULL, 1, 1427959369, NULL),
(24, NULL, NULL, 'DDD6FF', NULL, NULL, NULL, NULL, NULL, 1, 1427959387, NULL),
(25, NULL, NULL, '000000', NULL, NULL, NULL, NULL, NULL, 1, 1427962111, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color_contents`
--

CREATE TABLE IF NOT EXISTS `tbl_color_contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `color_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `serial` text,
  `file_name` varchar(512) DEFAULT NULL,
  `colorcontent_url` varchar(512) DEFAULT NULL,
  `order` tinyint(3) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color_personals`
--

CREATE TABLE IF NOT EXISTS `tbl_color_personals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `colorcontent_id` int(11) DEFAULT NULL,
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=478 ;

--
-- Dumping data for table `tbl_group_permissions`
--

INSERT INTO `tbl_group_permissions` (`id`, `permission_id`, `group_id`, `value`, `added`, `modified`) VALUES
(1, 1, 1, 1, 1429366587, 0),
(2, 2, 1, 1, 1429366587, 0),
(3, 3, 1, 1, 1429366587, 0),
(4, 4, 1, 1, 1429366587, 0),
(5, 5, 1, 1, 1429366587, 0),
(6, 6, 1, 1, 1429366587, 0),
(7, 38, 1, 1, 1429366587, 0),
(8, 39, 1, 1, 1429366587, 0),
(9, 7, 1, 1, 1429366587, 0),
(10, 8, 1, 1, 1429366587, 0),
(11, 9, 1, 1, 1429366587, 0),
(12, 10, 1, 1, 1429366587, 0),
(13, 11, 1, 1, 1429366587, 0),
(14, 12, 1, 1, 1429366587, 0),
(15, 13, 1, 1, 1429366587, 0),
(16, 14, 1, 1, 1429366587, 0),
(17, 15, 1, 1, 1429366587, 0),
(18, 16, 1, 1, 1429366587, 0),
(19, 17, 1, 1, 1429366587, 0),
(20, 18, 1, 1, 1429366587, 0),
(21, 19, 1, 1, 1429366587, 0),
(22, 20, 1, 1, 1429366587, 0),
(23, 21, 1, 1, 1429366587, 0),
(24, 22, 1, 1, 1429366587, 0),
(25, 23, 1, 1, 1429366587, 0),
(26, 24, 1, 1, 1429366587, 0),
(27, 25, 1, 1, 1429366587, 0),
(28, 26, 1, 1, 1429366587, 0),
(29, 27, 1, 1, 1429366587, 0),
(30, 28, 1, 1, 1429366587, 0),
(31, 29, 1, 1, 1429366587, 0),
(32, 30, 1, 1, 1429366587, 0),
(33, 31, 1, 1, 1429366587, 0),
(34, 32, 1, 1, 1429366587, 0),
(35, 33, 1, 1, 1429366587, 0),
(36, 34, 1, 1, 1429366587, 0),
(37, 35, 1, 1, 1429366587, 0),
(38, 36, 1, 1, 1429366587, 0),
(39, 37, 1, 1, 1429366587, 0),
(40, 40, 1, 1, 1429366587, 0),
(41, 41, 1, 1, 1429366587, 0),
(42, 42, 1, 1, 1429366587, 0),
(43, 43, 1, 1, 1429366587, 0),
(44, 44, 1, 1, 1429366587, 0),
(45, 45, 1, 1, 1429366587, 0),
(46, 46, 1, 1, 1429366587, 0),
(47, 47, 1, 1, 1429366587, 0),
(48, 48, 1, 1, 1429366587, 0),
(49, 49, 1, 1, 1429366587, 0),
(50, 50, 1, 1, 1429366587, 0),
(51, 51, 1, 1, 1429366587, 0),
(52, 52, 1, 1, 1429366587, 0),
(53, 53, 1, 1, 1429366587, 0),
(54, 1, 2, 1, 1429366587, 0),
(55, 2, 2, 1, 1429366587, 0),
(56, 3, 2, 1, 1429366587, 0),
(57, 4, 2, 1, 1429366587, 0),
(58, 5, 2, 1, 1429366587, 0),
(59, 6, 2, 1, 1429366587, 0),
(60, 38, 2, 1, 1429366587, 0),
(61, 39, 2, 1, 1429366587, 0),
(62, 7, 2, 1, 1429366587, 0),
(63, 8, 2, 1, 1429366587, 0),
(64, 9, 2, 1, 1429366587, 0),
(65, 10, 2, 1, 1429366587, 0),
(66, 11, 2, 1, 1429366587, 0),
(67, 12, 2, 1, 1429366587, 0),
(68, 13, 2, 1, 1429366587, 0),
(69, 14, 2, 1, 1429366587, 0),
(70, 15, 2, 1, 1429366587, 0),
(71, 16, 2, 1, 1429366588, 0),
(72, 17, 2, 1, 1429366588, 0),
(73, 18, 2, 1, 1429366588, 0),
(74, 19, 2, 1, 1429366588, 0),
(75, 20, 2, 1, 1429366588, 0),
(76, 21, 2, 1, 1429366588, 0),
(77, 22, 2, 1, 1429366588, 0),
(78, 23, 2, 1, 1429366588, 0),
(79, 24, 2, 1, 1429366588, 0),
(80, 25, 2, 1, 1429366588, 0),
(81, 26, 2, 1, 1429366588, 0),
(82, 27, 2, 1, 1429366588, 0),
(83, 28, 2, 1, 1429366588, 0),
(84, 29, 2, 1, 1429366588, 0),
(85, 30, 2, 1, 1429366588, 0),
(86, 31, 2, 1, 1429366588, 0),
(87, 32, 2, 1, 1429366588, 0),
(88, 33, 2, 1, 1429366588, 0),
(89, 34, 2, 1, 1429366588, 0),
(90, 35, 2, 1, 1429366588, 0),
(91, 36, 2, 1, 1429366588, 0),
(92, 37, 2, 1, 1429366588, 0),
(93, 40, 2, 1, 1429366588, 0),
(94, 41, 2, 1, 1429366588, 0),
(95, 42, 2, 1, 1429366588, 0),
(96, 43, 2, 1, 1429366588, 0),
(97, 44, 2, 1, 1429366588, 0),
(98, 45, 2, 1, 1429366588, 0),
(99, 46, 2, 1, 1429366588, 0),
(100, 47, 2, 1, 1429366588, 0),
(101, 48, 2, 1, 1429366588, 0),
(102, 49, 2, 1, 1429366588, 0),
(103, 50, 2, 1, 1429366588, 0),
(104, 51, 2, 1, 1429366588, 0),
(105, 52, 2, 1, 1429366588, 0),
(106, 53, 2, 1, 1429366588, 0),
(107, 1, 99, 0, 1429366588, 0),
(108, 2, 99, 0, 1429366588, 0),
(109, 3, 99, 0, 1429366588, 0),
(110, 4, 99, 0, 1429366588, 0),
(111, 5, 99, 0, 1429366588, 0),
(112, 6, 99, 0, 1429366588, 0),
(113, 38, 99, 0, 1429366588, 0),
(114, 39, 99, 0, 1429366588, 0),
(115, 7, 99, 0, 1429366588, 0),
(116, 8, 99, 0, 1429366588, 0),
(117, 9, 99, 0, 1429366588, 0),
(118, 10, 99, 0, 1429366588, 0),
(119, 11, 99, 0, 1429366588, 0),
(120, 12, 99, 0, 1429366588, 0),
(121, 13, 99, 0, 1429366588, 0),
(122, 14, 99, 0, 1429366588, 0),
(123, 15, 99, 0, 1429366588, 0),
(124, 16, 99, 0, 1429366588, 0),
(125, 17, 99, 0, 1429366588, 0),
(126, 18, 99, 0, 1429366588, 0),
(127, 19, 99, 0, 1429366588, 0),
(128, 20, 99, 0, 1429366588, 0),
(129, 21, 99, 0, 1429366588, 0),
(130, 22, 99, 0, 1429366588, 0),
(131, 23, 99, 0, 1429366588, 0),
(132, 24, 99, 0, 1429366588, 0),
(133, 25, 99, 0, 1429366588, 0),
(134, 26, 99, 0, 1429366588, 0),
(135, 27, 99, 0, 1429366588, 0),
(136, 28, 99, 0, 1429366588, 0),
(137, 29, 99, 0, 1429366588, 0),
(138, 30, 99, 0, 1429366588, 0),
(139, 31, 99, 0, 1429366588, 0),
(140, 32, 99, 0, 1429366588, 0),
(141, 33, 99, 0, 1429366588, 0),
(142, 34, 99, 0, 1429366588, 0),
(143, 35, 99, 0, 1429366588, 0),
(144, 36, 99, 0, 1429366588, 0),
(145, 37, 99, 0, 1429366588, 0),
(146, 40, 99, 0, 1429366588, 0),
(147, 41, 99, 0, 1429366588, 0),
(148, 42, 99, 0, 1429366588, 0),
(149, 43, 99, 0, 1429366588, 0),
(150, 44, 99, 0, 1429366588, 0),
(151, 45, 99, 0, 1429366588, 0),
(152, 46, 99, 0, 1429366588, 0),
(153, 47, 99, 0, 1429366588, 0),
(154, 48, 99, 0, 1429366588, 0),
(155, 49, 99, 0, 1429366588, 0),
(156, 50, 99, 0, 1429366588, 0),
(157, 51, 99, 0, 1429366588, 0),
(158, 52, 99, 0, 1429366588, 0),
(159, 53, 99, 0, 1429366588, 0),
(160, 1, 111, 0, 1429366588, 0),
(161, 2, 111, 0, 1429366588, 0),
(162, 3, 111, 0, 1429366588, 0),
(163, 4, 111, 0, 1429366588, 0),
(164, 5, 111, 0, 1429366588, 0),
(165, 6, 111, 0, 1429366588, 0),
(166, 38, 111, 0, 1429366588, 0),
(167, 39, 111, 0, 1429366588, 0),
(168, 7, 111, 0, 1429366588, 0),
(169, 8, 111, 0, 1429366588, 0),
(170, 9, 111, 0, 1429366588, 0),
(171, 10, 111, 0, 1429366588, 0),
(172, 11, 111, 0, 1429366588, 0),
(173, 12, 111, 0, 1429366588, 0),
(174, 13, 111, 0, 1429366588, 0),
(175, 14, 111, 0, 1429366588, 0),
(176, 15, 111, 0, 1429366588, 0),
(177, 16, 111, 0, 1429366588, 0),
(178, 17, 111, 0, 1429366588, 0),
(179, 18, 111, 0, 1429366588, 0),
(180, 19, 111, 0, 1429366588, 0),
(181, 20, 111, 0, 1429366588, 0),
(182, 21, 111, 0, 1429366588, 0),
(183, 22, 111, 0, 1429366588, 0),
(184, 23, 111, 0, 1429366588, 0),
(185, 24, 111, 0, 1429366588, 0),
(186, 25, 111, 0, 1429366588, 0),
(187, 26, 111, 0, 1429366588, 0),
(188, 27, 111, 0, 1429366588, 0),
(189, 28, 111, 0, 1429366588, 0),
(190, 29, 111, 0, 1429366588, 0),
(191, 30, 111, 0, 1429366588, 0),
(192, 31, 111, 0, 1429366588, 0),
(193, 32, 111, 0, 1429366588, 0),
(194, 33, 111, 0, 1429366588, 0),
(195, 34, 111, 0, 1429366588, 0),
(196, 35, 111, 0, 1429366588, 0),
(197, 36, 111, 0, 1429366588, 0),
(198, 37, 111, 0, 1429366588, 0),
(199, 40, 111, 0, 1429366588, 0),
(200, 41, 111, 0, 1429366588, 0),
(201, 42, 111, 0, 1429366588, 0),
(202, 43, 111, 0, 1429366588, 0),
(203, 44, 111, 0, 1429366588, 0),
(204, 45, 111, 0, 1429366588, 0),
(205, 46, 111, 0, 1429366588, 0),
(206, 47, 111, 0, 1429366588, 0),
(207, 48, 111, 0, 1429366588, 0),
(208, 49, 111, 0, 1429366588, 0),
(209, 50, 111, 0, 1429366588, 0),
(210, 51, 111, 0, 1429366588, 0),
(211, 52, 111, 0, 1429366588, 0),
(212, 53, 111, 0, 1429366588, 0),
(213, 1, 112, 0, 1429366588, 0),
(214, 2, 112, 0, 1429366588, 0),
(215, 3, 112, 0, 1429366588, 0),
(216, 4, 112, 0, 1429366588, 0),
(217, 5, 112, 0, 1429366588, 0),
(218, 6, 112, 0, 1429366588, 0),
(219, 38, 112, 0, 1429366588, 0),
(220, 39, 112, 0, 1429366588, 0),
(221, 7, 112, 0, 1429366588, 0),
(222, 8, 112, 0, 1429366588, 0),
(223, 9, 112, 0, 1429366588, 0),
(224, 10, 112, 0, 1429366588, 0),
(225, 11, 112, 0, 1429366588, 0),
(226, 12, 112, 0, 1429366588, 0),
(227, 13, 112, 0, 1429366588, 0),
(228, 14, 112, 0, 1429366588, 0),
(229, 15, 112, 0, 1429366588, 0),
(230, 16, 112, 0, 1429366588, 0),
(231, 17, 112, 0, 1429366588, 0),
(232, 18, 112, 0, 1429366588, 0),
(233, 19, 112, 0, 1429366588, 0),
(234, 20, 112, 0, 1429366588, 0),
(235, 21, 112, 0, 1429366588, 0),
(236, 22, 112, 0, 1429366588, 0),
(237, 23, 112, 0, 1429366588, 0),
(238, 24, 112, 0, 1429366588, 0),
(239, 25, 112, 0, 1429366588, 0),
(240, 26, 112, 0, 1429366588, 0),
(241, 27, 112, 0, 1429366588, 0),
(242, 28, 112, 0, 1429366588, 0),
(243, 29, 112, 0, 1429366588, 0),
(244, 30, 112, 0, 1429366588, 0),
(245, 31, 112, 0, 1429366588, 0),
(246, 32, 112, 0, 1429366588, 0),
(247, 33, 112, 0, 1429366588, 0),
(248, 34, 112, 0, 1429366588, 0),
(249, 35, 112, 0, 1429366588, 0),
(250, 36, 112, 0, 1429366588, 0),
(251, 37, 112, 0, 1429366588, 0),
(252, 40, 112, 0, 1429366588, 0),
(253, 41, 112, 0, 1429366588, 0),
(254, 42, 112, 0, 1429366588, 0),
(255, 43, 112, 0, 1429366588, 0),
(256, 44, 112, 0, 1429366588, 0),
(257, 45, 112, 0, 1429366588, 0),
(258, 46, 112, 0, 1429366588, 0),
(259, 47, 112, 0, 1429366588, 0),
(260, 48, 112, 0, 1429366588, 0),
(261, 49, 112, 0, 1429366588, 0),
(262, 50, 112, 0, 1429366588, 0),
(263, 51, 112, 0, 1429366588, 0),
(264, 52, 112, 0, 1429366588, 0),
(265, 53, 112, 0, 1429366588, 0),
(266, 1, 113, 0, 1429366588, 0),
(267, 2, 113, 0, 1429366588, 0),
(268, 3, 113, 0, 1429366588, 0),
(269, 4, 113, 0, 1429366588, 0),
(270, 5, 113, 0, 1429366588, 0),
(271, 6, 113, 0, 1429366588, 0),
(272, 38, 113, 0, 1429366588, 0),
(273, 39, 113, 0, 1429366588, 0),
(274, 7, 113, 0, 1429366588, 0),
(275, 8, 113, 0, 1429366588, 0),
(276, 9, 113, 0, 1429366588, 0),
(277, 10, 113, 0, 1429366588, 0),
(278, 11, 113, 0, 1429366588, 0),
(279, 12, 113, 0, 1429366588, 0),
(280, 13, 113, 0, 1429366588, 0),
(281, 14, 113, 0, 1429366588, 0),
(282, 15, 113, 0, 1429366588, 0),
(283, 16, 113, 0, 1429366588, 0),
(284, 17, 113, 0, 1429366588, 0),
(285, 18, 113, 0, 1429366588, 0),
(286, 19, 113, 0, 1429366588, 0),
(287, 20, 113, 0, 1429366588, 0),
(288, 21, 113, 0, 1429366588, 0),
(289, 22, 113, 0, 1429366588, 0),
(290, 23, 113, 0, 1429366588, 0),
(291, 24, 113, 0, 1429366588, 0),
(292, 25, 113, 0, 1429366588, 0),
(293, 26, 113, 0, 1429366588, 0),
(294, 27, 113, 0, 1429366588, 0),
(295, 28, 113, 0, 1429366588, 0),
(296, 29, 113, 0, 1429366588, 0),
(297, 30, 113, 0, 1429366588, 0),
(298, 31, 113, 0, 1429366588, 0),
(299, 32, 113, 0, 1429366588, 0),
(300, 33, 113, 0, 1429366588, 0),
(301, 34, 113, 0, 1429366588, 0),
(302, 35, 113, 0, 1429366588, 0),
(303, 36, 113, 0, 1429366588, 0),
(304, 37, 113, 0, 1429366588, 0),
(305, 40, 113, 0, 1429366588, 0),
(306, 41, 113, 0, 1429366588, 0),
(307, 42, 113, 0, 1429366588, 0),
(308, 43, 113, 0, 1429366588, 0),
(309, 44, 113, 0, 1429366588, 0),
(310, 45, 113, 0, 1429366588, 0),
(311, 46, 113, 0, 1429366588, 0),
(312, 47, 113, 0, 1429366588, 0),
(313, 48, 113, 0, 1429366588, 0),
(314, 49, 113, 0, 1429366588, 0),
(315, 50, 113, 0, 1429366588, 0),
(316, 51, 113, 0, 1429366588, 0),
(317, 52, 113, 0, 1429366588, 0),
(318, 53, 113, 0, 1429366588, 0),
(319, 1, 114, 0, 1429366588, 0),
(320, 2, 114, 0, 1429366588, 0),
(321, 3, 114, 0, 1429366588, 0),
(322, 4, 114, 0, 1429366588, 0),
(323, 5, 114, 0, 1429366588, 0),
(324, 6, 114, 0, 1429366588, 0),
(325, 38, 114, 0, 1429366588, 0),
(326, 39, 114, 0, 1429366588, 0),
(327, 7, 114, 0, 1429366588, 0),
(328, 8, 114, 0, 1429366588, 0),
(329, 9, 114, 0, 1429366588, 0),
(330, 10, 114, 0, 1429366588, 0),
(331, 11, 114, 0, 1429366588, 0),
(332, 12, 114, 0, 1429366588, 0),
(333, 13, 114, 0, 1429366588, 0),
(334, 14, 114, 0, 1429366588, 0),
(335, 15, 114, 0, 1429366588, 0),
(336, 16, 114, 0, 1429366588, 0),
(337, 17, 114, 0, 1429366588, 0),
(338, 18, 114, 0, 1429366588, 0),
(339, 19, 114, 0, 1429366588, 0),
(340, 20, 114, 0, 1429366588, 0),
(341, 21, 114, 0, 1429366588, 0),
(342, 22, 114, 0, 1429366588, 0),
(343, 23, 114, 0, 1429366588, 0),
(344, 24, 114, 0, 1429366588, 0),
(345, 25, 114, 0, 1429366588, 0),
(346, 26, 114, 0, 1429366588, 0),
(347, 27, 114, 0, 1429366588, 0),
(348, 28, 114, 0, 1429366588, 0),
(349, 29, 114, 0, 1429366588, 0),
(350, 30, 114, 0, 1429366588, 0),
(351, 31, 114, 0, 1429366588, 0),
(352, 32, 114, 0, 1429366588, 0),
(353, 33, 114, 0, 1429366588, 0),
(354, 34, 114, 0, 1429366588, 0),
(355, 35, 114, 0, 1429366588, 0),
(356, 36, 114, 0, 1429366588, 0),
(357, 37, 114, 0, 1429366588, 0),
(358, 40, 114, 0, 1429366588, 0),
(359, 41, 114, 0, 1429366588, 0),
(360, 42, 114, 0, 1429366588, 0),
(361, 43, 114, 0, 1429366588, 0),
(362, 44, 114, 0, 1429366588, 0),
(363, 45, 114, 0, 1429366588, 0),
(364, 46, 114, 0, 1429366588, 0),
(365, 47, 114, 0, 1429366588, 0),
(366, 48, 114, 0, 1429366588, 0),
(367, 49, 114, 0, 1429366588, 0),
(368, 50, 114, 0, 1429366588, 0),
(369, 51, 114, 0, 1429366588, 0),
(370, 52, 114, 0, 1429366588, 0),
(371, 53, 114, 0, 1429366588, 0),
(372, 1, 116, 0, 1429366588, 0),
(373, 2, 116, 0, 1429366588, 0),
(374, 3, 116, 0, 1429366588, 0),
(375, 4, 116, 0, 1429366588, 0),
(376, 5, 116, 0, 1429366588, 0),
(377, 6, 116, 0, 1429366588, 0),
(378, 38, 116, 0, 1429366588, 0),
(379, 39, 116, 0, 1429366588, 0),
(380, 7, 116, 0, 1429366588, 0),
(381, 8, 116, 0, 1429366588, 0),
(382, 9, 116, 0, 1429366588, 0),
(383, 10, 116, 0, 1429366588, 0),
(384, 11, 116, 0, 1429366588, 0),
(385, 12, 116, 0, 1429366588, 0),
(386, 13, 116, 0, 1429366588, 0),
(387, 14, 116, 0, 1429366588, 0),
(388, 15, 116, 0, 1429366588, 0),
(389, 16, 116, 0, 1429366588, 0),
(390, 17, 116, 0, 1429366588, 0),
(391, 18, 116, 0, 1429366588, 0),
(392, 19, 116, 0, 1429366588, 0),
(393, 20, 116, 0, 1429366588, 0),
(394, 21, 116, 0, 1429366588, 0),
(395, 22, 116, 0, 1429366588, 0),
(396, 23, 116, 0, 1429366588, 0),
(397, 24, 116, 0, 1429366588, 0),
(398, 25, 116, 0, 1429366588, 0),
(399, 26, 116, 0, 1429366588, 0),
(400, 27, 116, 0, 1429366588, 0),
(401, 28, 116, 0, 1429366588, 0),
(402, 29, 116, 0, 1429366588, 0),
(403, 30, 116, 0, 1429366588, 0),
(404, 31, 116, 0, 1429366588, 0),
(405, 32, 116, 0, 1429366588, 0),
(406, 33, 116, 0, 1429366588, 0),
(407, 34, 116, 0, 1429366588, 0),
(408, 35, 116, 0, 1429366588, 0),
(409, 36, 116, 0, 1429366588, 0),
(410, 37, 116, 0, 1429366588, 0),
(411, 40, 116, 0, 1429366588, 0),
(412, 41, 116, 0, 1429366588, 0),
(413, 42, 116, 0, 1429366588, 0),
(414, 43, 116, 0, 1429366588, 0),
(415, 44, 116, 0, 1429366588, 0),
(416, 45, 116, 0, 1429366588, 0),
(417, 46, 116, 0, 1429366588, 0),
(418, 47, 116, 0, 1429366588, 0),
(419, 48, 116, 0, 1429366588, 0),
(420, 49, 116, 0, 1429366588, 0),
(421, 50, 116, 0, 1429366588, 0),
(422, 51, 116, 0, 1429366588, 0),
(423, 52, 116, 0, 1429366588, 0),
(424, 53, 116, 0, 1429366588, 0),
(425, 1, 100, 0, 1429366588, 0),
(426, 2, 100, 0, 1429366588, 0),
(427, 3, 100, 0, 1429366588, 0),
(428, 4, 100, 0, 1429366588, 0),
(429, 5, 100, 0, 1429366588, 0),
(430, 6, 100, 0, 1429366588, 0),
(431, 38, 100, 0, 1429366588, 0),
(432, 39, 100, 0, 1429366588, 0),
(433, 7, 100, 0, 1429366588, 0),
(434, 8, 100, 0, 1429366588, 0),
(435, 9, 100, 0, 1429366588, 0),
(436, 10, 100, 0, 1429366588, 0),
(437, 11, 100, 0, 1429366588, 0),
(438, 12, 100, 0, 1429366588, 0),
(439, 13, 100, 0, 1429366588, 0),
(440, 14, 100, 0, 1429366588, 0),
(441, 15, 100, 0, 1429366588, 0),
(442, 16, 100, 0, 1429366588, 0),
(443, 17, 100, 0, 1429366588, 0),
(444, 18, 100, 0, 1429366588, 0),
(445, 19, 100, 0, 1429366588, 0),
(446, 20, 100, 0, 1429366588, 0),
(447, 21, 100, 0, 1429366588, 0),
(448, 22, 100, 0, 1429366588, 0),
(449, 23, 100, 0, 1429366588, 0),
(450, 24, 100, 0, 1429366588, 0),
(451, 25, 100, 0, 1429366588, 0),
(452, 26, 100, 0, 1429366588, 0),
(453, 27, 100, 0, 1429366588, 0),
(454, 28, 100, 0, 1429366588, 0),
(455, 29, 100, 0, 1429366588, 0),
(456, 30, 100, 0, 1429366588, 0),
(457, 31, 100, 0, 1429366588, 0),
(458, 32, 100, 0, 1429366588, 0),
(459, 33, 100, 0, 1429366588, 0),
(460, 34, 100, 0, 1429366588, 0),
(461, 35, 100, 0, 1429366588, 0),
(462, 36, 100, 0, 1429366588, 0),
(463, 37, 100, 0, 1429366588, 0),
(464, 40, 100, 0, 1429366588, 0),
(465, 41, 100, 0, 1429366588, 0),
(466, 42, 100, 0, 1429366588, 0),
(467, 43, 100, 0, 1429366588, 0),
(468, 44, 100, 0, 1429366588, 0),
(469, 45, 100, 0, 1429366588, 0),
(470, 46, 100, 0, 1429366588, 0),
(471, 47, 100, 0, 1429366588, 0),
(472, 48, 100, 0, 1429366588, 0),
(473, 49, 100, 0, 1429366588, 0),
(474, 50, 100, 0, 1429366588, 0),
(475, 51, 100, 0, 1429366588, 0),
(476, 52, 100, 0, 1429366588, 0),
(477, 53, 100, 0, 1429366588, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_languages`
--

CREATE TABLE IF NOT EXISTS `tbl_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `file_name` varchar(128) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `is_system` int(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `added` int(11) unsigned DEFAULT NULL,
  `modified` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_languages`
--

INSERT INTO `tbl_languages` (`id`, `name`, `prefix`, `file_name`, `default`, `is_system`, `status`, `added`, `modified`) VALUES
(1, 'Indonesia', 'id', 'indonesia.jpg', 0, 0, 1, 1325742926, 1325742938),
(2, 'English', 'en', 'english.jpg', 1, 1, 1, 1325742950, 1338195874),
(3, 'Arab', 'ar', 'arab.jpg', 0, 0, 1, 1325748808, 1429351334),
(4, 'French', 'fr', '', 0, 0, 1, 1429351625, NULL);

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
(1, 1, 'admin/Users'),
(2, 1, 'admin/UserProfiles'),
(3, 1, 'admin/UserHistories'),
(4, 1, 'admin/ModulePermissions'),
(5, 1, 'admin/UserGroupPermissions'),
(6, 1, 'admin/Languages'),
(7, 1, 'admin/Settings'),
(8, 1, 'admin/ServerLogs'),
(9, 1, 'admin/Sessions'),
(10, 8, 'page/Pages'),
(11, 8, 'page/PageMenus');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_module_lists`
--

INSERT INTO `tbl_module_lists` (`id`, `parent_id`, `module_name`, `module_link`, `order`) VALUES
(1, 0, 'admin', '#', 0),
(2, 1, 'Dashboard Panel', 'dashboard/index', 0),
(3, 1, 'Users', 'user/index', 1),
(4, 1, 'User Groups', 'usergroup/index', 2),
(5, 1, 'Languages', 'language/index', 3),
(6, 1, 'Settings', 'setting/index', 4),
(7, 1, 'Server Logs', 'serverlog/index', 5),
(8, 0, 'page', '#', 1),
(9, 8, 'Pages', 'page/index', 0),
(10, 8, 'Page Menus', 'pagemenu/index', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `tbl_module_permissions`
--

INSERT INTO `tbl_module_permissions` (`id`, `module_id`, `module_name`, `module_link`, `order`) VALUES
(1, 1, 'Dashboard Panel', 'dashboard/index', 0),
(2, 1, 'Users', 'user/index', 1),
(3, 1, 'User Groups', 'usergroup/index', 2),
(4, 1, 'Languages', 'language/index', 3),
(5, 1, 'Settings', 'setting/index', 4),
(6, 1, 'Server Logs', 'serverlog/index', 5),
(7, 1, 'Add New Dashboard', 'dashboard/add', 6),
(8, 1, 'View Dashboard', 'dashboard/view', 7),
(9, 1, 'Edit Dashboard', 'dashboard/edit', 8),
(10, 1, 'Delete Dashboard', 'dashboard/delete', 9),
(11, 1, 'Change Dashboard Status', 'dashboard/change', 10),
(12, 1, 'Add User', 'user/add', 11),
(13, 1, 'View User', 'user/view', 12),
(14, 1, 'Edit User', 'user/edit', 13),
(15, 1, 'Delete User', 'user/delete', 14),
(16, 1, 'Change User Status', 'user/change', 15),
(17, 1, 'Change User Image', 'user/image', 16),
(18, 1, 'Upload User Image', 'user/upload', 17),
(19, 1, 'Add User Group', 'usergroup/add', 18),
(20, 1, 'View User Group', 'usergroup/view', 19),
(21, 1, 'Edit User Group', 'usergroup/edit', 20),
(22, 1, 'Delete User Group', 'usergroup/delete', 21),
(23, 1, 'Change User Group Status', 'usergroup/change', 22),
(24, 1, 'Add Language', 'language/add', 23),
(25, 1, 'View Language', 'language/view', 24),
(26, 1, 'Edit Language', 'language/edit', 25),
(27, 1, 'Delete Language', 'language/delete', 26),
(28, 1, 'Change Language Status', 'language/change', 27),
(29, 1, 'Add Setting', 'setting/add', 28),
(30, 1, 'View Setting', 'setting/view', 29),
(31, 1, 'Edit Setting', 'setting/edit', 30),
(32, 1, 'Delete Setting', 'setting/delete', 31),
(33, 1, 'Change Setting Status', 'setting/change', 32),
(34, 1, 'View Server Log', 'serverlog/view', 33),
(35, 1, 'Edit Server Log', 'serverlog/edit', 34),
(36, 1, 'Delete Server Log', 'serverlog/delete', 35),
(37, 1, 'Trash Server Log', 'serverlog/trash', 36),
(38, 8, 'Pages', 'page/index', 0),
(39, 8, 'Page Menus', 'pagemenu/index', 1),
(40, 8, 'Add Page', 'page/index/add', 2),
(41, 8, 'View Page', 'page/index/view', 3),
(42, 8, 'Edit Page', 'page/index/edit', 4),
(43, 8, 'Delete Page', 'page/index/delete', 5),
(44, 8, 'Change Page Status', 'page/index/change', 6),
(45, 8, 'Export Page', 'page/index/export', 7),
(46, 8, 'Print Page', 'page/index/print', 8),
(47, 8, 'Add Page Menu', 'pagemenu/index/add', 9),
(48, 8, 'View Page Menu', 'pagemenu/index/view', 10),
(49, 8, 'Edit Page Menu', 'pagemenu/index/edit', 11),
(50, 8, 'Delete Page Menu', 'pagemenu/index/delete', 12),
(51, 8, 'Change Page Menu Status', 'pagemenu/index/change', 13),
(52, 8, 'Export Page Menu', 'pagemenu/index/export', 14),
(53, 8, 'Print Page Menu', 'pagemenu/index/print', 15);

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
  KEY `menu_id` (`menu_id`,`name`,`publish_date`,`unpublish_date`,`allow_comment`,`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_qrcodes`
--

CREATE TABLE IF NOT EXISTS `tbl_qrcodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `serial` text,
  `file_name` varchar(512) DEFAULT NULL,
  `qrcode_url` varchar(512) DEFAULT NULL,
  `order` tinyint(3) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questionnaires`
--

CREATE TABLE IF NOT EXISTS `tbl_questionnaires` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `questionnaire_text` text,
  `file_name` varchar(512) DEFAULT NULL,
  `order` tinyint(3) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questionnaire_completed`
--

CREATE TABLE IF NOT EXISTS `tbl_questionnaire_completed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  `date_completed` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `part_id` (`part_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questions`
--

CREATE TABLE IF NOT EXISTS `tbl_questions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `question_text` text,
  `file_name` varchar(512) DEFAULT NULL,
  `order` tinyint(3) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_server_logs`
--

CREATE TABLE IF NOT EXISTS `tbl_server_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `http_code` int(11) unsigned NOT NULL,
  `status_code` varchar(160) DEFAULT NULL,
  `bytes_served` int(11) DEFAULT NULL,
  `total_time` varchar(160) DEFAULT NULL,
  `ip_address` int(11) DEFAULT '0',
  `referrer` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `is_mobile` int(1) DEFAULT NULL,
  `status` int(1) unsigned NOT NULL,
  `added` int(11) unsigned NOT NULL,
  `modified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=457 ;

--
-- Dumping data for table `tbl_server_logs`
--

INSERT INTO `tbl_server_logs` (`id`, `session_id`, `url`, `user_id`, `http_code`, `status_code`, `bytes_served`, `total_time`, `ip_address`, `referrer`, `user_agent`, `is_mobile`, `status`, `added`, `modified`) VALUES
(1, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.91760700 1429300980', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429300980, 0),
(2, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23361600 1429301013', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301013, 0),
(3, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.88431100 1429301018', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301018, 0),
(4, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.29334200 1429301022', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301022, 0),
(5, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.30243300 1429301062', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301062, 0),
(6, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.67548400 1429301089', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301089, 0),
(7, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23318800 1429301113', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301113, 0),
(8, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.29117900 1429301117', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301117, 0),
(9, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.89660400 1429301154', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301154, 0),
(10, '2011be787f7655f44640bf1e8242259a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76408900 1429301156', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301156, 0),
(11, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.01271300 1429301271', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301271, 0),
(12, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.61103900 1429301276', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301276, 0),
(13, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.38396500 1429301289', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301289, 0),
(14, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65379600 1429301308', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301308, 0),
(15, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.51698800 1429301309', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301309, 0),
(16, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.54693000 1429301315', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301315, 0),
(17, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.84034200 1429301331', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301331, 0),
(18, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.55545700 1429301332', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301332, 0),
(19, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.99005200 1429301332', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301333, 0),
(20, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23427800 1429301337', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301337, 0),
(21, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.24292900 1429301360', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301360, 0),
(22, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.88502300 1429301388', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301388, 0),
(23, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.75122400 1429301405', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301405, 0),
(24, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.82338800 1429301406', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301406, 0),
(25, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.39366600 1429301407', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301407, 0),
(26, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90594400 1429301411', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301411, 0),
(27, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.14977900 1429301426', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301426, 0),
(28, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.98686500 1429301434', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301435, 0),
(29, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.95234900 1429301438', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301438, 0),
(30, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.92932400 1429301454', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301454, 0),
(31, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08406800 1429301456', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301456, 0),
(32, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.59160600 1429301487', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301487, 0),
(33, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.06582100 1429301491', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301491, 0),
(34, '6e6e31a27b7bfef0b73cb49e5d8a691c', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.98727300 1429301505', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301506, 0),
(35, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.68588600 1429301687', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301687, 0),
(36, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28941500 1429301690', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301690, 0),
(37, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.25272900 1429301819', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301819, 0),
(38, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.31865600 1429301822', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301822, 0),
(39, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.25469300 1429301823', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301823, 0),
(40, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.67534800 1429301835', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301835, 0),
(41, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.71943100 1429301836', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301836, 0),
(42, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.86886200 1429301854', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301854, 0),
(43, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.36245700 1429301857', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301857, 0),
(44, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.59653200 1429301865', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301865, 0),
(45, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.50843000 1429301897', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301897, 0),
(46, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.80830700 1429301901', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301901, 0),
(47, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37159900 1429301970', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301970, 0),
(48, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.66485400 1429301972', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301972, 0),
(49, '30ee15d0042416f0abd6784aef3c4912', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08909600 1429301981', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301981, 0),
(50, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.05598500 1429301995', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301995, 0),
(51, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.14460800 1429301999', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429301999, 0),
(52, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.82940900 1429302006', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302006, 0),
(53, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90165600 1429302007', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302007, 0),
(54, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.52985100 1429302008', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302008, 0),
(55, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.67925500 1429302008', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302008, 0),
(56, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.83937000 1429302008', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302008, 0),
(57, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.54111700 1429302010', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302010, 0),
(58, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.52280200 1429302011', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302011, 0),
(59, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.88343800 1429302020', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302020, 0),
(60, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.55677600 1429302039', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302039, 0),
(61, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.70028400 1429302043', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302043, 0),
(62, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.46654600 1429302044', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302044, 0),
(63, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.31713800 1429302053', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302053, 0),
(64, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.88275700 1429302117', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302117, 0),
(65, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.58292500 1429302120', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302120, 0),
(66, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.52967300 1429302123', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302123, 0),
(67, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.33231600 1429302124', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302124, 0),
(68, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28139100 1429302129', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302129, 0),
(69, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90790600 1429302129', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302129, 0),
(70, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.04604200 1429302138', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302138, 0),
(71, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.60252700 1429302147', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302147, 0),
(72, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.32354700 1429302151', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302151, 0),
(73, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.12547900 1429302159', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302159, 0),
(74, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49084900 1429302211', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302211, 0),
(75, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.72914700 1429302212', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302212, 0),
(76, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.20166900 1429302242', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302242, 0),
(77, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.22609200 1429302286', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302286, 0),
(78, '3ca3c134c15b30be1a9d76255f72a719', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65606100 1429302288', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302288, 0),
(79, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.93426100 1429302311', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302311, 0),
(80, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81527500 1429302315', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302315, 0),
(81, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.52753300 1429302341', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302341, 0),
(82, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.52059400 1429302373', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302373, 0),
(83, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.35828800 1429302377', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302377, 0),
(84, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.86090100 1429302392', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302392, 0),
(85, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.51719000 1429302437', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302437, 0),
(86, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23056700 1429302438', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302438, 0),
(87, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.53115800 1429302442', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302442, 0),
(88, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.03312900 1429302452', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302452, 0),
(89, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.22776800 1429302458', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302458, 0),
(90, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.84965000 1429302458', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302458, 0),
(91, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49242400 1429302514', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302514, 0),
(92, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.68762200 1429302515', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302515, 0),
(93, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.09243900 1429302516', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302516, 0),
(94, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.29693400 1429302516', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302516, 0),
(95, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.61760000 1429302524', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302524, 0),
(96, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.93957300 1429302526', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302526, 0),
(97, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.07952200 1429302538', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302538, 0),
(98, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.80978500 1429302538', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302538, 0),
(99, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.39935700 1429302570', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302570, 0),
(100, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.39071100 1429302571', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302571, 0),
(101, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.96870000 1429302571', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302572, 0),
(102, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.05815800 1429302577', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302577, 0),
(103, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76902800 1429302577', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302577, 0),
(104, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76377300 1429302601', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302601, 0),
(105, '93645fbdc19fe7c2ace439115b1b5bcf', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.35042700 1429302602', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302602, 0),
(106, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.39168700 1429302625', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302625, 0),
(107, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.48671700 1429302626', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302626, 0),
(108, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.45697600 1429302628', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302628, 0),
(109, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.85672800 1429302628', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302628, 0),
(110, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.25399900 1429302642', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302642, 0),
(111, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.69216400 1429302644', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302644, 0),
(112, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81378900 1429302647', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302647, 0),
(113, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.06813800 1429302658', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302658, 0),
(114, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.94651300 1429302661', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302661, 0),
(115, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.63969300 1429302671', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302671, 0),
(116, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.31264100 1429302734', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302734, 0),
(117, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.50464000 1429302742', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302742, 0),
(118, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08361500 1429302754', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302754, 0),
(119, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.87227200 1429302764', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302764, 0),
(120, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.54787900 1429302775', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302775, 0),
(121, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.95325200 1429302780', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302780, 0),
(122, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62210300 1429302788', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302788, 0),
(123, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.94556700 1429302796', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302796, 0),
(124, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13434000 1429302805', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302805, 0),
(125, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.47060300 1429302812', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302812, 0),
(126, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.78266400 1429302824', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302824, 0),
(127, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.18124500 1429302858', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302858, 0),
(128, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.75596900 1429302872', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302872, 0),
(129, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.64125200 1429302873', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302873, 0),
(130, 'dd36d5cfa7e025a6d9626024a9d87c09', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.87715900 1429302878', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302878, 0),
(131, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81900300 1429302979', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302979, 0),
(132, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65706900 1429302980', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429302980, 0),
(133, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.67489900 1429303027', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303027, 0),
(134, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37875800 1429303028', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303028, 0),
(135, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.58396500 1429303028', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303028, 0),
(136, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.87826600 1429303028', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303028, 0),
(137, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.48276500 1429303037', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303037, 0);
INSERT INTO `tbl_server_logs` (`id`, `session_id`, `url`, `user_id`, `http_code`, `status_code`, `bytes_served`, `total_time`, `ip_address`, `referrer`, `user_agent`, `is_mobile`, `status`, `added`, `modified`) VALUES
(138, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.24089800 1429303063', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303063, 0),
(139, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.30265000 1429303064', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303064, 0),
(140, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.67411500 1429303070', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303070, 0),
(141, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.82280300 1429303077', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303077, 0),
(142, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76205800 1429303095', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303095, 0),
(143, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.07834300 1429303104', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303104, 0),
(144, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.48254200 1429303108', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303108, 0),
(145, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.32604300 1429303118', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303118, 0),
(146, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.47818100 1429303140', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303140, 0),
(147, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.20799400 1429303141', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303141, 0),
(148, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.80284200 1429303153', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303153, 0),
(149, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.60683000 1429303167', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303167, 0),
(150, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76427700 1429303171', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303171, 0),
(151, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.21260700 1429303196', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303196, 0),
(152, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.91865700 1429303196', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303196, 0),
(153, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.12281200 1429303201', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303201, 0),
(154, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.98167000 1429303201', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303202, 0),
(155, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81530300 1429303202', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303202, 0),
(156, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.09456500 1429303203', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303203, 0),
(157, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65854800 1429303212', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303212, 0),
(158, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.19909400 1429303213', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303213, 0),
(159, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.00970400 1429303229', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303229, 0),
(160, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.45404100 1429303237', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303237, 0),
(161, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.42500300 1429303250', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303250, 0),
(162, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.98085300 1429303250', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303251, 0),
(163, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13217400 1429303251', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303251, 0),
(164, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.54928900 1429303251', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303251, 0),
(165, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.92533900 1429303251', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303251, 0),
(166, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.12507400 1429303252', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303252, 0),
(167, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.20082200 1429303253', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303253, 0),
(168, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.39949900 1429303276', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303276, 0),
(169, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.97194900 1429303276', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303277, 0),
(170, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.46944000 1429303277', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303277, 0),
(171, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.74920300 1429303277', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303277, 0),
(172, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90824900 1429303277', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303277, 0),
(173, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.09210600 1429303278', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303278, 0),
(174, '764a8f45985fb5d40635d54edd23212b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.14980700 1429303279', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303279, 0),
(175, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.48778100 1429303298', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303298, 0),
(176, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.95768200 1429303298', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303298, 0),
(177, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.14436000 1429303299', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303299, 0),
(178, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62065700 1429303299', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303299, 0),
(179, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62126900 1429303326', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303326, 0),
(180, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.25136100 1429303327', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303327, 0),
(181, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.42255900 1429303430', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303430, 0),
(182, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.17562900 1429303431', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303431, 0),
(183, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.53796000 1429303444', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303444, 0),
(184, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.11923800 1429303445', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303445, 0),
(185, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23693900 1429303458', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303458, 0),
(186, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.97059500 1429303482', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303483, 0),
(187, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.56801400 1429303483', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303483, 0),
(188, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.06661000 1429303491', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303491, 0),
(189, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81928400 1429303494', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303494, 0),
(190, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.40383800 1429303507', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303507, 0),
(191, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.64765800 1429303512', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303512, 0),
(192, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.01677500 1429303519', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303519, 0),
(193, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62942500 1429303519', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303519, 0),
(194, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90676000 1429303577', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303577, 0),
(195, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.83251500 1429303578', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303578, 0),
(196, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.21995300 1429303579', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303579, 0),
(197, '0d1b96b72b28a904905d65ac1216620d', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.03010100 1429303580', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303580, 0),
(198, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.80472300 1429303637', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303637, 0),
(199, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.44084400 1429303638', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303638, 0),
(200, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.58554000 1429303650', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303650, 0),
(201, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.17840400 1429303653', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303653, 0),
(202, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.69060500 1429303677', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303677, 0),
(203, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.00810800 1429303724', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303724, 0),
(204, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.79904600 1429303736', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303736, 0),
(205, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.45176400 1429303749', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303749, 0),
(206, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.78742400 1429303750', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303750, 0),
(207, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.24654300 1429303782', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303782, 0),
(208, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.68283500 1429303796', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303796, 0),
(209, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.51649600 1429303797', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303797, 0),
(210, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.33260900 1429303799', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303799, 0),
(211, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.26077700 1429303803', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303803, 0),
(212, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.71391300 1429303803', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303803, 0),
(213, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08618800 1429303808', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303808, 0),
(214, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13563300 1429303825', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303825, 0),
(215, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.73572400 1429303825', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303825, 0),
(216, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.66305000 1429303840', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303840, 0),
(217, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.06460500 1429303841', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303841, 0),
(218, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62832800 1429303841', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303841, 0),
(219, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90772900 1429303841', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303841, 0),
(220, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.11638500 1429303842', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303842, 0),
(221, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.25957900 1429303842', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303842, 0),
(222, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.83805300 1429303861', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303861, 0),
(223, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.53191100 1429303869', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303869, 0),
(224, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23940100 1429303890', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303890, 0),
(225, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.73854600 1429303891', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303891, 0),
(226, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65911100 1429303903', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303903, 0),
(227, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.16092000 1429303907', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303907, 0),
(228, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.35726400 1429303911', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303911, 0),
(229, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13031400 1429303917', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303917, 0),
(230, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37933500 1429303920', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303920, 0),
(231, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.63055600 1429303924', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303924, 0),
(232, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.09263200 1429303933', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303933, 0),
(233, '6e2b7e53b2368d7f0ab620dddda92f22', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.91673600 1429303933', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303933, 0),
(234, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.97875300 1429303942', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303943, 0),
(235, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.77106000 1429303950', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429303950, 0),
(236, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.45546700 1429304033', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304033, 0),
(237, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.75723600 1429304034', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304034, 0),
(238, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.96246100 1429304036', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304036, 0),
(239, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.16795400 1429304037', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304037, 0),
(240, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.66320600 1429304043', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304043, 0),
(241, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62950700 1429304048', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304048, 0),
(242, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.27394300 1429304090', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304090, 0),
(243, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.03527800 1429304099', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304099, 0),
(244, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.39397000 1429304118', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304118, 0),
(245, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.75002200 1429304126', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304126, 0),
(246, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.54908500 1429304142', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304142, 0),
(247, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.47508100 1429304145', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304145, 0),
(248, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.19630600 1429304154', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304154, 0),
(249, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76000400 1429304157', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304157, 0),
(250, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13149900 1429304160', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304160, 0),
(251, '3a8982fe0b3748b48dba4cbbf0ca57af', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.11697600 1429304165', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304165, 0),
(252, 'd950083181edd1a02687861f6a428518', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13980100 1429304260', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304260, 0),
(253, 'd950083181edd1a02687861f6a428518', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.79130000 1429304260', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304260, 0),
(254, 'd950083181edd1a02687861f6a428518', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.29290600 1429304373', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304373, 0),
(255, 'd950083181edd1a02687861f6a428518', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.92467400 1429304373', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304373, 0),
(256, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.45842300 1429304646', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304646, 0),
(257, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.14870700 1429304647', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304647, 0),
(258, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.72969000 1429304647', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304647, 0),
(259, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.07339700 1429304648', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304648, 0),
(260, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.40940000 1429304648', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304648, 0),
(261, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.61729200 1429304648', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304648, 0),
(262, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81673900 1429304648', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304648, 0),
(263, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.99550800 1429304677', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304678, 0),
(264, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37976000 1429304711', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304711, 0),
(265, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.17950700 1429304712', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304712, 0),
(266, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.85208700 1429304722', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304722, 0),
(267, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76581900 1429304723', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304723, 0),
(268, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.19389900 1429304725', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304725, 0),
(269, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13884700 1429304727', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304727, 0),
(270, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.78852500 1429304732', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304732, 0),
(271, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.42531500 1429304733', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304733, 0),
(272, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.72884100 1429304733', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304733, 0),
(273, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.27091200 1429304734', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304734, 0);
INSERT INTO `tbl_server_logs` (`id`, `session_id`, `url`, `user_id`, `http_code`, `status_code`, `bytes_served`, `total_time`, `ip_address`, `referrer`, `user_agent`, `is_mobile`, `status`, `added`, `modified`) VALUES
(274, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.83341000 1429304737', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304737, 0),
(275, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.61544600 1429304749', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304749, 0),
(276, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.22624800 1429304786', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304786, 0),
(277, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90213300 1429304786', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304786, 0),
(278, '280f890cda0335e2f5762eb359840a10', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.61102000 1429304919', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304926, 0),
(279, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.80013300 1429304955', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429304955, 0),
(280, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.41070400 1429305092', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305092, 0),
(281, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.21631800 1429305093', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305093, 0),
(282, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.46248300 1429305103', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305103, 0),
(283, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.91958400 1429305103', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305103, 0),
(284, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62515000 1429305119', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305119, 0),
(285, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.33499400 1429305120', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305120, 0),
(286, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.99479600 1429305145', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305146, 0),
(287, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.58287600 1429305146', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305146, 0),
(288, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.74448100 1429305159', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305159, 0),
(289, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.10991600 1429305173', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305173, 0),
(290, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.29200200 1429305186', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305186, 0),
(291, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49562800 1429305186', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305186, 0),
(292, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08284900 1429305197', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305197, 0),
(293, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65428700 1429305206', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305206, 0),
(294, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.60501700 1429305207', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305207, 0),
(295, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.32705300 1429305221', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305221, 0),
(296, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.09919300 1429305222', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305222, 0),
(297, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.40351100 1429305222', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305222, 0),
(298, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.57206900 1429305222', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305222, 0),
(299, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.95919400 1429305235', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305235, 0),
(300, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.82864100 1429305239', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305239, 0),
(301, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.38712200 1429305244', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305244, 0),
(302, 'db547b0c2290be512bf16adfd9af5950', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81619800 1429305245', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305245, 0),
(303, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.26977900 1429305257', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305257, 0),
(304, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.86219400 1429305265', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305265, 0),
(305, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.54736500 1429305349', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305349, 0),
(306, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.54791100 1429305359', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305359, 0),
(307, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.40882900 1429305368', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305368, 0),
(308, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.71982600 1429305416', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305416, 0),
(309, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.40548200 1429305429', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305429, 0),
(310, '8bc32406a534c8d1314a34bc658c58fb', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.79038200 1429305501', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305501, 0),
(311, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.59626400 1429305574', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305574, 0),
(312, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.53853200 1429305575', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305575, 0),
(313, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.84630400 1429305575', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305575, 0),
(314, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37170300 1429305582', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305582, 0),
(315, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.43416700 1429305600', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305600, 0),
(316, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.98053000 1429305606', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305607, 0),
(317, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.82113300 1429305611', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305611, 0),
(318, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.38316100 1429305643', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305643, 0),
(319, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49623500 1429305673', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305673, 0),
(320, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.56549600 1429305674', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305674, 0),
(321, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.64198300 1429305684', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305684, 0),
(322, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.56683500 1429305690', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305690, 0),
(323, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.96182200 1429305694', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305694, 0),
(324, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.11063200 1429305701', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305701, 0),
(325, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.60463800 1429305732', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305732, 0),
(326, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.05807200 1429305736', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305736, 0),
(327, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.71609300 1429305738', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305738, 0),
(328, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.99419600 1429305743', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305744, 0),
(329, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.63256500 1429305747', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305747, 0),
(330, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.48235900 1429305755', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305755, 0),
(331, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.17058400 1429305780', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305780, 0),
(332, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.19488200 1429305785', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305785, 0),
(333, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.39089800 1429305819', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305819, 0),
(334, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.15700900 1429305822', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305822, 0),
(335, 'a1af78024ea4142fad6d80c05f8397ee', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.06583800 1429305836', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305836, 0),
(336, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.77415800 1429305887', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305887, 0),
(337, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.19829700 1429305910', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305910, 0),
(338, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.21253800 1429305911', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305911, 0),
(339, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.68317700 1429305913', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305913, 0),
(340, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.43358800 1429305916', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305916, 0),
(341, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.56812100 1429305932', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305932, 0),
(342, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.79827200 1429305941', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305941, 0),
(343, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08356100 1429305955', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305955, 0),
(344, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28648600 1429305973', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305973, 0),
(345, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23476800 1429305977', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305977, 0),
(346, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.58091900 1429305983', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305983, 0),
(347, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65190700 1429305986', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305986, 0),
(348, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.79021500 1429305988', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305988, 0),
(349, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.04420700 1429305997', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429305997, 0),
(350, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.17184100 1429306007', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306007, 0),
(351, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.53953900 1429306018', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306018, 0),
(352, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.25671400 1429306019', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306019, 0),
(353, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.47463300 1429306019', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306019, 0),
(354, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49888000 1429306038', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306038, 0),
(355, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.50180000 1429306164', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306164, 0),
(356, '7383e02c3ea7f9c2e12f08c28d876c86', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.71131800 1429306169', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306169, 0),
(357, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08080700 1429306190', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306190, 0),
(358, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.88980600 1429306192', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306192, 0),
(359, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.56328600 1429306193', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306193, 0),
(360, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.69606800 1429306213', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306213, 0),
(361, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49550600 1429306226', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306226, 0),
(362, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.05523600 1429306228', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306228, 0),
(363, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.64563000 1429306228', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306228, 0),
(364, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.87833200 1429306228', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306228, 0),
(365, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.67141700 1429306237', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306237, 0),
(366, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.43762900 1429306247', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306247, 0),
(367, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.65472100 1429306256', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306256, 0),
(368, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49429900 1429306343', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306343, 0),
(369, '0c44a7e379102d7b2f0b1c2a0480a2d9', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08403700 1429306350', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429306350, 0),
(370, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.90456400 1429348871', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429348878, 0),
(371, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.68616400 1429349080', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349080, 0),
(372, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.71689700 1429349080', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349080, 0),
(373, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.75535100 1429349132', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349132, 0),
(374, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.96496100 1429349151', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349152, 0),
(375, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.16881500 1429349153', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349153, 0),
(376, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.80092600 1429349153', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349153, 0),
(377, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.36148400 1429349164', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349164, 0),
(378, '48f232e0eb8533b36f3f4cea74381b2a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.15659400 1429349175', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349175, 0),
(379, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.47691200 1429349179', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349179, 0),
(380, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.43616100 1429349233', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349233, 0),
(381, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81093400 1429349248', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349248, 0),
(382, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28817600 1429349327', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349327, 0),
(383, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.20995000 1429349336', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349336, 0),
(384, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.18874800 1429349343', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349343, 0),
(385, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.27256300 1429349344', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349344, 0),
(386, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.99399600 1429349346', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349347, 0),
(387, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23369800 1429349350', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349350, 0),
(388, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.05951100 1429349353', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349353, 0),
(389, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23401600 1429349358', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349358, 0),
(390, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.06735500 1429349398', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349398, 0),
(391, '31e10ddc14033f6ac9dac25cde48c3ea', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.02924200 1429349399', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349399, 0),
(392, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.30356300 1429349481', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349481, 0),
(393, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.47893700 1429349490', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349490, 0),
(394, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.13153900 1429349491', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349491, 0),
(395, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28345300 1429349491', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349491, 0),
(396, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37311000 1429349507', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349507, 0),
(397, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.45858100 1429349514', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349514, 0),
(398, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.27535200 1429349517', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349517, 0),
(399, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.58909000 1429349522', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349522, 0),
(400, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.48529700 1429349533', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349533, 0),
(401, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.88622900 1429349539', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349539, 0),
(402, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.93282700 1429349557', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349557, 0),
(403, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.99800900 1429349566', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349567, 0),
(404, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.24845900 1429349570', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349570, 0),
(405, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.88997700 1429349574', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349574, 0),
(406, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.08834400 1429349585', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349585, 0),
(407, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.64420300 1429349586', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349586, 0),
(408, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.76191000 1429349600', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349600, 0),
(409, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.31600100 1429349606', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349606, 0);
INSERT INTO `tbl_server_logs` (`id`, `session_id`, `url`, `user_id`, `http_code`, `status_code`, `bytes_served`, `total_time`, `ip_address`, `referrer`, `user_agent`, `is_mobile`, `status`, `added`, `modified`) VALUES
(410, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.85141700 1429349608', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349608, 0),
(411, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37076200 1429349609', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349609, 0),
(412, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.66311900 1429349625', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349625, 0),
(413, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.74393700 1429349628', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349628, 0),
(414, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.52293300 1429349629', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349629, 0),
(415, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.72665200 1429349629', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349629, 0),
(416, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.84203000 1429349629', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349629, 0),
(417, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.37956400 1429349774', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349774, 0),
(418, '3837daf14f55b1c03f864433fe57358a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.57741800 1429349775', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349775, 0),
(419, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.25088100 1429349784', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349784, 0),
(420, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.85472900 1429349789', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349789, 0),
(421, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.15812500 1429349801', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349801, 0),
(422, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.12032600 1429349805', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349805, 0),
(423, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.68679200 1429349817', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349817, 0),
(424, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28927800 1429349851', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349851, 0),
(425, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28184900 1429349852', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349852, 0),
(426, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.89409600 1429349864', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349864, 0),
(427, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.63759600 1429349865', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349865, 0),
(428, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.94546600 1429349865', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349865, 0),
(429, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.83589800 1429349871', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349871, 0),
(430, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.83745700 1429349876', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349876, 0),
(431, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.99039600 1429349892', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349893, 0),
(432, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.30106900 1429349910', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349910, 0),
(433, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.17853400 1429349919', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349919, 0),
(434, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.63721800 1429349926', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349926, 0),
(435, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.81766700 1429349932', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349932, 0),
(436, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.59876900 1429349933', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349933, 0),
(437, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.12903400 1429349941', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349941, 0),
(438, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.06210500 1429349942', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349942, 0),
(439, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.23171800 1429349942', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349942, 0),
(440, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.85907100 1429349947', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349947, 0),
(441, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.42319800 1429349948', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349948, 0),
(442, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.82006900 1429349953', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349953, 0),
(443, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.42255300 1429349959', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349959, 0),
(444, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.00679700 1429349967', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429349967, 0),
(445, 'f64e3474ce5f6ea3b2f81ef91bdcd624', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.19800600 1429350028', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350028, 0),
(446, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.10341600 1429350089', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350089, 0),
(447, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.28820400 1429350090', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350090, 0),
(448, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.79018400 1429350099', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350099, 0),
(449, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.62027100 1429350127', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350127, 0),
(450, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.49358300 1429350128', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350128, 0),
(451, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.97383400 1429350142', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350143, 0),
(452, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.59663200 1429350143', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350143, 0),
(453, '39fdc3aa74853865d0021a18f1815948', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.43279600 1429350154', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350154, 0),
(454, '31a5fafb7631e387225a45b0eeec1c9a', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.96798400 1429350448', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429350449, 0),
(455, '675ebbb8ba24c2298a62921b5f66ce7b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.43336200 1429351979', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429351979, 0),
(456, '675ebbb8ba24c2298a62921b5f66ce7b', 'http://localhost/dentsu.digital/', NULL, 200, 'OK', NULL, '0.47174400 1429351994', 0, 'http://localhost/dentsu.digital/admin-panel/serverlog/index', '{"user_agent":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko\\/20100101 Firefox\\/15.0.1","platform":"Mac OS X","browser":"Firefox"}', 0, 1, 1429351994, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `email`, `password`, `group_id`, `last_login`, `logged_in`, `status`, `session_id`, `added`, `modified`) VALUES
(1, 'admin', 'admin@admin.com', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 1, 1429366970, 1, 1, 'a37b200608c2fa1845f84deb3ec8db93', 0, 0),
(2, 'joni', 'admin1@admin.com', '9003d1df22eb4d3820015070385194c8', 2, 1417003004, 0, 1, '', 0, 1424687676),
(3, 'qc', 'asdf@asdf.com', 'fb00378895cf135de3b135f385c0012f3823e4fb', 3, 1417001008, 0, 1, '', 0, 1424689343),
(29, 'dyarfi', 'dyarfi20@gmail.com', '647dc5d75f6ce3c6a859eb3b91fa6ccaab05b245', 116, 0, 0, 1, '', 1417065898, 0),
(7, 'gmp', 'defrian.yarfi@gmail.com', '4d60cf3ac1381a533090412a84466000437eee1f', 4, 1417003001, 0, 1, '', 0, 0),
(28, 'public', 'defrian.yarfi@gmail.com', '616eae925a4c10a70f2675d13d5c9e909f4d60c6', 100, 1417001002, 1, 1, '', 1424854403, 1424689343),
(30, 'user.gen', 'defrian.yarfi@yahoo.com', '616eae925a4c10a70f2675d13d5c9e909f4d60c6', 100, 1417001002, 1, 1, '', 1416993998, 1424689343),
(31, 'zxcvxcvzxcv', 'defrian.yarfi@gmail.comv', '19bfae76572363c2fa22ce08024fece149ac3303', 100, 0, 0, 1, '', 1424854664, 0),
(32, 'admin@admin.com', 'admin@admin.com', '23aab64707ea295a6d8fa04d77a6db67e2d57c57', 100, 0, 0, 1, '', 1425380399, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_answers`
--

CREATE TABLE IF NOT EXISTS `tbl_user_answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `user_questionnaire_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `added` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `part_id` (`part_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
(111, 'Manager', 1, 1, 1, 0, 0, 1425320008),
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
(1, 'male', 'Top Administrator of this website and portal', 'Administrator', 'Website', 'Web Programmer', 'DKI Jakarta', 'Jakarta', 'Jl. Gading Putih 1 F2 No. 4', '14240', '', '2010-09-06', '1234', '081807244697', '0', 'http://google.com', 'image/jpeg', '03.jpg', 1, 1283760138, 1428349886),
(2, 'male', 'Administrator of this Website', '', '', 'Web Designer', 'DKI Jakarta', 'Jakarta', 'Jl. Gading Putih 1 F2 No. 4', '14240', '', '2010-09-06', '1234', '081807244697', '0', '', 'image/jpeg', '78d57b4b5a0c6048b75bb0c9d91a8392.jpg', 1, 1283760138, 1424687676),
(3, 'male', 'User of this Website', '', '', 'Jakarta', '', '', 'Jl. Pulomas Barat 1 No. 31', '', '', '0000-00-00', '1234', '', '', '', 'image/jpeg', 'a8a484572c007e1e17648ae2c7ad629c.jpg', 1, 1285152397, 1424689343),
(28, 'male', 'Test', 'Public', 'Viewers', 'Web Programmer', NULL, NULL, NULL, NULL, NULL, '0000-00-00', '909090090', '909090090', NULL, NULL, NULL, NULL, 1, 1424854403, 1424689343),
(29, 'male', 'Web Programmer not a full stack', 'Defrian', 'Yarfi', 'Web Programmer', NULL, NULL, NULL, NULL, NULL, '0000-00-00', '081807244697', '081807244697', NULL, NULL, NULL, NULL, 1, 1417065898, 0),
(111, 'male', '', 'Web Developer', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', 1, 1333442128, 1333442192),
(110, 'male', '', 'Web Developer', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', 1, 1333441986, 1333442058),
(31, 'male', 'Test', 'Defrian', 'Yarfi', 'Web Programmer', NULL, NULL, NULL, NULL, NULL, '2012-02-25', '081807244697', '909090090', NULL, NULL, NULL, NULL, 1, 1424854664, 0),
(32, 'male', NULL, 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5cae9-_7___felix_boyeaux_studios_by_fixxxxx.png', 1, 1425380399, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
