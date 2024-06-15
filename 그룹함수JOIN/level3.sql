
select * from departments;
select * from employees;

/* 조인을 이용하여 사원들의 
직원번호 (employee_id), 
고용일자(hire_date), 
직종(job_id),
직책(job_title)
*/
select * 
from employees e join jobs j on e.job_id = j.job_id;



-- 직책(job_title)이 'Sales Manager' 인 사원들의 입사년도 그룹별 평균급여를 출력. 입사년도를 기준으로 오름차순 출력
select TO_CHAR(e.hire_date, 'YYYY') 입사년도, 
avg(e.salary) 평균급여  from employees e 
join jobs j on e.job_id = j.job_id
where j.job_title = 'Sales Manager'
GROUP BY
    TO_CHAR(e.hire_date, 'YYYY')
order by 입사년도 asc;

-- departments 테이블에 있는 department_id 와 employees 테이블의 employee_id를 이용하여 
-- 조인하여 부서아이디 나타내어라.

select d.department_id
from departments d 
join employees e on d.department_id = e.employee_id;

--  직책 jobs_title 이 'Sales Manager' 인 사원들의 입사년도 그룹 별 평균 급여를 출력
select to_char(e.hire_date, 'YYYY') 입사년도, avg(e.salary) 평균급여
from employees e
join jobs j on  e.job_id = j.job_id
where j.job_title ='Sales Manager' 
group by to_char(e.hire_date, 'YYYY')
order by 입사년도;

-- 부서별 사원수, 최대급여, 최소급여, 급여합계, 평균급여를 급여합계 큰순으로 조회
select department_id 부서별, count(*)사원수, max(salary)최대급여, min(salary)최소급여, sum(salary)급여합계, round(avg(salary),2)평균급여 
from employees
group by department_id
order by 급여합계 desc;

-- 부서별, 직업별(job_id)별로 그룹을 지어 salary 합계와 그룹별 직원의 숫자를 출력
select department_id 부서별 , job_id 직종아이디, sum(salary) 급여합계,count(*) 직원수 from employees
group by department_id, job_id;

-- 부서별로 최고 월급을 뽑아서 평균을 내고, 최저월급 또한 평균을 내어 출력 
select round(avg(max_salary),2), round(avg(min_salary),2) from (
select department_id, max(salary) as max_salary, min(salary) as min_salary
from employees 
group by department_id
);

