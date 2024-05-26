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

-- employees 테이블에서 employee_id, first_name, last_name을 출력 employee_id 를 기준으로 내림차순 출력
select employee_id, first_name,last_name 
from employees
order by employee_id desc;

-- employees 테이블에서 employee_id 에서 120에서 150번까지 직원을 부서번호가 큰순으로 정렬하고, 부서번호가 같을 시 월급이 큰 순으로 정렬 
select employee_id, salary 월급 from employees 
where employee_id between 120 and 150
order by department_id desc, salary desc ;

-- like 연산자

-- B로 시작하는 조건 
select * from employees
where last_name like 'B%';

-- b가 있는 모든 쿼리 조회
select * from employees
where last_name like '%b%';
-- 다섯번째로 적힌 d 조회
select * from employees
where first_name like '____d';