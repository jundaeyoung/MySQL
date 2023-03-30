use myblog;

SELECT * FROM user;
SELECT * FROM reservation
WHERE user_id ='jdy1787';
DELETE FROM reservation;
SELECT * FROM home;
SELECT * FROM reservation;
SELECT * FROM reply;
 DELETE FROM reply WHERE user_id='jdy1787'AND id='44';

CREATE TABLE user(
	id VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    tel VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);

ALTER TABLE reply DROP CONSTRAINT user_id;
ALTER TABLE reply 
ADD FOREIGN KEY(user_id) 
REFERENCES user(id) 
ON UPDATE CASCADE;

dESC reply;

CREATE TABLE reservation(
	id INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    personNumber INT NOT NULL,
    user_id varchar(30) NOT NULL,
    home_id int NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(home_id) REFERENCES home(id)
);

CREATE TABLE home(
	id INT AUTO_INCREMENT PRIMARY KEY,
    price VARCHAR(30) NOT NULL
);
insert into home(price,name,day,view)
VALUES
	('\296,800 / 박','Ganggu-myeon, Yeongdeok-gun,한국','3월 20일~25일','바다 전망'),
    ('\679,531 / 박','Niseko, Abuta District, Hokkaido, 일본','3월 21일~26일','산 전망'),
    ('\483,007 / 박','南伊豆町, 静岡県, 일본','3월 23일~26일','산 전망'),
    ('\1,012,190 / 박','시모다, 일본','3월 20일~25일','바다 전망'),
    ('\167,639 / 박','수영구, 한국','3월 26일~5월 1일','해변 및 바다 전망'),
    ('\71,912 / 박','여수시, 전라남도, 한국','4월 3일~4월 8일','시티 전망');

SELECT * FROM home
WHERE name like '%한국' ;    

ALTER table home AUTO_INCREMENT=1;
DELETE from home;
CREATE TABLE reply(
	id int AUTO_INCREMENT PRIMARY KEY,
	user_id VARCHAR(50) NOT NULL,
    home_id int NOT NULL,
    content text NOT NULL,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(home_id) REFERENCES home(id)
);

SELECT count(*) AS coment FROM reply
WHERE home_id=6;

update reply
set id =1,
user_id='jdy1787',
home_id='1',
content='별로였어요';
INSERT INTO reply(user_id, home_id, content)
VALUES
	('jdy1787',1,'너무 좋았어요');
SELECT * FROM reply;
DROP TABLE reply;
INSERT INTO home(price)
VALUES
	(200000);
DELETE FROM reply;

INSERT INTO reservation(start_date,end_date,personNumber,user_id,home_id)
VALUES
	(current_date(),current_date(),2,'jdy1787',1);
    
INSERT INTO user(id,password,tel,email)
VALUES 
	('jdy1787','1234','010-1111-1111','jdy1787@naver.com');

UPDATE `user`
SET id = 'jdy1787',
	password='123',
    tel='010-2222-2222',
    email='1111@naver.com'
WHERE id ='jdy1787';

DROP TABLE user;

CREATE DATABASE demo5;
use demo5;

CREATE TABLE user(
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);
SELECT * FROM user;
Drop table reservation;
SHOW VARIABLES LIKE 'c%';

SELECT * FROM reply WHERE home_id = '6' ORDER BY date DESC
