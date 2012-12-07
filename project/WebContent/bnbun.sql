CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `userid` varchar(100) DEFAULT '',
  `location` varchar(100) DEFAULT '',
  `distance` int(11) DEFAULT '0',
  `type` varchar(100) DEFAULT '',
  `kind` varchar(100) DEFAULT '',
  `price` varchar(100) DEFAULT '',
  `deposit` varchar(100) DEFAULT null,
  `address` varchar(255) DEFAULT '',
  `lat` varchar(100) DEFAULT '',
  `lng` varchar(255) DEFAULT '',
  `facility` varchar(255) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `photo` varchar(100) DEFAULT '',
<<<<<<< HEAD
   PRIMARY KEY (`roomid`)

) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



=======
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


>>>>>>> 24335b32ee19548c10365498ab9e82b69e042f30
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL DEFAULT '',
  `pwd` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `phonenumber` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



=======

) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
>>>>>>> 24335b32ee19548c10365498ab9e82b69e042f30

