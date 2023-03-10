
SELECT * FROM titles;
-- Staff -- > 결과집합으로 Staff 직원에 이력을
		 -- > 결과 집합으로 만들기
SELECT * 
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
ORDER BY e.emp_no DESC
limit 10;

-- 2단계
SELECT e.emp_no, e.first_name, e.last_name, t.title 
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
ORDER BY e.emp_no DESC
limit 10;

desc employees;
desc salaries;
SELECT e.first_name,e.last_name ,count(s.salary) AS count
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
HAVING first_name = 'Georgi'
AND last_name = 'Facello';


CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    email VARCHAR(40)
);
CREATE TABLE blog(
	id INT PRIMARY KEY,
    name VARCHAR(10) unique NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);
CREATE TABLE reply(
	id INT PRIMARY KEY,
    content VARCHAR(100),
    blog_name VARCHAR(10) NOT NULL,
    FOREIGN KEY (blog_name) REFERENCES blog(name)
);
INSERT INTO user(name,email)
VALUES
	('티모', 'timo@naver.com'),
    ('애쉬', 'ash@naver.com'),
    ('애니비아', 'anibia@naver.com');
INSERT INTO blog(id, name, user_id)
VALUES
	(1,'네이버',1),
    (2,'다음',2),
    (3,'구글',1),
    (4,'네이트',2),
    (5,'인스타그램',3);
INSERT INTO reply(id,content, blog_name)
VALUES	
	(1,'사이트가 불편해요','네이버'),
    (2,'광고가 많아요','인스타그램'),
    (3,'좋아요','구글');

SELECT * FROM user;
SELECT * FROM blog;
SELECT * FROM reply;
SELECT * 
FROM user 
where name 
like '%티모%'; 

INSERT INTO user
VALUES 
	(4, '카타리나','kata@naver.com');