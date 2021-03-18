-- 1) ��� ����� ���� ��� �� ���� ������ ���´� ��, �ֻ��� �Ǵ� ������ ������
-- ���� ��� �� ������ ����. �Ҽӵ� ����� �� � ����� ���� �ٹ� ���� 
-- ����� �� ���� ����϶�

SELECT COUNT(DISTINCT MANAGER_ID) "COUNT MANAGERS"
FROM EMPLOYEES;

SELECT COUNT(E.MANAGER_ID)
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.EMPLOYEE_ID = M.EMPLOYEE_ID;


-- 2) �� ����� �Ҽӵ� �μ����� �޿� �հ�, �޿� ���, �޿� �ִ�, �޿� �ּڰ��� ������
-- ���� ��°��� ���� �ڸ��� �� �ڸ� ���б�ȣ, $ǥ�ÿ� �Բ� �Ʒ��� ���� ����϶�
-- �� �μ��� �Ҽӵ��� ���� ����� ���� ������ �����ϰ�, ��� �� ����ó�� ��Ī ó���϶�
-- (��Ī�� : DEPARTMENT_ID, SUM_SALARY, AVG_SALARY, MAX_SALARY, MIN SALARY)



--1) ���� ������ �ϴ� ����� �� �����

--2) �޿��� �ִ񰪰� �ּڰ��� ���̸� ���ϱ�

--3) Toronto���� ���ϴ� ������ ��, ����, �μ���ȣ, �μ��̸� ����ϱ�

--4) ���� Matos�� Taylor�� ������ ��, ���� ���̵�, �Ի����� �Ի��� ���� ������������ ����ϱ�

--5) 1994�⿡ �Ի��� ������� ��, �Ի��� ����ϱ�


--1) 
SELECT 
DEPARTMENT_ID, JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

--2)
SELECT
MAX(SALARY) - MIN(SALARY) AS �޿�����
FROM EMPLOYEES;

--3) ????
SELECT E.LAST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Toronto');
                         
--4)  ??
SELECT
LAST_NAME, EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%Matos%' || '%Talyor%';

--5) ???
SELECT 
LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE TO_NUMBER('1994');


