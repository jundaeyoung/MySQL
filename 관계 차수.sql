CREATE TABLE school(
	school_id INT PRIMARY KEY,
    school_name VARCHAR(20) NOT NULL,
    city VARCHAR(20)
);

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(3) NOT NULL,
    school_id INT,
    FOREIGN KEY(school_id) REFERENCES school(school_id)
);

INSERT INTO school(school_id, school_name,city)
VALUES 
	(1,'서울대학교', '서울'),
    (2,'고려대학교', '서울'),
    (3,'연세대학교', '서울'),
    (4,'한양대학교', '서울');



INSERT INTO student(student_id, student_name, grade, school_id)
VALUES
	(1,'홍길동','1학년',1),
    (2,'김유신','2학년',2),
    (3,'이순신','1학년',3),
    (4,'유관순','3학년',1),
    (5,'안중근','2학년',4);
    
-- 제약 키 FK 사용하게 된다면 여러 가지 제약사항이 생기게 된다.
    
SELECT * FROM school;
SELECT * FROM student;
DESC student;

INSERT INTO student(student_id, student_name, grade, school_id)
VALUES(6, '야스오',1,10);

/*
Error Code: 1452.
Cannot add or update a child row: a foreign key constraint fails 
(`mydb`.`student`, CONSTRAINT `student_ibfk_1` 
FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`))
*/

-- 야구팀과 야구선수 관계를 1 : N 
CREATE TABLE team(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    team_name VARCHAR(50) NOT NULL
);

CREATE TABLE player(
	player_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    player_name VARCHAR(50) NOT NULL,
    team_id INT,
    FOREIGN KEY(team_id) REFERENCES team(id)
);



INSERT INTO team(team_name)
VALUES
	('LG트윈스'),
    ('NC다이노스'),
    ('두산베어스');
    
INSERT INTO player(player_name, team_id)
VALUES
	('허경민', 1),
    ('김하성', 2),
    ('최원준', 3);
    
    
    
    
SELECT * FROM team;
SELECT * FROM player;

CREATE TABLE department(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employee(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(id)
);

INSERT INTO department(name)
VALUES
	('삼성'),
    ('현대'),
    ('카카오'),
    ('네이버');
    
INSERT INTO employee(name,department_id)
VALUES
	('대영',1);


SELECT * FROM employee;
SELECT * FROM department;


CREATE TABLE product(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10),
    price INT NOT NULL
);

CREATE TABLE `order`(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE ,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES product(id)
);

INSERT INTO product(name, price)
VALUES
	('노트북', 1000000),
    ('스마트폰', 700000),
    ('키보드', 50000);

INSERT INTO `order`(order_date, product_id)
VALUES
	(20220215,2),
    (20220216,1),
    (20220217,3);
    
SELECT *FROM product;
SELECT *FROM `order`;
