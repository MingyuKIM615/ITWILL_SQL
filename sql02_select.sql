-- Alt+F10: 새 워크시트(소스코드) 만들기

-- DQL(Data Query Language): 데이터베이스 테이블에서 자료를 검색.
-- select 컬럼1, 컬럼2, ... from 테이블 이름;

-- 부서 테이블(dept)에서 부서 번호(deptno)와 부서 이름(dname)을 검색.
select deptno, dname from dept;
SELECT deptno, dname FROM dept;
select DEPTNO, DNAME from DEPT;

-- 부서 테이블(dept)에서 모든 컬럼을 검색.
select deptno, dname, loc
from dept;
-- select한 컬럼 순서대로 출력.

select dname, loc, deptno
from dept;

select * from dept;
-- 테이블이 만들어진 컬럼 순서대로 출력.

-- 검색하는 컬럼 이름에 별명(출력문에서 보여질 컬럼 이름) 주기
-- select 컬럼 이름 as 별명, ... from 테이블 이름;
-- 별명은 큰따옴표("")로 묶어줌. 별명에 공백이 없는 경우에는 큰따옴표를 생략 가능.
select deptno as "부서 번호", dname as "부서 이름"
from dept;

-- 원하는 컬럼에만 별명을 줄 수 있음.
select deptno, dname as "부서 이름"
from dept;

-- 연결 연산자(||)
select deptno || dname as "부서 정보"
from dept;

select dname || ' 부서의 사무실 위치는 ' || loc || '입니다.' as "부서 정보"
from dept;
-- Oracle에서 문자열(varchar, varchar2)은 작은 따옴표('')로 묶어줌.

-- 정렬해서 출력하기: 오름차순(ascending order), 내림차순(descending order)
-- select 컬럼, ... from 테이블 이름 order by 정렬할 컬럼 asc/desc;
-- 정렬은 오름차순 정렬이 기본이어서 asc는 생략 가능.
-- 부서 테이블(dept)에서 부서 번호(deptno), 부서 이름(dname)을 부서 번호의 오름차순으로 출력.
select deptno, dname 
from dept
order by deptno;

-- 부서 테이블(dept)에서 부서 번호(deptno), 부서 이름(dname)을 부서 번호의 내림차순으로 출력.
select deptno, dname
from dept
order by deptno desc;

-- 직원 테이블(emp)에서 사번(empno)과 이름(ename)을 사번의 오름차순으로 출력.
select empno, ename
from emp
order by empno;

-- 직원 테이블(emp)에서 이름(ename)과 직책(job)을 "SMITH는 CLERK입니다." 형식으로 출력.
select ename || '은(는) ' || job || '입니다.' as "사원 정보"
from emp;

-- 직원 테이블(emp)에서 직책(job)을 검색
select job from emp;

-- 중복되지 않는 값들만 출력
select distinct job from emp;

-- distinct는 select 문장에서 한번만, 모든 컬럼 이름들 보다 먼저 사용.
select distinct job, deptno 
from emp;

-- 직원 테이블(emp)에서 중복되지 않는 부서 번호와 직책을 검색. 부서번호 오름차순으로 정렬.
select distinct deptno, job
from emp
order by deptno;