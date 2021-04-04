select sysdate, systimestamp
from dual;
-- date : ������ 7byte �Ҵ�, ũ��� ����x
-- tiemstamp : date�� Ȯ����

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
values(20190001, 'conan', '221210-1******', '�ڳ�', 'ö�а�', 'PHI');

select * from case;

insert into case (empno, id, code, name, major, m_code)
values(20190002, 'rose', '940424-2******', '���', 'ȭ����', 'CME');

insert into case (empno, id, code, name, major, m_code)
values(20190003, 'ran', '9401010-2******', '�̶�', '�濵��', 'SS');

insert into case (empno, id, code, name, major, m_code)
values(20190004, 'kid', '950606-1******', 'Ű��', '�濵��', 'BA');

select empno, id, name
from case
where major = '�濵��';

drop table case;

create table u_case(
m_code  varchar2(10),
univ varchar2(30),
u_name varchar2(30)
);
desc u_case;

drop table u_case;

insert into u_case (m_code, univ, u_name)
values('PHI', '�ι�����', '������');

insert into u_case (m_code, univ, u_name)
values('CME', '��������', '������');

insert into u_case (m_code, univ, u_name)
values('BA', '�濵����', '����');

insert into u_case (m_code, univ, u_name)
values('BA', '�濵����', '����');

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
from emp; --all : �ߺ��Ǵ� �� ���� ���� ���

select deptno from emp;

select distinct deptno from emp; --distinct : �ߺ� ������ ����

select distinct job, deptno from emp;

-- ������� ���� �Ѽ���(����)�� Ȯ���� �� �ֵ��� �̸�, ����, ����, Ŀ�̼� ����ϱ�
-- ���� : ����* 12 + Ŀ�̼�

select ename, sal, sal*12+comm as ann_sal, comm
from emp;

select empno, ename, sal, deptno
from emp
order by sal;

select empno, ename, sal, deptno 
from emp
order by sal desc;

--emp ��ü ���� �μ� ��ȣ ���� �������� �޿� ���� ������������ ����
select * 
from emp
order by deptno asc, sal desc;

--�μ���ȣ�� 30���� �μ����� �ٹ��ϴ� ������� ������ ���
select *
from emp
where deptno = 30;

--�μ� ��ȣ�� 30�̰� ������ SALESMAN�� ������� ����ϱ�
select *
from emp
where deptno = 30 and job = 'SALESMAN'; --��ҹ��� ������

--�μ� ��ȣ�� 30�̰ų� ������ CLERCK�� ��� ���� ���
SELECT *
FROM EMP
WHERE DEPTNO=30 OR JOB='CLERCK';

--�޿��� 3000�̻��� ���
SELECT *
FROM EMP
WHERE SAL>=3000;

--����̸��� ���ĺ� ������� 'FORZ'�տ� ���� ����� ��ȸ
SELECT *
FROM EMP
WHERE ENAME<='FORZ';  

--�޿��� 3000�� �ƴ� ����� ������ ��ȸ
SELECT *
FROM EMP
WHERE SAL != 3000;

SELECT *
FROM EMP
WHERE NOT SAL = 3000;

--������ 'MANAGER' �Ǵ� 'CLERCK'�̰ų� 'SALESMAN'�� ��� ��ȸ
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
        OR JOB = 'CLERK'
        OR JOB = 'SALESMAN';
        
SELECT *
FROM EMP
WHERE JOB
IN ('MANAGER', 'SALESMAN', 'CLERK');

--������ 'MANAGER' �� �ƴϰ� 'CLERCK'�� �ƴϰ� 'SALESMAN'�� �ƴ� ��� ��ȸ
SELECT *
FROM EMP
WHERE JOB!='MANAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

SELECT *
FROM EMP
WHERE JOB
NOT IN('MANAGER', 'SALESMAN', 'CLERK');

--�޿��� 2000�̻� 3000���� ���
SELECT * 
FROM EMP
WHERE SAL>= 2000 AND SAL<=3000;

SELECT *
FROM EMP
WHERE SAL
BETWEEN 2000 AND 3000;

--�޿��� 2000~ 3000�̿��� ��� ���� ��ȸ
SELECT *
FROM EMP
WHERE SAL
NOT BETWEEN 2000 AND 3000;

-- �̸��� �빮�� S�� �����ϴ� ��� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

--�̸��� �� ��° ���ڰ� L�� ���
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

--����̸��� AM�� ���ԵǾ� �ִ� ���
SELECT * 
FROM EMP
WHERE ENAME LIKE '%AM%';

--����̸��� AM�� ���ԵǾ� ���� ���� ���
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

--������ȣ, �ӱ�, ���� 5% �λ� �߰�
SELECT EMPNO, SAL, SAL*1.05 AS "5%UP_SAL"
FROM EMP;

--�μ���ȣ�� 10�� ����� ������
SELECT *
FROM EMP
WHERE DEPTNO=10;

--����� �̸� ���� ����ϱ�
-- UPPER : �빮�� / LOWER : �ҹ��� / INITCAP : ù ���ڸ� �빮��
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

--��ҹ��� ���� ���� SMITH�� ���
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('smith');

SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%smith%');

--����̸��� �� �������� ã��
select ename, length(ename)
from emp;

--�̸��� 5���� �̻��� ��� ���
select ename, length(ename)
from emp
where length(ename)>=5;

--substr : ���ڿ� �Ϻ� ����
select job, substr(job, 1, 2), substr(job, 5)
from emp;

--substr�� ���� ��ġ�� ������ ��� ������ ��ġ���� �Ž����� ��ġ���� ����
select job,
substr(job, -length(job)),
substr(job, -length(job), 2),
substr(job, -3)
from emp;

--instr : Ư�� ���� ��ġ�� ã��
select
instr('hello, orcale!', 'l') as instr_1,
instr('hello, orcale!', 'l', 5) as instr_2,
instr('hello, orcale!', 'l', 2, 2) as instr_3
from dual;

--instr�Լ��� ��� �̸��� ���� 'S'�� �ִ� ��
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S')>0;

SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

--REPLACE : Ư�� ���ڸ� �ٸ� ���ڷ� ��ü
SELECT '010-1234-5678' AS "BEFORE",
REPLACE('010-1234-5678', '-', '') AS "AFTER1",
REPLACE('010-1234-5678', '-', '.') AS "AFTER2"
FROM DUAL;

--LPAD, RPAD �������� �� ������ Ư�� ���ڷ� ä��
SELECT 'ORACLE',
LPAD('ORACLE', 10, '#') AS LPAD1,
RPAD('ORACLE', 10, '*') AS RPAD1,
LPAD('ORACLE', 10) AS LPAD2,
RPAD('OARCLE', 10) AS RPAD2
FROM DUAL;

--CONCAT : �� ���ڿ� �����͸� ��ħ
--�����ȣ�� ����̸��� ������ ���
SELECT 
CONCAT(EMPNO, ENAME),
CONCAT(EMPNO, CONCAT('.', ENAME))
FROM EMP
WHERE ENAME='SMITH';

--|| : �� ���ڿ� ������ ����
SELECT 
EMPNO || ENAME,
EMPNO || '.' || ENAME
FROM EMP
WHERE ENAME = 'SMITH';

--TRIM, LTRIM, RTRIM : Ư�� ���ڿ� ����
SELECT
'[' || TRIM('_ORACLE_') || ']' AS TRIM,
'[' || LTRIM('_ORACLE_') || ']' AS LTRIM,
'[' || LTRIM('<_ORACLE_>', '_<') || ']' AS LTRIM2,
'[' || RTRIM('_ORACLE_') || ']' AS RTRIM,
'[' || LTRIM('<_ORACLE_>', '>_') || ']' AS RTRIM2
FROM DUAL;

--ROUND : Ư�� ��ġ���� �ݿø�
SELECT
ROUND(1234.5678) AS ROUND,
ROUND(1234.5678, 0) AS ROUND_0,
ROUND(1234.5678, 1) AS ROUND_1,
ROUND(1234.5678, 2) AS ROUND_2,
ROUND(1234.5678, -1) AS ROUND_MINUS1,
ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

--TRUNC : Ư�� ��ġ�� ����
SELECT
TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 0) AS TRUNC_0,
TRUNC(1234.5678, 1) AS TRUNC_1,
TRUNC(1234.5678, 2) AS TRUNC_2,
TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

--CEIL, FLOOR : ������ ���� ����� ������ ã��
SELECT
CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14)
FROM DUAL;

--MOD: ���ڸ� ���� ������ ��
SELECT
MOD(15, 6),
MOD(10, 2),
MOD(11, 2)
FROM DUAL;

--SYSDATE : ����Ŭ DB������ ���� ��¥�� �ð� ���� ��ȯ
SELECT
SYSDATE AS NOW,
SYSDATE-1 AS YESERDAY,
SYSDATE-2 AS TOMORROW
FROM DUAL;

--ADD_MONTHS(�� ���� ������ ��¥�� ����)
SELECT 
SYSDATE,
ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

--�� ������� �����ȣ, �̸�, �Ի���, �Ի��� 10�ֳ� ��¥ ����ϱ�
SELECT
EMPNO, ENAME, HIREDATE, 
ADD_MONTHS(HIREDATE, 120) AS WORKD10YEARS
FROM EMP;

--�Ի��ϰ� ���� ��¥ ������ ���� �� ���
SELECT
ENAME, HIREDATE, SYSDATE,
MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM EMP;

--NEXT_DAY : ���ƿ��� ����, LAST_DAY : ���� ������ ��¥
SELECT
SYSDATE,
NEXT_DAY(SYSDATE, '������'),
LAST_DAY(SYSDATE)
FROM DUAL;

--ROUND �Լ�
SELECT 
SYSDATE,
ROUND(SYSDATE, 'CC') AS FORMAT_CC,
ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
ROUND(SYSDATE, 'Q') AS FORMAT_Q,
ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
ROUND(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;

--TRUNC�Լ�
SELECT
SYSDATE,
TRUNC(SYSDATE, 'CC') AS FROMAT_CC,
TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
TRUNC(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;

--�� ��ȯ �Լ�
SELECT EMPNO, ENAME, EMPNO+'500'
FROM EMP
WHERE ENAME='SMITH';

SELECT 
TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ����
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
nvl(comm, 0), --comm�� null�� ��� 0
sal+nvl(comm, 0) --null�� ��� 0���� ��ü �� ����
from emp;

select
empno, ename, comm,
nvl2(comm, 'o', 'x'), --null�� �ƴ� ���, �� �߰����� ���� �� 'o'���
nvl2(comm, sal*12+comm, sal*12) as annsal
from emp;

--decode
--������ manager�� ����� �޿��� 10% �λ�, salesman �޿� 5%, analyst 0%, ������ 3%
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
    WHEN COMM IS NULL THEN '�ش���� ����'
    WHEN COMM = 0 THEN '���� ����'
    WHEN COMM > 0 THEN '���� :' || COMM
END AS COMM_TXT
FROM EMP;

--������� �޿� �հ� ���ϱ�
SELECT
SUM(DISTINCT SAL),
SUM(ALL SAL),
SUM(SAL)
FROM EMP;

-- ������� �� ���ϱ�
SELECT 
COUNT(*) AS "������� ��"
FROM EMP;


--�μ� ��ȣ�� 30���� ��� ��
SELECT
COUNT(*) AS "��� ��"
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

--�μ� ��ȣ�� 10���� ������� �ִ� �޿�, �ּ� �޿� ����ϱ�
SELECT
MAX(SAL) AS �ִ�,
MIN(SAL) AS �ּ�
FROM EMP
WHERE DEPTNO=10;

SELECT
MAX(HIREDATE) AS �ֱ��Ի���,
MIN(HIREDATE) AS �������Ի���
FROM EMP
WHERE DEPTNO=20;

--�μ� ��ȣ�� 30�� ������� ��� �޿� ����ϱ�
SELECT
AVG(SAL)
FROM EMP
WHERE DEPTNO=30;

--�μ��� ��� �޿��� �μ� ��ȣ�� �Բ� ���
SELECT
AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

--�μ��� ������ ��� �޿� ���
SELECT
DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--�� �μ��� ������ ��� �޿��� ���ϵ� �� ��� �޿��� 2000�̻��� �׷츸 ���
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


