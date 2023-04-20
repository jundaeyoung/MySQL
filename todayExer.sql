/*
	서브 쿼리란 - 쿼리안에 쿼리가 있다.
    : 서브 쿼리는 쿼리의 위치가 어디에 
     있느냐에 따라서 3가지 종류로 나눌 수 있다.
     
     1. 중첩 서브쿼리(Nested Subquery):WHERE 절에사용하는 서브 쿼리
     2. 인라인 뷰(Inline view): FROM 절에 사용하느 서브 쿼리
     3. 스칼라 서브쿼리 : (Scalar Subquery) : SELECT 절에 사용하는 서브 쿼리
     
     : 내부 쿼리는 괄호로 반드시 감싸져 있어야 한다.
     
*/
-- db 생성 
create database reservationdb;
use reservationdb;

-- 예약 테이블 생성 
create table reservation(
	id int auto_increment, 
    name varchar(20) not null, 
    reserveDate date not null, 
    roomNum varchar(5) not null,
    primary key(id)
);

-- 고객 테이블 
create table customer(
	id int auto_increment, 
    name varchar(20) not null, 
    age int not null, 
    address varchar(10), 
    primary key(id)
);



-- 예약 테이블 데이터 생성 
insert into reservation values(1, '홍길동', '2020-04-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-04-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-04-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-04-04 00:00:00', 4);

-- 데이터 확인 
select * from reservation;

-- 데이터 수정 
update reservation set roomNum = '1001' where id = 1; 
update reservation set roomNum = '1002' where id = 2; 
update reservation set roomNum = '1003' where id = 3; 
update reservation set roomNum = '1004' where id = 4; 

-- 고객 테이블 데이터 생성 
select * from customer;

-- 고객 테이블 데이터 생성
insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');


-- 고객 테이블 데이터 수정 
update customer set address = '인천' where id = 2;
update customer set address = '서울' where id = 3;
update customer set address = '수원' where id = 4;

select * from customer;
select * from reservation;
select * from customer;

-- 주소가 서울인 고객이 예약한 예약 정보만을 뽑아 주세요
-- 중첩 서브쿼리
SELECT id, reserveDate, roomNum, name
FROM reservation
WHERE name IN( SELECT name FROM customer WHERE address='서울' ); 

SELECT id, reserveDate, roomNum, name
FROM reservation
WHERE name IN('홍길동','장길산');

-- JOIN을 사용해서 주소가 서울인 고객이 예약한 예약 정보만을 뽑아 주세요 
SELECT c.id, r.reserveDate, r.roomNum, c.name
FROM reservation AS r
JOIN customer AS c
ON r.name = c.name
WHERE c.address='서울';

-- FROM 절 서브 쿼리
SELECT name, reservedRoom
FROM (
   SELECT name, reserveDate, (roomNum) as reservedRoom
    FROM reservation
    WHERE roomNum > 1001
) AS reservationInfo;

/*
	서브쿼리의 특징
    1. 서브쿼리를 사용하면 다음과 같은 장점을 얻을 수 있다.
    서브쿼리를 사용하면 쿼리를 구조화 시키므로, 쿼리의 각 부분을 명확히 구분할 수 있게 해준다.(쿼리의 가독성을 높여준다.)
    2. 서브쿼리는 복잡한 join 이나 UNION과 같은 동작을 수행할 수 있는 또 다른 방법을 제공합니다.
    3. 서브쿼리는 읽기 편하다.
    
    !. 스칼라 서브쿼리는 가능한 사용을 하지말자(연습도 안할것)
    */
    
    -- 서브쿼리 사용
    -- 2020-04-02 예약 정보 확인
    -- 2020-04-02 일자로 예약한 고객의 id와 이름 조회하기
    SELECT *
    FROM reservation
    WHERE reserveDate='20200402';
    
    
    SELECT id, name
    FROM customer
    WHERE name IN (
		SELECT name
		FROM reservation
		WHERE reserveDate='20200402'
    );
    use employees;
    SELECT * FROM dept_emp;
    SELECT * FROM departments;
    SELECT * FROM salaries;
    SELECT * FROM dept_manager;
    SELECT * FROM employees;
    
    -- 개발부서와 마케팅부에서 생일이 2일인 사람의 생일과 이름을 구하시오.
    SELECT e.birth_date, e.first_name, e.last_name FROM employees AS e
    JOIN dept_emp AS de
    ON e.emp_no=de.emp_no
    WHERE DAY(e.birth_date) ='02'
    AND de.dept_no IN 
    (SELECT dept_no 
    FROM departments
    WHERE dept_name 
    IN ('Development','Marketing'));
    
    -- 개발 부서중 월급이 70000원 이상인 사람 
    -- 그리고 last_name이 N으로 시작하는 하고 n으로 끝나는 사람중
    -- 생일이 1월4일인 사람을 구하세요.(like 절 쓰지않기)
    -- 구한 사람의 생년월일과 last_name, 월급을 구하세요.
    -- 월급을 오름차순으로 구하세요
    SELECT e.birth_date,e.last_name,s.salary FROM employees AS e
    JOIN salaries AS s
    ON e.emp_no = s.emp_no
    WHERE s.salary >='70000' AND
    e.last_name LIKE 'N%' AND
    e.last_name LIKE '%n' AND
    MONTH(e.birth_date)= 1 AND
    day(e.birth_date)=04 AND
    e.emp_no IN 
		( SELECT emp_no
		FROM dept_emp
        WHERE dept_no IN
		(SELECT dept_no 
        FROM departments 
        WHERE dept_name = 'Development'))
	ORDER BY s.salary;
    SELECT * FROM salaries WHERE ;
    
    -- Marketing 부서중 2000년 01월 01 일 이후에(from_date) 입사한 남자의 
    -- 이름과 생일,성별을 출력하시오.
SELECT birth_date, first_name, last_name , gender
FROM employees    
WHERE gender = 'M' AND emp_no IN (
SELECT de.emp_no FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing' AND YEAR(from_date)='2000');

    
SELECT * FROM employees WHERE first_name like 'k%' AND emp_no 
IN(SELECT emp_no FROM salaries WHERE to_date != '99990101');
    
SELECT *
FROM dept_emp AS de
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE de.from_date
IN (SELECT from_date FROM dept_emp WHERE from_date >= '1990-01-01')
ORDER BY de.from_date;
    
    SELECT * FROM dept_emp WHERE from_date >= '1990-01-01';
    
SELECT *
FROM (
	SELECT name, reserveDate, roomNum
    FROM reservation
    WHERE roomNum > 1001
) AS reservationInfo;

SELECT  * FROM reservation;
    
    
    -- 개발 부서중 Susumu Picht 보다 입사일이 늦은사람 모두의 부서이름과 입사일, 사원정보를 출력하세요
    SELECT * FROM departments AS d
    JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
    WHERE d.dept_name='Development' AND from_date > 
    ALL(SELECT de.from_date FROM dept_emp AS de
    JOIN employees AS e
    ON e.emp_no=de.emp_no
    WHERE e.last_name='Picht'AND e.first_name='Susumu');
    
    
    
    
    
    -- 중첩쿼리를 사용해서 개발부(Development)에서 아직 일하는 사람 중 생일이 4월인 사람의 first_name, birth_date, dept_name,to_date를 출력하시오.
    SELECT e.first_name,e.birth_date,d.dept_name,de.to_date 
    FROM employees AS e
    JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
    JOIN departments AS d
    ON de.dept_no = d.dept_no
    WHERE e.birth_date LIKE '%-04-%'
    AND e.emp_no 
    IN (SELECT de.emp_no FROM dept_manager WHERE de.to_date='99990101' AND de.dept_no 
    IN (SELECT d.dept_no FROM departments WHERE d.dept_name='Development'))
	ORDER BY birth_date ASC;
    SELECT * FROM employees;
    
     SELECT * FROM dept_emp;
    SELECT * FROM departments;
    SELECT * FROM salaries;
    SELECT * FROM dept_manager;
    SELECT * FROM employees;
    
    SELECT * 
    FROM departments AS d
    JOIN dept_emp AS de 
    ON d.dept_no = de.dept_no
    JOIN salaries AS s
    ON s.emp_no = de.emp_no
    JOIN employees AS e
    ON e.emp_no = de.emp_no
    WHERE de.emp_no IN 
    (SELECT emp_no FROM salaries
    WHERE salary=(
    SELECT MAX(salary) FROM salaries)) ;
    
    