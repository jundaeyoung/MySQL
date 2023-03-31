use myblog;

SELECT * FROM user;
SELECT * FROM reservation
WHERE user_id ='jdy1787';
DELETE FROM reply;
SELECT * FROM home;
SELECT * FROM reservation;
SELECT * FROM reply;
SELECT format(avg(rating),2)as rating FROM reply
WHERE home_id='1';
 DELETE FROM reply WHERE user_id='jdy1787'AND id='44';

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
delete from homeinfo 
where home_id=2;
insert into homeinfo
values
	('정면오션테라스ㅡ광안리불꽃축제 명당','❣ 슈퍼호스트 · 수영구, 부산, 한국','images/home5/home5_1.png','images/home5/home5_2.png','images/home5/home5_3.png','images/home5/home5_4.png','images/home5/home5_5.png','그랜드테라스 님이 호스팅하는 레지던스 전체','최대 인원 2명 · 원룸 · 침대 1개 · 욕실 1개','superhost1.png','그랜드테라스님은 슈퍼호스트입니다','슈퍼호스트는 풍부한 경험과 높은 평점을 자랑하며 게스트가 숙소에서 편안히 머무를 수 있도록 최선을 다하는 호스트입니다..','checkin.png','셀프 체크인','열쇠 보관함을 이용해 체크인하세요.','key.png','순조로운 체크인 과정','최근 숙박한 게스트 중 100%가 체크인 과정에 별점 5점을 준 숙소입니다.',5);
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
