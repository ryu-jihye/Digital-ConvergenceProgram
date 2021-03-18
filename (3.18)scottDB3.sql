--1) 전체 사원 중 ALLEN과 직무가 같은 사원들의 사원정보(직무, 사원정보, 사원 이름, 급여)와
-- 부서 정보(부서 번호, 부서 이름)을 출력하기

SELECT --??
E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM 
(SELECT JOB FROM EMP WHERE ENAME = 'ALLEN') E,
(SELECT * FROM DEPT) D
WHERE E.EMPNO = D.DEPTNO;




--2) 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원 정보, 부서 정보, 급여 등급 정보 출력하기
-- 급여가 많은 순으로 정렬하되, 급여가 같을 경우 사원번호를 기준으로 오름차순 정렬, 정보는 출력된 열을 확인

SELECT E.EMPNO, E.ENAME, E.HIREDATE, E.SAL, D.DNAME,  D.LOC --??
FROM
(SELECT SAL FROM EMP WHERE SAL > AVG(SAL)) E,
(SELECT * FROM DEPT) D
WHERE E.EMPNO = D.DEPTNO
ORDER BY EMPNO ASC;

--1) 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의
-- 사원 정보, 부서 정보를 다음과 같이 출력하기

SELECT *
FROM DEPT
WHERE DEPTNO NOT IN 
            (SELECT DEPTNO 
            FROM EMP
            GROUP BY DEPTNO
            HAVING COUNT(*) > 0);


--2) 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의
-- 사원정보, 급여 등급 정보를 다음과 같이 출력
SELECT EMPNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO = 30);
             
             
             
-- 1) 이번분기에 60번 IT부서에서는 신규 프로그램을 개발하고 보급하여 회사에 공헌함
-- 이에 해당 부서의 사원 급여를 12.3% 인상하기로 함
-- 60번 IT부서 사원의 급여를 12.3% 인상하여 정수만(반올림) 표시하는 보고서 작성하라
-- 보고서는 사원정보, 성과 이름(NAME으로 별칭), 급여, 인상된 급여(INCREASE SALARY)순으로 출력

SELECT --??
EMPNO, CONCAT(FIRST_NAME, LAST_NAME) AS NAME, SALARY,
DECODE(DEPTNO, 60, SAL*1.123, SAL)
FROM EMP;



--2) 각 사원의 성(LAST_NAME)이 's'로 끝나는 사원의 이름과 업무를 아래의 예와 같이 출력하고자 함
-- 출력 시 이름(fist_name)과 성(last)name)은 첫 글자가 대문자, 업무는 모두 대문자로 출력하고
-- 머리글은 Employee JOBs.로 표시하시오
--얘) MIchael Rogers is a ST_CLERK


SELECT E.EMPNO, E.ENAME, D.DNAME,
    E.HIREDATE, D.LOC, E.SAL, S.GRADE 
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO AND (E.SAL BETWEEN LOSAL AND HISAL)
    AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;


