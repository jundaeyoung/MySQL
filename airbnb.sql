use myblog;

SELECT * FROM user;
DELETE FROM user;

CREATE TABLE user(
	id VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    tel VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);

INSERT INTO user
VALUES 
	('jdy1787','1234','010-1111-1111','jdy1787@naver.com'),
    ('1234','1234','010-1234-1234','1234@naver.com');

UPDATE `user`
SET id = 'jdy1787',
	password='123',
    tel='010-2222-2222',
    email='1111@naver.com'
WHERE id ='jdy1787';

CREATE DATABASE demo5;
use demo5;

CREATE TABLE user(
	id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
SELECT * FROM user;
Drop table users;
SHOW VARIABLES LIKE 'c%';

