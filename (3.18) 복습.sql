-- ����� �̸��� ����� ���ӻ�� �̸��� ������ ���(��ü����)

SELECT
E.EMPNO, E.ENAME, E.MGR,
M.EMPNO AS MGR_NO,
M.ENAME AS MGR_NAME
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;

-- ����� �̸��� ����� ���ӻ�� �̸��� ������ ���(���� �ܺ�����)
-- ���� �ܺ� ���� : �����ʿ� (+) ���̱�, (+) ���� ���� NULL���� ����(M��)
SELECT
E.EMPNO, E.ENAME, E.MGR,
M.EMPNO AS MGR_NO,
M.ENAME AS MGR_NAME
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO(+);

-- ����� �̸��� ����� ���ӻ�� �̸��� ������ ���(������ �ܺ�����)
-- ������ �ܺ� ���� : ���ʿ� (+) ���̱�, (+) ���� ���� NULL���� ����(E��)
SELECT
E.EMPNO, E.ENAME, E.MGR,
M.EMPNO AS MGR_NO,
M.ENAME AS MGR_NAME
FROM EMP E, EMP M
WHERE E.MGR(+) = M.EMPNO;

-- �� ���̺��� �̸��� �ڷ����� ���� ���� ã�� ����, �� ���� �������� �����
SELECT
E.EMPNO, E.ENAME, E.JOB, E.MGR,
E.HIREDATE, E.SAL, E.COMM,
DEPTNO,
D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

-- �޿��� 3000�̻��� ������� ������ �ٹ� �μ� ���� ����ϱ�(JOIN ~ USING)
SELECT
E.EMPNO, E.ENAME, E.JOB, E.MGR,
E.HIREDATE, E.SAL, E.COMM,
DEPTNO,
D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING(DEPTNO)
ORDER BY DEPTNO, E.EMPNO;

-- �޿��� 3000�̻��� ������� ������ �ٹ� �μ� ���� ����ϱ�(JOIN ~ ON)
SELECT
E.EMPNO, E.ENAME, E.JOB, E.MGR,
E.HIREDATE, E.SAL, E.COMM,
E.DEPTNO,
D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON(E.DEPTNO=D.DEPTNO)
WHERE SAL >= 3000
ORDER BY E.DEPTNO, EMPNO;

-- JONES���� �޿��� ���� ��� ��ȸ�ϱ�(��������)
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
            FROM EMP
            WHERE ENAME = 'JONES');
            
--BLAKE���� �Ի簡 ���� ��� ��� ��ȸ
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'BLAKE');
                  
-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴�
-- ��� ������ �Ҽ� �μ� ������ �Բ� ��ȸ

SELECT
E.EMPNO, E.ENAME, E.JOB, E.SAL,
D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
        AND E.DEPTNO = 20
        AND SAL > (SELECT AVG(SAL) FROM EMP);
        

-- ������ ���� ����
-- �� �μ��� �ְ� �޿��� �޴� ��� ��ȸ�ϱ�
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO); -- �� �μ��� ����
              
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
              

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ���
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


--�μ���ȣ�� 30���� ������� �ִ� �޿����� �� ���� �޴� ��� ����ϱ�
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
              
-- �ζ��κ�
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

-- ��Į�󼭺�����
SELECT 
    EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO,
    (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;
