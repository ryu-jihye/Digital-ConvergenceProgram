--1)
SELECT JOB, AVG(SAL)
FROM EMP
WHERE JOB != 'SALESMAN'
GROUP BY JOB
HAVING SUM(SAL) >= 3000
ORDER BY AVG(SAL) DESC;


--2)
SELECT 
COUNT(*)
FROM EMP
WHERE MGR != NULL;

--3)
SELECT
ENAME, SAL, COMM, (SAL+COMM) AS ALLSAL
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY ALLSAL DESC;

--4)
SELECT
DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--5)
SELECT *
FROM EMP E, DEPT D
WHERE (D.DEPTNO = E.DEPTNO(+)) AND ENAME IS NULL;
-- (D.DEPTNO(+) = E.DEPTNO) : 결과 X
-- AND ENAME과 EMPNO 둘 다 가능

--A)
SELECT
JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 4; --COUNT(JOB)으로 해도 됨

-- B)
SELECT
EMPNO, ENAME
FROM EMP
WHERE EMPNO BETWEEN 7400 AND 7600;
-- WHERE BETWEEN EMPNO >= 7400 AND EMPNO <= 7600 (X)
-- WHERE EMPNO BETWEEN 7400 AND 7600

-- C)
SELECT 
E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- D) ★
SELECT
E.ENAME,
D.ENAME AS MGR_NAME
FROM EMP E, EMP D
WHERE E.MGR = D.EMPNO;



---------------------------------------- 3/19 강의 중 문제

-- 1) 추가수당을 받는 사원 수와 받지 않는 사원 수 출력하기

SELECT
NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*)
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

-- 2) 입사년도를 기준으로 인원수 출력하기 
 
SELECT 
TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE,'YYYY');

-- 3) 같은 직책에 근무하는 사원이 3명 이상인 직책과 인원 수 출력하기

SELECT 
JOB, COUNT(MGR)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- 4) EMPNO열에는 사원 이름이 다섯 글자 이상이며 여섯 글자 미만인 사원 정보 출력
-- MASKING_EMPNO 열에는 사원 번호 앞 두 자리 수를 제외한 나머지는 '*'로 출력
-- MASKING_ENAME열에는 사원 이름 첫 글자만 보여주고 나머지 수 만큼 '*'로 출력

SELECT
EMPNO,RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKIGN_EMPNO, ENAME,
RPAD(SUBSTR(ENAME,1,1),4,'*') AS MASKING_NAME
FROM EMP
WHERE LENGTH(ENAME)=5;



--5) 사원들의 월 평균 근무일 수는 21.5일이고, 하루 8시간 근무를 기준으로 하여
-- 하루 급여와 시급 계산하여 출력하기
-- 단 출력 결과를 확인하여 적절한 반올림 처리

SELECT 
EMPNO, ENAME, SAL, ROUND((SAL/21.5),1) AS DAY_PAY, ROUND((SAL/21.5/8),1) AS TIME_PAY 
FROM EMP; 

-- 6) 사원들은 입사일을 기준으로 3개월이 지난 후 첫 요일에 정직원이 된다
-- 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 출력하고 추가수당(COMM)이
-- 없는 사원의 추가 수당은 N/A로 출력

SELECT 
EMPNO,ENAME,
TO_CHAR(ADD_MONTHS(HIREDATE,3),'YYYY-MM-DD') AS R_JOB, 
NVL2(COMM,TO_CHAR(COMM),'N/A') AS "EXIST_COMM"
FROM EMP; 



--7) 사원들을 대상으로 직속 상관의 사원번호를 다음과 같은 기준으로 변환해서 CHG_MGR열에 출력하기
-- 상관 사번이 없을 경우 : 0000
-- 상관 번호 앞자리가 75일 경우 : 5555
-- 상관 번호 앞자리가 76일 경우 : 6666
-- 상관 번호 앞자리가 77일 경우 : 7777
-- 상관 번호 앞자리가 78일 경우 : 8888
-- 그 외 : 상관 번호 그대로 출력

SELECT DISTINCT
EMPNO,ENAME, NVL(TO_CHAR(MGR),' ') AS MGR, 
CASE 
WHEN MGR IS NULL THEN 0000
WHEN MGR LIKE '75%' THEN 5555
WHEN MGR LIKE '76%' THEN 6666
WHEN MGR LIKE '77%' THEN 7777
WHEN MGR LIKE '78%' THEN 8888
ELSE MGR 
END AS TEST
FROM EMP;


----------------------------------------

-- 다음의 열 구조를 가지는 EMP_EX 테이블 생성하기

CREATE TABLE EMP_EX(
EMPNO   NUMBER(4),
ENAME   VARCHAR2(10),
JOB     VARCHAR2(9),
MGR     NUMBER(4),
HIREDATE  DATE,
SAL     NUMBER(7,2),
COMM    NUMBER(7,2),
DEPTNO  NUMBER(2)
);

-- 테이블에 BIGO(가변형 문자열, 길이 20) 추가

ALTER TABLE EMP_EX
ADD BIGO VARCHAR2(20);

DESC EMP_EX;

-- BIGO열 크기를 30으로 변경

ALTER TABLE EMP_EX
MODIFY BIGO VARCHAR2(30);

DESC EMP_EX;

-- BIGO열 이름을 비고로 변경

ALTER TABLE EMP_EX
RENAME COLUMN BIGO TO 비고;

DESC EMP_EX;

SELECT * FROM EMP_EX;

-- EMP_EX 테이블에 EMP테이블 데이터를 모두 저장하기(비고열은 NULL) -> 확인
--> 서브쿼리 이용하기
-- 테이블은 준비됨 -> INSERT만 함(P.8, 원하는 데이터 꺼내와서 다시하기)

SELECT * FROM EMP;

INSERT INTO EMP_EX
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, 
NULL FROM EMP;

SELECT * FROM EMP_EX;