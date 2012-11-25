로그인 및 로그아웃 가능 
아이디 admin 
비밀번호 1234

승엽 :    CREATE TABLE users CREATE DATABASE bnbun DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

         GRANT ALL ON bnbun.* TO 'bnb'@'localhost' IDENTIFIED BY 'bnbun';

         use bnbun;


CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	userid VARCHAR(100) NOT NULL UNIQUE,
	pwd VARCHAR(255) NOT NULL,
         name VARCHAR(100), 
	phonenumber VARCHAR(100) UNIQUE
);

승엽 : 데이터 베이스 로그인 완료.