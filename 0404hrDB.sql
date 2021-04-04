--�����̸��� �������� ������ ������ �ϴ� ����� ���� ����Ͻÿ� 
--�� �̸��� ���� '���� ��ȣ'�� '������ �����'�� ���
select * from employees;

select count(distinct job_id) as "���� ��ȣ",
count(job_id) as "������ �����"
from employees
group by job_id;

-- ��� �޿��� ���� ���� �μ��� ��ȣ�� ���
select
round(avg(salary)) as "avg", department_id
from employees
group by department_id
order by "avg" desc;

-- ���� ��¥ Ÿ���� �Լ��� ���� Ȯ���ϰ�, 2002��01��01�Ϻ��� 2005��12��31�� ���̿�
--���� ������� �̸�(FIRST_NAME)�� ��(Name)���� ��Ī, �Ի���(HIRE_DATE)�� ����϶�
--�� �Ի����� ���� ������ �����ϱ�

select * from employees;

select
concat(first_name, last_name) as name, hire_date
from employees
where hire_date between to_date('2002-01-01', 'yyyy-mm-dd') and
to_date('2005-12-31', 'yyyy-mm-dd')
order by hire_date;


--��� ����� ������ ǥ���ϴ� ������ �ۼ��Ϸ��� �Ѵ�. 
--������ ����� �̸��� ��(Name���� ��Ī), �޿�, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�
--���翩�δ� ������ ������ "SALARY + COMMISSION_PCT", ������ ������ "SALARY ONLY'��� ǥ���ϰ�
--�׸��� �̸��� RESULT_SALARY��� �����ض�
--���� ��� �� ABC �̸� ������ �����Ͻÿ�

select 
concat(first_name, last_name) as name,
salary, commission_pct,
nvl2(commission_pct, to_char(salary + (salary*commission_pct)), 'salary only') as result_salary
from employees
order by name asc;

--��� ����� �̸�, �Ի��� �׸��� �Ի����� � �����̾����� ����Ͻÿ�
--�̶� ��(week)�� ������ �Ͽ��Ϻ��� ��µǵ��� �����Ͻ�

select
first_name, hire_date,
to_char(hire_date, 'day') as "����"
from employees
order by to_char(hire_date, 'd');