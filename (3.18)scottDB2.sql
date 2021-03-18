--1) 세일즈맨을 제외하고, 각 업무별 사원들의 총 급여가 3000이상인 각 업무에 대해서,
-- 업무명과 각 업무별 평균 급여를 출력하되, 평균급여의 내림차순으로 출력하라

--2) 전체 사원 가운데 직속 상관이 있는 사원의 수를 출력하시오

--3) EMP 테이블에서 이름, 급여, 커미션 금액, 총액(SAL+COMM)을 구하여 총액이 많은 순서대로
--출력하기 단 커미션이 NULL인 사람은 제외

--4) 각 부서별로 같은 업무를 한 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라

--5) 사원이 한 명도 없는 부서의 이름을 출력하라

--6) 부하직원이 없는 사원의 이름을 표시하시오


--1)
SELECT JOB, ROUND(AVG(SAL)) --업무명과 평균급여
FROM EMP 
WHERE JOB != 'SALESMAN' -- 세일즈맨이 아님
GROUP BY JOB  -- 직업 내에서 그룹핑을 함(각 업무별 사원들 내에서 작업하길 원함)
HAVING SUM(SAL) >= 3000 -- 그룹핑 내에서 조건 들어감(HAVING) : 총 급여 3000이상
ORDER BY AVG(SAL) DESC; -- 평균 급여의 내림차순

--2)
SELECT COUNT(*) -- 전체 중
FROM EMP 
WHERE MGR IS NOT NULL; -- IS NOT NULL : NULL이 아님(값 존재), MGR : 상사 값

--3)
SELECT 
ENAME, SAL, COMM, SAL+COMM AS TOTAL
FROM EMP 
WHERE COMM IS NOT NULL --커미션이 NULL인 사람 제외
ORDER BY TOTAL DESC; 

--4)
SELECT DEPTNO,JOB, COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

--5)
SELECT *
FROM EMP E, DEPT D
WHERE (E.DEPTNO(+) = D.DEPTNO) AND ENAME IS NULL;

--6)
SELECT ENAME
FROM EMP
WHERE EMPNO NOT IN 
(SELECT DISTINCT(MGR) FROM EMP WHERE MGR IS NOT NULL);

-- A) 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원 수 출력하기

-- B) 사원번호가 7400 이상 7600이하인 사원의 이름 출력

-- C) 사원의 이름과 사원의 부서 출력

-- D) 사원의 이름과 팀장의 이름 출력

-- E) 사원 BLAKE보다 급여를 많이 받는 사람의 이름 출력

-- F) 사원 BLAKE가 일하는 부서번호 혹은 DALLAS에 있는 부서 번호 출력


--1)
SELECT 
JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 4;

--2)

SELECT ENAME
FROM EMP
WHERE EMPNO >= 7400 AND EMPNO <= 7600;


--3)

SELECT
E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;


--4)
SELECT 
EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');


SELECT * FROM DEPT;

--5)??
SELECT
DEPTNO
FROM EMP,
DEPTNO
FROM DPET
WHERE EMPNO IN (SELECT EMPNO FROM EMP WHERE ENAME = 'BLAKE'),
WHERE DPETNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLS');
