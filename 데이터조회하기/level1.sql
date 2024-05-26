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



-- employees 테이블에서 email 값이 ad를 포함하는 모든데이터 조회
select * from employees where email like '%ad%';

-- employees 테이블에서 email 가 ad를 포함하면서 ad뒤에 따라오는 문자열이 3자리인 데이터 값을 갖는 직원정보를 조회
select * from employees where email like '%ad___%' ;
-- employees 테이블에서 전화번호 뒷자리가 1234로 끝나는 직원정보를 조회
select * from employees where phone_number like '%1234';
-- employees 테이블에서 전화번호 3이 들어가지 않으면서 전화번호 끝자리가 9로 끝나는 직원정보를 출력
select *  from employees where phone_number not like '%3%' and  phone_number like '%9';

-- employees 테이블에서 last_name에서 ms 을 포함하거나 ss 를 포함하는 직원정보 조회
select * from employees where last_name like '%ms%' or last_name like '%st%';

-- 월급이 9000 와 10000 사이에 있는 직원 조회
select * from employees where salary >= 9000 and salary <= 10000;

-- employees 테이블에서 salary가 10,000이상이고, 20,000이하인 직원정보를 출력
select * from employees
where salary between 10000 and 20000 ;

-- employees 테이블에서 hire_date 가 1994년 1월 1일부터 1994년 12월 30일 사이인 직원정보 출력
select * from employees
where hire_date between '94/01/01' and  '94/12/30';

-- employees 테이블에서 salary 7000 미만이거나 17000 보다 많은 사원을 출력
select * from employees where salary < 7000 or salary > 17000;
