SELECT
SUM(DISTINCT SALARY), -- �ߺ��� �����ϰ� �ջ�
SUM(ALL SALARY), -- ��� �����͸� �ջ�
SUM(SALARY)
FROM EMPLOYEES;

SELECT
COUNT(*) -- COUNT : DISTINCT, ALL �� �ϳ��� ����(���ϱ⵵ ��) + ������ ���� ���̳� ������
FROM EMPLOYEES;

SELECT 
COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30; --�μ� ��ȣ�� 30���� ��� ��

SELECT
COUNT(COMMISSION_PCT) -- COUNT ��� �� NULL �����ʹ� ������ ������ ���� ��ȯ
FROM EMPLOYEES;

SELECT
COUNT(COMMISSION_PCT)  -- COUNT ��� �� NULL �����ʹ� ������ ������ ���� ��ȯ
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- �μ���ȣ�� 10���� ������� �ִ� �޿�, �ּ� �޿� ���
SELECT 
MAX(SALARY) AS �ִ�,
MIN(SALARY) AS �ּ�
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10;

-- �μ� ��ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��ϰ� ���� ������ �Ի��� ����ϱ�
SELECT
MAX(HIRE_DATE) AS �ֱ��Ի���,
MIN(HIRE_DATE) AS �������Ի���
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;

--�μ� ��ȣ�� 30�� ������� ��� �޿� ����ϱ�
SELECT 
AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

-- �μ��� ��� �޿��� �μ� ��ȣ�� �Բ� ����ϱ�
SELECT 
ROUND(AVG(SALARY),1) AS ��ձ޿�, DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID; --GROUP BY : ���� �����Ϳ��� �ǹ��ִ� �ϳ��� ����� Ư�� �� ������ ��� ���

--�μ��� ������ ��� �޿� ����ϱ�
SELECT
DEPARTMENT_ID, JOB_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID, JOB_ID;

-- GROUP BY ������
-- ������ �Լ��� ������� �ʴ� �Ϲ� ���� GROUP BY���� ������� ������ SELECT���� ��� �Ұ�

--�� �μ��� ������ ��ޱ޿��� ���ϵ� �� ��� �޿��� 2000�̻��� �׷츸 ���
SELECT
DEPARTMENT_ID, JOB_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING ROUND(AVG(SALARY)) >= 2000 --HAVING�� ���� ��հ��� 2000�̻��� ��츸 ���
ORDER BY DEPARTMENT_ID, JOB_ID;

-- HAVING ��� �� ������
-- WHERE���� ��� ��� ���� ����
-- HAVING���� �׷�ȭ�� ����� ��¿��� ����

-- WHERE�� HAVING���� ����
-- WHERE�� GROUP BY, HAVING���� ���� �����

--HAVING�� ����ϴ� ���
SELECT 
DEPARTMENT_ID, JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING AVG(SALARY) >= 2000
ORDER BY DEPARTMENT_ID, JOB_ID;

-- WHERE, HAVING ���� ����ϴ� ���
SELECT 
DEPARTMENT_ID, JOB_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE SALARY <= 3000 --�޿� 3000 �ʰ��ϴ� ��� ����
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING AVG(SALARY) >= 2000
ORDER BY DEPARTMENT_ID, JOB_ID;

-- ���� : �� �� �̻��� ���̺��� �����Ͽ� �ϳ��� ���̺�ó�� ���

-- ��������� ���Ҿ� �ٹ� �μ� �̸� �Ǵ� �μ� ��ġ ���� �� ��ȸ
SELECT *
FROM EMPLOYEES, DEPARTMENTS
ORDER BY DEPARTMENT_ID;

SELECT * 
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;

SELECT *
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;

-- EMPLOYEES ���̺� ��Ī�� E, DEPARTMENT ���̺� ��Ī�� D��� �ϰ�
-- �����ȣ�� �μ� �̸� ����ϱ�
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;


-- �����
-- ���� ���̺��� �� �̸��� ���� ��
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME, JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;

-- WHERE�� ���ǽ� �߰��Ͽ� ��¹��� ����
-- �����ȣ, �̸� , �޿�, �ٹ� �μ��� �Բ� ����ϵ� �޿��� 3000�̻��� �����͸� ����ϱ�
SELECT
E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND SALARY >= 3000;

