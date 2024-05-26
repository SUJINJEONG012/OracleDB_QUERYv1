/* employees 테이블에서 job_id가 1라면 
employee_id, first_name, last_name, salary를 출력하되 s
alary가 9000 이상이면 ‘상위급여’, 6000과 8999 사이면 ‘중위급여’, 
그 외는 ‘하위급여’라고 출력
*/
select employee_id, first_name, last_name, salary,
case when salary < 9000 then '상위급여' 
     when salary between 6000 and 8999 then '중위급여'
     else '하위급여'
end "급여등급"
from employees;

-- nvl 함수는 null값을 다른값으로 바꿀때 사용, 모든 데이터 타입에 적용가능
select last_name, nvl(manager_id,0) manager_id
from employees
where last_name ='King';



/*  ======== 변환형 함수 ========
to_char 날짜와 숫자를 문자로 변환 to_char(날짜, 출력형식) to_char(숫자, 출력형식)
to_date 문자를 날짜형으로 변환 to_date(문자, 출력형식)
to_number 문자를 숫자로 변환 to_number(문자, 출력형식)
*/

/* ======== Number Format ========
- 특정형식의 문자타입으로 변환
,(comma) 9,999 콤마형식으로 변환
.(period) 99.99 소수점 형식으로 변환
0 0999 왼쪽에 0을 형식
$ $9999 $통화로 표시
L L9999 Local통화로 표시(한국의 더블유)
XXXX XXXX 16진수로 표시
*/


select to_char(11234567, '99,999,999') comma from dual;
select to_char(123.45678, '999.99') from dual;
select to_char(12345678, '$999,999,999') dollor from dual;
select to_char(12345678, 'L999,999,999') local from dual;
select to_char(123, '0999') from dual;
-- 16진수로 변경
select to_char(123, 'XXXX') from dual;




-- Data타입의 데이터를 특정형식의 문자타입으로 변환
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') "sysdate"
from dual;

--356일 중 몇일 째인지 조회 
select to_char(sysdate, 'DDD') "day of year" from dual;

-- 53주 몇 주차 인지 조회
select to_char(sysdate, 'IW') from dual;
-- 해당 월의 이름 조회
select to_char(sysdate, 'month') "몇달인지" from dual;
select to_char(sysdate, 'DAY') "무슨요일인지" from dual;

-- employees 테이블에서 department_id 가 10인 사원들의 입사일을 이용하여 월/년도로 출력 
select department_id , to_char(hire_date, 'MM/YY') "입사일" from employees where department_id = 10;

-- employees 테이블에서 salary가 10000 달러가 넘는 사원들의 이름과 월급을 월급이 많은 순으로 나타내어라.
select  last_name 이름, to_char(salary, '$99,999,999.00') 월급 from employees
order by salary desc;

-- date 타입으로 변환하는 예제, 문자를 데이터 타입으로 변환
select to_date('2011-01-01', 'YYYY-MM-DD') from dual;

-- 문자를 숫자로 변환하는 간단한 예제
select to_number('1021220') from dual;
