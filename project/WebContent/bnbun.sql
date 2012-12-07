
CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `userid` varchar(100) DEFAULT '',
  `location` varchar(100) DEFAULT '',
  `distance` int(11) DEFAULT '0',
<<<<<<< HEAD
  `userid` varchar(100) DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT '',
  `distance` int(11) DEFAULT NULL,
=======
>>>>>>> 2eae5517978bc12ecf9a772310c21396ffd6ba45
  `type` varchar(100) DEFAULT '',
  `kind` varchar(100) DEFAULT '',
  `price` varchar(100) DEFAULT '',
  `deposit` varcher(100) DEFAULT null,
  `address` varchar(255) DEFAULT '',
  `lat` varchar(100) DEFAULT '',
  `lng` varchar(255) DEFAULT '',
  `facility` varchar(255) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `photo` varchar(100) DEFAULT '',
  PRIMARY KEY (`roomid`)
<<<<<<< HEAD
);
=======
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


>>>>>>> 2eae5517978bc12ecf9a772310c21396ffd6ba45
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL DEFAULT '',
  `pwd` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `phonenumber` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
);

INSERT INTO `users` VALUES (12,'a','112233','정경락','11231123'),(13,'a@a.a','112233','경락이','010-1111-1111');
=======
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



>>>>>>> 2eae5517978bc12ecf9a772310c21396ffd6ba45
