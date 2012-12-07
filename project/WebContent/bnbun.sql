# Host: localhost  (Version: 5.5.27)
<<<<<<< HEAD
# Date: 2012-12-07 15:45:39
# Generator: MySQL-Front 5.3  (Build 1.20)
=======
# Date: 2012-12-07 12:22:05
# Generator: MySQL-Front 5.3  (Build 1.21)
>>>>>>> 351a986ba787c3c1f4b0b8a3e1eb3d7ac18baa99

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;

#
# Source for table "rooms"
#

CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `userid` varchar(100) DEFAULT '',
  `location` varchar(100) DEFAULT '',
  `distance` int(11) DEFAULT '0',
  `userid` varchar(100) DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT '',
  `distance` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT '',
  `kind` varchar(100) DEFAULT '',
  `price` varchar(100) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `lat` varchar(100) DEFAULT '',
  `lng` varchar(255) DEFAULT '',
  `facility` varchar(255) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `photo` varchar(100) DEFAULT '',
  PRIMARY KEY (`roomid`)
);
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL DEFAULT '',
  `pwd` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `phonenumber` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);

INSERT INTO `users` VALUES (12,'a','112233','정경락','11231123'),(13,'a@a.a','112233','경락이','010-1111-1111');
