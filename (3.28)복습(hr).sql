--성이 'JOHN'인 사원의 근무일수 출력
SELECT * FROM EMPLOYEES;

SELECT HIRE_DATE, ROUND((SYSDATE-HIRE_DATE)*30, 1) AS "근무일수"
FROM EMPLOYEES
WHERE FIRST_NAME = 'JOHN';

--모든 사원이 근무한 지 몇 주가 지났는지 출력
SELECT LAST_NAME AS "이름", ROUND((SYSDATE-HIRE_DATE)*30, 1) AS "근무일수",
ROUND((SYSDATE-HIRE_DATE)*30/7, 1) AS "근무 한 주"
FROM EMPLOYEES
ORDER BY LAST_NAME, ROUND((SYSDATE-HIRE_DATE)/7, 1);

--각 부서별로 실적에 따라 급여를 다르게 인상하는데 20번과 30번 부서는 각각 5, 15% 인상하고
--나머지 부서는 동결할 경우 급여를 출력

SELECT DEPARTMENT_ID, 
CASE DEPARTMENT_ID WHEN 20 THEN SALARY*1.05
                    WHEN 30 THEN SALARY*1.15
    ELSE SALARY*1
    END "급여"
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

--사원의 이름과 매니저 사번을 출력하시오
SELECT CONCAT(E.FIRST_NAME, E.LAST_NAME) AS "사원 이름",
CONCAT(M.FIRST_NAME, M.LAST_NAME) AS "매니저 이름"
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID = M.DEPARTMENT_ID;

--매월 1, 3주 토요일은 휴무이다 현재 월의 휴무일을 출력하라
SELECT NEXT_DAY(TRUNC(SYSDATE, 'MONTH'), '토요일') "1번째 휴무일",
        NEXT_DAY(TRUNC(SYSDATE, 'MONTH'), '토요일') + 14 "2번째 휴무일"
FROM EMPLOYEES;

--10번 부서의 이름과 그 부서에서 그 근무하는 사원의 이름을 출력하시오
SELECT  CONCAT(E.FIRST_NAME, E.LAST_NAME) AS "사원 이름", D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND D.DEPARTMENT_ID = 10;
    
--2500번 지역의 이름과 그 곳에 있는 부서의 이름 출력
SELECT L.STREET_ADDRESS AS "지역이름", D.DEPARTMENT_NAME AS "부서이름"
FROM LOCATIONS L, DEPARTMENTS D
WHERE L.LOCATION_ID = D.LOCATION_ID
AND L.LOCATION_ID = 2500;
