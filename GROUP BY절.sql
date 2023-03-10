use employees;

show TABLES;

SELECT * FROM salaries
limit 10;

SELECT *
FROM salaries
GROUP BY emp_no
HAVING emp_no = 10001;

-- GROUB BY에 조건절을 사용할때는 HAVING 절을 사용한다.
-- 2단계
SELECT *, count(salary)
FROM salaries
GROUP BY emp_no;

-- 3단계 (max, min)
SELECT *, count(salary) AS count,
		  max(salary)AS MAX,
		  min(salary) AS MIN,
          sum(salary) AS SUM,
          round(avg(salary),2) AS avg
FROM salaries
GROUP BY emp_no;

-- 두문제 생성, 직접 쿼리 출력

SELECT * FROM salaries;
SELECT * FROM titles;

-- emp_no로 그룹을 나누고 title table에서 title과 
-- salaries table에서 salary를 출력하라.
SELECT s.emp_no,t.title, s.salary
FROM salaries AS s
JOIN titles AS t
ON s.emp_no = t.emp_no
GROUP BY emp_no;


-- 위에서 출력한값에서 연봉이 65000원 이상인 사람만 출력하라.
-- (몇명인지도 출력)
SELECT s.emp_no,t.title, s.salary,
count(s.salary) AS count
FROM salaries AS s
JOIN titles AS t
ON s.emp_no = t.emp_no
GROUP BY emp_no
HAVING salary>65000;


-- 문제 만들어 보기 
-- 3. Engineer(시니어, 어시스턴트, 일반 모두 포함)이라는 직책을 가진 사원들의 최고 연봉을 출력해라
SELECT s.emp_no,t.title, s.salary,
max(s.salary) AS max
FROM salaries AS s
JOIN titles AS t
ON s.emp_no = t.emp_no
GROUP BY title
HAVING title IN('Senior Engineer','Engineer','Assistant Engineer');

-- 4. 각 부서에는 몇 명이 있는지 출력해보자
SELECT dp.dept_name, count(d.emp_no) AS count
FROM dept_emp AS d
JOIN departments AS dp
ON d.dept_no = dp.dept_no
GROUP BY d.dept_no;

-- 5. 각 직급 별로 몇 명이 있는지 출력해보자
SELECT t.title, count(title)AS count
FROM titles AS t
JOIN employees AS e
ON t.emp_no = e.emp_no
GROUP BY title;

-- d003 부서 소속 매니저 사원 중 가장 높은 연봉과 
-- 월급의 평균값 출력
SElECT * FROM salaries;
SELECT * FROM dept_manager;

SELECT m.dept_no,MAX(s.salary), round(avg(s.salary/12))
FROM salaries AS s
JOIN dept_manager AS m
ON s.emp_no = m.emp_no
GROUP BY dept_no
HAVING dept_no = 'd003';