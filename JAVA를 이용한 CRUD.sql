
DESC employees;

SELECT * FROM employees
WHERE emp_no = 10002;

SELECT * FROM buyTBL;
SELECT * FROM userTBL;

DESC buyTBL;	
DESC userTBL;

INSERT INTO 
	userTBL(username, birthYear,addr, mobile)
VALUES ('티모', '2000', '대구','010-1234-1234');

INSERT INTO
	buyTBL(username,prodName,price,amount)
VALUES ('티모','사과',20000,1);

SELECT * FROM userTBL;
UPDATE userTBL 
	SET birthYear = '1999', addr = '천안',
		mobile = '010-2222-2222'
	WHERE username = '야스오';

DELETE FROM buyTBL
WHERE username = '티모';
DELETE FROM userTBL
WHERE username = '티모';

-- 구매 테이블에 데이터 입력할때 유저 테이블에 이름이
-- 없으면 입력 안됨!!
-- 삭제 할때도 마찬가지이다.
-- 자식테이블에 데이터를 먼저 삭제하고 
-- 부모테이블에 정보를 삭제할 수 있다.
SELECT * FROM userTBL;
SELECT * FROM buyTBL;

UPDATE buyTBL
SET price =1000
WHERE username ='뉴진스'; 

DELETE From buyTBL
WHERE username = '뉴진스';

