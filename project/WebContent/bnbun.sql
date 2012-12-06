﻿CREATE TABLE users CREATE DATABASE bnbun DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON bnbun.* TO 'bnb'@'localhost' IDENTIFIED BY 'bnbun';

use bnbun;


CREATE TABLE users (
	userid VARCHAR(100) NOT NULL UNIQUE,
	pwd VARCHAR(255) NOT NULL,
  name VARCHAR(100), 
	phonenumber VARCHAR(100) UNIQUE
);

