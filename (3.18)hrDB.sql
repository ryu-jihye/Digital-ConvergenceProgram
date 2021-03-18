-- 1) 모든 사원은 직속 상사 및 직속 직원을 갖는다 단, 최상위 또는 최하위 직원은
-- 직속 상사 및 직원이 없다. 소속된 사원들 중 어떤 사원의 상사로 근무 중인 
-- 사원의 총 수를 출력하라

SELECT COUNT(DISTINCT MANAGER_ID) "COUNT MANAGERS"
FROM EMPLOYEES;

SELECT COUNT(E.MANAGER_ID)
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.EMPLOYEE_ID = M.EMPLOYEE_ID;


-- 2) 각 사원이 소속된 부서별로 급여 합계, 급여 평균, 급여 최댓값, 급여 최솟값을 집계함
-- 계산된 출력값은 여섯 자리와 세 자리 구분기호, $표시와 함께 아래와 같이 출력하라
-- 단 부서에 소속되지 않은 사원에 대한 정보는 제외하고, 출력 시 다음처럼 별칭 처리하라
-- (별칭들 : DEPARTMENT_ID, SUM_SALARY, AVG_SALARY, MAX_SALARY, MIN SALARY)



--1) 같은 직무를 하는 사람의 수 세어보기

--2) 급여의 최댓값과 최솟값의 차이를 구하기

--3) Toronto에서 일하는 직원의 성, 직무, 부서번호, 부서이름 출력하기

--4) 성이 Matos와 Taylor인 직원의 성, 직무 아이디, 입사일을 입사일 기준 오름차순으로 출력하기

--5) 1994년에 입사한 사원들의 성, 입사일 출력하기


--1) 
SELECT 
DEPARTMENT_ID, JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

--2)
SELECT
MAX(SALARY) - MIN(SALARY) AS 급여차이
FROM EMPLOYEES;

--3) ????
SELECT E.LAST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Toronto');
                         
--4)  ??
SELECT
LAST_NAME, EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%Matos%' || '%Talyor%';

--5) ???
SELECT 
LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE TO_NUMBER('1994');


