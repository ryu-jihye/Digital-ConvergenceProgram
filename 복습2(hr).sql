-- 1) Employees 테이블에서 급여가 12000인 직원의 성과 급여 출력하기
-- 2) 부서번호가 20 혹은 50인 직원의 성과 부서번호를 성에 대하여 오름차순으로 출력하기
-- 3) 성의 세 번째에 a가 들어가는 직원의 성 출력하기

--1) 9명
SELECT first_name, salary FROM Employees
WHERE salary >= 12000;

-- 2) 47명
SELECT department_id, first_name FROM Employees
WHERE department_id = 20 OR department_id = 50
ORDER BY first_name;

-- 3) 3명
SELECT last_name FROM Employees
WHERE last_name like '__a%';