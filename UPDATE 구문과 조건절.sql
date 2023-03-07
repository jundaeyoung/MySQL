-- DROP TABLE `order`;

SELECT * FROM `order`;
DESC `order`;

-- 1. id가 1인 주문의 상품 수량을 5개로 수정
UPDATE `order`
SET quantity=5
WHERE id=1;

-- 2. id가 3인 주문의 메뉴를 '감바스'로 수정
UPDATE `order`
SET product_name = '감바스'
WHERE id =3;

-- 3. id 가 5인 주문의 주문 일자를 '2022-01-05'로 수정
-- UPDATE 구문의 DATE 타입 값 입력시에는 작은 따옴표로 감싸주기
UPDATE `order`
SET order_date = 20220105
WHERE id=5;

-- 4.테이블 구조를 변경해보기(컬럼 추가 하는방법)
-- ALTER TABLE `order`
-- ADD column address VARCHAR(100);
ALTER TABLE `order`
ADD address VARCHAR(100);


-- 주문 수량이 2개 이상이고, 상품명이 '피자'인 주문의 수령인 이름을 '김철수'로 수정해주세요
UPDATE `order`
SET order_name='김철수'
WHERE quantity >= 2 
	AND product_name = '피자';

-- 주문 날짜가 '2022-02-28'이고, 상품명이 '초밥'인 주문의 주문수량을 5개로 수정
UPDATE `order`
SET quantity = 5
WHERE order_date=20220228 
	AND product_name='초밥';

-- 주문 수량이 1개 이하이고, 상품명이 '감바스'인 주문의 수령인 주소를 '경기도 성남시'로 수정
UPDATE `order`
SET address ='경기도 성남시'
WHERE quantity <= 1 
	AND product_name = '감바스';


SELECT * FROM `order`;