--업무이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오 
--열 이름은 각각 '업무 번호'와 '업무별 사원수'로 출력
select * from employees;

select count(distinct job_id) as "업무 번호",
count(job_id) as "업무별 사원수"
from employees
group by job_id;

-- 평균 급여가 가장 높은 부서의 번호를 출력
select
round(avg(salary)) as "avg", department_id
from employees
group by department_id
order by "avg" desc;

-- 현재 날짜 타입을 함수를 통해 확인하고, 2002년01월01일부터 2005년12월31일 사이에
--고용된 사원들의 이름(FIRST_NAME)과 성(Name)으로 별칭, 입사일(HIRE_DATE)을 출력하라
--단 입사일이 빠른 순으로 정렬하기

select * from employees;

select
concat(first_name, last_name) as name, hire_date
from employees
where hire_date between to_date('2002-01-01', 'yyyy-mm-dd') and
to_date('2005-12-31', 'yyyy-mm-dd')
order by hire_date;


--모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다. 
--보고서의 사원의 이름과 성(Name으로 별칭), 급여, 수당여부에 따른 연봉을 포함하여 출력하시오
--수당여부는 수당이 있으면 "SALARY + COMMISSION_PCT", 수당이 없으면 "SALARY ONLY'라고 표시하고
--항목의 이름을 RESULT_SALARY라고 지정해라
--또한 출력 시 ABC 이름 순으로 정렬하시오

select 
concat(first_name, last_name) as name,
salary, commission_pct,
nvl2(commission_pct, to_char(salary + (salary*commission_pct)), 'salary only') as result_salary
from employees
order by name asc;

--모든 사원의 이름, 입사일 그리고 입사일이 어떤 요일이었는지 출력하시오
--이때 주(week)의 시작인 일요일부터 출력되도록 정렬하시

select
first_name, hire_date,
to_char(hire_date, 'day') as "요일"
from employees
order by to_char(hire_date, 'd');