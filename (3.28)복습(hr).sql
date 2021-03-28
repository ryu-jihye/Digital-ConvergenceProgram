--���� 'JOHN'�� ����� �ٹ��ϼ� ���
SELECT * FROM EMPLOYEES;

SELECT HIRE_DATE, ROUND((SYSDATE-HIRE_DATE)*30, 1) AS "�ٹ��ϼ�"
FROM EMPLOYEES
WHERE FIRST_NAME = 'JOHN';

--��� ����� �ٹ��� �� �� �ְ� �������� ���
SELECT LAST_NAME AS "�̸�", ROUND((SYSDATE-HIRE_DATE)*30, 1) AS "�ٹ��ϼ�",
ROUND((SYSDATE-HIRE_DATE)*30/7, 1) AS "�ٹ� �� ��"
FROM EMPLOYEES
ORDER BY LAST_NAME, ROUND((SYSDATE-HIRE_DATE)/7, 1);

--�� �μ����� ������ ���� �޿��� �ٸ��� �λ��ϴµ� 20���� 30�� �μ��� ���� 5, 15% �λ��ϰ�
--������ �μ��� ������ ��� �޿��� ���

SELECT DEPARTMENT_ID, 
CASE DEPARTMENT_ID WHEN 20 THEN SALARY*1.05
                    WHEN 30 THEN SALARY*1.15
    ELSE SALARY*1
    END "�޿�"
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

--����� �̸��� �Ŵ��� ����� ����Ͻÿ�
SELECT CONCAT(E.FIRST_NAME, E.LAST_NAME) AS "��� �̸�",
CONCAT(M.FIRST_NAME, M.LAST_NAME) AS "�Ŵ��� �̸�"
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID = M.DEPARTMENT_ID;

--�ſ� 1, 3�� ������� �޹��̴� ���� ���� �޹����� ����϶�
SELECT NEXT_DAY(TRUNC(SYSDATE, 'MONTH'), '�����') "1��° �޹���",
        NEXT_DAY(TRUNC(SYSDATE, 'MONTH'), '�����') + 14 "2��° �޹���"
FROM EMPLOYEES;

--10�� �μ��� �̸��� �� �μ����� �� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�
SELECT  CONCAT(E.FIRST_NAME, E.LAST_NAME) AS "��� �̸�", D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND D.DEPARTMENT_ID = 10;
    
--2500�� ������ �̸��� �� ���� �ִ� �μ��� �̸� ���
SELECT L.STREET_ADDRESS AS "�����̸�", D.DEPARTMENT_NAME AS "�μ��̸�"
FROM LOCATIONS L, DEPARTMENTS D
WHERE L.LOCATION_ID = D.LOCATION_ID
AND L.LOCATION_ID = 2500;
