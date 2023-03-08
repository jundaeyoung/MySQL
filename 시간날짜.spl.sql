
SELECT now();
SELECT curtime();
SELECT curdate();

SELECT year();
SELECT month();
SELECT day();
SELECT hour();

-- STRING FUNCTION
SELECT ASCII('U');
SELECT char_length('my SQL test');

SELECT concat("green","class","  100") AS title;
SELECT concat_ws("->","class","mysql","홍길동");
SELECT find_in_set('q','s,q,l');
SELECT format(2500.123,3);
SELECT lcase('HELLO JAVA');
SELECT ucase('hello java');
SELECT trim('  MY S Q L '); -- 양 끝 공백만 제거
SELECT replace('  MY S Q L ', ' ', '');

-- mySql Numberic function
SELECT *
FROM buyTBL;

SELECT *, sum(price) AS'상품가격에 총합' FROM buyTBL;

SELECT *,(SELECT sum(price) FROM buyTBL) AS '총 합계'
FROM
buyTBL;

-- avg 평균값 계산
SELECT *, avg(price) AS '상품 평균 가격' 
FROM buyTBL;

SELECT *,(SELECT avg(price) FROM buyTBL) AS '평균값'
FROM buyTBL;

SELECT ceil(25.12);
SELECT round(25.56,1);
SELECT floor(25.75);

SELECT prodName, max(price)
FROM buyTBL;

SELECT prodName, min(price)
FROM buyTBL;

DROP TABLE userTBL;
DROP TABLE buyTBL;

CREATE TABLE userTBL(
	username char(3) not null, 
    birthYear int not null, 
    addr char(2) not null, 
    mobile char(10) not null,
    primary key(username)
); 

alter table userTBL modify mobile varchar(13);

CREATE TABLE buyTBL(
	username char(3) not null, 
    prodName char(3) not null, 
    price int not null, 
    amount int not null, 
    foreign key(username) references userTBL(username)
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

insert into buyTBL values('야스오', '책', 10, 3);

-- select @@global.sql_mode;
-- select @@session.sql_mode;

-- set session sql_mode='NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';

-- SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';

