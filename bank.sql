CREATE DATABASE bank;
USE bank;

-- 유저 테이블 설계 해보기
CREATE TABLE user_tb(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);
-- 사용자의 계좌 정보 테이블 설계
CREATE TABLE account_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    balance BIGINT NOT NULL COMMENT '계좌잔액',
    user_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- 입금 내역 저장
-- 출금 내역 저장
-- 사용자간 이체 내역 저장

-- 사용자들에 history 테이블 설계
-- BIGINT 데이터 크기는 8byte 크기에 정수형
-- 조(10에 12승) -- 경(10에 16승) -- 해(10에 20승)
-- 자(10에 24승) -- 양(10에 28승)
CREATE TABLE history_tb(
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '거래 내역',
    amount BIGINT NOT NULL COMMENT '거래 금액',
    w_account_id INT COMMENT '출금 계좌 id',
    d_account_id INT COMMENT '입금 계좌 id',
    w_balance BIGINT COMMENT '출금 요청된 계좌에 잔액',
    d_balance BIGINT COMMENT '입급 요청된 계좌에 잔액',
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

SELECT * FROM user_tb;
INSERT INTO user_tb(username, password, fullname, created_at) values('길동', '1234',
'고', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('둘리', '1234',
'애기공룡', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('콜', '1234',
'마이', now());

SELECT * FROM account_tb;
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('1111', '1234', 900, 1, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('2222', '1234', 1100, 2, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('333', '1234', 0, 3, now());


SELECT * FROM history_tb;
-- 히스토리 추적 내용 ( 이체 , 입급, 출금 )
-- 히스토리 테이블에 insert 구문을 작성
-- 이체 내역을 기록 ( 1번계좌에서 2번 계좌에 100원을 이체한다.)
INSERT INTO history_tb(amount,w_balance,d_balance,
                     w_account_id, d_account_id,created_at)
VALUES
	(100,900,1100,1,2,now());
-- 출금 내역 (1번 계좌에서 100원을 출금 처리)
INSERT INTO history_tb(amount,w_balance,d_balance,
                     w_account_id, d_account_id,created_at)
VALUES
	(100,800,NULL,1,NULL,now());
-- 입금 내역 ( 1번 계좌에 500원 입급 처리)
INSERT INTO history_tb(amount,w_balance,d_balance,
                     w_account_id, d_account_id,created_at)
VALUES
	(500,NULL,700,NULL,1,now());
    
-- 출금 내역 ( 3번이 1000원 출금, 잔액은 0 원인 상태를 거래내역 기록 )
INSERT INTO history_tb(amount,w_balance,d_balance,
                     w_account_id, d_account_id,created_at)
VALUES
	(1000,1000,NULL,3,NULL,now());
    
    
-- 이체 연습
INSERT INTO history_tb(amount,w_balance,d_balance,
                     w_account_id, d_account_id,created_at)
VALUES
	(100,1200,0,1,3,now());



-- 출금기록중 800원을 출금한 기록이 
-- 있는 고객의 이름과 잔액을 출력하시오.
SELECT u.username, a.balance
FROM user_tb AS u
JOIN account_tb AS a
ON u.id=a.id
WHERE u.id 
IN(SELECT w_account_id
FROM history_tb
WHERE w_balance='800');


-- 이체 연습
-- 입급 연습
-- 출금 연습
-- 1. user_tb의 아이디가 1인 유저의 모든 출금 
--     history 뽑아라
SELECT * FROM history_tb
WHERE w_account_id IN (SELECT id FROM user_tb
WHERE id = 1);

SELECT * FROM history_tb
WHERE d_account_id IN (SELECT id FROM user_tb
WHERE fullname = '고'AND username='길동');

-- 출금한 기록이 있는 계좌를 가진 고객의
--  이름(username)들을 출력하시오.
SELECT username FROM user_tb
WHERE id IN(
SELECT id FROM history_tb
);
    
-- history_tb 에서 계좌 id 1번인 입금 내역 만드시오 
SELECT id, amount ,d_account_id FROM history_tb
WHERE d_account_id=1;
-- history_tb 에서 계좌 id 1번인 출금 내역 만드시오
SELECT id, amount, w_account_id 
FROM history_tb
WHERE w_account_id=1;
-- history_tb 에서 계좌 id 1번인 입출금 쿼리를 만드시오 
SELECT id, amount, w_account_id,d_account_id
FROM history_tb
WHERE w_account_id=1 OR d_account_id=1;
    
SELECT * FROM user_tb;
SELECT * FROM history_tb;
SELECT * FROM account_tb;

SELECT h.d_account_id,h.d_balance,a.number
FROM history_tb AS h
JOIN account_tb AS a
ON a.user_id = h.d_account_id;

SELECT h.w_account_id,h.w_balance,a.number
FROM history_tb AS h
JOIN account_tb AS a
ON a.user_id = h.w_account_id;

-- 2023년 4월 14일에 고길동의 출금내역을 출력하라
SELECT h.created_at FROM user_tb AS u
JOIN history_tb AS h
ON u.id= h.w_account_id
WHERE h.created_at LIKE '2023-04-14 %';
