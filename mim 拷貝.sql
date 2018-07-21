-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018-07-20 09:48:01
-- 伺服器版本: 5.7.14
-- PHP 版本： 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mim`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin_groups`
--

CREATE TABLE `admin_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES
(1, 'webmaster', 'Webmaster'),
(2, 'admin', 'Administrator'),
(3, 'manager', 'Manager'),
(4, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_login_attempts`
--

CREATE TABLE `admin_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_users`
--

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES
(1, '127.0.0.1', 'webmaster', '$2y$08$xggGXiJSbWzEO8onzdztce3UjAwpuCGj7Pj6okj1A5u6aCk/Nepne', NULL, NULL, NULL, NULL, NULL, NULL, 1451900190, 1532047577, 1, 'Webmaster', ''),
(2, '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, 1451900228, 1523245269, 1, '陳大文', NULL),
(3, '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, 1451900430, 1522808279, 1, '張三丰', NULL),
(4, '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, 1451900439, 1465489590, 1, '李四', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `admin_users_groups`
--

CREATE TABLE `admin_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_users_groups`
--

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- 資料表結構 `api_access`
--

CREATE TABLE `api_access` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'anonymous', 1, 1, 0, NULL, 1463388382);

-- --------------------------------------------------------

--
-- 資料表結構 `api_limits`
--

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `applicants`
--

CREATE TABLE `applicants` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `id_type` varchar(6) COLLATE utf8_bin NOT NULL,
  `id_num` varchar(20) COLLATE utf8_bin NOT NULL,
  `name_c` varchar(45) COLLATE utf8_bin NOT NULL,
  `name_e` varchar(45) COLLATE utf8_bin NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(1) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `tel` varchar(12) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `applicants`
--

INSERT INTO `applicants` (`id`, `offer_id`, `id_type`, `id_num`, `name_c`, `name_e`, `dob`, `gender`, `email`, `tel`) VALUES
(1, 1, 'BIRM', '52031200', '陳輝民', 'CHAN FAI MAN1', '2017-12-18', 'F', 'josechan@ipm.edu.mo', ''),
(9, 1, 'HKID', 'A1234563', '陳輝民', 'CHAN FAI MAN', '2018-07-05', 'M', '4654@ipm.edu.mo', '11');

-- --------------------------------------------------------

--
-- 資料表結構 `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `abbreviation` varchar(4) COLLATE utf8_bin NOT NULL,
  `name_c` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `name_e` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `remarks` text COLLATE utf8_bin,
  `last_num` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `areas`
--

INSERT INTO `areas` (`id`, `abbreviation`, `name_c`, `name_e`, `remarks`, `last_num`) VALUES
(1, 'ACP', 'ACC 一般會計', 'General account (澳門)', '<p>\r\n	Such as CPA....</p>\r\n', 14),
(2, '', NULL, NULL, NULL, 0),
(3, '', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `offers_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `candidates`
--

INSERT INTO `candidates` (`id`, `offers_id`, `applicant_id`, `student_id`, `priority`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 9, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `code` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `name_c` tinytext COLLATE utf8_bin,
  `name_e` tinytext COLLATE utf8_bin,
  `type` varchar(3) COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `assessment` text COLLATE utf8_bin NOT NULL,
  `method` text COLLATE utf8_bin NOT NULL,
  `target` tinytext COLLATE utf8_bin NOT NULL,
  `prerequisite` tinytext COLLATE utf8_bin NOT NULL,
  `instruction_language` varchar(3) COLLATE utf8_bin NOT NULL,
  `handout_language` varchar(3) COLLATE utf8_bin NOT NULL,
  `certificate` varchar(3) COLLATE utf8_bin NOT NULL,
  `hours` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tution_fee` int(11) DEFAULT NULL,
  `other_fee` int(11) DEFAULT NULL,
  `payment` varchar(3) COLLATE utf8_bin NOT NULL,
  `quota` tinyint(4) NOT NULL,
  `reference` varchar(20) COLLATE utf8_bin NOT NULL,
  `active` tinyint(1) DEFAULT '0',
  `remarks` text COLLATE utf8_bin,
  `last_num` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `courses`
--

INSERT INTO `courses` (`id`, `area_id`, `code`, `name_c`, `name_e`, `type`, `description`, `assessment`, `method`, `target`, `prerequisite`, `instruction_language`, `handout_language`, `certificate`, `hours`, `tution_fee`, `other_fee`, `payment`, `quota`, `reference`, `active`, `remarks`, `last_num`) VALUES
(1, 1, 'CPA01', '澳門註冊會計師-試前研習班', 'VADFGAFDS', 'LCT', '<p>\r\n	Accouting course for .....</p>\r\n', '', '', '', '', '', '', '', '60', 5000, 1000, 'CNT', 30, '', 1, NULL, 2),
(2, 1, '54564', 'okjoj', 'erqtqert', 'LCT', '<p>\r\n	545</p>\r\n', '', '', '', '', '', '', '', NULL, 0, 0, 'CNT', 0, '0', 1, NULL, 1),
(3, 1, '4455', 'knbjb', 'kj', '', '<p>\r\n	6564</p>\r\n', '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(4, 1, '456', '4', NULL, '', NULL, '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(5, 1, '123', '456', '44', '', NULL, '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(6, 1, 'ACP0001', '5464', '55', '', NULL, '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(7, 1, 'ACP2', '454', '5', '', NULL, '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(9, 1, 'ACP3', '45', '76uyj', '', NULL, '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(10, 1, 'ACP04', '46', NULL, '', NULL, '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(11, 1, 'ACP05', '545', NULL, 'WRK', NULL, '', '', '', '', '', '', '', NULL, 0, 0, '', 0, '0', 0, NULL, 0),
(12, 1, 'ACP06', '百萬行', 'millennium walk', 'WRK', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '0', 0, NULL, 0),
(13, 1, 'ACP07', '百萬行', 'Mellennium', 'WRK', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '0', 0, NULL, 0),
(14, 1, 'ACP08', '陳輝民', 'CHAN FAI MAN', 'LCT', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '0', 0, NULL, 0),
(15, 1, 'ACP09', '陳輝民', 'chan fai man', 'LCT', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '0', 0, NULL, 0),
(16, 1, 'ACP10', 'gfgtrtr', 'e5trtr', 'LCT', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '', 0, NULL, 0),
(17, 1, NULL, '45646', 'kjh', 'LCT', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '', 0, NULL, 0),
(18, 1, 'ACP12', '44444', '66666', 'LCT', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '', 0, NULL, 0),
(19, 1, 'ACP13', '4546', '454', 'LCT', NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, '', 0, '', 0, NULL, 0),
(20, 1, 'ACP14', '澳門註冊會計師-試前研習班', 'VADFGAFDS', 'LCT', '<p>\r\n	Accouting course for .....</p>\r\n', '', '', '', '', '', '', '', '60', 5000, 1000, 'CNT', 30, '', 1, NULL, 1);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `courses_offer`
-- (請參考以下實際畫面)
--
CREATE TABLE `courses_offer` (
`id` int(11)
,`offer_code` varchar(10)
,`course_id` int(11)
,`offer_name_c` tinytext
,`offer_name_e` tinytext
,`apply_start` date
,`apply_end` date
,`application` tinyint(1)
,`offer_start` date
,`offer_end` date
,`seats` int(11)
,`flier` tinytext
,`offer_remarks` text
,`area_id` int(11)
,`course_code` varchar(12)
,`course_name_c` tinytext
,`course_name_e` tinytext
,`type` varchar(3)
,`course_description` mediumtext
,`assessment` text
,`method` text
,`target` tinytext
,`prerequisite` tinytext
,`instruction_language` varchar(3)
,`handout_language` varchar(3)
,`certificate` varchar(3)
,`hours` varchar(45)
,`tution_fee` int(11)
,`other_fee` int(11)
,`payment` varchar(3)
,`quota` tinyint(4)
,`reference` varchar(20)
,`applicants` bigint(21)
);

-- --------------------------------------------------------

--
-- 資料表結構 `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'members', 'General User');

-- --------------------------------------------------------

--
-- 資料表結構 `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `name_c` tinytext COLLATE utf8_bin NOT NULL,
  `name_e` tinytext COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `type` varchar(3) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `holidays`
--

INSERT INTO `holidays` (`id`, `name_c`, `name_e`, `date`, `type`, `description`) VALUES
(1, '元旦', 'New Year’s Day', '2018-01-01', 'LGL', ''),
(2, '農曆正月初一', 'Lunar New Year\'s Day', '2018-02-16', 'LGL', ''),
(3, '農曆正月初二', 'The second day of the Lunar New Year', '2018-02-17', 'LGL', ''),
(4, '農曆正月初三', 'The third day of the Lunar New Year', '2018-02-18', 'LGL', ''),
(5, '耶穌受難日', 'Good Friday', '2018-03-30', 'LGL', ''),
(6, '復活節前日', 'The Day before Easter', '2018-03-31', 'LGL', ''),
(7, '清明節', 'Cheng Ming Festival', '2018-04-05', 'LGL', ''),
(8, '勞動節', 'Labor Day', '2018-05-01', 'LGL', ''),
(9, '佛誕節', 'The Buddha’s Birthday (Feast of Buddha)', '2018-05-22', 'LGL', ''),
(10, '端午節', 'Tung Ng Festival (Dragon Boat Festival)', '2018-06-18', 'LGL', ''),
(11, '中秋節翌日', 'The Day following Chong Chao (Mid-Autumn) Festival', '2018-09-25', 'LGL', ''),
(12, '中華人民共和國國慶日', 'National Day of the People’s Republic of China', '2018-10-01', 'LGL', ''),
(13, '中華人民共和國國慶日翌日', 'The Day following National Day of the People’s Republic of China', '2018-10-02', 'LGL', ''),
(14, '重陽節', 'Chong Yeung Festival (Festival of Ancestors)', '2018-10-17', 'LGL', ''),
(15, '追思節', 'All Soul’s Day', '2018-11-02', 'LGL', ''),
(16, '聖母無原罪瞻禮', 'Feast of Immaculate Conception', '2018-12-08', 'LGL', ''),
(17, '澳門特別行政區成立紀念日', 'Macao S.A.R. Establishment Day', '2018-12-20', 'LGL', ''),
(18, '冬至', 'Winter Solstice', '2018-12-22', 'LGL', ''),
(19, '聖誕節前日', 'Christmas Eve', '2018-12-24', 'LGL', ''),
(20, '聖誕節', 'Christmas Day', '2018-12-25', 'LGL', ''),
(21, '農曆除夕', 'Lunar New Year\'s Eve', '2018-02-15', 'EXM', ''),
(22, '農曆正月初四', 'The fourth day of the Lunar New Year', '2018-02-19', 'EXM', ''),
(23, '農曆正月初五', 'The fifth day of the Lunar New Year', '2018-02-25', 'EXM', ''),
(24, '復活節前日之後首個工作日', 'The first working day after the Day before Easter', '2018-04-03', 'EXM', ''),
(25, '聖母無原罪瞻禮後首個工作日', 'The first working day after Feast of Immaculate Conception', '2018-12-10', 'EXM', ''),
(26, '冬至後首個工作日', 'The first working day after Winter Solstice', '2018-12-26', 'EXM', ''),
(27, '除夕', 'New Year\'s Eve', '2018-12-31', 'EXM', '');

-- --------------------------------------------------------

--
-- 資料表結構 `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `course_id` int(11) NOT NULL,
  `name_c` tinytext COLLATE utf8_bin NOT NULL,
  `name_e` tinytext COLLATE utf8_bin NOT NULL,
  `apply_start` date NOT NULL,
  `apply_end` date NOT NULL,
  `application` tinyint(1) NOT NULL,
  `offer_start` date NOT NULL,
  `offer_end` date NOT NULL,
  `seats` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `remarks` text COLLATE utf8_bin NOT NULL,
  `flier` tinytext COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `offers`
--

INSERT INTO `offers` (`id`, `code`, `course_id`, `name_c`, `name_e`, `apply_start`, `apply_end`, `application`, `offer_start`, `offer_end`, `seats`, `credit`, `remarks`, `flier`) VALUES
(1, 'ACC001-001', 1, '澳門註冊會計師-試前研習班', '798', '2018-07-01', '2018-07-31', 0, '2018-07-01', '2018-10-31', 0, 0, '', ''),
(2, 'ABC002-003', 2, 'ooooaaa', 'dfgadfg', '2018-07-03', '2018-07-17', 0, '2018-07-25', '2018-07-03', 0, 0, '', ''),
(3, 'CPA01-002', 1, 'HGJHGJH', 'GUGG', '2018-07-03', '2018-07-18', 0, '2018-07-20', '2018-09-18', 0, 0, '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `offers_teachers`
--

CREATE TABLE `offers_teachers` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `offers_teachers`
--

INSERT INTO `offers_teachers` (`id`, `offer_id`, `teacher_id`, `priority`) VALUES
(1, 3, 2, 0),
(2, 3, 1, 0),
(8, 2, 1, 0),
(7, 2, 2, 0),
(9, 1, 2, 0),
(10, 1, 1, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `code` char(6) COLLATE utf8_bin NOT NULL,
  `type` char(6) COLLATE utf8_bin NOT NULL,
  `seats` int(11) NOT NULL,
  `location` char(6) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `rooms`
--

INSERT INTO `rooms` (`id`, `code`, `type`, `seats`, `location`, `description`) VALUES
(1, 'R101', 'CLS', 40, 'MIM', ''),
(2, 'C102', 'COM', 0, 'MIM', '');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `type` varchar(3) COLLATE utf8_bin NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `sessions`
--

INSERT INTO `sessions` (`id`, `room_id`, `reference_id`, `type`, `time_start`, `time_end`) VALUES
(45, 1, 1, 'SUB', '2018-07-31 07:00:01', '2018-07-31 08:00:01'),
(34, 1, 1, 'SUB', '2018-07-31 09:00:00', '2018-07-31 10:00:00'),
(32, 1, 1, 'SUB', '2018-08-07 09:00:00', '2018-08-07 10:00:00'),
(35, 1, 1, 'SUB', '2018-08-01 09:00:00', '2018-08-01 10:00:00'),
(36, 1, 1, 'SUB', '2018-08-08 09:00:00', '2018-08-08 10:00:00'),
(37, 1, 1, 'SUB', '2018-08-01 11:00:00', '2018-08-01 12:00:00'),
(38, 1, 1, 'SUB', '2018-08-08 11:00:00', '2018-08-08 12:00:00'),
(39, 1, 1, 'SUB', '2018-07-31 11:00:00', '2018-07-31 12:00:00'),
(40, 1, 1, 'SUB', '2018-08-07 11:00:00', '2018-08-07 12:00:00'),
(41, 1, 1, 'SUB', '2018-07-31 12:00:01', '2018-07-31 13:00:01'),
(42, 1, 1, 'SUB', '2018-08-07 12:00:01', '2018-08-07 13:00:01'),
(43, 1, 1, 'SUB', '2018-08-01 12:00:01', '2018-08-01 13:00:01'),
(44, 1, 1, 'SUB', '2018-08-08 12:00:01', '2018-08-08 13:00:01'),
(46, 1, 1, 'SUB', '2018-08-07 07:00:01', '2018-08-07 08:00:01'),
(47, 1, 1, 'SUB', '2018-07-31 06:00:01', '2018-07-31 07:00:00'),
(48, 1, 1, 'SUB', '2018-08-07 06:00:01', '2018-08-07 07:00:00'),
(49, 1, 1, 'SUB', '2018-07-31 05:00:01', '2018-07-31 06:00:00'),
(50, 1, 1, 'SUB', '2018-08-07 05:00:01', '2018-08-07 06:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `sow`
--

CREATE TABLE `sow` (
  `id` int(11) NOT NULL,
  `title` tinytext COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `sow`
--

INSERT INTO `sow` (`id`, `title`, `date`, `remarks`) VALUES
(1, '課程類別管理', '2018-04-09 00:00:00', '<p>\r\n	最高層分類，自動編號，提供中、英文名稱及備注欄位。</p>\r\n<p>\r\n	&nbsp;</p>\r\n'),
(2, '課程設計', '2018-04-09 00:00:00', '<p>\r\n	指可以開設的課程，基本課程內容及學費等不變動之課程資料內容。其他如教室，老師、報名及上課時期等，則設於課程開設的功能內。</p>\r\n'),
(3, '課程開設', '2018-04-09 00:00:00', '<p>\r\n	指具體開設供學員報名的課程，其設有報名期限，老師、教室等。。。</p>\r\n'),
(4, '公眾網上報名表', '2018-04-09 00:00:00', '<p>\r\n	根據開始的課程，供報名人士選擇並輸入報名資料。</p>\r\n<p>\r\n	1. 輸入澳門居民身份證編號後,系統自動檢測舊有之個人資料並自動填寫.</p>\r\n<p>\r\n	2. System will check the double application by the field of BIRM and Offer_id</p>\r\n<p>\r\n	&nbsp;</p>\r\n');

-- --------------------------------------------------------

--
-- 資料表結構 `sow_logs`
--

CREATE TABLE `sow_logs` (
  `id` int(11) NOT NULL,
  `sow_task_id` int(11) NOT NULL,
  `title` tinytext COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `sow_logs`
--

INSERT INTO `sow_logs` (`id`, `sow_task_id`, `title`, `date`, `remarks`) VALUES
(1, 1, '基本資料欄位及功能', '2018-04-09 00:00:00', '<div>\r\n	<div>\r\n		<div>\r\n			Field<span style="white-space:pre"> </span>Type</div>\r\n		<div>\r\n			id<span style="white-space:pre"> </span>int(11)</div>\r\n		<div>\r\n			area_id<span style="white-space:pre"> </span>int(11)</div>\r\n		<div>\r\n			code<span style="white-space:pre"> </span>varchar(12)</div>\r\n		<div>\r\n			name_c<span style="white-space:pre"> </span>tinytext</div>\r\n		<div>\r\n			name_e<span style="white-space:pre"> </span>tinytext</div>\r\n		<div>\r\n			description<span style="white-space:pre"> </span>mediumtext</div>\r\n		<div>\r\n			hours<span style="white-space:pre"> </span>varchar(45)</div>\r\n		<div>\r\n			tution_fee<span style="white-space:pre"> </span>int(11)</div>\r\n		<div>\r\n			other_fee<span style="white-space:pre"> </span>int(11)</div>\r\n		<div>\r\n			active<span style="white-space:pre"> </span>tinyint(1)</div>\r\n		<div>\r\n			remarks<span style="white-space:pre"> </span>text</div>\r\n		<div>\r\n			&nbsp;</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n'),
(2, 3, '基本資料欄位及功能', '2018-04-09 00:00:00', ''),
(3, 2, '基本資料欄位及功能', '2018-04-09 00:00:00', ''),
(4, 4, '前台報名表基本樣式', '2018-04-09 00:00:00', '<p>\r\n	報名表基本內容，不含美工。。</p>\r\n<p>\r\n	1.根據澳門民身份證及選擇之課程查找是否有重複報名. 如重複,跳過並回能已報名.&nbsp;</p>\r\n');

-- --------------------------------------------------------

--
-- 資料表結構 `sow_tasks`
--

CREATE TABLE `sow_tasks` (
  `id` int(11) NOT NULL,
  `sow_id` int(11) NOT NULL,
  `title` tinytext COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8_bin NOT NULL,
  `status` varchar(3) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `sow_tasks`
--

INSERT INTO `sow_tasks` (`id`, `sow_id`, `title`, `date`, `description`, `status`) VALUES
(1, 2, '課科設計基本功能', '2018-04-09 00:00:00', '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: nowrap; background-color: rgb(217, 235, 245);">基本資料欄及CURD</span></p>\r\n', 'REV'),
(2, 3, '課程開設基本功能', '2018-04-09 00:00:00', '<p>\r\n	基本資料欄及CURD</p>\r\n', 'REV'),
(3, 1, '課程類別基本功能', '2018-04-09 00:00:00', '<p>\r\n	基本資料欄及CURD</p>\r\n', 'REV'),
(4, 4, '公眾報名基本功能', '2018-04-09 00:00:00', '', 'INP');

-- --------------------------------------------------------

--
-- 資料表結構 `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8_bin NOT NULL,
  `name` tinytext COLLATE utf8_bin NOT NULL,
  `credit` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `schedule` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `subjects`
--

INSERT INTO `subjects` (`id`, `offer_id`, `code`, `name`, `credit`, `teacher_id`, `schedule`) VALUES
(1, 50, '', 'afadsf', 0, 0, '[{"week":"1","room_id":"1","room_num":"R101","start":"09:00","hours":"11"}]'),
(2, 1, '', '456', 4, 0, '[{"week":"1","room_id":"1","room_num":"R101","start":"09:04","hours":"4"}]');

-- --------------------------------------------------------

--
-- 資料表結構 `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `code` varchar(5) COLLATE utf8_bin NOT NULL,
  `name_c` varchar(4) COLLATE utf8_bin NOT NULL,
  `name_e` varchar(20) COLLATE utf8_bin NOT NULL,
  `nickname` varchar(20) COLLATE utf8_bin NOT NULL,
  `phone` varchar(12) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin NOT NULL,
  `professional` varchar(3) COLLATE utf8_bin NOT NULL,
  `engage` varchar(3) COLLATE utf8_bin NOT NULL,
  `remarks` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `teachers`
--

INSERT INTO `teachers` (`id`, `code`, `name_c`, `name_e`, `nickname`, `phone`, `email`, `professional`, `engage`, `remarks`) VALUES
(1, '1', '陳輝民', 'CHAN FAI MAN', 'Jose Chan', '63860836', 'josechan@ipm.edu.mo', 'ACC', 'FUL', '<p>\r\n	資訊科技，項目管理</p>\r\n'),
(2, '2', '張三豐', 'Cheong Sam Fong', '', '', '', '', 'FUL', ''),
(3, '3', '陳小文 ', '', '', '', '', '', 'FUL', ''),
(4, '4', '陳宏櫟', '', '', '', '', '', '', ''),
(5, '5', '陳宏楓', '', '', '', '', '', '', ''),
(6, '', '陳倩榆', '', '', '', '', '', '', ''),
(7, '7', '5555', '', '', '', '', '', '', ''),
(8, '8', '4564', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'member', '$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G', NULL, 'member@member.com', NULL, NULL, NULL, NULL, 1451903855, 1451905011, 1, 'Member', 'One', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user_guides`
--

CREATE TABLE `user_guides` (
  `id` int(11) NOT NULL,
  `title` tinytext COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `video_path` tinytext COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `user_guides`
--

INSERT INTO `user_guides` (`id`, `title`, `description`, `video_path`) VALUES
(1, '課程管理簡介', '<p>\r\n	包括有課程類別，課程設計及課程開設等三部分的架構簡介。&nbsp;包括有課程類別，課程設計及課程開設等三部分的架構簡介。包括有課程類別，課程設計及課程開設等三部分的架構簡介。</p>\r\n', ''),
(2, 'Project Management', '<p>\r\n	for project communicatonfor project communicaton&nbsp;for project communicaton</p>\r\n', '');

-- --------------------------------------------------------

--
-- 檢視表結構 `courses_offer`
--
DROP TABLE IF EXISTS `courses_offer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `courses_offer`  AS  select `o`.`id` AS `id`,`o`.`code` AS `offer_code`,`o`.`course_id` AS `course_id`,`o`.`name_c` AS `offer_name_c`,`o`.`name_e` AS `offer_name_e`,`o`.`apply_start` AS `apply_start`,`o`.`apply_end` AS `apply_end`,`o`.`application` AS `application`,`o`.`offer_start` AS `offer_start`,`o`.`offer_end` AS `offer_end`,`o`.`seats` AS `seats`,`o`.`flier` AS `flier`,`o`.`remarks` AS `offer_remarks`,`c`.`area_id` AS `area_id`,`c`.`code` AS `course_code`,`c`.`name_c` AS `course_name_c`,`c`.`name_e` AS `course_name_e`,`c`.`type` AS `type`,`c`.`description` AS `course_description`,`c`.`assessment` AS `assessment`,`c`.`method` AS `method`,`c`.`target` AS `target`,`c`.`prerequisite` AS `prerequisite`,`c`.`instruction_language` AS `instruction_language`,`c`.`handout_language` AS `handout_language`,`c`.`certificate` AS `certificate`,`c`.`hours` AS `hours`,`c`.`tution_fee` AS `tution_fee`,`c`.`other_fee` AS `other_fee`,`c`.`payment` AS `payment`,`c`.`quota` AS `quota`,`c`.`reference` AS `reference`,(select count(0) from `applicants` `a` where (`a`.`offer_id` = `o`.`id`)) AS `applicants` from (`offers` `o` join `courses` `c` on((`c`.`id` = `o`.`course_id`))) where ((`c`.`active` = 1) and (`o`.`apply_start` <= now()) and (`o`.`offer_end` >= now())) ;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `api_access`
--
ALTER TABLE `api_access`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `api_limits`
--
ALTER TABLE `api_limits`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- 資料表索引 `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `offers_teachers`
--
ALTER TABLE `offers_teachers`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `sow`
--
ALTER TABLE `sow`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `sow_logs`
--
ALTER TABLE `sow_logs`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `sow_tasks`
--
ALTER TABLE `sow_tasks`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_guides`
--
ALTER TABLE `user_guides`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `api_access`
--
ALTER TABLE `api_access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `api_limits`
--
ALTER TABLE `api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用資料表 AUTO_INCREMENT `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用資料表 AUTO_INCREMENT `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 使用資料表 AUTO_INCREMENT `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `offers_teachers`
--
ALTER TABLE `offers_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用資料表 AUTO_INCREMENT `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- 使用資料表 AUTO_INCREMENT `sow`
--
ALTER TABLE `sow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `sow_logs`
--
ALTER TABLE `sow_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `sow_tasks`
--
ALTER TABLE `sow_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用資料表 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `user_guides`
--
ALTER TABLE `user_guides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
