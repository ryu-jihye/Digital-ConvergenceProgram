-- 1) Employees ���̺��� �޿��� 12000�� ������ ���� �޿� ����ϱ�
-- 2) �μ���ȣ�� 20 Ȥ�� 50�� ������ ���� �μ���ȣ�� ���� ���Ͽ� ������������ ����ϱ�
-- 3) ���� �� ��°�� a�� ���� ������ �� ����ϱ�

--1) 9��
SELECT first_name, salary FROM Employees
WHERE salary >= 12000;

-- 2) 47��
SELECT department_id, first_name FROM Employees
WHERE department_id = 20 OR department_id = 50
ORDER BY first_name;

-- 3) 3��
SELECT last_name FROM Employees
WHERE last_name like '__a%';