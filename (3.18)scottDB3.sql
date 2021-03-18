--1) ��ü ��� �� ALLEN�� ������ ���� ������� �������(����, �������, ��� �̸�, �޿�)��
-- �μ� ����(�μ� ��ȣ, �μ� �̸�)�� ����ϱ�

SELECT --??
E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM 
(SELECT JOB FROM EMP WHERE ENAME = 'ALLEN') E,
(SELECT * FROM DEPT) D
WHERE E.EMPNO = D.DEPTNO;




--2) ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��� ���� ����ϱ�
-- �޿��� ���� ������ �����ϵ�, �޿��� ���� ��� �����ȣ�� �������� �������� ����, ������ ��µ� ���� Ȯ��

SELECT E.EMPNO, E.ENAME, E.HIREDATE, E.SAL, D.DNAME,  D.LOC --??
FROM
(SELECT SAL FROM EMP WHERE SAL > AVG(SAL)) E,
(SELECT * FROM DEPT) D
WHERE E.EMPNO = D.DEPTNO
ORDER BY EMPNO ASC;

--1) 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� �������
-- ��� ����, �μ� ������ ������ ���� ����ϱ�

SELECT *
FROM DEPT
WHERE DEPTNO NOT IN 
            (SELECT DEPTNO 
            FROM EMP
            GROUP BY DEPTNO
            HAVING COUNT(*) > 0);


--2) ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� �������
-- �������, �޿� ��� ������ ������ ���� ���
SELECT EMPNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO = 30);
             
             
             
-- 1) �̹��б⿡ 60�� IT�μ������� �ű� ���α׷��� �����ϰ� �����Ͽ� ȸ�翡 ������
-- �̿� �ش� �μ��� ��� �޿��� 12.3% �λ��ϱ�� ��
-- 60�� IT�μ� ����� �޿��� 12.3% �λ��Ͽ� ������(�ݿø�) ǥ���ϴ� ���� �ۼ��϶�
-- ������ �������, ���� �̸�(NAME���� ��Ī), �޿�, �λ�� �޿�(INCREASE SALARY)������ ���

SELECT --??
EMPNO, CONCAT(FIRST_NAME, LAST_NAME) AS NAME, SALARY,
DECODE(DEPTNO, 60, SAL*1.123, SAL)
FROM EMP;



--2) �� ����� ��(LAST_NAME)�� 's'�� ������ ����� �̸��� ������ �Ʒ��� ���� ���� ����ϰ��� ��
-- ��� �� �̸�(fist_name)�� ��(last)name)�� ù ���ڰ� �빮��, ������ ��� �빮�ڷ� ����ϰ�
-- �Ӹ����� Employee JOBs.�� ǥ���Ͻÿ�
--��) MIchael Rogers is a ST_CLERK


SELECT E.EMPNO, E.ENAME, D.DNAME,
    E.HIREDATE, D.LOC, E.SAL, S.GRADE 
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO AND (E.SAL BETWEEN LOSAL AND HISAL)
    AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;


