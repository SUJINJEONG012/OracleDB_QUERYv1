
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


