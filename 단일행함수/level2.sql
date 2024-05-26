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
