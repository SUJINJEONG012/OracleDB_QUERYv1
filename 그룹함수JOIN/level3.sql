
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