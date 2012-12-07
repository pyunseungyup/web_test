# Host: localhost  (Version: 5.5.27)
# Date: 2012-12-07 12:20:10
# Generator: MySQL-Front 5.3  (Build 1.21)

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
  `userid` varchar(100) DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT '',
  `distance` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT '',
  `kind` varchar(100) DEFAULT '',
  `price` varchar(100) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `facility` varchar(255) DEFAULT '',
  `description` text,
  `photo` varchar(100) DEFAULT '',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "rooms"
#

INSERT INTO `rooms` VALUES (1,'1234','????','Seoul_Un',5,'rented room','one_room',NULL,'???',NULL,'        ???',''),(2,'12341234','연세원룸','Seoul_Un',5,'rented room','one_room',NULL,'',NULL,'        ㄴㅁ','');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
