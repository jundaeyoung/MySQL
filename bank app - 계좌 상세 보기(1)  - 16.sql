
-- 1. 1111
-- 1번 계좌의 출금 내역이다.
SELECT * 
FROM history_tb 
WHERE w_account_id =1; 
-- 1번 계좌의 입금 내역이다.
SELECT * 
FROM history_tb 
WHERE d_account_id =1; 

-- 1번 계좌 입금 내역에 계좌 번호 정보 까지 결과 집합 만들기
SELECT h.id, h.amount,
h.d_balance, a.number, h.created_at
FROM history_tb AS h
JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE h.d_account_id=1;

-- 1번 계좌의 출금 내역 뽑기
SELECT h.id, h.amount,
h.w_balance, a.number, h.created_at
FROM history_tb AS h
JOIN account_tb AS a
ON h.w_account_id = a.id
WHERE h.w_account_id=1;



-- 2단계
-- 1번 계좌 출금 내역
SELECT h.id, h.amount, h.w_balance, 
		wa.number AS sender,
        ifnull(h.d_account_id,'ATM') AS receiver
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.w_account_id=1;


select h.id, h.amount, h.w_balance,
	   wa.number as sender,
       ifnull(h.d_account_id, 'ATM') as receiver, 
       da.number 
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
left join account_tb as da
on h.d_account_id = da.id 
where h.w_account_id = 1; 

-- 1번계좌의 입금 내역을 위와 같이 뽑아주세요.
SELECT h.id, h.amount, h.d_balance,  h.created_at,
		da.number AS receiver,
        ifnull(h.w_account_id,'ATM') AS sender
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
WHERE h.d_account_id=2;


SELECT h.id, h.amount, h.d_balance,  
		da.number AS receiver,
        ifnull(h.w_account_id,'ATM') AS sender,
        wa.number,
        h.created_at
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id=1;

-- 출금내역 + 입금내역
-- d_account_id 표시 하기 --> 계좌 번호도 표기 
-- 1번 계좌 출금 내역 
select h.id, h.amount, h.w_balance,
	   wa.number as sender,
       ifnull(h.d_account_id, 'ATM') as receiver, 
       da.number 
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
left join account_tb as da
on h.d_account_id = da.id 
where h.w_account_id = 1; 

--------------------------------------------------------------------

-- 1번 계좌에 입금 내역 + 이체시 출금한 사람에 계좌 번호 출력하기 
select h.id, h.amount, h.d_balance, h.created_at,
	   da.number as recevier,
       ifnull(h.w_account_id, 'ATM') as sener, 
       wa.number 
from history_tb as h 
left join account_tb as da
on h.d_account_id = da.id 
left join account_tb as wa 
on h.w_account_id = wa.id
where h.d_account_id = 1;

-- 1번 계좌에 입금 내역 + 이체시 출금한 사람에 계좌 번호 출력하기 
select h.id, h.amount, h.d_balance, h.created_at,
	   da.number as recevier,
       ifnull(h.w_account_id, 'ATM') as sener, 
       wa.number 
from history_tb as h 
left join account_tb as da
on h.d_account_id = da.id 
left join account_tb as wa 
on h.w_account_id = wa.id
where h.d_account_id = 1;

-- 입출금 동시에 출력
select h.id, h.amount, h.d_balance, h.created_at,
	   da.number as recevier,
       ifnull(h.w_account_id, 'ATM') as sener, 
       wa.number 
from history_tb as h 
left join account_tb as da
on h.d_account_id = da.id 
left join account_tb as wa 
on h.w_account_id = wa.id
where h.d_account_id = 1 or h.w_account_id=1;


-- 입금 내역 : 쿼리 결정
SELECT h.id, h.amount, h.d_balance AS balance,
	   h.created_at,
       ifnull(wa.number,'ATM') AS sender,
       da.number AS receiver
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1;

-- 출금 내역
select h.id, h.amount, h.w_balance as balance, h.created_at,
	   ifnull(da.number, 'AMT') as recevier, 
       wa.number as sender 
from history_tb as h 
left join account_tb as wa
on h.w_account_id = wa.id 
left join account_tb as da 
on h.d_account_id = da.id 
where h.w_account_id = 1;

-- 입출금 내역
select h.id, h.amount, h.w_balance as balance, h.created_at,
	   ifnull(da.number, 'AMT') as receiver, 
       wa.number as sender 
from history_tb as h 
left join account_tb as wa
on h.w_account_id = wa.id 
left join account_tb as da 
on h.d_account_id = da.id 
where h.w_account_id = 1 OR h.d_account_id =1;

-- CASE WHEN THEN END
SELECT h.id, h.amount, 
	CASE WHEN h.w_account_id = 1 THEN (h.w_balance)
		 WHEN h.d_account_id = 1 THEN (h.d_balance)
         END AS balance,
         ifnull(wa.number,'ATM') AS sender,
         ifnull(da.number,'ATM') AS receiver,
         h.created_at
FROM history_tb AS h 
LEFT JOIN account_tb AS da 
ON h.d_account_id = da.id 
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id 
WHERE h.w_account_id = 1 OR h.d_account_id =1;

SELECT * FROM account_tb;
SELECT * FROM user_tb;
SELECT * FROM history_tb;

