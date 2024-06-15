-- having 절과 group by

-- 사원수가 다섯명이 넘는 부서의 사원수를 조회
select department_id 부서명, count(*) 사원수 from employees
group by department_id
having count(*) > 5
order by department_id desc;

-- 직종별 평균월급이 $10000을 초과하는 직종에 대해서 job_id 와 월급여 합계를 조회
select job_id 직종,  sum(salary) 월급여합계 
from employees
group by job_id
having avg(salary) > 10000
order by 월급여합계 desc;

-- 부서번호 10을 제외한 부서별 평균급여가 7000이하인 부서들의 평균급여
select department_id , round(avg(salary)) 평균급여
from employees 
where department_id != 10
group by department_id
having avg(salary) < 7000