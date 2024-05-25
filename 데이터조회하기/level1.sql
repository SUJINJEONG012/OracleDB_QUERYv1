-- null값 조회하는 쿼리
select * from employees
where manager_id is null;
-- null이 아닌 값 조회
select * from employees
where manager_id is not null;

-- 부서번호로 정렬 후, 사원번호로 정렬 
select department_id, employee_id, first_name, last_name
from employees
order by department_id, employee_id;

-- 연봉 출력하는 쿼리
select  department_id, last_name, salary*12 연봉
from employees
order by 연봉 desc;