-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2017 at 10:49 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.1.4-1+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iot1`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_user`
--

CREATE TABLE `a_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `salt` int(4) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_user`
--

INSERT INTO `a_user` (`id`, `username`, `password`, `salt`, `email`, `create_time`) VALUES
(1, 'qixx', 'f45a1078feb35de77d26b3f7a52ef502', 846, 'qixx@fiberhome.com', '2017-05-14 13:40:47');

-- --------------------------------------------------------

--
-- Table structure for table `t_alarm`
--

CREATE TABLE `t_alarm` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `value` float NOT NULL,
  `count` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cancel_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_alarm`
--

INSERT INTO `t_alarm` (`id`, `uid`, `type`, `value`, `count`, `level`, `state`, `create_time`, `cancel_time`) VALUES
(1, 305419896, 1, 4660, 1, 1, 1, '2017-05-14 07:04:23', NULL),
(2, 305419896, 2, 4660, 1, 1, 1, '2017-05-14 07:08:36', NULL),
(3, 305419896, 1, 4660, 1, 2, 2, '2017-05-14 07:08:57', NULL),
(4, 305419896, 1, 4660, 1, 1, 1, '2017-05-14 07:04:23', NULL),
(5, 305419896, 1, 4660, 1, 1, 1, '2017-05-14 07:04:23', NULL),
(6, 305419896, 1, 4660, 1, 1, 1, '2017-05-14 07:04:23', NULL),
(7, 305419896, 1, 4660, 1, 1, 1, '2017-05-14 07:04:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_alarm_level`
--

CREATE TABLE `t_alarm_level` (
  `id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `content` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_alarm_level`
--

INSERT INTO `t_alarm_level` (`id`, `value`, `content`) VALUES
(1, 1, 'normal'),
(2, 2, 'important');

-- --------------------------------------------------------

--
-- Table structure for table `t_alarm_state`
--

CREATE TABLE `t_alarm_state` (
  `id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `content` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_alarm_state`
--

INSERT INTO `t_alarm_state` (`id`, `value`, `content`) VALUES
(1, 1, 'alarm'),
(3, 2, 'cancel');

-- --------------------------------------------------------

--
-- Table structure for table `t_alarm_type`
--

CREATE TABLE `t_alarm_type` (
  `id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `content` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_alarm_type`
--

INSERT INTO `t_alarm_type` (`id`, `value`, `content`) VALUES
(1, 1, 'temperature high'),
(3, 2, 'temperature low');

-- --------------------------------------------------------

--
-- Table structure for table `t_map`
--

CREATE TABLE `t_map` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `worker_id` tinyint(4) NOT NULL,
  `connect_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_node`
--

CREATE TABLE `t_node` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `ip` int(11) NOT NULL,
  `addr` varchar(30) NOT NULL,
  `gisx` float NOT NULL,
  `gisy` float NOT NULL,
  `group` tinyint(4) NOT NULL,
  `team` tinyint(4) NOT NULL,
  `operator` int(11) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_node`
--

INSERT INTO `t_node` (`id`, `uid`, `state`, `ip`, `addr`, `gisx`, `gisy`, `group`, `team`, `operator`, `remark`, `create_time`, `update_time`) VALUES
(2, 305419896, 2, -1062731775, 'Wuhan Optical valley', 114.406, 30.5119, 1, 1, 2, 'Test Node', '2017-05-14 03:59:50', NULL),
(104, 0, 1, -1062731775, 'rand in China', 119, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(105, 1, 1, -1062731775, 'rand in China', 118, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(106, 2, 1, -1062731775, 'rand in China', 118, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(107, 3, 1, -1062731775, 'rand in China', 123, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(108, 4, 1, -1062731775, 'rand in China', 111, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(109, 5, 1, -1062731775, 'rand in China', 81, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(110, 6, 1, -1062731775, 'rand in China', 100, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(111, 7, 1, -1062731775, 'rand in China', 128, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(112, 8, 1, -1062731775, 'rand in China', 100, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(113, 9, 1, -1062731775, 'rand in China', 93, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(114, 10, 1, -1062731775, 'rand in China', 110, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(115, 11, 1, -1062731775, 'rand in China', 121, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(116, 12, 1, -1062731775, 'rand in China', 95, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(117, 13, 1, -1062731775, 'rand in China', 80, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(118, 14, 1, -1062731775, 'rand in China', 118, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(119, 15, 1, -1062731775, 'rand in China', 90, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(120, 16, 1, -1062731775, 'rand in China', 120, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(121, 17, 1, -1062731775, 'rand in China', 106, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(122, 18, 1, -1062731775, 'rand in China', 129, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(123, 19, 1, -1062731775, 'rand in China', 119, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(124, 20, 1, -1062731775, 'rand in China', 83, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(125, 21, 1, -1062731775, 'rand in China', 112, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(126, 22, 1, -1062731775, 'rand in China', 90, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:14', NULL),
(127, 23, 1, -1062731775, 'rand in China', 96, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(128, 24, 1, -1062731775, 'rand in China', 83, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(129, 25, 1, -1062731775, 'rand in China', 96, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(130, 26, 1, -1062731775, 'rand in China', 101, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(131, 27, 1, -1062731775, 'rand in China', 118, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(132, 28, 1, -1062731775, 'rand in China', 114, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(133, 29, 1, -1062731775, 'rand in China', 115, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(134, 30, 1, -1062731775, 'rand in China', 84, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:15', NULL),
(135, 31, 1, -1062731775, 'rand in China', 80, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(136, 32, 1, -1062731775, 'rand in China', 129, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(137, 33, 1, -1062731775, 'rand in China', 105, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(138, 34, 1, -1062731775, 'rand in China', 105, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(139, 35, 1, -1062731775, 'rand in China', 108, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(140, 36, 1, -1062731775, 'rand in China', 78, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(141, 37, 1, -1062731775, 'rand in China', 84, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(142, 38, 1, -1062731775, 'rand in China', 78, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(143, 39, 1, -1062731775, 'rand in China', 113, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(144, 40, 1, -1062731775, 'rand in China', 102, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(145, 41, 1, -1062731775, 'rand in China', 93, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(146, 42, 1, -1062731775, 'rand in China', 89, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(147, 43, 1, -1062731775, 'rand in China', 124, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:16', NULL),
(148, 44, 1, -1062731775, 'rand in China', 112, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(149, 45, 1, -1062731775, 'rand in China', 93, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(150, 46, 1, -1062731775, 'rand in China', 79, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(151, 47, 1, -1062731775, 'rand in China', 83, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(152, 48, 1, -1062731775, 'rand in China', 101, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(153, 49, 1, -1062731775, 'rand in China', 120, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(154, 50, 1, -1062731775, 'rand in China', 123, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(155, 51, 1, -1062731775, 'rand in China', 77, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(156, 52, 1, -1062731775, 'rand in China', 103, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(157, 53, 1, -1062731775, 'rand in China', 77, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(158, 54, 1, -1062731775, 'rand in China', 100, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(159, 55, 1, -1062731775, 'rand in China', 125, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(160, 56, 1, -1062731775, 'rand in China', 113, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(161, 57, 1, -1062731775, 'rand in China', 105, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(162, 58, 1, -1062731775, 'rand in China', 106, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(163, 59, 1, -1062731775, 'rand in China', 91, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(164, 60, 1, -1062731775, 'rand in China', 79, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(165, 61, 1, -1062731775, 'rand in China', 113, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(166, 62, 1, -1062731775, 'rand in China', 87, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(167, 63, 1, -1062731775, 'rand in China', 105, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(168, 64, 1, -1062731775, 'rand in China', 109, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(169, 65, 1, -1062731775, 'rand in China', 86, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(170, 66, 1, -1062731775, 'rand in China', 88, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(171, 67, 1, -1062731775, 'rand in China', 106, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(172, 68, 1, -1062731775, 'rand in China', 101, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(173, 69, 1, -1062731775, 'rand in China', 125, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(174, 70, 1, -1062731775, 'rand in China', 126, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(175, 71, 1, -1062731775, 'rand in China', 85, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(176, 72, 1, -1062731775, 'rand in China', 123, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(177, 73, 1, -1062731775, 'rand in China', 95, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:17', NULL),
(178, 74, 1, -1062731775, 'rand in China', 108, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(179, 75, 1, -1062731775, 'rand in China', 109, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(180, 76, 1, -1062731775, 'rand in China', 110, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(181, 77, 1, -1062731775, 'rand in China', 96, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(182, 78, 1, -1062731775, 'rand in China', 115, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(183, 79, 1, -1062731775, 'rand in China', 113, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(184, 80, 1, -1062731775, 'rand in China', 118, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(185, 81, 1, -1062731775, 'rand in China', 116, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(186, 82, 1, -1062731775, 'rand in China', 85, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(187, 83, 1, -1062731775, 'rand in China', 127, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(188, 84, 1, -1062731775, 'rand in China', 126, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(189, 85, 1, -1062731775, 'rand in China', 95, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(190, 86, 1, -1062731775, 'rand in China', 103, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(191, 87, 1, -1062731775, 'rand in China', 83, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(192, 88, 1, -1062731775, 'rand in China', 107, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(193, 89, 1, -1062731775, 'rand in China', 103, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(194, 90, 1, -1062731775, 'rand in China', 129, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(195, 91, 1, -1062731775, 'rand in China', 127, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(196, 92, 1, -1062731775, 'rand in China', 107, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(197, 93, 1, -1062731775, 'rand in China', 118, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(198, 94, 1, -1062731775, 'rand in China', 78, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(199, 95, 1, -1062731775, 'rand in China', 128, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(200, 96, 1, -1062731775, 'rand in China', 92, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(201, 97, 1, -1062731775, 'rand in China', 116, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(202, 98, 1, -1062731775, 'rand in China', 98, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(203, 99, 1, -1062731775, 'rand in China', 121, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(204, 100, 1, -1062731775, 'rand in China', 121, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(205, 101, 1, -1062731775, 'rand in China', 100, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(206, 102, 1, -1062731775, 'rand in China', 113, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(207, 103, 1, -1062731775, 'rand in China', 90, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(208, 104, 1, -1062731775, 'rand in China', 101, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(209, 105, 1, -1062731775, 'rand in China', 100, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(210, 106, 1, -1062731775, 'rand in China', 109, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:18', NULL),
(211, 107, 1, -1062731775, 'rand in China', 96, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(212, 108, 1, -1062731775, 'rand in China', 94, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(213, 109, 1, -1062731775, 'rand in China', 82, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(214, 110, 1, -1062731775, 'rand in China', 96, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(215, 111, 1, -1062731775, 'rand in China', 111, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(216, 112, 1, -1062731775, 'rand in China', 129, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(217, 113, 1, -1062731775, 'rand in China', 112, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(218, 114, 1, -1062731775, 'rand in China', 103, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(219, 115, 1, -1062731775, 'rand in China', 125, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(220, 116, 1, -1062731775, 'rand in China', 102, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(221, 117, 1, -1062731775, 'rand in China', 106, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(222, 118, 1, -1062731775, 'rand in China', 119, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(223, 119, 1, -1062731775, 'rand in China', 88, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(224, 120, 1, -1062731775, 'rand in China', 95, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(225, 121, 1, -1062731775, 'rand in China', 81, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(226, 122, 1, -1062731775, 'rand in China', 128, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(227, 123, 1, -1062731775, 'rand in China', 129, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(228, 124, 1, -1062731775, 'rand in China', 126, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(229, 125, 1, -1062731775, 'rand in China', 91, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(230, 126, 1, -1062731775, 'rand in China', 80, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(231, 127, 1, -1062731775, 'rand in China', 99, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(232, 128, 1, -1062731775, 'rand in China', 83, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(233, 129, 1, -1062731775, 'rand in China', 99, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(234, 130, 1, -1062731775, 'rand in China', 123, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(235, 131, 1, -1062731775, 'rand in China', 80, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(236, 132, 1, -1062731775, 'rand in China', 94, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(237, 133, 1, -1062731775, 'rand in China', 93, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(238, 134, 1, -1062731775, 'rand in China', 127, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(239, 135, 1, -1062731775, 'rand in China', 129, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(240, 136, 1, -1062731775, 'rand in China', 122, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(241, 137, 1, -1062731775, 'rand in China', 97, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(242, 138, 1, -1062731775, 'rand in China', 98, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(243, 139, 1, -1062731775, 'rand in China', 80, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:19', NULL),
(244, 140, 1, -1062731775, 'rand in China', 113, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(245, 141, 1, -1062731775, 'rand in China', 91, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(246, 142, 1, -1062731775, 'rand in China', 109, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(247, 143, 1, -1062731775, 'rand in China', 121, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(248, 144, 1, -1062731775, 'rand in China', 104, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(249, 145, 1, -1062731775, 'rand in China', 128, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(250, 146, 1, -1062731775, 'rand in China', 107, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(251, 147, 1, -1062731775, 'rand in China', 85, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(252, 148, 1, -1062731775, 'rand in China', 124, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(253, 149, 1, -1062731775, 'rand in China', 84, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(254, 150, 1, -1062731775, 'rand in China', 121, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(255, 151, 1, -1062731775, 'rand in China', 91, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(256, 152, 1, -1062731775, 'rand in China', 109, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(257, 153, 1, -1062731775, 'rand in China', 114, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(258, 154, 1, -1062731775, 'rand in China', 77, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(259, 155, 1, -1062731775, 'rand in China', 112, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(260, 156, 1, -1062731775, 'rand in China', 116, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(261, 157, 1, -1062731775, 'rand in China', 93, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(262, 158, 1, -1062731775, 'rand in China', 82, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(263, 159, 1, -1062731775, 'rand in China', 83, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(264, 160, 1, -1062731775, 'rand in China', 82, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(265, 161, 1, -1062731775, 'rand in China', 77, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(266, 162, 1, -1062731775, 'rand in China', 109, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(267, 163, 1, -1062731775, 'rand in China', 100, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(268, 164, 1, -1062731775, 'rand in China', 119, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(269, 165, 1, -1062731775, 'rand in China', 92, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(270, 166, 1, -1062731775, 'rand in China', 107, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(271, 167, 1, -1062731775, 'rand in China', 120, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(272, 168, 1, -1062731775, 'rand in China', 122, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:20', NULL),
(273, 169, 1, -1062731775, 'rand in China', 99, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(274, 170, 1, -1062731775, 'rand in China', 106, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(275, 171, 1, -1062731775, 'rand in China', 123, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(276, 172, 1, -1062731775, 'rand in China', 92, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(277, 173, 1, -1062731775, 'rand in China', 87, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(278, 174, 1, -1062731775, 'rand in China', 96, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(279, 175, 1, -1062731775, 'rand in China', 85, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(280, 176, 1, -1062731775, 'rand in China', 91, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(281, 177, 1, -1062731775, 'rand in China', 91, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(282, 178, 1, -1062731775, 'rand in China', 111, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(283, 179, 1, -1062731775, 'rand in China', 96, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(284, 180, 1, -1062731775, 'rand in China', 104, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(285, 181, 1, -1062731775, 'rand in China', 120, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(286, 182, 1, -1062731775, 'rand in China', 118, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(287, 183, 1, -1062731775, 'rand in China', 115, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(288, 184, 1, -1062731775, 'rand in China', 115, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(289, 185, 1, -1062731775, 'rand in China', 82, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(290, 186, 1, -1062731775, 'rand in China', 102, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(291, 187, 1, -1062731775, 'rand in China', 81, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(292, 188, 1, -1062731775, 'rand in China', 122, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(293, 189, 1, -1062731775, 'rand in China', 78, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(294, 190, 1, -1062731775, 'rand in China', 96, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(295, 191, 1, -1062731775, 'rand in China', 81, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(296, 192, 1, -1062731775, 'rand in China', 127, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(297, 193, 1, -1062731775, 'rand in China', 97, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(298, 194, 1, -1062731775, 'rand in China', 86, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(299, 195, 1, -1062731775, 'rand in China', 129, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(300, 196, 1, -1062731775, 'rand in China', 107, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(301, 197, 1, -1062731775, 'rand in China', 106, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:21', NULL),
(302, 198, 1, -1062731775, 'rand in China', 97, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(303, 199, 1, -1062731775, 'rand in China', 92, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(304, 200, 1, -1062731775, 'rand in China', 128, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(305, 201, 1, -1062731775, 'rand in China', 105, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(306, 202, 1, -1062731775, 'rand in China', 77, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(307, 203, 1, -1062731775, 'rand in China', 109, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(308, 204, 1, -1062731775, 'rand in China', 105, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(309, 205, 1, -1062731775, 'rand in China', 104, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(310, 206, 1, -1062731775, 'rand in China', 125, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(311, 207, 1, -1062731775, 'rand in China', 111, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(312, 208, 1, -1062731775, 'rand in China', 97, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(313, 209, 1, -1062731775, 'rand in China', 104, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(314, 210, 1, -1062731775, 'rand in China', 77, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(315, 211, 1, -1062731775, 'rand in China', 114, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(316, 212, 1, -1062731775, 'rand in China', 121, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(317, 213, 1, -1062731775, 'rand in China', 90, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(318, 214, 1, -1062731775, 'rand in China', 126, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(319, 215, 1, -1062731775, 'rand in China', 104, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(320, 216, 1, -1062731775, 'rand in China', 126, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(321, 217, 1, -1062731775, 'rand in China', 89, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(322, 218, 1, -1062731775, 'rand in China', 85, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(323, 219, 1, -1062731775, 'rand in China', 85, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(324, 220, 1, -1062731775, 'rand in China', 99, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(325, 221, 1, -1062731775, 'rand in China', 88, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(326, 222, 1, -1062731775, 'rand in China', 109, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(327, 223, 1, -1062731775, 'rand in China', 111, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(328, 224, 1, -1062731775, 'rand in China', 100, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(329, 225, 1, -1062731775, 'rand in China', 88, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(330, 226, 1, -1062731775, 'rand in China', 108, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:22', NULL),
(331, 227, 1, -1062731775, 'rand in China', 107, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(332, 228, 1, -1062731775, 'rand in China', 107, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(333, 229, 1, -1062731775, 'rand in China', 108, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(334, 230, 1, -1062731775, 'rand in China', 90, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(335, 231, 1, -1062731775, 'rand in China', 122, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(336, 232, 1, -1062731775, 'rand in China', 107, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(337, 233, 1, -1062731775, 'rand in China', 90, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(338, 234, 1, -1062731775, 'rand in China', 96, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(339, 235, 1, -1062731775, 'rand in China', 120, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(340, 236, 1, -1062731775, 'rand in China', 111, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(341, 237, 1, -1062731775, 'rand in China', 128, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(342, 238, 1, -1062731775, 'rand in China', 111, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(343, 239, 1, -1062731775, 'rand in China', 77, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(344, 240, 1, -1062731775, 'rand in China', 129, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(345, 241, 1, -1062731775, 'rand in China', 112, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(346, 242, 1, -1062731775, 'rand in China', 107, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(347, 243, 1, -1062731775, 'rand in China', 114, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(348, 244, 1, -1062731775, 'rand in China', 98, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(349, 245, 1, -1062731775, 'rand in China', 105, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(350, 246, 1, -1062731775, 'rand in China', 84, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(351, 247, 1, -1062731775, 'rand in China', 115, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(352, 248, 1, -1062731775, 'rand in China', 96, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(353, 249, 1, -1062731775, 'rand in China', 110, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(354, 250, 1, -1062731775, 'rand in China', 99, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(355, 251, 1, -1062731775, 'rand in China', 118, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(356, 252, 1, -1062731775, 'rand in China', 100, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(357, 253, 1, -1062731775, 'rand in China', 99, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(358, 254, 1, -1062731775, 'rand in China', 92, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(359, 255, 1, -1062731775, 'rand in China', 92, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(360, 256, 1, -1062731775, 'rand in China', 103, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(361, 257, 1, -1062731775, 'rand in China', 86, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:23', NULL),
(362, 258, 1, -1062731775, 'rand in China', 88, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(363, 259, 1, -1062731775, 'rand in China', 117, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(364, 260, 1, -1062731775, 'rand in China', 83, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(365, 261, 1, -1062731775, 'rand in China', 117, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(366, 262, 1, -1062731775, 'rand in China', 91, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(367, 263, 1, -1062731775, 'rand in China', 96, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(368, 264, 1, -1062731775, 'rand in China', 124, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(369, 265, 1, -1062731775, 'rand in China', 118, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(370, 266, 1, -1062731775, 'rand in China', 79, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(371, 267, 1, -1062731775, 'rand in China', 112, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(372, 268, 1, -1062731775, 'rand in China', 82, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(373, 269, 1, -1062731775, 'rand in China', 94, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(374, 270, 1, -1062731775, 'rand in China', 77, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(375, 271, 1, -1062731775, 'rand in China', 99, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(376, 272, 1, -1062731775, 'rand in China', 96, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(377, 273, 1, -1062731775, 'rand in China', 103, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(378, 274, 1, -1062731775, 'rand in China', 90, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(379, 275, 1, -1062731775, 'rand in China', 117, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(380, 276, 1, -1062731775, 'rand in China', 127, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(381, 277, 1, -1062731775, 'rand in China', 115, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(382, 278, 1, -1062731775, 'rand in China', 88, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(383, 279, 1, -1062731775, 'rand in China', 106, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(384, 280, 1, -1062731775, 'rand in China', 105, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(385, 281, 1, -1062731775, 'rand in China', 127, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:24', NULL),
(386, 282, 1, -1062731775, 'rand in China', 103, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(387, 283, 1, -1062731775, 'rand in China', 112, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(388, 284, 1, -1062731775, 'rand in China', 126, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(389, 285, 1, -1062731775, 'rand in China', 89, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(390, 286, 1, -1062731775, 'rand in China', 108, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(391, 287, 1, -1062731775, 'rand in China', 123, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(392, 288, 1, -1062731775, 'rand in China', 114, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(393, 289, 1, -1062731775, 'rand in China', 106, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(394, 290, 1, -1062731775, 'rand in China', 78, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(395, 291, 1, -1062731775, 'rand in China', 106, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(396, 292, 1, -1062731775, 'rand in China', 95, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(397, 293, 1, -1062731775, 'rand in China', 100, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(398, 294, 1, -1062731775, 'rand in China', 87, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(399, 295, 1, -1062731775, 'rand in China', 122, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(400, 296, 1, -1062731775, 'rand in China', 84, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(401, 297, 1, -1062731775, 'rand in China', 98, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(402, 298, 1, -1062731775, 'rand in China', 93, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(403, 299, 1, -1062731775, 'rand in China', 94, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(404, 300, 1, -1062731775, 'rand in China', 96, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(405, 301, 1, -1062731775, 'rand in China', 90, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(406, 302, 1, -1062731775, 'rand in China', 128, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(407, 303, 1, -1062731775, 'rand in China', 126, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(408, 304, 1, -1062731775, 'rand in China', 113, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(409, 305, 1, -1062731775, 'rand in China', 89, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(410, 306, 1, -1062731775, 'rand in China', 110, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(411, 307, 1, -1062731775, 'rand in China', 107, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(412, 308, 1, -1062731775, 'rand in China', 103, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(413, 309, 1, -1062731775, 'rand in China', 114, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:25', NULL),
(414, 310, 1, -1062731775, 'rand in China', 90, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(415, 311, 1, -1062731775, 'rand in China', 106, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(416, 312, 1, -1062731775, 'rand in China', 97, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(417, 313, 1, -1062731775, 'rand in China', 123, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(418, 314, 1, -1062731775, 'rand in China', 104, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(419, 315, 1, -1062731775, 'rand in China', 99, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(420, 316, 1, -1062731775, 'rand in China', 98, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(421, 317, 1, -1062731775, 'rand in China', 119, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(422, 318, 1, -1062731775, 'rand in China', 128, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(423, 319, 1, -1062731775, 'rand in China', 117, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(424, 320, 1, -1062731775, 'rand in China', 91, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(425, 321, 1, -1062731775, 'rand in China', 80, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(426, 322, 1, -1062731775, 'rand in China', 127, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(427, 323, 1, -1062731775, 'rand in China', 109, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(428, 324, 1, -1062731775, 'rand in China', 124, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(429, 325, 1, -1062731775, 'rand in China', 92, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(430, 326, 1, -1062731775, 'rand in China', 128, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(431, 327, 1, -1062731775, 'rand in China', 85, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(432, 328, 1, -1062731775, 'rand in China', 88, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(433, 329, 1, -1062731775, 'rand in China', 125, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(434, 330, 1, -1062731775, 'rand in China', 92, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(435, 331, 1, -1062731775, 'rand in China', 115, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(436, 332, 1, -1062731775, 'rand in China', 92, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(437, 333, 1, -1062731775, 'rand in China', 124, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(438, 334, 1, -1062731775, 'rand in China', 99, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(439, 335, 1, -1062731775, 'rand in China', 85, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(440, 336, 1, -1062731775, 'rand in China', 116, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(441, 337, 1, -1062731775, 'rand in China', 109, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(442, 338, 1, -1062731775, 'rand in China', 127, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(443, 339, 1, -1062731775, 'rand in China', 92, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(444, 340, 1, -1062731775, 'rand in China', 93, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(445, 341, 1, -1062731775, 'rand in China', 103, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(446, 342, 1, -1062731775, 'rand in China', 103, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(447, 343, 1, -1062731775, 'rand in China', 126, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(448, 344, 1, -1062731775, 'rand in China', 100, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(449, 345, 1, -1062731775, 'rand in China', 100, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(450, 346, 1, -1062731775, 'rand in China', 101, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:26', NULL),
(451, 347, 1, -1062731775, 'rand in China', 77, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(452, 348, 1, -1062731775, 'rand in China', 79, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(453, 349, 1, -1062731775, 'rand in China', 101, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(454, 350, 1, -1062731775, 'rand in China', 121, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(455, 351, 1, -1062731775, 'rand in China', 90, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(456, 352, 1, -1062731775, 'rand in China', 127, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(457, 353, 1, -1062731775, 'rand in China', 77, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(458, 354, 1, -1062731775, 'rand in China', 114, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(459, 355, 1, -1062731775, 'rand in China', 79, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(460, 356, 1, -1062731775, 'rand in China', 93, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(461, 357, 1, -1062731775, 'rand in China', 127, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(462, 358, 1, -1062731775, 'rand in China', 77, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(463, 359, 1, -1062731775, 'rand in China', 80, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(464, 360, 1, -1062731775, 'rand in China', 96, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(465, 361, 1, -1062731775, 'rand in China', 91, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(466, 362, 1, -1062731775, 'rand in China', 124, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(467, 363, 1, -1062731775, 'rand in China', 80, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(468, 364, 1, -1062731775, 'rand in China', 102, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(469, 365, 1, -1062731775, 'rand in China', 99, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(470, 366, 1, -1062731775, 'rand in China', 115, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(471, 367, 1, -1062731775, 'rand in China', 96, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(472, 368, 1, -1062731775, 'rand in China', 100, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(473, 369, 1, -1062731775, 'rand in China', 124, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(474, 370, 1, -1062731775, 'rand in China', 129, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(475, 371, 1, -1062731775, 'rand in China', 88, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(476, 372, 1, -1062731775, 'rand in China', 127, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(477, 373, 1, -1062731775, 'rand in China', 103, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(478, 374, 1, -1062731775, 'rand in China', 93, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(479, 375, 1, -1062731775, 'rand in China', 90, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(480, 376, 1, -1062731775, 'rand in China', 99, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(481, 377, 1, -1062731775, 'rand in China', 106, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(482, 378, 1, -1062731775, 'rand in China', 86, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(483, 379, 1, -1062731775, 'rand in China', 100, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:27', NULL),
(484, 380, 1, -1062731775, 'rand in China', 93, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(485, 381, 1, -1062731775, 'rand in China', 109, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(486, 382, 1, -1062731775, 'rand in China', 122, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(487, 383, 1, -1062731775, 'rand in China', 122, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(488, 384, 1, -1062731775, 'rand in China', 114, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(489, 385, 1, -1062731775, 'rand in China', 92, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(490, 386, 1, -1062731775, 'rand in China', 129, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(491, 387, 1, -1062731775, 'rand in China', 123, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(492, 388, 1, -1062731775, 'rand in China', 91, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(493, 389, 1, -1062731775, 'rand in China', 103, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(494, 390, 1, -1062731775, 'rand in China', 124, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(495, 391, 1, -1062731775, 'rand in China', 77, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(496, 392, 1, -1062731775, 'rand in China', 91, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(497, 393, 1, -1062731775, 'rand in China', 108, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(498, 394, 1, -1062731775, 'rand in China', 119, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(499, 395, 1, -1062731775, 'rand in China', 114, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(500, 396, 1, -1062731775, 'rand in China', 125, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(501, 397, 1, -1062731775, 'rand in China', 115, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(502, 398, 1, -1062731775, 'rand in China', 84, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(503, 399, 1, -1062731775, 'rand in China', 128, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(504, 400, 1, -1062731775, 'rand in China', 113, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(505, 401, 1, -1062731775, 'rand in China', 86, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(506, 402, 1, -1062731775, 'rand in China', 116, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(507, 403, 1, -1062731775, 'rand in China', 78, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(508, 404, 1, -1062731775, 'rand in China', 119, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(509, 405, 1, -1062731775, 'rand in China', 89, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(510, 406, 1, -1062731775, 'rand in China', 107, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(511, 407, 1, -1062731775, 'rand in China', 79, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(512, 408, 1, -1062731775, 'rand in China', 86, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(513, 409, 1, -1062731775, 'rand in China', 87, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(514, 410, 1, -1062731775, 'rand in China', 95, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:28', NULL),
(515, 411, 1, -1062731775, 'rand in China', 117, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(516, 412, 1, -1062731775, 'rand in China', 115, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(517, 413, 1, -1062731775, 'rand in China', 114, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(518, 414, 1, -1062731775, 'rand in China', 85, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(519, 415, 1, -1062731775, 'rand in China', 83, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(520, 416, 1, -1062731775, 'rand in China', 80, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(521, 417, 1, -1062731775, 'rand in China', 101, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(522, 418, 1, -1062731775, 'rand in China', 97, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(523, 419, 1, -1062731775, 'rand in China', 103, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(524, 420, 1, -1062731775, 'rand in China', 78, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(525, 421, 1, -1062731775, 'rand in China', 128, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(526, 422, 1, -1062731775, 'rand in China', 102, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(527, 423, 1, -1062731775, 'rand in China', 116, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(528, 424, 1, -1062731775, 'rand in China', 109, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(529, 425, 1, -1062731775, 'rand in China', 109, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(530, 426, 1, -1062731775, 'rand in China', 90, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(531, 427, 1, -1062731775, 'rand in China', 95, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(532, 428, 1, -1062731775, 'rand in China', 85, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(533, 429, 1, -1062731775, 'rand in China', 125, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(534, 430, 1, -1062731775, 'rand in China', 87, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(535, 431, 1, -1062731775, 'rand in China', 126, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(536, 432, 1, -1062731775, 'rand in China', 99, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(537, 433, 1, -1062731775, 'rand in China', 108, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(538, 434, 1, -1062731775, 'rand in China', 109, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(539, 435, 1, -1062731775, 'rand in China', 82, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(540, 436, 1, -1062731775, 'rand in China', 112, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(541, 437, 1, -1062731775, 'rand in China', 83, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(542, 438, 1, -1062731775, 'rand in China', 119, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(543, 439, 1, -1062731775, 'rand in China', 94, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(544, 440, 1, -1062731775, 'rand in China', 105, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(545, 441, 1, -1062731775, 'rand in China', 116, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(546, 442, 1, -1062731775, 'rand in China', 127, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(547, 443, 1, -1062731775, 'rand in China', 108, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(548, 444, 1, -1062731775, 'rand in China', 97, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:29', NULL),
(549, 445, 1, -1062731775, 'rand in China', 108, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(550, 446, 1, -1062731775, 'rand in China', 111, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(551, 447, 1, -1062731775, 'rand in China', 96, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(552, 448, 1, -1062731775, 'rand in China', 118, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(553, 449, 1, -1062731775, 'rand in China', 79, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(554, 450, 1, -1062731775, 'rand in China', 100, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(555, 451, 1, -1062731775, 'rand in China', 95, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(556, 452, 1, -1062731775, 'rand in China', 113, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(557, 453, 1, -1062731775, 'rand in China', 124, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(558, 454, 1, -1062731775, 'rand in China', 117, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(559, 455, 1, -1062731775, 'rand in China', 89, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(560, 456, 1, -1062731775, 'rand in China', 97, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(561, 457, 1, -1062731775, 'rand in China', 123, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(562, 458, 1, -1062731775, 'rand in China', 96, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(563, 459, 1, -1062731775, 'rand in China', 80, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(564, 460, 1, -1062731775, 'rand in China', 114, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(565, 461, 1, -1062731775, 'rand in China', 106, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(566, 462, 1, -1062731775, 'rand in China', 91, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(567, 463, 1, -1062731775, 'rand in China', 108, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(568, 464, 1, -1062731775, 'rand in China', 122, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(569, 465, 1, -1062731775, 'rand in China', 126, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(570, 466, 1, -1062731775, 'rand in China', 87, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL);
INSERT INTO `t_node` (`id`, `uid`, `state`, `ip`, `addr`, `gisx`, `gisy`, `group`, `team`, `operator`, `remark`, `create_time`, `update_time`) VALUES
(571, 467, 1, -1062731775, 'rand in China', 82, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(572, 468, 1, -1062731775, 'rand in China', 120, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:30', NULL),
(573, 469, 1, -1062731775, 'rand in China', 81, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(574, 470, 1, -1062731775, 'rand in China', 119, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(575, 471, 1, -1062731775, 'rand in China', 101, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(576, 472, 1, -1062731775, 'rand in China', 127, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(577, 473, 1, -1062731775, 'rand in China', 123, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(578, 474, 1, -1062731775, 'rand in China', 103, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(579, 475, 1, -1062731775, 'rand in China', 121, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(580, 476, 1, -1062731775, 'rand in China', 99, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(581, 477, 1, -1062731775, 'rand in China', 100, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(582, 478, 1, -1062731775, 'rand in China', 121, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(583, 479, 1, -1062731775, 'rand in China', 102, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(584, 480, 1, -1062731775, 'rand in China', 92, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(585, 481, 1, -1062731775, 'rand in China', 104, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(586, 482, 1, -1062731775, 'rand in China', 104, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(587, 483, 1, -1062731775, 'rand in China', 97, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(588, 484, 1, -1062731775, 'rand in China', 121, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(589, 485, 1, -1062731775, 'rand in China', 128, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(590, 486, 1, -1062731775, 'rand in China', 114, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(591, 487, 1, -1062731775, 'rand in China', 104, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(592, 488, 1, -1062731775, 'rand in China', 97, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(593, 489, 1, -1062731775, 'rand in China', 93, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(594, 490, 1, -1062731775, 'rand in China', 104, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(595, 491, 1, -1062731775, 'rand in China', 111, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(596, 492, 1, -1062731775, 'rand in China', 125, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(597, 493, 1, -1062731775, 'rand in China', 112, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(598, 494, 1, -1062731775, 'rand in China', 111, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(599, 495, 1, -1062731775, 'rand in China', 103, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(600, 496, 1, -1062731775, 'rand in China', 82, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(601, 497, 1, -1062731775, 'rand in China', 89, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(602, 498, 1, -1062731775, 'rand in China', 113, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(603, 499, 1, -1062731775, 'rand in China', 95, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(604, 500, 1, -1062731775, 'rand in China', 129, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(605, 501, 1, -1062731775, 'rand in China', 109, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(606, 502, 1, -1062731775, 'rand in China', 119, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(607, 503, 1, -1062731775, 'rand in China', 83, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:31', NULL),
(608, 504, 1, -1062731775, 'rand in China', 94, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(609, 505, 1, -1062731775, 'rand in China', 115, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(610, 506, 1, -1062731775, 'rand in China', 107, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(611, 507, 1, -1062731775, 'rand in China', 96, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(612, 508, 1, -1062731775, 'rand in China', 104, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(613, 509, 1, -1062731775, 'rand in China', 86, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(614, 510, 1, -1062731775, 'rand in China', 112, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(615, 511, 1, -1062731775, 'rand in China', 123, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(616, 512, 1, -1062731775, 'rand in China', 101, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(617, 513, 1, -1062731775, 'rand in China', 100, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(618, 514, 1, -1062731775, 'rand in China', 95, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(619, 515, 1, -1062731775, 'rand in China', 116, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(620, 516, 1, -1062731775, 'rand in China', 120, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(621, 517, 1, -1062731775, 'rand in China', 126, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(622, 518, 1, -1062731775, 'rand in China', 121, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(623, 519, 1, -1062731775, 'rand in China', 95, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(624, 520, 1, -1062731775, 'rand in China', 102, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(625, 521, 1, -1062731775, 'rand in China', 128, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(626, 522, 1, -1062731775, 'rand in China', 96, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(627, 523, 1, -1062731775, 'rand in China', 118, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(628, 524, 1, -1062731775, 'rand in China', 96, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(629, 525, 1, -1062731775, 'rand in China', 104, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(630, 526, 1, -1062731775, 'rand in China', 121, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(631, 527, 1, -1062731775, 'rand in China', 105, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(632, 528, 1, -1062731775, 'rand in China', 95, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(633, 529, 1, -1062731775, 'rand in China', 118, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(634, 530, 1, -1062731775, 'rand in China', 91, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(635, 531, 1, -1062731775, 'rand in China', 87, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:32', NULL),
(636, 532, 1, -1062731775, 'rand in China', 89, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(637, 533, 1, -1062731775, 'rand in China', 121, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(638, 534, 1, -1062731775, 'rand in China', 106, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(639, 535, 1, -1062731775, 'rand in China', 126, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(640, 536, 1, -1062731775, 'rand in China', 81, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(641, 537, 1, -1062731775, 'rand in China', 79, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(642, 538, 1, -1062731775, 'rand in China', 84, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(643, 539, 1, -1062731775, 'rand in China', 116, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(644, 540, 1, -1062731775, 'rand in China', 79, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(645, 541, 1, -1062731775, 'rand in China', 125, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(646, 542, 1, -1062731775, 'rand in China', 78, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(647, 543, 1, -1062731775, 'rand in China', 129, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(648, 544, 1, -1062731775, 'rand in China', 94, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(649, 545, 1, -1062731775, 'rand in China', 110, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(650, 546, 1, -1062731775, 'rand in China', 82, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(651, 547, 1, -1062731775, 'rand in China', 114, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(652, 548, 1, -1062731775, 'rand in China', 128, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(653, 549, 1, -1062731775, 'rand in China', 77, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(654, 550, 1, -1062731775, 'rand in China', 104, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(655, 551, 1, -1062731775, 'rand in China', 122, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(656, 552, 1, -1062731775, 'rand in China', 91, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(657, 553, 1, -1062731775, 'rand in China', 107, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(658, 554, 1, -1062731775, 'rand in China', 83, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(659, 555, 1, -1062731775, 'rand in China', 95, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(660, 556, 1, -1062731775, 'rand in China', 108, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(661, 557, 1, -1062731775, 'rand in China', 95, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(662, 558, 1, -1062731775, 'rand in China', 108, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(663, 559, 1, -1062731775, 'rand in China', 117, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(664, 560, 1, -1062731775, 'rand in China', 82, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(665, 561, 1, -1062731775, 'rand in China', 85, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(666, 562, 1, -1062731775, 'rand in China', 129, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:33', NULL),
(667, 563, 1, -1062731775, 'rand in China', 97, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(668, 564, 1, -1062731775, 'rand in China', 83, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(669, 565, 1, -1062731775, 'rand in China', 128, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(670, 566, 1, -1062731775, 'rand in China', 88, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(671, 567, 1, -1062731775, 'rand in China', 97, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(672, 568, 1, -1062731775, 'rand in China', 92, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(673, 569, 1, -1062731775, 'rand in China', 116, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(674, 570, 1, -1062731775, 'rand in China', 106, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(675, 571, 1, -1062731775, 'rand in China', 96, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(676, 572, 1, -1062731775, 'rand in China', 127, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(677, 573, 1, -1062731775, 'rand in China', 124, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(678, 574, 1, -1062731775, 'rand in China', 127, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(679, 575, 1, -1062731775, 'rand in China', 123, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(680, 576, 1, -1062731775, 'rand in China', 106, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(681, 577, 1, -1062731775, 'rand in China', 124, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(682, 578, 1, -1062731775, 'rand in China', 98, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(683, 579, 1, -1062731775, 'rand in China', 77, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(684, 580, 1, -1062731775, 'rand in China', 91, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(685, 581, 1, -1062731775, 'rand in China', 117, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(686, 582, 1, -1062731775, 'rand in China', 97, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(687, 583, 1, -1062731775, 'rand in China', 126, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(688, 584, 1, -1062731775, 'rand in China', 83, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(689, 585, 1, -1062731775, 'rand in China', 101, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(690, 586, 1, -1062731775, 'rand in China', 126, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(691, 587, 1, -1062731775, 'rand in China', 88, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(692, 588, 1, -1062731775, 'rand in China', 93, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(693, 589, 1, -1062731775, 'rand in China', 88, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(694, 590, 1, -1062731775, 'rand in China', 116, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(695, 591, 1, -1062731775, 'rand in China', 98, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(696, 592, 1, -1062731775, 'rand in China', 79, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(697, 593, 1, -1062731775, 'rand in China', 97, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(698, 594, 1, -1062731775, 'rand in China', 99, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(699, 595, 1, -1062731775, 'rand in China', 96, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(700, 596, 1, -1062731775, 'rand in China', 120, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:34', NULL),
(701, 597, 1, -1062731775, 'rand in China', 118, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(702, 598, 1, -1062731775, 'rand in China', 117, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(703, 599, 1, -1062731775, 'rand in China', 123, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(704, 600, 1, -1062731775, 'rand in China', 99, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(705, 601, 1, -1062731775, 'rand in China', 97, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(706, 602, 1, -1062731775, 'rand in China', 93, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(707, 603, 1, -1062731775, 'rand in China', 87, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(708, 604, 1, -1062731775, 'rand in China', 112, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(709, 605, 1, -1062731775, 'rand in China', 109, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(710, 606, 1, -1062731775, 'rand in China', 125, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(711, 607, 1, -1062731775, 'rand in China', 102, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(712, 608, 1, -1062731775, 'rand in China', 122, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(713, 609, 1, -1062731775, 'rand in China', 123, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(714, 610, 1, -1062731775, 'rand in China', 116, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(715, 611, 1, -1062731775, 'rand in China', 115, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(716, 612, 1, -1062731775, 'rand in China', 93, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(717, 613, 1, -1062731775, 'rand in China', 89, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(718, 614, 1, -1062731775, 'rand in China', 116, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(719, 615, 1, -1062731775, 'rand in China', 91, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(720, 616, 1, -1062731775, 'rand in China', 98, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(721, 617, 1, -1062731775, 'rand in China', 105, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(722, 618, 1, -1062731775, 'rand in China', 97, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(723, 619, 1, -1062731775, 'rand in China', 117, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(724, 620, 1, -1062731775, 'rand in China', 123, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(725, 621, 1, -1062731775, 'rand in China', 125, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:35', NULL),
(726, 622, 1, -1062731775, 'rand in China', 109, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(727, 623, 1, -1062731775, 'rand in China', 119, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(728, 624, 1, -1062731775, 'rand in China', 77, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(729, 625, 1, -1062731775, 'rand in China', 95, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(730, 626, 1, -1062731775, 'rand in China', 86, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(731, 627, 1, -1062731775, 'rand in China', 102, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(732, 628, 1, -1062731775, 'rand in China', 107, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(733, 629, 1, -1062731775, 'rand in China', 125, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(734, 630, 1, -1062731775, 'rand in China', 126, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(735, 631, 1, -1062731775, 'rand in China', 89, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(736, 632, 1, -1062731775, 'rand in China', 125, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(737, 633, 1, -1062731775, 'rand in China', 106, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(738, 634, 1, -1062731775, 'rand in China', 119, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(739, 635, 1, -1062731775, 'rand in China', 89, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(740, 636, 1, -1062731775, 'rand in China', 87, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(741, 637, 1, -1062731775, 'rand in China', 91, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(742, 638, 1, -1062731775, 'rand in China', 111, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(743, 639, 1, -1062731775, 'rand in China', 112, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(744, 640, 1, -1062731775, 'rand in China', 116, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(745, 641, 1, -1062731775, 'rand in China', 92, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(746, 642, 1, -1062731775, 'rand in China', 109, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(747, 643, 1, -1062731775, 'rand in China', 109, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(748, 644, 1, -1062731775, 'rand in China', 87, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(749, 645, 1, -1062731775, 'rand in China', 98, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(750, 646, 1, -1062731775, 'rand in China', 92, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(751, 647, 1, -1062731775, 'rand in China', 119, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(752, 648, 1, -1062731775, 'rand in China', 100, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(753, 649, 1, -1062731775, 'rand in China', 117, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(754, 650, 1, -1062731775, 'rand in China', 111, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(755, 651, 1, -1062731775, 'rand in China', 120, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(756, 652, 1, -1062731775, 'rand in China', 94, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(757, 653, 1, -1062731775, 'rand in China', 126, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(758, 654, 1, -1062731775, 'rand in China', 106, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(759, 655, 1, -1062731775, 'rand in China', 81, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(760, 656, 1, -1062731775, 'rand in China', 101, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(761, 657, 1, -1062731775, 'rand in China', 91, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:36', NULL),
(762, 658, 1, -1062731775, 'rand in China', 92, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(763, 659, 1, -1062731775, 'rand in China', 78, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(764, 660, 1, -1062731775, 'rand in China', 105, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(765, 661, 1, -1062731775, 'rand in China', 129, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(766, 662, 1, -1062731775, 'rand in China', 118, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(767, 663, 1, -1062731775, 'rand in China', 114, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(768, 664, 1, -1062731775, 'rand in China', 116, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(769, 665, 1, -1062731775, 'rand in China', 114, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(770, 666, 1, -1062731775, 'rand in China', 101, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(771, 667, 1, -1062731775, 'rand in China', 83, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(772, 668, 1, -1062731775, 'rand in China', 78, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(773, 669, 1, -1062731775, 'rand in China', 109, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(774, 670, 1, -1062731775, 'rand in China', 111, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(775, 671, 1, -1062731775, 'rand in China', 128, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(776, 672, 1, -1062731775, 'rand in China', 113, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(777, 673, 1, -1062731775, 'rand in China', 85, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(778, 674, 1, -1062731775, 'rand in China', 92, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(779, 675, 1, -1062731775, 'rand in China', 89, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(780, 676, 1, -1062731775, 'rand in China', 88, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(781, 677, 1, -1062731775, 'rand in China', 120, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(782, 678, 1, -1062731775, 'rand in China', 127, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(783, 679, 1, -1062731775, 'rand in China', 116, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(784, 680, 1, -1062731775, 'rand in China', 115, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(785, 681, 1, -1062731775, 'rand in China', 108, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(786, 682, 1, -1062731775, 'rand in China', 102, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(787, 683, 1, -1062731775, 'rand in China', 94, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(788, 684, 1, -1062731775, 'rand in China', 106, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(789, 685, 1, -1062731775, 'rand in China', 85, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(790, 686, 1, -1062731775, 'rand in China', 110, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(791, 687, 1, -1062731775, 'rand in China', 100, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(792, 688, 1, -1062731775, 'rand in China', 106, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(793, 689, 1, -1062731775, 'rand in China', 113, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(794, 690, 1, -1062731775, 'rand in China', 107, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(795, 691, 1, -1062731775, 'rand in China', 99, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:37', NULL),
(796, 692, 1, -1062731775, 'rand in China', 123, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(797, 693, 1, -1062731775, 'rand in China', 99, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(798, 694, 1, -1062731775, 'rand in China', 95, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(799, 695, 1, -1062731775, 'rand in China', 83, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(800, 696, 1, -1062731775, 'rand in China', 104, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(801, 697, 1, -1062731775, 'rand in China', 86, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(802, 698, 1, -1062731775, 'rand in China', 98, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(803, 699, 1, -1062731775, 'rand in China', 124, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(804, 700, 1, -1062731775, 'rand in China', 109, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(805, 701, 1, -1062731775, 'rand in China', 101, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(806, 702, 1, -1062731775, 'rand in China', 107, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(807, 703, 1, -1062731775, 'rand in China', 104, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(808, 704, 1, -1062731775, 'rand in China', 98, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(809, 705, 1, -1062731775, 'rand in China', 98, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(810, 706, 1, -1062731775, 'rand in China', 123, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(811, 707, 1, -1062731775, 'rand in China', 102, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(812, 708, 1, -1062731775, 'rand in China', 121, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(813, 709, 1, -1062731775, 'rand in China', 122, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(814, 710, 1, -1062731775, 'rand in China', 77, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(815, 711, 1, -1062731775, 'rand in China', 112, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(816, 712, 1, -1062731775, 'rand in China', 125, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(817, 713, 1, -1062731775, 'rand in China', 91, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(818, 714, 1, -1062731775, 'rand in China', 115, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(819, 715, 1, -1062731775, 'rand in China', 111, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(820, 716, 1, -1062731775, 'rand in China', 92, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(821, 717, 1, -1062731775, 'rand in China', 87, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(822, 718, 1, -1062731775, 'rand in China', 105, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(823, 719, 1, -1062731775, 'rand in China', 90, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(824, 720, 1, -1062731775, 'rand in China', 110, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(825, 721, 1, -1062731775, 'rand in China', 110, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(826, 722, 1, -1062731775, 'rand in China', 116, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(827, 723, 1, -1062731775, 'rand in China', 80, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(828, 724, 1, -1062731775, 'rand in China', 93, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:38', NULL),
(829, 725, 1, -1062731775, 'rand in China', 105, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(830, 726, 1, -1062731775, 'rand in China', 97, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(831, 727, 1, -1062731775, 'rand in China', 94, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(832, 728, 1, -1062731775, 'rand in China', 90, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(833, 729, 1, -1062731775, 'rand in China', 79, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(834, 730, 1, -1062731775, 'rand in China', 104, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(835, 731, 1, -1062731775, 'rand in China', 77, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(836, 732, 1, -1062731775, 'rand in China', 85, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(837, 733, 1, -1062731775, 'rand in China', 109, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(838, 734, 1, -1062731775, 'rand in China', 107, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(839, 735, 1, -1062731775, 'rand in China', 88, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(840, 736, 1, -1062731775, 'rand in China', 106, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(841, 737, 1, -1062731775, 'rand in China', 84, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(842, 738, 1, -1062731775, 'rand in China', 107, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(843, 739, 1, -1062731775, 'rand in China', 84, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(844, 740, 1, -1062731775, 'rand in China', 112, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(845, 741, 1, -1062731775, 'rand in China', 81, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(846, 742, 1, -1062731775, 'rand in China', 109, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(847, 743, 1, -1062731775, 'rand in China', 113, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(848, 744, 1, -1062731775, 'rand in China', 118, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(849, 745, 1, -1062731775, 'rand in China', 110, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(850, 746, 1, -1062731775, 'rand in China', 77, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(851, 747, 1, -1062731775, 'rand in China', 87, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(852, 748, 1, -1062731775, 'rand in China', 109, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(853, 749, 1, -1062731775, 'rand in China', 96, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(854, 750, 1, -1062731775, 'rand in China', 113, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(855, 751, 1, -1062731775, 'rand in China', 85, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(856, 752, 1, -1062731775, 'rand in China', 83, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(857, 753, 1, -1062731775, 'rand in China', 113, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(858, 754, 1, -1062731775, 'rand in China', 109, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(859, 755, 1, -1062731775, 'rand in China', 111, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(860, 756, 1, -1062731775, 'rand in China', 77, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(861, 757, 1, -1062731775, 'rand in China', 103, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(862, 758, 1, -1062731775, 'rand in China', 83, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(863, 759, 1, -1062731775, 'rand in China', 123, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:39', NULL),
(864, 760, 1, -1062731775, 'rand in China', 118, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(865, 761, 1, -1062731775, 'rand in China', 78, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(866, 762, 1, -1062731775, 'rand in China', 81, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(867, 763, 1, -1062731775, 'rand in China', 79, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(868, 764, 1, -1062731775, 'rand in China', 114, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(869, 765, 1, -1062731775, 'rand in China', 83, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(870, 766, 1, -1062731775, 'rand in China', 93, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(871, 767, 1, -1062731775, 'rand in China', 84, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(872, 768, 1, -1062731775, 'rand in China', 109, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(873, 769, 1, -1062731775, 'rand in China', 105, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(874, 770, 1, -1062731775, 'rand in China', 129, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(875, 771, 1, -1062731775, 'rand in China', 87, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(876, 772, 1, -1062731775, 'rand in China', 110, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(877, 773, 1, -1062731775, 'rand in China', 99, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(878, 774, 1, -1062731775, 'rand in China', 83, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(879, 775, 1, -1062731775, 'rand in China', 80, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(880, 776, 1, -1062731775, 'rand in China', 77, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(881, 777, 1, -1062731775, 'rand in China', 94, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(882, 778, 1, -1062731775, 'rand in China', 125, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(883, 779, 1, -1062731775, 'rand in China', 111, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(884, 780, 1, -1062731775, 'rand in China', 79, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(885, 781, 1, -1062731775, 'rand in China', 101, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(886, 782, 1, -1062731775, 'rand in China', 101, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(887, 783, 1, -1062731775, 'rand in China', 87, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(888, 784, 1, -1062731775, 'rand in China', 101, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(889, 785, 1, -1062731775, 'rand in China', 111, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(890, 786, 1, -1062731775, 'rand in China', 105, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(891, 787, 1, -1062731775, 'rand in China', 97, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(892, 788, 1, -1062731775, 'rand in China', 104, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(893, 789, 1, -1062731775, 'rand in China', 115, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(894, 790, 1, -1062731775, 'rand in China', 106, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(895, 791, 1, -1062731775, 'rand in China', 109, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:40', NULL),
(896, 792, 1, -1062731775, 'rand in China', 95, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(897, 793, 1, -1062731775, 'rand in China', 79, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(898, 794, 1, -1062731775, 'rand in China', 88, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(899, 795, 1, -1062731775, 'rand in China', 122, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(900, 796, 1, -1062731775, 'rand in China', 81, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(901, 797, 1, -1062731775, 'rand in China', 110, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(902, 798, 1, -1062731775, 'rand in China', 124, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(903, 799, 1, -1062731775, 'rand in China', 110, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(904, 800, 1, -1062731775, 'rand in China', 117, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(905, 801, 1, -1062731775, 'rand in China', 118, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(906, 802, 1, -1062731775, 'rand in China', 122, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(907, 803, 1, -1062731775, 'rand in China', 107, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(908, 804, 1, -1062731775, 'rand in China', 103, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(909, 805, 1, -1062731775, 'rand in China', 119, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(910, 806, 1, -1062731775, 'rand in China', 120, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(911, 807, 1, -1062731775, 'rand in China', 109, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(912, 808, 1, -1062731775, 'rand in China', 93, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(913, 809, 1, -1062731775, 'rand in China', 120, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(914, 810, 1, -1062731775, 'rand in China', 111, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(915, 811, 1, -1062731775, 'rand in China', 120, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(916, 812, 1, -1062731775, 'rand in China', 78, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(917, 813, 1, -1062731775, 'rand in China', 113, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(918, 814, 1, -1062731775, 'rand in China', 117, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(919, 815, 1, -1062731775, 'rand in China', 124, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(920, 816, 1, -1062731775, 'rand in China', 83, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(921, 817, 1, -1062731775, 'rand in China', 99, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(922, 818, 1, -1062731775, 'rand in China', 100, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(923, 819, 1, -1062731775, 'rand in China', 91, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(924, 820, 1, -1062731775, 'rand in China', 97, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(925, 821, 1, -1062731775, 'rand in China', 101, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(926, 822, 1, -1062731775, 'rand in China', 82, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(927, 823, 1, -1062731775, 'rand in China', 128, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:41', NULL),
(928, 824, 1, -1062731775, 'rand in China', 112, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(929, 825, 1, -1062731775, 'rand in China', 97, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(930, 826, 1, -1062731775, 'rand in China', 80, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(931, 827, 1, -1062731775, 'rand in China', 83, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(932, 828, 1, -1062731775, 'rand in China', 127, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(933, 829, 1, -1062731775, 'rand in China', 107, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(934, 830, 1, -1062731775, 'rand in China', 95, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(935, 831, 1, -1062731775, 'rand in China', 120, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(936, 832, 1, -1062731775, 'rand in China', 114, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(937, 833, 1, -1062731775, 'rand in China', 115, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(938, 834, 1, -1062731775, 'rand in China', 90, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(939, 835, 1, -1062731775, 'rand in China', 114, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(940, 836, 1, -1062731775, 'rand in China', 104, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(941, 837, 1, -1062731775, 'rand in China', 117, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(942, 838, 1, -1062731775, 'rand in China', 103, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(943, 839, 1, -1062731775, 'rand in China', 99, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(944, 840, 1, -1062731775, 'rand in China', 87, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(945, 841, 1, -1062731775, 'rand in China', 91, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(946, 842, 1, -1062731775, 'rand in China', 128, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(947, 843, 1, -1062731775, 'rand in China', 110, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(948, 844, 1, -1062731775, 'rand in China', 129, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(949, 845, 1, -1062731775, 'rand in China', 79, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(950, 846, 1, -1062731775, 'rand in China', 80, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(951, 847, 1, -1062731775, 'rand in China', 88, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(952, 848, 1, -1062731775, 'rand in China', 79, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(953, 849, 1, -1062731775, 'rand in China', 85, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(954, 850, 1, -1062731775, 'rand in China', 121, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(955, 851, 1, -1062731775, 'rand in China', 118, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(956, 852, 1, -1062731775, 'rand in China', 105, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(957, 853, 1, -1062731775, 'rand in China', 104, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(958, 854, 1, -1062731775, 'rand in China', 87, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(959, 855, 1, -1062731775, 'rand in China', 125, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:42', NULL),
(960, 856, 1, -1062731775, 'rand in China', 121, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(961, 857, 1, -1062731775, 'rand in China', 129, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(962, 858, 1, -1062731775, 'rand in China', 89, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(963, 859, 1, -1062731775, 'rand in China', 123, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(964, 860, 1, -1062731775, 'rand in China', 77, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(965, 861, 1, -1062731775, 'rand in China', 105, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(966, 862, 1, -1062731775, 'rand in China', 123, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(967, 863, 1, -1062731775, 'rand in China', 128, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(968, 864, 1, -1062731775, 'rand in China', 110, 27, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(969, 865, 1, -1062731775, 'rand in China', 128, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(970, 866, 1, -1062731775, 'rand in China', 95, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(971, 867, 1, -1062731775, 'rand in China', 123, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(972, 868, 1, -1062731775, 'rand in China', 101, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(973, 869, 1, -1062731775, 'rand in China', 124, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(974, 870, 1, -1062731775, 'rand in China', 90, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(975, 871, 1, -1062731775, 'rand in China', 114, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(976, 872, 1, -1062731775, 'rand in China', 94, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(977, 873, 1, -1062731775, 'rand in China', 106, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(978, 874, 1, -1062731775, 'rand in China', 77, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(979, 875, 1, -1062731775, 'rand in China', 89, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(980, 876, 1, -1062731775, 'rand in China', 81, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(981, 877, 1, -1062731775, 'rand in China', 129, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(982, 878, 1, -1062731775, 'rand in China', 127, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(983, 879, 1, -1062731775, 'rand in China', 82, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(984, 880, 1, -1062731775, 'rand in China', 112, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(985, 881, 1, -1062731775, 'rand in China', 97, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(986, 882, 1, -1062731775, 'rand in China', 127, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(987, 883, 1, -1062731775, 'rand in China', 118, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(988, 884, 1, -1062731775, 'rand in China', 92, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(989, 885, 1, -1062731775, 'rand in China', 110, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(990, 886, 1, -1062731775, 'rand in China', 118, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:43', NULL),
(991, 887, 1, -1062731775, 'rand in China', 86, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(992, 888, 1, -1062731775, 'rand in China', 95, 31, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(993, 889, 1, -1062731775, 'rand in China', 82, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(994, 890, 1, -1062731775, 'rand in China', 120, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(995, 891, 1, -1062731775, 'rand in China', 128, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(996, 892, 1, -1062731775, 'rand in China', 116, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(997, 893, 1, -1062731775, 'rand in China', 87, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(998, 894, 1, -1062731775, 'rand in China', 125, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(999, 895, 1, -1062731775, 'rand in China', 90, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1000, 896, 1, -1062731775, 'rand in China', 77, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1001, 897, 1, -1062731775, 'rand in China', 101, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1002, 898, 1, -1062731775, 'rand in China', 124, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1003, 899, 1, -1062731775, 'rand in China', 123, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1004, 900, 1, -1062731775, 'rand in China', 101, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1005, 901, 1, -1062731775, 'rand in China', 82, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1006, 902, 1, -1062731775, 'rand in China', 81, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1007, 903, 1, -1062731775, 'rand in China', 86, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1008, 904, 1, -1062731775, 'rand in China', 93, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1009, 905, 1, -1062731775, 'rand in China', 88, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1010, 906, 1, -1062731775, 'rand in China', 89, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1011, 907, 1, -1062731775, 'rand in China', 114, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1012, 908, 1, -1062731775, 'rand in China', 117, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1013, 909, 1, -1062731775, 'rand in China', 80, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1014, 910, 1, -1062731775, 'rand in China', 102, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1015, 911, 1, -1062731775, 'rand in China', 126, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1016, 912, 1, -1062731775, 'rand in China', 83, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1017, 913, 1, -1062731775, 'rand in China', 100, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1018, 914, 1, -1062731775, 'rand in China', 81, 36, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1019, 915, 1, -1062731775, 'rand in China', 90, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1020, 916, 1, -1062731775, 'rand in China', 101, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1021, 917, 1, -1062731775, 'rand in China', 124, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1022, 918, 1, -1062731775, 'rand in China', 77, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1023, 919, 1, -1062731775, 'rand in China', 98, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:44', NULL),
(1024, 920, 1, -1062731775, 'rand in China', 86, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1025, 921, 1, -1062731775, 'rand in China', 125, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1026, 922, 1, -1062731775, 'rand in China', 102, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1027, 923, 1, -1062731775, 'rand in China', 106, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1028, 924, 1, -1062731775, 'rand in China', 103, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1029, 925, 1, -1062731775, 'rand in China', 102, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1030, 926, 1, -1062731775, 'rand in China', 105, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1031, 927, 1, -1062731775, 'rand in China', 78, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1032, 928, 1, -1062731775, 'rand in China', 117, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1033, 929, 1, -1062731775, 'rand in China', 78, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1034, 930, 1, -1062731775, 'rand in China', 97, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1035, 931, 1, -1062731775, 'rand in China', 89, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1036, 932, 1, -1062731775, 'rand in China', 85, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1037, 933, 1, -1062731775, 'rand in China', 86, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL);
INSERT INTO `t_node` (`id`, `uid`, `state`, `ip`, `addr`, `gisx`, `gisy`, `group`, `team`, `operator`, `remark`, `create_time`, `update_time`) VALUES
(1038, 934, 1, -1062731775, 'rand in China', 115, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1039, 935, 1, -1062731775, 'rand in China', 122, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1040, 936, 1, -1062731775, 'rand in China', 89, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1041, 937, 1, -1062731775, 'rand in China', 101, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1042, 938, 1, -1062731775, 'rand in China', 117, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1043, 939, 1, -1062731775, 'rand in China', 107, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1044, 940, 1, -1062731775, 'rand in China', 109, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1045, 941, 1, -1062731775, 'rand in China', 90, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:45', NULL),
(1046, 942, 1, -1062731775, 'rand in China', 103, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1047, 943, 1, -1062731775, 'rand in China', 123, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1048, 944, 1, -1062731775, 'rand in China', 103, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1049, 945, 1, -1062731775, 'rand in China', 121, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1050, 946, 1, -1062731775, 'rand in China', 119, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1051, 947, 1, -1062731775, 'rand in China', 126, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1052, 948, 1, -1062731775, 'rand in China', 96, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1053, 949, 1, -1062731775, 'rand in China', 94, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1054, 950, 1, -1062731775, 'rand in China', 100, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1055, 951, 1, -1062731775, 'rand in China', 126, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1056, 952, 1, -1062731775, 'rand in China', 107, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1057, 953, 1, -1062731775, 'rand in China', 79, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1058, 954, 1, -1062731775, 'rand in China', 120, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1059, 955, 1, -1062731775, 'rand in China', 88, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1060, 956, 1, -1062731775, 'rand in China', 105, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1061, 957, 1, -1062731775, 'rand in China', 113, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1062, 958, 1, -1062731775, 'rand in China', 93, 38, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1063, 959, 1, -1062731775, 'rand in China', 116, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1064, 960, 1, -1062731775, 'rand in China', 126, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1065, 961, 1, -1062731775, 'rand in China', 116, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1066, 962, 1, -1062731775, 'rand in China', 88, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1067, 963, 1, -1062731775, 'rand in China', 124, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1068, 964, 1, -1062731775, 'rand in China', 84, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1069, 965, 1, -1062731775, 'rand in China', 99, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1070, 966, 1, -1062731775, 'rand in China', 109, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1071, 967, 1, -1062731775, 'rand in China', 116, 24, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1072, 968, 1, -1062731775, 'rand in China', 101, 26, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1073, 969, 1, -1062731775, 'rand in China', 108, 41, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1074, 970, 1, -1062731775, 'rand in China', 122, 40, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1075, 971, 1, -1062731775, 'rand in China', 104, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1076, 972, 1, -1062731775, 'rand in China', 112, 33, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1077, 973, 1, -1062731775, 'rand in China', 86, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:46', NULL),
(1078, 974, 1, -1062731775, 'rand in China', 96, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1079, 975, 1, -1062731775, 'rand in China', 119, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1080, 976, 1, -1062731775, 'rand in China', 96, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1081, 977, 1, -1062731775, 'rand in China', 100, 22, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1082, 978, 1, -1062731775, 'rand in China', 85, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1083, 979, 1, -1062731775, 'rand in China', 124, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1084, 980, 1, -1062731775, 'rand in China', 83, 42, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1085, 981, 1, -1062731775, 'rand in China', 127, 25, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1086, 982, 1, -1062731775, 'rand in China', 86, 28, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1087, 983, 1, -1062731775, 'rand in China', 126, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1088, 984, 1, -1062731775, 'rand in China', 82, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1089, 985, 1, -1062731775, 'rand in China', 104, 34, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1090, 986, 1, -1062731775, 'rand in China', 117, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1091, 987, 1, -1062731775, 'rand in China', 106, 30, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1092, 988, 1, -1062731775, 'rand in China', 118, 32, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1093, 989, 1, -1062731775, 'rand in China', 104, 39, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1094, 990, 1, -1062731775, 'rand in China', 109, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1095, 991, 1, -1062731775, 'rand in China', 80, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1096, 992, 1, -1062731775, 'rand in China', 106, 21, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1097, 993, 1, -1062731775, 'rand in China', 110, 29, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1098, 994, 1, -1062731775, 'rand in China', 88, 35, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1099, 995, 1, -1062731775, 'rand in China', 80, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1100, 996, 1, -1062731775, 'rand in China', 110, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1101, 997, 1, -1062731775, 'rand in China', 89, 37, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1102, 998, 1, -1062731775, 'rand in China', 106, 23, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1103, 999, 1, -1062731775, 'rand in China', 77, 43, 1, 1, 1, 'big data test', '2017-05-12 14:45:47', NULL),
(1104, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 13:29:32', NULL),
(1105, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 13:31:18', NULL),
(1106, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 13:44:19', NULL),
(1107, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:38:05', NULL),
(1108, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:39:57', NULL),
(1109, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:47:43', NULL),
(1110, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:50:44', NULL),
(1111, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:51:56', NULL),
(1112, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:53:17', NULL),
(1113, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:54:17', NULL),
(1114, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 14:55:09', NULL),
(1115, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:07:10', NULL),
(1116, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:08:25', NULL),
(1117, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:11:25', NULL),
(1118, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:13:51', NULL),
(1119, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:14:16', NULL),
(1120, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:17:29', NULL),
(1121, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:21:55', NULL),
(1122, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:25:28', NULL),
(1123, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:25:48', NULL),
(1124, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:27:40', NULL),
(1125, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-20 15:28:24', NULL),
(1126, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 01:11:28', NULL),
(1127, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 08:40:59', NULL),
(1128, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 08:43:10', NULL),
(1129, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 08:44:11', NULL),
(1130, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 08:45:56', NULL),
(1131, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 08:47:19', NULL),
(1132, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 08:58:01', NULL),
(1133, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 08:59:12', NULL),
(1134, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 09:02:46', NULL),
(1135, 305419896, 1, -1062731775, 'Wuhan Optical valley', 30.5984, 114.312, 1, 1, 2, 'Test Node', '2017-05-21 09:15:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_node_state`
--

CREATE TABLE `t_node_state` (
  `id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `content` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_node_state`
--

INSERT INTO `t_node_state` (`id`, `value`, `content`) VALUES
(1, 1, 'offline'),
(2, 2, 'online');

-- --------------------------------------------------------

--
-- Table structure for table `t_report_index`
--

CREATE TABLE `t_report_index` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `value` float NOT NULL,
  `time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_report_index`
--

INSERT INTO `t_report_index` (`id`, `uid`, `value`, `time`) VALUES
(8, 305419896, 3080.63, '2017-05-20 15:25:52'),
(9, 305419896, 3086.44, '2017-05-20 15:25:54'),
(10, 305419896, 3090.63, '2017-05-20 15:25:56'),
(11, 305419896, 3076.63, '2017-05-20 15:27:40'),
(12, 305419896, 3090.63, '2017-05-20 15:27:42'),
(14, 305419896, 3092.63, '2017-05-20 15:28:24'),
(15, 305419896, 3090.63, '2017-05-20 15:28:26'),
(16, 305419896, 3090.63, '2017-05-21 01:11:28'),
(17, 305419896, 3090.63, '2017-05-21 01:11:58'),
(18, 305419896, 3090.63, '2017-05-21 01:12:28'),
(19, 305419896, 3090.63, '2017-05-21 01:12:58'),
(20, 305419896, 3090.63, '2017-05-21 01:13:28'),
(21, 305419896, 3090.63, '2017-05-21 01:13:58'),
(22, 305419896, 3090.63, '2017-05-21 01:14:28'),
(23, 305419896, 3090.63, '2017-05-21 01:14:58'),
(24, 305419896, 3090.63, '2017-05-21 01:15:28'),
(25, 305419896, 3095.63, '2017-05-21 01:15:59'),
(26, 305419896, 3090.63, '2017-05-21 01:16:29'),
(27, 305419896, 3090.63, '2017-05-21 01:16:59'),
(28, 305419896, 3092.63, '2017-05-21 01:17:29'),
(29, 305419896, 3090.63, '2017-05-21 01:17:59'),
(30, 305419896, 3085.63, '2017-05-21 01:18:29'),
(31, 305419896, 3087.63, '2017-05-21 01:18:59'),
(32, 305419896, 3090.63, '2017-05-21 01:19:29'),
(33, 305419896, 3090.63, '2017-05-21 01:19:59'),
(34, 305419896, 3090.63, '2017-05-21 01:20:29'),
(35, 305419896, 3090.63, '2017-05-21 01:20:59'),
(36, 305419896, 3090.63, '2017-05-21 01:21:29'),
(37, 305419896, 3090.63, '2017-05-21 01:21:59'),
(38, 305419896, 3090.63, '2017-05-21 01:22:29'),
(39, 305419896, 3090.63, '2017-05-21 01:22:59'),
(40, 305419896, 3090.63, '2017-05-21 01:23:29'),
(41, 305419896, 3090.63, '2017-05-21 01:23:59'),
(42, 305419896, 3090.63, '2017-05-21 01:24:29'),
(43, 305419896, 3090.63, '2017-05-21 01:25:00'),
(44, 305419896, 3090.63, '2017-05-21 01:25:30'),
(45, 305419896, 3090.63, '2017-05-21 01:26:00'),
(46, 305419896, 3090.63, '2017-05-21 01:26:30'),
(47, 305419896, 3090.63, '2017-05-21 01:27:00'),
(55, 305419896, 3090.63, '2017-05-21 08:58:01'),
(56, 305419896, 3090.63, '2017-05-21 08:58:06'),
(57, 305419896, 3090.63, '2017-05-21 08:59:12'),
(58, 305419896, 3090.63, '2017-05-21 08:59:17'),
(59, 305419896, 3090.63, '2017-05-21 08:59:22'),
(67, 305419896, 3090.63, '2017-05-21 09:15:04'),
(68, 305419896, 3090.63, '2017-05-21 09:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8 NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `level` tinyint(4) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `name`, `phone`, `email`, `level`, `state`, `create_time`) VALUES
(1, 'qixx', '18507157503', '', 1, 1, '2017-05-14 13:09:36'),
(3, 'test', '', '', 2, 2, '2017-05-14 07:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_level`
--

CREATE TABLE `t_user_level` (
  `id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `content` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_level`
--

INSERT INTO `t_user_level` (`id`, `value`, `content`) VALUES
(1, 1, 'manager'),
(3, 2, 'developer');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_state`
--

CREATE TABLE `t_user_state` (
  `id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `content` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_state`
--

INSERT INTO `t_user_state` (`id`, `value`, `content`) VALUES
(1, 1, 'valid'),
(3, 2, 'invalid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_user`
--
ALTER TABLE `a_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_alarm`
--
ALTER TABLE `t_alarm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `t_alarm_level`
--
ALTER TABLE `t_alarm_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_alarm_state`
--
ALTER TABLE `t_alarm_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_alarm_type`
--
ALTER TABLE `t_alarm_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_map`
--
ALTER TABLE `t_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uid_2` (`uid`);

--
-- Indexes for table `t_node`
--
ALTER TABLE `t_node`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uid_2` (`uid`);

--
-- Indexes for table `t_node_state`
--
ALTER TABLE `t_node_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_report_index`
--
ALTER TABLE `t_report_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_level`
--
ALTER TABLE `t_user_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_state`
--
ALTER TABLE `t_user_state`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_user`
--
ALTER TABLE `a_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_alarm`
--
ALTER TABLE `t_alarm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `t_alarm_level`
--
ALTER TABLE `t_alarm_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_alarm_state`
--
ALTER TABLE `t_alarm_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `t_alarm_type`
--
ALTER TABLE `t_alarm_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `t_map`
--
ALTER TABLE `t_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_node`
--
ALTER TABLE `t_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1136;
--
-- AUTO_INCREMENT for table `t_node_state`
--
ALTER TABLE `t_node_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_report_index`
--
ALTER TABLE `t_report_index`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `t_user_level`
--
ALTER TABLE `t_user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `t_user_state`
--
ALTER TABLE `t_user_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
