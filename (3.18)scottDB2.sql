--1) ��������� �����ϰ�, �� ������ ������� �� �޿��� 3000�̻��� �� ������ ���ؼ�,
-- ������� �� ������ ��� �޿��� ����ϵ�, ��ձ޿��� ������������ ����϶�

--2) ��ü ��� ��� ���� ����� �ִ� ����� ���� ����Ͻÿ�

--3) EMP ���̺��� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(SAL+COMM)�� ���Ͽ� �Ѿ��� ���� �������
--����ϱ� �� Ŀ�̼��� NULL�� ����� ����

--4) �� �μ����� ���� ������ �� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�

--5) ����� �� �� ���� �μ��� �̸��� ����϶�

--6) ���������� ���� ����� �̸��� ǥ���Ͻÿ�


--1)
SELECT JOB, ROUND(AVG(SAL)) --������� ��ձ޿�
FROM EMP 
WHERE JOB != 'SALESMAN' -- ��������� �ƴ�
GROUP BY JOB  -- ���� ������ �׷����� ��(�� ������ ����� ������ �۾��ϱ� ����)
HAVING SUM(SAL) >= 3000 -- �׷��� ������ ���� ��(HAVING) : �� �޿� 3000�̻�
ORDER BY AVG(SAL) DESC; -- ��� �޿��� ��������

--2)
SELECT COUNT(*) -- ��ü ��
FROM EMP 
WHERE MGR IS NOT NULL; -- IS NOT NULL : NULL�� �ƴ�(�� ����), MGR : ��� ��

--3)
SELECT 
ENAME, SAL, COMM, SAL+COMM AS TOTAL
FROM EMP 
WHERE COMM IS NOT NULL --Ŀ�̼��� NULL�� ��� ����
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

-- A) ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο� �� ����ϱ�

-- B) �����ȣ�� 7400 �̻� 7600������ ����� �̸� ���

-- C) ����� �̸��� ����� �μ� ���

-- D) ����� �̸��� ������ �̸� ���

-- E) ��� BLAKE���� �޿��� ���� �޴� ����� �̸� ���

-- F) ��� BLAKE�� ���ϴ� �μ���ȣ Ȥ�� DALLAS�� �ִ� �μ� ��ȣ ���


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
