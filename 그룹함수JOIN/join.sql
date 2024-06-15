/* 조인의 개념 
- 둘 이상의 테이블을 연결하여 데이터를 검색
- 보통 둘 이상의 행들의 공통 값 기본키 및 외래키 값을 사용 
- 두 개의 테이블을 select 문장안에서 조인하려면 적어도 하나의 컬럼이 그 두 테이블사이에서 공유되어야 한다.
*/

/* 조인의 방법과 방식 
- 동등조인, 비동등조인, 자체조인, 외부조인
*/

-- on을 사용한 join 기본

-- select e.employee_id, e.last_name, e.department_id, d.department_id
select *
from employees e
join departments d
on e.department_id = d.department_id;



-- 3개의 테이블 join
select * 
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.department_id = l.department_id;

-- 조건문 추가
select e.employee_id, e.last_name, d.department_id, d.location_id
from employees e
join departments d on e.department_id = d.department_id
where d.department_id = 10;
