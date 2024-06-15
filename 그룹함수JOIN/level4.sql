-- having 절과 group by

-- 사원수가 다섯명이 넘는 부서의 사원수를 조회
select department_id 부서명, count(*) 사원수 from employees
group by department_id
having count(*) > 5
order by department_id desc;