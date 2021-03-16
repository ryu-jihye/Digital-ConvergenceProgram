-- 1) 사원의 이름과 직위를 출력하라 (단, 사원의 이름은 '사원이름' 직위는 '사원직위' 머리글 나오도록 출력
-- 2) 30번 부서에서 근무하는 모든 사원의 이름과 급여 출력
-- 3) 인상된 급여 출력(10% 인상), 단 사원 번호 순으로 출력
--  증가된 급여분에 대한 열 이름은 증가액
-- 4)'F'로 시작하는 모든 사원과 부서번호 출력

--1)
SELECT ENAME, JOB
FROM EMP;

--2)
SELECT DEPTNO, ENAME, SAL FROM EMP
WHERE DEPTNO = 30;

--3)
SELECT ENAME, EMPNO*(1+0.1) AS UPGRADE, EMPNO
FROM EMP;

--4) 
SELECT * FROM EMP
WHERE ENAME LIKE 'F%';


