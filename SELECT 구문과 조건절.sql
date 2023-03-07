-- WHERE 절 사용해보기

-- student table 에서
-- 학과가 '컴퓨터공학과 ' 학생들의 이름과 학번을 조회하고 싶을 때
-- 사용하는 쿼리문을 작성해보자.
SELECT * FROM student;

SELECT student_id,name
FROM student 
WHERE major='컴퓨터공학과';

-- student
-- 1. grade가 3인 학생들 조회 하기
SELECT *
FROM student
WHERE grade = 3;

-- 2. 이름이 홍길동인 학생 조회하기
SELECT *
FROM student
WHERE name = '홍길동';

-- 3. 학번이 1부터 10까지인 학생들 조회
SELECT *
FROM student
WHERE student_id BETWEEN 1 AND 10;

-- 4. 학과가 컴퓨터 공학과이고, 학년이 2학년인 학생들만 조회해줘
SELECT *
FROM student
WHERE grade=2 AND major='컴퓨터공학과';

-- 5. 학과가 컴퓨터공학과 이거나 학년이 2학년인 학생들을 조회해주세요.
SELECT *
FROM student
WHERE major='컴퓨터공학과' OR grade=2;

-- 6. 학생이름이 홍길동이 아닌 학생들을 조회하세요.
SELECT *
FROM student
WHERE name !='홍길동';

SELECT *
FROM student
WHERE name <> '홍길동';

-- 7. 학생들의 학년이 2학년 이상인 사람들을 조회하기
SELECT *
FROM student
WHERE grade >= 2;

-- 8. 학생들의 학년이 2학년 미만인 사람들을 조회하기
SELECT *
FROM student
WHERE grade < 2;

-- 9. 학년이 1학년이거나 3학년, 4학년인 학생들을 조회하기
SELECT *
FROM student
WHERE grade IN(1,3,4);

-- DROP TABLE subject;
-- DROP TABLE customer;

SELECT*FROM subject;

-- subject TABLE 에서
-- 1. 과목 이름이 '미국사' 인 테이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE subject_name='미국사';

-- 2. 학점이 3점인 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE credit = 3;

-- 3. 국어국문학과에서 개설된 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE department='국어국문학과';

-- 4. 과목 이름이 ' 영어회화'이거나 교수명이 '이승호'인 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE  subject_name = '영어회화' OR professor='이승호';

-- 5. 과목 번호가 5보다 큰 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE subject_id > 5;

-- 6. 과목이름이 '데이터 베이스개론' 이 아닌 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE subject_name != '데이터베이스 개론';

-- 7.학과가 '컴퓨터공학과'이고 교수명이 '박철수'인 과목데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE department = '컴퓨터공학과' AND professor = '박철수';

-- 8.교수명이 '김현진'이거나 '최영식'이면서 학과가 '외국어학과'인 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE professor IN('김현진','최영식') 
	AND department='외국어학과';
-- 습관적으로 검증 쿼리를 출력해 볼수 있다.
SELECT * FROM subject 
WHERE professor='홍길동';

-- 1. 학점이 3점이고 학과가 '국어국문학과'인 과목을 출력하시오.
SELECT *
FROM subject
WHERE credit = 3 AND department = '국어국문학과';
-- 2. 교수명이 '이승호'이거나 '홍길동'이면서 학과가 '컴퓨터공학과'이면서 학점이 3점인 과목을 출력하시오.
SELECT *
FROM subject
WHERE professor IN('이승호','홍길동')
	AND department = '컴퓨터공학과'
    AND credit = 3;
-- 3. 학과가 '수학과'아니면 '국어국문학과'인 과목을 출력하시오.
SELECT *
FROM subject
WHERE department = '수학과' 
	OR department='국어국문학과';
-- 4. 아이디가 3에서 8까지의 과목을 출력하시오.
SELECT *
FROM customer
WHERE id BETWEEN 3 AND 8;

-- 5. 아이디가 3에서 8까지의 사람중 '경기도 의정부시'에 거주하고 있는 사람중 이메일을 입력한 사람을 출력하시오.
SELECT *
FROM customer
WHERE (id BETWEEN 3 AND 8) AND address = '경기도 의정부시';
;

SELECT * FROM customer;
-- 1. 강남 3구 사는 사람들을 조회(서초구,송파구,강남구)
SELECT *
FROM customer
WHERE address IN('서울시 서초구', '서울시 송파구', '서울시 강남구');
-- 2. email을 입력하지 않은 사람의 데이터를 출력하세요
SELECT *
FROM customer
WHERE email IS NULL;
-- 3. id가 5이상이며 주소가 서울시에 거주하는 사람 이름을 검색해라 
--    단, 서울시는 다음과 같은 주소가 있다  강남구, 서초구, 송파구, 강서구 종로구
SELECT *
FROM customer
WHERE id>=5 AND address LIKE '서울시%';
-- 4. email이 NULL인 사람을 조회하는 쿼리 (IS NULL 을 사용해보세요)
SELECT *
FROM customer
WHERE email IS NULL;
-- 5. 이메일이 NULL 이 아니고 주문 번호가 2번이 넘으며 종로구에 사시는분은
SELECT *
FROM customer
WHERE email IS NOT NULL AND id > 2 AND address LIKE '%종로구';
-- 6. 주소가 '서울'이면서 id가 5이하인 고객 조회하는 쿼리
SELECT *
FROM customer
WHERE address LIKE '서울%' AND id<=5;
-- 7. 서울시에 사는 고객들을 조회하는 쿼리 (LIKE 사용해보기) 
SELECT *
FROM customer
WHERE address LIKE '서울시%';
-- 8. 아이디가 3에서 8까지의 사람 중 '경기도 의정부시'에 거주하고 있는 사람 중 이메일을 입력한 사람을 출력하시오
SELECT *
FROM customer
WHERE id BETWEEN 3 AND 8 AND address='경기도 의정부시' AND email IS NOT NULL;