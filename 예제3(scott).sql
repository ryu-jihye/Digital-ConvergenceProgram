-- 1) ����� �̸��� ������ ����϶� (��, ����� �̸��� '����̸�' ������ '�������' �Ӹ��� �������� ���
-- 2) 30�� �μ����� �ٹ��ϴ� ��� ����� �̸��� �޿� ���
-- 3) �λ�� �޿� ���(10% �λ�), �� ��� ��ȣ ������ ���
--  ������ �޿��п� ���� �� �̸��� ������
-- 4)'F'�� �����ϴ� ��� ����� �μ���ȣ ���

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


