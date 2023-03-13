USE mydb;

SELECT * FROM customer;
USE myblog;

-- user 테이블 생성
-- id : pk 부여
-- username : 사용자 이름(100자)not null처리,
-- 중복 허용 불가(unique)
-- password : 100자, not null, 중복허용
-- email : 100자, not null
-- address : 100자
-- userRole : ADMIN, MANAGER, USER
-- createDate : 

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address  VARCHAR(100), 
    userRole VARCHAR(20),
    createDate TIMESTAMP 
);
SELECT * FROM user;

-- 블로그 사이트
CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB NOT NULL,
    readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);
DROP TABLE board;
SELECT * FROM board;
-- user : board = 1 : N

-- 댓글 테이블 만들기
CREATE TABLE reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY (boardId) REFERENCES board(id),
	FOREIGN KEY (userId) REFERENCES user(id)
);
SELECT * FROM reply;

-- user : reply = 1 : N
-- board : reply = 1 : N

SELECT now();

INSERT INTO user
	(username ,password,email,address,userRole,createDate)
VALUES('jun','1234','jun@naver.com','busan','USER',now());

SELECT * FROM user	;

-- username과 password가 일치하는 사용자 찾아 보기
SELECT * 
FROM user
WHERE username = '홍길동'
	AND password = '1234';
    
DELETE FROM user
WHERE username = 'jun1'
	AND password = '1234';
    
SELECT * FROM board WHERE id = 7;
INSERT INTO board(title,content,userId)
VALUES
	('첫번째 게시글','자바는 쉬운거에요',3);

ALTER TABLE board MODIFY content TEXT NOT NULL;

DELETE FROM board 
WHERE id = 5;