select sysdate, systimestamp
from dual;
-- date : 고정된 7byte 할당, 크기는 지정x
-- tiemstamp : date의 확장형

desc emp;
select * from emp;
desc dept;
select * from dept;
desc salgrade;
select * from salgrade;

select empno from emp;

create table case (
empno number,
id varchar2(10),
code varchar2(20),
name varchar2(10),
major varchar2(10),
m_code varchar2(10)
);

insert into case (empno, id, code, name, major, m_code)
values(20190001, 'conan', '221210-1******', '코난', '철학과', 'PHI');

select * from case;

insert into case (empno, id, code, name, major, m_code)
values(20190002, 'rose', '940424-2******', '장미', '화공과', 'CME');

insert into case (empno, id, code, name, major, m_code)
values(20190003, 'ran', '9401010-2******', '미란', '경영학', 'SS');

insert into case (empno, id, code, name, major, m_code)
values(20190004, 'kid', '950606-1******', '키드', '경영학', 'BA');

select empno, id, name
from case
where major = '경영학';

drop table case;

create table u_case(
m_code  varchar2(10),
univ varchar2(30),
u_name varchar2(30)
);
desc u_case;

drop table u_case;

insert into u_case (m_code, univ, u_name)
values('PHI', '인문대학', '남도일');

insert into u_case (m_code, univ, u_name)
values('CME', '공과대학', '수현씨');

insert into u_case (m_code, univ, u_name)
values('BA', '경영경제', '브라운');

insert into u_case (m_code, univ, u_name)
values('BA', '경영경제', '브라운');

select * from u_case;

desc u_case;
desc case; 
select e.id, e.name, e.major, u.u_name
from case e, u_case u
where e.m_code  = u.m_code;

select * from emp;

select empno, ename, deptno
from emp;

select all job, deptno 
from emp; --all : 중복되는 열 제거 없이 출력

select deptno from emp;

select distinct deptno from emp; --distinct : 중복 데이터 삭제

select distinct job, deptno from emp;

-- 사원들의 연간 총수입(연봉)을 확인할 수 있도록 이름, 월급, 연봉, 커미션 출력하기
-- 연봉 : 월급* 12 + 커미션

select ename, sal, sal*12+comm as ann_sal, comm
from emp;

select empno, ename, sal, deptno
from emp
order by sal;

select empno, ename, sal, deptno 
from emp
order by sal desc;

--emp 전체 열을 부서 번호 기준 오름차순 급여 기준 내림차순으로 정렬
select * 
from emp
order by deptno asc, sal desc;

--부서번호가 30번인 부서에서 근무하는 사원들의 데이터 출력
select *
from emp
where deptno = 30;

--부서 번호가 30이고 직무가 SALESMAN인 사원정보 출력하기
select *
from emp
where deptno = 30 and job = 'SALESMAN'; --대소문자 구별함

--부서 번호가 30이거나 직무가 CLERCK인 사원 정보 출력
SELECT *
FROM EMP
WHERE DEPTNO=30 OR JOB='CLERCK';

--급여가 3000이상인 경우
SELECT *
FROM EMP
WHERE SAL>=3000;

--사원이름이 알파벳 순서대로 'FORZ'앞에 오는 사원만 조회
SELECT *
FROM EMP
WHERE ENAME<='FORZ';  

--급여가 3000이 아닌 사원의 데이터 조회
SELECT *
FROM EMP
WHERE SAL != 3000;

SELECT *
FROM EMP
WHERE NOT SAL = 3000;

--직무가 'MANAGER' 또는 'CLERCK'이거나 'SALESMAN'인 사원 조회
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
        OR JOB = 'CLERK'
        OR JOB = 'SALESMAN';
        
SELECT *
FROM EMP
WHERE JOB
IN ('MANAGER', 'SALESMAN', 'CLERK');

--직무가 'MANAGER' 도 아니고 'CLERCK'도 아니고 'SALESMAN'도 아닌 사원 조회
SELECT *
FROM EMP
WHERE JOB!='MANAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

SELECT *
FROM EMP
WHERE JOB
NOT IN('MANAGER', 'SALESMAN', 'CLERK');

--급여가 2000이상 3000이하 사원
SELECT * 
FROM EMP
WHERE SAL>= 2000 AND SAL<=3000;

SELECT *
FROM EMP
WHERE SAL
BETWEEN 2000 AND 3000;

--급여가 2000~ 3000이외의 사원 정보 조회
SELECT *
FROM EMP
WHERE SAL
NOT BETWEEN 2000 AND 3000;

-- 이름이 대문자 S로 시작하는 사원 조회
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

--이름의 두 번째 글자가 L인 사원
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

--사원이름이 AM이 포함되어 있는 사원
SELECT * 
FROM EMP
WHERE ENAME LIKE '%AM%';

--사원이름이 AM이 포함되어 있지 않은 사원
SELECT * 
FROM EMP
WHERE ENAME NOT LIKE '%AM%';

--NULL
SELECT *
FROM EMP
WHERE COMM= NULL;

--IS NULL, IS NOT NULL
SELECT * 
FROM EMP
WHERE COMM IS NULL;

SELECT * 
FROM EMP
WHERE COMM IS NOT NULL;

--직원번호, 임금, 연봉 5% 인상 추가
SELECT EMPNO, SAL, SAL*1.05 AS "5%UP_SAL"
FROM EMP;

--부서번호가 10인 사원들 데이터
SELECT *
FROM EMP
WHERE DEPTNO=10;

--사원들 이름 정보 출력하기
-- UPPER : 대문자 / LOWER : 소문자 / INITCAP : 첫 글자만 대문자
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

--대소문자 관계 없이 SMITH인 사람
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('smith');

SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%smith%');

--사원이름이 몇 글자인지 찾기
select ename, length(ename)
from emp;

--이름이 5글자 이상인 사원 출력
select ename, length(ename)
from emp
where length(ename)>=5;

--substr : 문자열 일부 추출
select job, substr(job, 1, 2), substr(job, 5)
from emp;

--substr의 시작 위치가 음수일 경우 마지막 위치부터 거슬러간 위치에서 시작
select job,
substr(job, -length(job)),
substr(job, -length(job), 2),
substr(job, -3)
from emp;

--instr : 특정 문자 위치를 찾음
select
instr('hello, orcale!', 'l') as instr_1,
instr('hello, orcale!', 'l', 5) as instr_2,
instr('hello, orcale!', 'l', 2, 2) as instr_3
from dual;

--instr함수로 사원 이름에 문자 'S'가 있는 행
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S')>0;

SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

--REPLACE : 특정 문자를 다른 문자로 대체
SELECT '010-1234-5678' AS "BEFORE",
REPLACE('010-1234-5678', '-', '') AS "AFTER1",
REPLACE('010-1234-5678', '-', '.') AS "AFTER2"
FROM DUAL;

--LPAD, RPAD 데이터의 빈 공간을 특정 문자로 채움
SELECT 'ORACLE',
LPAD('ORACLE', 10, '#') AS LPAD1,
RPAD('ORACLE', 10, '*') AS RPAD1,
LPAD('ORACLE', 10) AS LPAD2,
RPAD('OARCLE', 10) AS RPAD2
FROM DUAL;

--CONCAT : 두 문자열 데이터를 함침
--사원번호와 사원이름을 연결해 출력
SELECT 
CONCAT(EMPNO, ENAME),
CONCAT(EMPNO, CONCAT('.', ENAME))
FROM EMP
WHERE ENAME='SMITH';

--|| : 두 문자열 데이터 연결
SELECT 
EMPNO || ENAME,
EMPNO || '.' || ENAME
FROM EMP
WHERE ENAME = 'SMITH';

--TRIM, LTRIM, RTRIM : 특정 문자열 삭제
SELECT
'[' || TRIM('_ORACLE_') || ']' AS TRIM,
'[' || LTRIM('_ORACLE_') || ']' AS LTRIM,
'[' || LTRIM('<_ORACLE_>', '_<') || ']' AS LTRIM2,
'[' || RTRIM('_ORACLE_') || ']' AS RTRIM,
'[' || LTRIM('<_ORACLE_>', '>_') || ']' AS RTRIM2
FROM DUAL;

--ROUND : 특정 위치에서 반올림
SELECT
ROUND(1234.5678) AS ROUND,
ROUND(1234.5678, 0) AS ROUND_0,
ROUND(1234.5678, 1) AS ROUND_1,
ROUND(1234.5678, 2) AS ROUND_2,
ROUND(1234.5678, -1) AS ROUND_MINUS1,
ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

--TRUNC : 특정 위치에 버림
SELECT
TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 0) AS TRUNC_0,
TRUNC(1234.5678, 1) AS TRUNC_1,
TRUNC(1234.5678, 2) AS TRUNC_2,
TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

--CEIL, FLOOR : 지정한 수와 가까운 정수를 찾음
SELECT
CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14)
FROM DUAL;

--MOD: 숫자를 나눈 나머지 값
SELECT
MOD(15, 6),
MOD(10, 2),
MOD(11, 2)
FROM DUAL;

--SYSDATE : 오라클 DB서버의 현재 날짜와 시간 정보 반환
SELECT
SYSDATE AS NOW,
SYSDATE-1 AS YESERDAY,
SYSDATE-2 AS TOMORROW
FROM DUAL;

--ADD_MONTHS(몇 개월 이후의 날짜를 구함)
SELECT 
SYSDATE,
ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

--각 사원들의 사원번호, 이름, 입사일, 입사일 10주년 날짜 출력하기
SELECT
EMPNO, ENAME, HIREDATE, 
ADD_MONTHS(HIREDATE, 120) AS WORKD10YEARS
FROM EMP;

--입사일과 현재 날짜 사이의 개월 수 출력
SELECT
ENAME, HIREDATE, SYSDATE,
MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM EMP;

--NEXT_DAY : 돌아오는 요일, LAST_DAY : 달의 마지막 날짜
SELECT
SYSDATE,
NEXT_DAY(SYSDATE, '월요일'),
LAST_DAY(SYSDATE)
FROM DUAL;

--ROUND 함수
SELECT 
SYSDATE,
ROUND(SYSDATE, 'CC') AS FORMAT_CC,
ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
ROUND(SYSDATE, 'Q') AS FORMAT_Q,
ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
ROUND(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;

--TRUNC함수
SELECT
SYSDATE,
TRUNC(SYSDATE, 'CC') AS FROMAT_CC,
TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
TRUNC(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;

--형 변환 함수
SELECT EMPNO, ENAME, EMPNO+'500'
FROM EMP
WHERE ENAME='SMITH';

SELECT 
TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재
FROM DUAL;

SELECT
SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON') AS MON,
TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY') AS DY,
TO_CHAR(SYSDATE, 'DAY') AS DAY
FROM DUAL;

SELECT 
SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS MM, 
TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE=KOREAN') AS MON_KOR,
TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE="ENGLISH') AS MON_ENG
FROM DUAL;

select sal,
to_char(sal, '$999,999')as sal_$,
to_char(sal, 'l999,999')as sal_l,
to_char(sal, '999,999,00') as sal1,
to_char(sal, '000,999,999.00')as sal_2,
to_char(sal, '000999999.99')as sal_3,
to_char(sal, '999,999,00') as sal4
from emp;

select
1300 - '1500',
'1300' + 1500
from dual;

select 
to_number('1,300', '999,999') - to_number('1,500', '999,999')
from dual;

select
to_date('2020-07-07', 'yyyy-mm-dd') as to_date1,
to_date('20200707', 'yyyy-mm-dd') as to_date2
from dual;

select *
from emp
where hiredate > to_date('1981/06/01', 'yyyy-mm-dd');

select
empno, ename, sal, comm, sal+comm,
nvl(comm, 0), --comm이 null인 경우 0
sal+nvl(comm, 0) --null인 경우 0으로 대체 후 연산
from emp;

select
empno, ename, comm,
nvl2(comm, 'o', 'x'), --null이 아닐 경우, 즉 추가수당 존재 시 'o'출력
nvl2(comm, sal*12+comm, sal*12) as annsal
from emp;

--decode
--직무가 manager인 사원인 급여의 10% 인상, salesman 급여 5%, analyst 0%, 나머지 3%
select empno, ename, job, sal,
decode(job,
        'MANAGER', sal*1.1,
        'SALESMAN', SAL*1.05,
        'ANALYST', SAL, SAL*1.03) AS SALRAISE
FROM EMP;

SELECT
EMPNO, ENAME, JOB, SAL,
CASE JOB
    WHEN 'MANAGER' THEN SAL*1.1
    WHEN 'SALESMAN' THEN SAL*1.05
    WHEN 'ANALYST' THEN SAL
    ELSE SAL*1.03
END AS SALRAISE
FROM EMP;

SELECT EMPNO, ENAME, COMM,
CASE
    WHEN COMM IS NULL THEN '해당사항 없음'
    WHEN COMM = 0 THEN '수당 없음'
    WHEN COMM > 0 THEN '수당 :' || COMM
END AS COMM_TXT
FROM EMP;

--사원들의 급여 합계 구하기
SELECT
SUM(DISTINCT SAL),
SUM(ALL SAL),
SUM(SAL)
FROM EMP;

-- 사원들의 수 구하기
SELECT 
COUNT(*) AS "사원들의 수"
FROM EMP;


--부서 번호가 30번인 사원 수
SELECT
COUNT(*) AS "사원 수"
FROM EMP
WHERE DEPTNO=30;

SELECT
COUNT(DISTINCT SAL),
COUNT(ALL SAL),
COUNT(SAL)
FROM EMP;

SELECT
COUNT(COMM)
FROM EMP;

SELECT
COUNT(COMM)
FROM EMP
WHERE COMM IS NOT NULL;

--부서 번호가 10번인 사원들의 최대 급여, 최소 급여 출력하기
SELECT
MAX(SAL) AS 최대,
MIN(SAL) AS 최소
FROM EMP
WHERE DEPTNO=10;

SELECT
MAX(HIREDATE) AS 최근입사일,
MIN(HIREDATE) AS 오래된입사일
FROM EMP
WHERE DEPTNO=20;

--부서 번호가 30인 사원들의 평균 급여 출력하기
SELECT
AVG(SAL)
FROM EMP
WHERE DEPTNO=30;

--부서별 평균 급여를 부서 번호와 함께 출력
SELECT
AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

--부서의 직무별 평균 급여 출력
SELECT
DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--각 부서의 직무별 평균 급여를 구하되 그 평균 급여가 2000이상인 그룹만 출력
SELECT
DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT
DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT
DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL<=3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO , JOB;


