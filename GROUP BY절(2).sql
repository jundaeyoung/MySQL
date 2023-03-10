-- 1단계
SELECT *
FROM employees
GROUP BY gender;

-- 2단계
SELECT * ,count(gender)
FROM employees
GROUP BY gender;
-- 조건 2개 걸기
SELECT *, count(hire_date)
FROM employees
GROUP BY hire_date, gender;

-- 
SELECT * FROM employees;
-- 1(employees) : N(dept_emp)
SELECT * FROM dept_emp;
-- N(dept_emp) : 1(departments)
SELECT * FROM departments;

-- employees : departments --> N : M 관계 차수를 가진다.
-- 중간 테이블 dept_emp를 만들어서 N : M 관계를 표현하고 있다.

-- employees : dept_emp --> 1 : N 관계로 풀어진다.
-- departments : dept_emp --> 1 : N 관계로 풀어진다.

-- 1단계 조인해보기
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2단계 조인 하나더 추가하기
SELECT *  
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON dp.dept_no = d.dept_no;

-- 3단계 
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name  
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON dp.dept_no = d.dept_no;

-- 4단계 사용방법 연습(HAVING)
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name  
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON dp.dept_no = d.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';


SELECT * FROM departments;