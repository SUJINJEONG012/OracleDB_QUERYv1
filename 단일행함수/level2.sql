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



/* 날짜함수의 종류 
ROUND - 형식에 맞추어 반올림
TRUNC - 형식에 맞추어 버림한 날짜를 반환
MONTHS_BETWEEN - 두 날짜간의 기간을 월 수로 계산한다.
ADD_MONTHS - 날짜에 n 달을 더한 날짜를 계산
NEXT_DAY - 날짜이후 지정된 요일에 해당하는 날짜를 계산
LAST_DAY - 날짜를 포함한 달의 마지막 날짜를 계산한다.
*/

select 
months_between('2017/10/10', '2017/06/10') 월차이,
add_months('2018/07/10', 3) 월추가하기
from dual;

-- 현재날짜 
select sysdate from dual;

select sysdate-1 어제, sysdate 오늘, sysdate+1 내일 from dual;

-- 근무일수 (현재날짜 - 입사날짜)
select last_name, floor(sysdate - hire_date) 근무일수 from employees where department_id = 10;

select employee_id, hire_date,
-- round() 날짜를 반올림하고 1일로 반환
round(hire_date, 'month') 월,
round(hire_date, 'year') 년,
-- trunc(날짜, 'month') : 모든 날짜데이터를 해당 월의 1일로 반환
trunc(hire_date, 'month') month,
-- trunc(날짜, 'month') : 모든 날짜데이터를 해당 연도의 1월1일로 반환
trunc(hire_date, 'year') year
from employees
where months_between(sysdate, hire_date) > 12;

-- employees테이블에서 department_id가 10인 직원에 대해 오늘날짜, hire_date, 오늘날짜와 hire_date사이의 개월 수를 출력 
select  sysdate, hire_date, months_between(sysdate,hire_date) 오늘날차이 from employees
where department_id = 10;

select min(department_id), max(department_id) from employees;
-- employees 테이블에서 employee_id가 3과 9의 사이인 직원의 hire_date에 3개월을 더한 값, hire_date에 3개월을 뺀 값 출력 
select 
add_months(hire_date, 3) "3개월추가하기",
hire_date,
add_months(hire_date, -3) "3개월 뺀값"
from employees where department_id between 3 and 9;

-- 반올림 하는 함수, 15.2, 15, 20 출력
select 
round(15.251, 0) 소수첫째,
round(15.251, 0) 정수,
round(15.251, -1) "10의 자리"
from dual;

-- 숫자를 절삭, 15.7, 15, 10 출력
select trunc(15.79,1) 소수첫째,
trunc(15.251,0) 정수,
trunc(15.251,-1) "10의자리"
from dual;


-- 짝수 (mod를 이용하여 나머지값이 0이면 짝수)
select employee_id 짝수, last_name
from employees
where mod(employee_id, 2) =0 order by 1;

--employees 테이블에서 salary를 30으로 나눈 후 나눈 값의 결과를 반올림하여  정수, 소수점 첫째 자리, 10의 자리로 나타내시오.
select salary, round(salary /30, 0)정수, round(salary/30, 1) 소수첫째자리, round(salary/30, -1) "10의 자리" from employees;


/* ==========  문자형 함수 예제 ========== */
select department_id, last_name, department_id
from employees where last_name = 'higgins';

select department_id, last_name, department_id
from employees where lower(last_name) = 'higgins';

-- substr(3,1) 3번째위치에서 2문자를 추출
select last_name, concat('이메일' , email) as 이메일
from employees
where substr(email, 3,2) = 'is';

-- 젤 마지막에 있는 알파벳 1개 출력
select last_name, substr(last_name, -1,1) from employees;

-- 몇번째 알파벳이 있는지 확인
select employee_id, 
concat(first_name, last_name) 전체이름,
last_name,
length(last_name) 길이,
instr(last_name, 'a') "'a'가 몇번째?"
from employees;


-- replace() 특정문자 제거 함수 => 칼럼명, 찾을문자, 치환문자
select email, replace(email, 'br', 'ssss') 적용결과
from employees;

-- INITCAP 첫번째 글자를 대문자로 변경하는 
select lower(last_name) 소문자, upper(last_name) 대문자 , 
INITCAP(email) 이메일은첫번째만대문자
from employees;