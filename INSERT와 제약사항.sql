-- 데이터 저장( 한줄 주석 )
/*
여러줄 주석
*/

-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);
DESC student;

-- 기본 문구 모양
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ..)VALUES(값1, 값2);
INSERT INTO student(student_id, name, grade, major)
VALUES(1,'홍길동', 3, '컴퓨터공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES(2, '김철수', 4, '전자공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES(3, '이영희', 2, '경영학과');

INSERT INTO student(student_id, name, grade, major)
VALUE(4, '티모', 1, '롤학과');

-- 테이블에 데이터를 삭제하는 명령어 사용해보기
DELETE FROM student; -- 테이블 안에 있는 데이터만 삭제하는 명령어

-- 복수형으로 INSERT 쿼리문 작성하기
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '이영희', 3, '수학과'),
    (1003, '박민수', 1, '전자공학과');

-- 복수형으로 데이터 3행을 넣어주세요 단 VALUE로 사용해보세요.
INSERT INTO student(student_id, name, grade, major)
VALUE
	(1004, '김철수2', 2, '컴퓨터공학과'),
    (1005, '이영희2' , 3, '수학과'),
    (1006, '박민수2' , 1, '전자공학과');

-- INSERT 복수행 쿼리를 실행할 때 하나라도 오류가 있으면
-- 데이터는 정상 저장되지 않는다.
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1007, '김철수3', 2, '컴퓨터공학과'),
    (1008, '이영희3', 3, '수학과'),
    (1009, '박민수3', 1, '전자공학과');

SELECT * FROM student;
 
 
 -- DROP TABLE employee;
 -- DROP TABLE customer;
 CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    age INT NOT NULL,s
    salary INT
 );
 
 CREATE TABLE customer(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100),
    tel VARCHAR(50)
 );
 
 DESC employee;
 DESC customer;
 
 INSERT INTO employee(id, name, gender, age, salary)
 VALUES
	(1, '홍길동', '남', 20, 3000),
    (2, '김철수', '남', 21, 4000),
    (3, '박민수', '남', 21, 3400),
    (4, '이영희', '여', 23, 3500),
    (5, '티모', '남', 20, 2700);

INSERT INTO customer(id, name, email, address, tel)
VALUES
	(1, '길동', 'gildong@naver.com','조선 1길','010-2323-2323'),
    (2, '철수', 'cs@naver.com', '동래구 낙민동', '010-2322-2222'),
    (3, '민수', 'ms@naver.com', '부산시 해운대구', '010-3333-3333'),
    (4, '영희', 'yh@naver.com', '부산시 동래구', '010-4444-4444'),
    (5, ' 티모', 'tm@naver.com', '소환사 협곡', '010-5555-5555');


SELECT * FROM employee;
SELECT * FROM customer;

CREATE TABLE product(
	id int PRIMARY KEY,
	name VARCHAR(50) not null,
    price int not null
);

INSERT INTO product(id, name, price)
VALUE
	(1, '롱소드','350'),
    (2, '증폭의 고서', '425'),
    (3, '쓸데없이 큰 지팡이','1250');
    
SELECT * FROM product;

-- 테이블 제약사항에 NULL 허용의미와 NOT NULL 허용의미
DESC student;
-- 이미 생성된 테이블 제약 사항 변경하기
ALTER TABLE student MODIFY grade INT NULL;
DESC student;

INSERT INTO student(student_id, name, major)
VALUES(1, '홍길동', '검술학과');


-- grade 제약을 NOT NULL로 변경해보기
-- 테이블에 값이 하나 들어가있다. 
ALTER TABLE student MODIFY grade INT NOT NULL;
SELECT * FROM student;

-- 하나의 행을 삭제하는 쿼리이다. - WHERE절(조건절)
DELETE FROM student WHERE student_id=1;

-- major 컬럼 제약을 NOT NULL로 변경해 주세요
ALTER TABLE student MODIFY major VARCHAR(50) NOT NULL;
DESC student;	

-- 컬럼 선언 부분을 생략도 가능하다. 단 전부 값을 넣을려고 하는 상황일 때 
INSERT INTO student VALUES(2, '홍길동', 3, '검술학과');
SELECT * FROM student;

-- INSERT 구문 컬럼명 선언 방식
-- 1. 전부 작성하는 방법
-- 2. 제약사항이 NULL 인 열이 있다면 넣고 싶은 열만 지정해서 구문을 작성할 수 있다.
-- 3. 전부 데이터를 넣는 상황이라면 컬럼 선언 부분을 생략 가능하다.

-- NOT NULL 과 defalut 값
DROP TABLE student;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) DEFAULT '미정' NOT NULL
);

DESC student;
-- 디폴트 제약을 사용했을 때 값을 넣는 방법 1
INSERT INTO student(student_id, name, grade, major)
VALUES 
	(1, 'John', 3, '경영학과'),
    (2, 'Jane', 2, '경영학과'),
    (3, 'Mike', 1, DEFAULT),
    (4, 'David', 2, DEFAULT);

SELECT * FROM student;

-- 디폴트 제약을 사용했을 때 값을 넣는 방법 2
INSERT INTO student(student_id, name, grade)
VALUES 
	(5, '홍길동1', 2),
    (6, '홍길동2', 3),
    (7, '홍길동3', 1),
    (8, '홍길동4', 3);
SELECT * FROM student;

-- professor 컬럼 제약사항을 defalut로 추가하고 값을 빈 문자열로 만들어 주세요.
-- 빈 문자열의 의미는 '' 처리 하면 된다.
CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);

-- 테이블이 생성되어 있을 때 제약 변경 default 구문 추가
ALTER TABLE subject MODIFY professor VARCHAR(50) DEFAULT '' NOT NULL;

DESC subject;