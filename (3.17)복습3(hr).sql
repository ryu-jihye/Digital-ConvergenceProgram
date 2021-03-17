

-- A) 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력하시오
--    열 이름은 각각 MAX, MIN, SUM , AVG로 하고 소수점 이하는 반올림 하여 정수로 출력

-- B) 업무이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오 열 이름은 각각
--    '업무'와 '업무별 사원수'로 출력

-- C) 사원의 최대 급여와 최소 급여의 차액을 출력하기

-- D) 30번 부서의 구성원 수와 사원들 급여의 합계와 평균을 출력

-- E) 평균 급여가 가장 높은 부서의 번호를 출력


-- A) 
SELECT 
MAX(SALARY) AS MAX,
MIN(SALARY) AS MIN,
SUM(DISTINCT SALARY) AS SUM,
ROUND(AVG(DISTINCT SALARY), 0) AS AVG
FROM EMPLOYEES;

-- B)
SELECT
COUNT(DISTINCT JOB_ID) AS 업무,
COUNT(JOB_ID) AS "업무별 사원수"
FROM EMPLOYEES
GROUP BY JOB_ID; --업무별로 동일한 업무를 하는 사람 수가 나옴

-- C) 
SELECT 
(MAX(SALARY) - MIN(SALARY)) AS 차액
FROM EMPLOYEES;

-- D)
SELECT
COUNT(*),
SUM(DISTINCT SALARY),
AVG(DISTINCT SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

-- E)평균 급여가 가장 높은 부서의 번호를 출력
SELECT 
ROUND(AVG(SALARY)) AS "AVG", DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY "AVG" DESC;


-- 1) 현재 날짜 타입을 함수를 통해 확인하고, 2006년 05월 20일부터 2007년 05월 20일 사이에
-- 고용된 사원들의 이름(FIRST_NAME)과 성(Name)으로 별칭, 업무(JOB_ID), 입사일(HIRE_DATE)을 출력하시오
-- 단 입사일이 빠른 순으로 정렬하시오(18행)

-- 2) 모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다. 보고서의 사원의 이름과 성(Name으로 별칭),
-- 급여, 수당여부에 따른 연봉을 포함하여 출력하시오
-- 수당여부는 수당이 있으면 "Salary + Commission", 수당이 없으면 "Salary only'라고 표시하고
-- 볖칭은 적절히 붙이시오. 또한 출력시 연봉이 높은 순으로 정렬하시오(107행)

-- 3) 모든 사원의 이름과 성(Name으로 별칭), 입사일 그리고 입사일이 어떤 요일이었는지 출력하시오
--  이때 주(week)의 시작인 일요일부터 출력되도록 정렬하시오(107행)


--1)
SELECT HIRE_DATE FROM EMPLOYEES; --날짜 21/03/17로 표시

SELECT 
CONCAT(FIRST_NAME, LAST_NAME) AS NAME,
JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('2006-05-20', 'YYYY-MM-DD') AND
TO_DATE('2007-05-20', 'YYYY-MM-DD')
ORDER BY HIRE_DATE;

--2)
SELECT
CONCAT(FIRST_NAME, LAST_NAME) AS NAME,
SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT, TO_CHAR(SALARY + (SALARY*COMMISSION_PCT)), 'SALARY ONLY') AS RESULT_SALARY --TO_CHAT 이용 이유 : COMMSSION_PCT에는 NULL값도 존재
FROM EMPLOYEES
ORDER BY SALARY DESC;

--3) 
SELECT
CONCAT(FIRST_NAME, LAST_NAME) AS NAME,
HIRE_DATE,
TO_CHAR(HIRE_DATE, 'DAY') AS 요일 --TO_CHAR : 숫자, 날짜를 문자형으로 바꿈
FROM EMPLOYEES
ORDER BY TO_CHAR(HIRE_DATE, 'D');
