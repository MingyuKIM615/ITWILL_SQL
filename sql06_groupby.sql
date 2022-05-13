-- scott 계정 사용

-- 함수(function)
-- (1) 단일 행 함수: 
--     행(row)이 하나씩 함수의 argument로 전달되고, 행 마다 결과를 리턴하는 함수.
-- (2) 그룹 함수(다중 행 함수):
--     여러 개의 행(row)이 한꺼번에 함수의 argument로 전달되고, 
--     여러 개의 행에서 하나의 결과를 리턴하는 함수.

-- 단일 행 함수의 예
select ename, lower(ename)
from emp;

select hiredate, to_char(hiredate, 'RR/MM/DD')
from emp;

-- nvl(컬럼이름, value): 컬럼의 값이 null이 아니면 자기 자신을 리턴, null이면 value를 리턴.
-- nvl2(컬럼이름, value1,  value2): 컬럼이 값이 null 아니면 value1을, null이면 value2를 리턴.
select comm, nvl(comm, -1), nvl2(comm, comm, -1)
from emp;


-- 그룹 함수(다중 행 함수)의 예: 
-- count(개수), sum(합계), avg(평균), max(최댓값), min(최솟값), variance(분산), stddev(표준편차)
select count(ename), count(mgr), count(comm)
from emp;

select sum(sal), avg(sal), max(sal), min(sal),
    variance(sal), stddev(sal)
from emp;


-- 목적: 부서별 급여의 최댓값, 최솟값 찾기
select max(sal), min(sal)
from emp
where deptno = 30;

select deptno, max(sal), min(sal)
from emp
group by deptno
order by deptno;

-- 부서별 급여의 평균, 표준편차 찾기. 소수점 2자리까지 반올림. 부서번호 오름차순 정렬.
select deptno, 
    round(avg(sal), 2) as AVG_SAL, 
    round(stddev(sal), 2) as STDDEV_SAL
from emp
group by deptno
order by deptno;


-- 직책별 직원수, 급여의 최댓값, 평균, 최솟값 검색.
-- 소수점 2자리까지 표시. 직책 오름차순 정렬
select job, count(*), max(sal), 
    round(avg(sal), 2) as AVG_SAL,
    min(sal)
from emp
group by job
order by job;

-- 부서별, 직책별 부서번호, 직책, 직원수, 급여 평균 검색
-- 소수점 2자리까지 표시. 정렬 순서는 (1) 부서 번호 (2) 직책 오름차순
select deptno, job, count(*), round(avg(sal), 2)
from emp
group by deptno, job
order by deptno, job;

-- 입사연도별 사원수 검색. (힌트) to_char(날짜, 포맷) 이용
select to_char(hiredate, 'YYYY') as YEAR, count(*) as COUNT
from emp
group by to_char(hiredate, 'YYYY')
order by YEAR;
-- select 절에서 만든 별명은 where, group by, having에서는 사용할 수 없고,
-- order by에서만 사용 가능!

/* SELECT 구문 순서
select 컬럼, ...
from 테이블
where (그룹을 묶기 전에 검사할) 조건식
group by 그룹을 묶어줄 컬럼, ...
having 그룹을 묶은 다음에 검사할 조건식
order by 출력 순서를 설정할 컬럼, ...;
*/

-- 부서별 부서 번호, 급여 평균을 검색.
-- 부서별 급여 평균이 2000 이상인 부서들만 출력.
-- 부서 번호 오름차순으로 정렬 출력.
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000
order by deptno;

-- emp 테이블에서 mgr가 null이 아닌 직원들 중에서
-- 부서별 급여 평균을 검색. 부서 번호 오름차순 출력.
select deptno, round(avg(sal), 2)
from emp
where mgr is not null
group by deptno
order by deptno;

-- 직책별 사원수를 검색.
-- 직책이 PRESIDENT는 제외.
-- 직책별 사원수가 3명 이상인 경우만 선택.
-- 직책 오름차순 출력.
select job, count(*)
from emp
where job != 'PRESIDENT'
group by job
having count(*) >= 3
order by job;

select job, count(*)
from emp
group by job
having job != 'PRESIDENT'and count(*) >= 3
order by job;

-- 입사연도, 부서 번호, 입사연도별 부서별 입사한 사원수 검색.
-- 1980년 제외.
-- 연도별 부서별 사원수가 2명 이상인 경우 선택.
-- 연도 오름차순 출력.
select to_char(hiredate, 'YYYY'), deptno, count(*)
from emp
where to_char(hiredate,'YYYY') != '1980'
group by to_char(hiredate, 'YYYY'), deptno
having count(*) >= 2
order by to_char(hiredate,'YYYY');

select to_char(hiredate, 'YYYY') as year, deptno, count(*)
from emp
group by to_char(hiredate, 'YYYY'), deptno
having count(*) >= 2 and to_char(hiredate,'YYYY') != '1980'
order by to_char(hiredate,'YYYY');