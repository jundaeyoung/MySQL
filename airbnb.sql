use myblog;

SELECT * FROM user;
SELECT * FROM reservation;

SELECT * FROM homeinfo;
SELECT * FROM home;
desc homeinfo;
update home
set image='images/home1.png'
WHERE id=1;
SELECT * FROM reservation;
SELECT format(avg(rating),2)as rating FROM reply
WHERE home_id='1';
 ALTER TABLE home AUTO_INCREMENT=11;
 DELETE FROM reply WHERE user_id='jdy1787'AND id='44';
delete from home where id=21;
CREATE TABLE HomeInfo(
	title VARCHAR(200),
	location VARCHAR(200),
	image1 VARCHAR(200),
	image2 VARCHAR(200),
	image3 VARCHAR(200),
	image4 VARCHAR(200),
	image5 VARCHAR(200),
	host VARCHAR(200),
	info VARCHAR(200),
	sideimage1 VARCHAR(200),
	sideInfo1 VARCHAR(200),
    sideInfo1_1 VARCHAR(200),
	sideimage2 VARCHAR(200),
	sideInfo2 VARCHAR(200),
    sideInfo2_1 VARCHAR(200),
	sideimage3 VARCHAR(200),
	sideInfo3 VARCHAR(200),
    sideInfo3_1 VARCHAR(200),
    home_id int,
	FOREIGN KEY(home_id) REFERENCES home(id)
);
SELECT * FROM homeinfo;

insert into homeinfo
values
	(
    'OceanView / 신규오픈 / 윤슬 / 프라이빗 / 수변공원 ',
    '❣ 슈퍼호스트 · 수영구, 부산, 한국',
    'images/home9/home9_1.png',
    'images/home9/home9_2.png',
    'images/home9/home9_3.png',
    'images/home9/home9_4.png',
    'images/home9/home9_5.png',
    'Olivia 님이 호스팅하는 공동 주택 전체',
    '최대 인원 4명침실 1개침대 1개욕실 1개',
    'desk.png',
    '업무 전용 공간',
    '와이파이가 제공되어 업무를 보기에 적합한 방입니다',
    'location.png',
    '훌륭한 숙소 위치',
    '최근 숙박한 게스트 중 100%가 위치에 별점 5점을 준 숙소입니다.',
    'key.png',
    '순조로운 체크인 과정',
    '최근 숙박한 게스트 중 100%가 체크인 과정에 별점 5점을 준 숙소입니다.',
    9
    );
CREATE TABLE user(
	id VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    tel VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);

CREATE TABLE home_info(
	title VARCHAR(200)
    
);

ALTER TABLE reply add rating INT;
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
	('\148,353 / 박','수영,부산시,한국','4월 7일~13일','바다 전망');

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
