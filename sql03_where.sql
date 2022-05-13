-- 테이블에서 데이터 검색
--   (1) projection: 테이블에서 원하는 컬럼들을 선택
--   (2) selection: 테이블에서 조건을 만족하는 레코드(행)들을 검색.

-- select 컬럼, ... from 테이블 where 조건식 [order by 정렬 기준 컬럼];

-- 직원 테이블(emp)에서 10번 부서에 근무하는 직원들의 부서번호, 사번, 이름을 검색.
select deptno, empno, ename
from emp
where deptno = 10;

-- 비교 연산자: =, !=, >, >=, <, <=, is null, is not null, ...
-- 논리 연산자: and, or, not

-- 직원 테이블에서 수당(comm)이 null이 아닌 직원들의 사번, 이름, 수당을 검색.
-- 출력 순서는 이름의 오름차순으로 정렬해서.
select empno, ename, comm
from emp
where comm is not null
order by ename;

-- 직원 테이블에서 급여(sal)가 2000 이상인 직원들의 이름과 급여를 검색
-- 출력 순서는 급여의 내림차순으로 정렬해서.
select ename, sal
from emp
where sal >= 2000
order by sal desc;

-- 직원 테이블에서 급여가 2000 이상 3000 이하인 직원들의 사번, 이름, 직책, 급여를 검색.
-- 급여의 내림차순 출력.
select empno, ename, job, sal
from emp
where sal >= 2000 and sal <= 3000
order by sal desc;

select empno, ename, job, sal
from emp
where sal between 2000 and 3000
order by sal desc;

-- 직원 테이블에서 10번 또는 20번 부서에서 근무하는 직원들의 부서번호, 이름, 급여를 검색
-- 출력 순서는 (1) 부서 번호 (2) 이름 오름차순 정렬.
select deptno, ename, sal
from emp
where deptno = 10 or deptno = 20
order by deptno, ename;

select deptno, ename, sal
from emp
where deptno in (10, 20)
order by deptno, ename;

-- SQL에서는 숫자만이 아니라 문자열을 비교할 때도 비교 연산자(=, !=, >, ...)을 사용함.

-- 직원 테이블에서 직책이 'CLERK'인 직원들의 직책, 이름, 급여를 출력.
-- 이름 오름차순 순서로 출력.
select job, ename, sal
from emp
where job = 'CLERK'
order by ename;

-- SQL에서 문자열은 작은따옴표('')를 사용.
-- 테이블에 저장된 데이터(문자열)은 대/소문자를 구분.

-- 직원 테이블에서 직책이 CLERK 또는 MANAGER인 직원들의 직책, 이름, 급여를 검색.
-- 출력 순서 (1) 직책 (2) 급여 오름차순 정렬.
select job, ename, sal
from emp
where job = 'CLERK' or job = 'MANAGER'
order by job, sal;

select job, ename, sal
from emp
where job in ('CLERK', 'MANAGER')
order by job, sal;

-- 직원 테이블에서 20번 부서에서 근무하는 CLERK의 모든 정보를 검색
select * from emp
where deptno = 20 and job = 'CLERK';

-- 직원 테이블에서 20번 부서에서 근무하거나 또는 직책이 CLERK인 직원들의 모든 정보를 검색
select * from emp
where deptno = 20 or job = 'CLERK';

-- 직원 테이블에서 CLERK, ANALYST, MANAGER가 아닌 직원들의 사번, 이름, 직책, 급여를 검색
-- 사번 오름차순 정렬.
-- (1)
select empno, ename, job, sal
from emp
where job != 'CLERK' and job != 'ANALYST' and job != 'MANAGER'
order by empno;

-- (2)
select empno, ename, job, sal
from emp
where not (job = 'CLERK' or job = 'ANALYST' or job = 'MANAGER')
order by empno;

-- (3)
select empno, ename, job, sal
from emp
where not job in ('CLERK', 'ANALYST', 'MANAGER')
order by empno;

select empno, ename, job, sal
from emp
where job not in ('CLERK', 'ANALYST', 'MANAGER')
order by empno;

-- 숫자, 날짜, 문자열 타입들은 모두 크기(대/소) 비교가 가능.

-- '1987/01/01' (포함) 이후에 입사한 사원들의 레코드(모든 컬럼)를 검색
-- 입사일 오름차순으로 출력.
select *
from emp
where hiredate >= '1987/01/01'
order by hiredate;

-- to_date(날짜 문자열, 날짜 포맷 문자열) : 문자열을 date 타입으로 변환.
-- 연/월/일, 월/일/연(미국식), 일/월/연(영국식)
select * from emp
where hiredate >= to_date('87/01/01', 'RR/MM/DD')
order by hiredate;

-- 'D'보다 큰 이름을 갖는 직원들의 레크드를 검색. 이름의 오름차순으로 출력
select *
from emp
where ename > 'D'
order by ename;

-- 특정 문자(열)로 시작하는 단어를 검색
-- 'A'로 시작하는 이름을 갖는 직원들의 이름을 오름차순으로 출력.
select ename
from emp
where ename like 'A%' -- 이름(ename)의 글자수는 제한이 없고, A로 시작.
order by ename;

select ename
from emp
where ename like 'A_' -- 이름(ename)이 두 글자로 이루어져 있고, A로 시작.
order by ename;

select * from emp
where job like '_LERK'; -- ALERK, BLERK, CLERK, DLERK, ....

-- 직원 이름에 'E'가 포함된 직원들의 레코드(모든 컬럼)를 검색.
select * from emp
where ename like '%E%'
order by ename;

-- 30번 부서에서 일하는 직책이 SALES로 시작하는 직원들의
-- 사번, 이름, 급여, 부서번호, 직책을 검색. 사번 오름차순 출력.
select empno, ename, sal, deptno, job
from emp
where (deptno = 30) and (job like 'SALES%')
order by empno;


-- 20번, 30번 부서에서 일하는 직원들 중에서 급여가 2000을 초과하는
-- 직원들의 사번, 부서번호, 이름, 급여를 검색.
-- 출력 순서 (1) 부서번호 오름차순 (2) 사번 오름차순
select empno, deptno, ename, sal
from emp
where sal > 2000 and deptno in(20, 30)
order by deptno, empno;

-- 수당이 null이고, 매니저는 있고(not null), 직책이 MANAGER 또는 CLERK인
-- 직원들의 레코드를 검색. 사번 오름차순으로 출력
select *
from emp
where job in('MANAGER', 'CLERK') and comm is null and mgr is not null
order by empno;
