-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-05-07 11:12:44
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iot1`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_alarm`
--

CREATE TABLE IF NOT EXISTS `t_alarm` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `value` float NOT NULL,
  `count` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `create_time` timestamp NOT NULL,
  `cancel_time` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_map`
--

CREATE TABLE IF NOT EXISTS `t_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `worker_id` tinyint(4) NOT NULL,
  `connect_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_node`
--

CREATE TABLE IF NOT EXISTS `t_node` (
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
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
