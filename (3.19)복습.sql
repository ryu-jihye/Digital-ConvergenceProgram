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
-- (D.DEPTNO(+) = E.DEPTNO) : ��� X
-- AND ENAME�� EMPNO �� �� ����

--A)
SELECT
JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 4; --COUNT(JOB)���� �ص� ��

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

-- D) ��
SELECT
E.ENAME,
D.ENAME AS MGR_NAME
FROM EMP E, EMP D
WHERE E.MGR = D.EMPNO;



---------------------------------------- 3/19 ���� �� ����

-- 1) �߰������� �޴� ��� ���� ���� �ʴ� ��� �� ����ϱ�

SELECT
NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*)
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

-- 2) �Ի�⵵�� �������� �ο��� ����ϱ� 
 
SELECT 
TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE,'YYYY');

-- 3) ���� ��å�� �ٹ��ϴ� ����� 3�� �̻��� ��å�� �ο� �� ����ϱ�

SELECT 
JOB, COUNT(MGR)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- 4) EMPNO������ ��� �̸��� �ټ� ���� �̻��̸� ���� ���� �̸��� ��� ���� ���
-- MASKING_EMPNO ������ ��� ��ȣ �� �� �ڸ� ���� ������ �������� '*'�� ���
-- MASKING_ENAME������ ��� �̸� ù ���ڸ� �����ְ� ������ �� ��ŭ '*'�� ���

SELECT
EMPNO,RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKIGN_EMPNO, ENAME,
RPAD(SUBSTR(ENAME,1,1),4,'*') AS MASKING_NAME
FROM EMP
WHERE LENGTH(ENAME)=5;



--5) ������� �� ��� �ٹ��� ���� 21.5���̰�, �Ϸ� 8�ð� �ٹ��� �������� �Ͽ�
-- �Ϸ� �޿��� �ñ� ����Ͽ� ����ϱ�
-- �� ��� ����� Ȯ���Ͽ� ������ �ݿø� ó��

SELECT 
EMPNO, ENAME, SAL, ROUND((SAL/21.5),1) AS DAY_PAY, ROUND((SAL/21.5/8),1) AS TIME_PAY 
FROM EMP; 

-- 6) ������� �Ի����� �������� 3������ ���� �� ù ���Ͽ� �������� �ȴ�
-- �������� �Ǵ� ��¥(R_JOB)�� YYYY-MM-DD �������� ����ϰ� �߰�����(COMM)��
-- ���� ����� �߰� ������ N/A�� ���

SELECT 
EMPNO,ENAME,
TO_CHAR(ADD_MONTHS(HIREDATE,3),'YYYY-MM-DD') AS R_JOB, 
NVL2(COMM,TO_CHAR(COMM),'N/A') AS "EXIST_COMM"
FROM EMP; 



--7) ������� ������� ���� ����� �����ȣ�� ������ ���� �������� ��ȯ�ؼ� CHG_MGR���� ����ϱ�
-- ��� ����� ���� ��� : 0000
-- ��� ��ȣ ���ڸ��� 75�� ��� : 5555
-- ��� ��ȣ ���ڸ��� 76�� ��� : 6666
-- ��� ��ȣ ���ڸ��� 77�� ��� : 7777
-- ��� ��ȣ ���ڸ��� 78�� ��� : 8888
-- �� �� : ��� ��ȣ �״�� ���

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

-- ������ �� ������ ������ EMP_EX ���̺� �����ϱ�

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

-- ���̺� BIGO(������ ���ڿ�, ���� 20) �߰�

ALTER TABLE EMP_EX
ADD BIGO VARCHAR2(20);

DESC EMP_EX;

-- BIGO�� ũ�⸦ 30���� ����

ALTER TABLE EMP_EX
MODIFY BIGO VARCHAR2(30);

DESC EMP_EX;

-- BIGO�� �̸��� ���� ����

ALTER TABLE EMP_EX
RENAME COLUMN BIGO TO ���;

DESC EMP_EX;

SELECT * FROM EMP_EX;

-- EMP_EX ���̺� EMP���̺� �����͸� ��� �����ϱ�(����� NULL) -> Ȯ��
--> �������� �̿��ϱ�
-- ���̺��� �غ�� -> INSERT�� ��(P.8, ���ϴ� ������ �����ͼ� �ٽ��ϱ�)

SELECT * FROM EMP;

INSERT INTO EMP_EX
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, 
NULL FROM EMP;

SELECT * FROM EMP_EX;