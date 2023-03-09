CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

-- 학생과 수강 테이블에 관계는 1:N
-- 과목과 수강 테이블의 관계는 1:N
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);

-- 한사람이 여러개의 도시에서 여러번 여행을 다녀온 경우를 
-- 테이블로 구축해 보세요.
-- 여기서 사람과 도시의 관계를 관계 차수로 표현해 보세요.
-- 도시에 방문한 사람의 이력을 저장 가능
-- 한 사람이 여러 도시를 방문할수 있고, 
-- 한 도시에는 여러사람이 방문할 수 있다.
CREATE TABLE person(
	person_id INT PRIMARY KEY,
    name VARCHAR(50) 
);
CREATE TABLE city(
	city_id INT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE travel(
    person_id INT NOT NULL,
    city_id INT NOT NULL,
    trip_date DATE,
    PRIMARY KEY(person_id, city_id, trip_date),
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

INSERT INTO person 
VALUES
	(1, '김영희'),
    (2, '박철수'),
    (3, '이민호'),
    (4, '한지민'),
    (5, '송혜교');
    
INSERT INTO city 
VALUES
	(1, '서울'),
    (2, '부산'),
    (3, '제주'),
    (4, '홍콩'),
    (5, '도쿄');
    
INSERT INTO travel 
VALUES 
	(1, 1, 20220710),
    (1, 2, 20220710),
    (2, 5, 20220710),
    (2, 4, 20220710),
    (3, 3, 20220710),
    (4, 5, 20220710),
    (1, 4, 20220710);
    
SELECT * FROM travel;

-- 문제 join 구문을 활용해서 무슨 사람이 어떤 부분에 방문했다.
-- 2문제

-- 1. 김영희가 간 도시를 출력하시오.
SELECT name
FROM city AS c
INNER JOIN travel AS t
ON c.city_id = t.city_id
where person_id = 1 ;

-- 2. 제주도와 홍콩을 방문한 사람을 출력하시오.
SELECT name
FROM person AS p
INNER JOIN travel AS t
ON p.person_id =  t.person_id
where city_id IN (3,4);

-- 다대다 관계
-- 고객, 주문 목록 -> 1:N
-- ex) 홍길동->신발,컴퓨터,시계

-- 고객, 상품 정보, 주문 목록 --> N : M 관계 -->중간테이블 주문목록
-- 주문 -- 1(홍길동), 1(신발), "일자"

-- 테이블 설계 
-- 고객, 상품, 주문목록
CREATE TABLE customer(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orderlist(
	customer_id INT,
    product_id INT,
    date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

SELECT*FROM city;

