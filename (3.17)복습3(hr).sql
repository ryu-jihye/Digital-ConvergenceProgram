

-- A) ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ����Ͻÿ�
--    �� �̸��� ���� MAX, MIN, SUM , AVG�� �ϰ� �Ҽ��� ���ϴ� �ݿø� �Ͽ� ������ ���

-- B) �����̸��� �������� ������ ������ �ϴ� ����� ���� ����Ͻÿ� �� �̸��� ����
--    '����'�� '������ �����'�� ���

-- C) ����� �ִ� �޿��� �ּ� �޿��� ������ ����ϱ�

-- D) 30�� �μ��� ������ ���� ����� �޿��� �հ�� ����� ���

-- E) ��� �޿��� ���� ���� �μ��� ��ȣ�� ���


-- A) 
SELECT 
MAX(SALARY) AS MAX,
MIN(SALARY) AS MIN,
SUM(DISTINCT SALARY) AS SUM,
ROUND(AVG(DISTINCT SALARY), 0) AS AVG
FROM EMPLOYEES;

-- B)
SELECT
COUNT(DISTINCT JOB_ID) AS ����,
COUNT(JOB_ID) AS "������ �����"
FROM EMPLOYEES
GROUP BY JOB_ID; --�������� ������ ������ �ϴ� ��� ���� ����

-- C) 
SELECT 
(MAX(SALARY) - MIN(SALARY)) AS ����
FROM EMPLOYEES;

-- D)
SELECT
COUNT(*),
SUM(DISTINCT SALARY),
AVG(DISTINCT SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

-- E)��� �޿��� ���� ���� �μ��� ��ȣ�� ���
SELECT 
ROUND(AVG(SALARY)) AS "AVG", DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY "AVG" DESC;


-- 1) ���� ��¥ Ÿ���� �Լ��� ���� Ȯ���ϰ�, 2006�� 05�� 20�Ϻ��� 2007�� 05�� 20�� ���̿�
-- ���� ������� �̸�(FIRST_NAME)�� ��(Name)���� ��Ī, ����(JOB_ID), �Ի���(HIRE_DATE)�� ����Ͻÿ�
-- �� �Ի����� ���� ������ �����Ͻÿ�(18��)

-- 2) ��� ����� ������ ǥ���ϴ� ������ �ۼ��Ϸ��� �Ѵ�. ������ ����� �̸��� ��(Name���� ��Ī),
-- �޿�, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�
-- ���翩�δ� ������ ������ "Salary + Commission", ������ ������ "Salary only'��� ǥ���ϰ�
-- ��Ī�� ������ ���̽ÿ�. ���� ��½� ������ ���� ������ �����Ͻÿ�(107��)

-- 3) ��� ����� �̸��� ��(Name���� ��Ī), �Ի��� �׸��� �Ի����� � �����̾����� ����Ͻÿ�
--  �̶� ��(week)�� ������ �Ͽ��Ϻ��� ��µǵ��� �����Ͻÿ�(107��)


--1)
SELECT HIRE_DATE FROM EMPLOYEES; --��¥ 21/03/17�� ǥ��

SELECT 
CONCAT(FIRST_NAME, LAST_NAME) AS NAME,
JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('2006-05-20', 'YYYY-MM-DD') AND
TO_DATE('2007-05-20', 'YYYY-MM-DD')
ORDER BY HIRE_DATE;

--2)
SELECT
CONCAT(FIRST_NAME, LAST_NAME) AS NAME,
SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT, TO_CHAR(SALARY + (SALARY*COMMISSION_PCT)), 'SALARY ONLY') AS RESULT_SALARY --TO_CHAT �̿� ���� : COMMSSION_PCT���� NULL���� ����
FROM EMPLOYEES
ORDER BY SALARY DESC;

--3) 
SELECT
CONCAT(FIRST_NAME, LAST_NAME) AS NAME,
HIRE_DATE,
TO_CHAR(HIRE_DATE, 'DAY') AS ���� --TO_CHAR : ����, ��¥�� ���������� �ٲ�
FROM EMPLOYEES
ORDER BY TO_CHAR(HIRE_DATE, 'D');
