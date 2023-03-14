use myblog;

SELECT * FROM board;

INSERT INTO board(title, content, userId)
VALUES 
	('테스트글1','테스트 내용1',1);
    
SELECT * FROM board
WHERE id = 7;

SELECT * FROM board;

DELETE FROM board
WHERE id = 16;

CREATE TABLE cafe(
	id INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(10) NOT NULL UNIQUE,
    email VARCHAR(50)
);
INSERT INTO cafe(name)
VALUES 
	('카타리나');
    
SELECT * FROM cafe;


DROP TABLE cafe;
DELETE FROM cafe
WHERE name = '티모';

UPDATE cafe
SET name = '르블랑'
WHERE name = '티모';