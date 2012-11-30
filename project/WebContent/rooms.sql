
CREATE TABLE `rooms` (
  `name` varchar(20) DEFAULT '',
  `userid` varchar(100) DEFAULT '',
  `location` varchar(100) DEFAULT '',
  `distance` varchar(100) DEFAULT '',
  `type` varchar(100) DEFAULT '',
  `kind` varchar(100) DEFAULT '',
  `price` varchar(100) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `facility` varchar(255) DEFAULT '',
  `description` text,
  `photo` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

