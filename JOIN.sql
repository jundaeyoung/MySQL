
CREATE DATABASE showdb;
use showdb;

CREATE TABLE userTBL(
	username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY(username)
);

ALTER table userTBL MODIFY mobile VARCHAR(13) NOT NULL;


CREATE TABLE buyTBL(
	username CHAR(3) NOT NULL,
    prodName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY(username) REFERENCES userTBL(username)
);

insert into userTBL values('이승기', 1987, '서울', '010-1234-1234');
insert into userTBL values('홍길동', 1911, '부산', '010-2222-3333');
insert into userTBL values('이순신', 1999, '대구', '010-3333-4444');

insert into buyTBL values('이승기', '운동화', 50, 1);
insert into buyTBL values('이승기', '노트북', 150, 1);
insert into buyTBL values('홍길동', '책', 10, 5);
insert into buyTBL values('홍길동', '모니터', 200, 2);
insert into buyTBL values('이순신', '청바지', 40, 1);
insert into buyTBL values('이순신', '책', 10, 3);

-- 부모 테이블 userTBL에 현재 야스오는 없는 사람이기 때문에 존재할 수 없다.
insert into buyTBL values('야스오', '책', 10, 3);

SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- INNER JOIN
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- LEFT JOIN
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- 야스오 회원 가입함
INSERT INTO userTBL(username,birthYear,addr,mobile)
VALUES('야스오',2020,'부산','010-1234-1234');

SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS(별칭) 사용해서 다시 INNER JOIN 
SELECT * 
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.username = B.username;

-- 별칭 사용 LEFT JOIN, LEFT JOIN IS NOT NULL 작성해보기

-- LEFT JOIN 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과 집합이 다를수 있다.
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 하는것이 좋다.
SELECT *
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.username = u.username;

-- right join
SELECT u.username, b.prodName, b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL As b
ON u.username = b.username;

SELECT 'aaaa';

-- 함수 사용해보기
SELECT u.username, b.prodName, b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.username = b.username;



-- 문제 작성 3문제
-- 이름,주소와 buyTBL에서 제품이름을 INNER JOIN을 사용하여 출력하세요.
SELECT u.username,u.addr,b.prodName
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username;

-- 주문한 제품과 가격과 갯수,  그리고 주문한 사람의 지역을 LEFT JOIN을 사용해 출력하세요.
SELECT b.prodName,b.amount,u.addr
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.username = u.username;

-- 주문한 사람의 생일과, 주문한 제품이름과 갯수를 출력하시오.
SELECT u.birthYear, b.prodName,b.amount
FROM buyTBL AS b
INNER JOIN userTBL AS u
On b.username = u.username;

-- 1. 성이 이씨이면서 태어난 년도가 1999년인 구매한 아이템 정보와 총 구입금액를 표시해주세요!
SELECT prodName, (b.price * b.amount) AS '총 구입금액'
FROM buyTBL AS b
INNER JOIN userTBL AS u
ON b.username = u.username
WHERE u.username LIKE '이%' AND birthYear=1999;

-- 2. 기준 테이블은 userTBL로 하고 LEFT JOIN을 사용하여 
-- 주문자 이름과, 주소, 전화번호, 상품 이름, 가격, 주문 수량 을 출력해보자 
-- (단, 주문 정보가 없는 경우 출력하지 않는다.)
SELECT u.username, u.addr, u.mobile,b.prodName,
b.price,b.amount
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username
WHERE b.username IS NOT NULL;

-- 3. LEFT JOIN 을 사용하여 NULL 값도 확인할 수 있게 출력 
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username;

-- 4. userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회해라
SELECT * 
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.amount >= 3;
-- 5. buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서
-- userTBL의 username이 null이 아닌 데이터를 조회해라
SELECT 
    *
FROM
    buyTBL AS b
        RIGHT JOIN
    userTBL AS u ON b.username = u.username
WHERE
    (u.username = '이승기' OR u.username = '야스오')
        AND u.username IS NOT NULL;
     
-- 6. 기준 테이블로 buyTBL을 사용해서 LEFT JOIN을 수행하고,
-- 1999년에 태어난 사람은 총 몇 개의 물품을 구매했는지 구하시오.
SELECT b.amount
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.username = u.username
WHERE birthYear = 1999;

-- 7. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고,
-- '책'을 구매한 사람들의 이름과 전화번호를 출력하시오.
SELECT u.username,u.mobile
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.prodName = '책';

-- 8. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고,
-- '대구'에 사는 사람이 구매한 물품들을 출력하시오.
SELECT b.prodName
from buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.username = u.username
WHERE addr = '대구';


-- 평가
-- 1. 학생 테이블 생성
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL
);
-- 2. 상품 테이블 생성하고 데이터 입력 쿼리 구문 작성
CREATE TABLE product(
	product_id INT NOT NULL primary key,
	product_name VARCHAR(20) NOT NULL,
    price INT NOT NULL
);
INSERT INTO product
VALUES
	(1,'시계',2000000),
    (2,'팔찌',1000000);
    
-- 3.상품 테이블과 1:N 관계를 가지는 구매 테이블을 생성 하시오  
CREATE TABLE buy(
	id INT,
    acount INT NOT NULL,
    FOREIGN KEY (id) REFERENCES product(product_id)
);

-- 4. 구매 테이블에 데이터를 입력하시오.

INSERT INTO buy
VALUES	
	(1,2),
    (2,3);

SELECT *
FROM product AS p
INNER JOIN buy AS b
ON p.product_id = b.id;

DROP TABLE product;

select @@global.sql_mode;