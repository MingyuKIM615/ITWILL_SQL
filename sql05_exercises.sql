-- hr 계정의 employees 테이블 사용
-- 이름을 검색할 때는 First/Last Name을 붙여서 출력할 수 있도록.

-- employees 테이블 구조 확인

select *
from employees;

-- 성(last_name)이 'J'로 시작하는 직원들의 사번, 이름을 출력
select employee_id, first_name || ' ' ||last_name as "Name"
from employees
where last_name like'J%';

-- 성(last_name)에 'E' 또는 'e'가 포함된 직원들의 사번, 이름을 출력
select employee_id, first_name || ' ' ||last_name as "Name"
from employees
where last_name like '%e%' or last_name like '%E%';

select employee_id, first_name || ' ' ||last_name as employee_name
from employees
where last_name in ('%e%', '%E%');
-- where last_name = '%e%' or last_name = '%E%'와 같은 의미

-- 문자열 함수 이용 : upper(컬럼이름) - 대문자로 변환, lower(컬럼이름) - 소문자 변환.
select employee_id, first_name || ' ' ||last_name as employee_name
from employees
where upper(last_name) like '%E%';

-- 전화번호가 '011'로 시작하는 직원들의 사번, 이름, 전화번호를 출력
select employee_id, 
       first_name || ' ' ||last_name as employee_name, 
       phone_number
from employees
where phone_number like '011%';


-- 급여가 3000이상 5000 이하인 직원들의 사번, 이름, 급여를 검색
-- 급여의 내림차순 출력
select employee_id, 
    first_name || ' ' ||last_name as employee_name, 
    salary
from employees
WHERE salary between 3000 and 5000
order by salary desc;

-- 수당이 있는(not null) 직원들의 사번, 이름, 급여, 연봉을 검색
-- commission_pct 컬럼: 수당의 퍼센티지(percentage). 수당이 12개월 급여의 몇 %인 지.
-- 수당 포함 연봉 = 월급 * 12 + 특별수당
--                = 월급 * 12 + (월급 * 12) * percentage
--                = (월급 * 12) * (1 + percentage)
select employee_id, 
    first_name || ' ' ||last_name as employee_name, 
    salary, 
    commission_pct,
    (salary * 12) *(1 + commission_pct) as annual_salary
from employees
where commission_pct is not null;

select (14000 * 12) * (1 + 0.4) from dual;