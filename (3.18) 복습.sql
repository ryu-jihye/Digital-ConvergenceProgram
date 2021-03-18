-- 사원의 이름과 사원의 직속상관 이름을 나란히 출력(자체조인)

SELECT
E.EMPNO, E.ENAME, E.MGR,
M.EMPNO AS MGR_NO,
M.ENAME AS MGR_NAME
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;

-- 사원의 이름과 사원의 직속상관 이름을 나란히 출력(왼쪽 외부조인)
-- 왼쪽 외부 조인 : 오른쪽에 (+) 붙이기, (+) 붙인 값이 NULL값이 나옴(M값)
SELECT
E.EMPNO, E.ENAME, E.MGR,
M.EMPNO AS MGR_NO,
M.ENAME AS MGR_NAME
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO(+);

-- 사원의 이름과 사원의 직속상관 이름을 나란히 출력(오른쪽 외부조인)
-- 오른쪽 외부 조인 : 왼쪽에 (+) 붙이기, (+) 붙인 값이 NULL값이 나옴(E값)
SELECT
E.EMPNO, E.ENAME, E.MGR,
M.EMPNO AS MGR_NO,
M.ENAME AS MGR_NAME
FROM EMP E, EMP M
WHERE E.MGR(+) = M.EMPNO;

-- 두 테이블에서 이름과 자료형이 같은 열을 찾은 다음, 그 열을 기준으로 등가조인
SELECT
E.EMPNO, E.ENAME, E.JOB, E.MGR,
E.HIREDATE, E.SAL, E.COMM,
DEPTNO,
D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

-- 급여가 3000이상인 사원들의 정보와 근무 부서 정보 출력하기(JOIN ~ USING)
SELECT
E.EMPNO, E.ENAME, E.JOB, E.MGR,
E.HIREDATE, E.SAL, E.COMM,
DEPTNO,
D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING(DEPTNO)
ORDER BY DEPTNO, E.EMPNO;

-- 급여가 3000이상인 사원들의 정보와 근무 부서 정보 출력하기(JOIN ~ ON)
SELECT
E.EMPNO, E.ENAME, E.JOB, E.MGR,
E.HIREDATE, E.SAL, E.COMM,
E.DEPTNO,
D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON(E.DEPTNO=D.DEPTNO)
WHERE SAL >= 3000
ORDER BY E.DEPTNO, EMPNO;

-- JONES보다 급여가 높은 사원 조회하기(서브쿼리)
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
            FROM EMP
            WHERE ENAME = 'JONES');
            
--BLAKE보다 입사가 빠른 사원 목록 조회
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'BLAKE');
                  
-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
-- 사원 정보와 소속 부서 정보를 함께 조회

SELECT
E.EMPNO, E.ENAME, E.JOB, E.SAL,
D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
        AND E.DEPTNO = 20
        AND SAL > (SELECT AVG(SAL) FROM EMP);
        

-- 다중행 서브 쿼리
-- 각 부서별 최고 급여를 받는 사원 조회하기
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO); -- 각 부서로 묶음
              
SELECT *
FROM EMP
WHERE SAL = ANY (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);
              
SELECT *
FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);
              

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE SAL < ANY(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

SELECT *
FROM EMP
WHERE SAL < SOME(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

SELECT *
FROM EMP
WHERE SAL < ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;


--부서번호가 30번인 사원들의 최대 급여보다 더 많이 받는 사원 출력하기
SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30);

-- EXISTS                
SELECT * 
FROM EMP
WHERE EXISTS (SELECT ENAME
              FROM EMP
              WHERE DEPTNO = 10);
              
-- 인라인뷰
SELECT E.EMPNO, E.ENAME, E.DEPTNO,
D.DNAME, D.LOC
FROM 
(SELECT * FROM EMP WHERE DEPTNO = 10) E,
(SELECT * FROM DEPT) D
WHERE E.DEPTNO = D.DEPTNO;

--FROM
WITH 
E AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E.EMPNO, E.ENAME, E.DEPTNO,
D.DNAME, D.LOC
FROM E, D
WHERE D.DEPTNO = E.DEPTNO;

-- 스칼라서브쿼리
SELECT 
    EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO,
    (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;
