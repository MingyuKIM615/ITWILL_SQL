-- JOIN: 두 개 이상의 테이블에서 검색하는 것.
-- RDBMS(Realtional DataBase Management System) : 관계형 DB 관리 시스템
--   테이블들이 서로 관계를 맺고 있는 DB. JOIN 문장이 많이 사용됨.   

/* JOIN 문법
1. Oracle 문법
SELECT 컬럼,...
FROM 테이블1, 테이블2, ...
WHERE join조건;

2. ANSI 표준 문법
SELECT 컬럼,...
FROM 테이블1 join종류 테이블2 ON join조건; 
*/

-- 사번, 이름, 부서번호, 부서이름 검색
-- inner join
-- Oracle 문법
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

-- ANSI 표준 문법
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp inner join dept
    on emp.deptno = dept.deptno;
    
-- inner join은 두 테이블(emp, dept)에 공통으로 등장하는 부서 번호들만 검색.
-- emp 테이블의 '오쌤'(dept=50)이 결과에 나오지 않고,
-- dept 테이블의 'OPERATION'(deptno=40)이 결과에 포함되지 않음.
    
-- join 문장을 작성할 때는 from 절에서 테이블 이름에 별명을 줄 수 있음.
-- from에서 지정한 별명은 select, where, on, ... 등에서 사용할 수 있음.
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- emp 테이블의 empno, ename, deptno, 값을 1004, '오쌤', 50으로 삽입(새 데이터 추가)
insert into emp(empno, ename, deptno)
values(1004, '오쌤', 50);

commit; -- 테이블 변경 사항을 하드디스크에 영구 저장.

--Left Outer Join
select e.empno, e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+);

select e.empno, e.ename, e.deptno, d.dname
from emp e left outer join dept d 
    on e.deptno = d.deptno;
    
-- left outer join에서는 왼쪽 테이블(emp)에 등장하는 모든 부서 번호들이 검색됨.
-- 왼쪽 테이블에 존재하는 deptno=50인 '오쌤' 정보가 결과에 포함되지만,
-- 오른쪽 테이블에만 존재하는 deptno=40인 'Operation' 부서 정보는 결과에 포함되지 않음.
    
-- Right Outer Join
select e.empno, e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

select e.empno, e.ename, d.deptno, d.dname
from emp e right join dept d
    on e.deptno = d.deptno;

-- right outer join에서는 오른쪽 테이블에 있는 모든 부서 번호들이 검색됨.
-- 왼쪽 테이블에만 존재하는 deptno=50에 대한 정보는 검색 결과에 포함되지 않고,
-- 오른쪽 테이블에만 존재하는 deptno=40에 대한 정보는 검색 결과에 포함됨.

-- full outer join
-- Oracle문법은 없음! ANSI 표준 문법만 가능!
select e.empno, e.ename, e.deptno, d.deptno, d.dname
from emp e full outer join dept d
    on e.deptno = d.deptno;

-- Oracle에서는 합집합(union) 연산을 사용해서 full outer join을 할 수 있음.
select e.empno, e.ename, e.deptno, d.deptno, d.dname
    from emp e, dept d
    where e.deptno = d.deptno(+) -- left outer join
union -- 합집합
select e.empno, e.ename, e.deptno, d.deptno, d.dname
    from emp e, dept d
    where e.deptno(+) = d.deptno; -- right outer join
    
-- join 이름에서 inner와 outer는 생략 가능
-- inner join = join
-- left outer join = left join
-- right outer join = right join
-- full outer join = full join

-- 사번, 이름, 부서이름, 급여를 검색(inner join)
-- 급여가 2000 이상인 직원들만 선택. 출력 순서는 급여 내림차순.
-- Oracle
select e.empno, d.dname, e.sal 
from emp e, dept d
where e.deptno = d.deptno 
    and e.sal >= 2000
order by e.sal desc;

-- ANSI
select e.empno, d.dname, e.sal 
from emp e join dept d
    on e.deptno = d.deptno
where e.sal >= 2000
order by e.sal desc;

-- self join
-- 사번, 이름, 매니저 사번, 매니저 이름을 검색(inner join, left, right, full)
select distinct mgr from emp;

-- Oracle inner
select e1.empno as "사번", e1.ename as "직원 이름", 
    e1.mgr as "매니저 사번", e2.ename as "매니저 이름"
from emp e1, emp e2
where e1.mgr = e2.empno;

-- ANSI inner join
select e1.empno as "사번", e1.ename as "직원 이름", 
    e1.mgr as "매니저 사번", e2.ename as "매니저 이름"
from emp e1 join emp e2
    on e1.mgr = e2.empno;

-- Oracle left join
select e1.empno as "사번", e1.ename as "직원 이름", 
    e1.mgr as "매니저 사번", e2.ename as "매니저 이름"
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- ANSI left join
select e1.empno as "사번", e1.ename as "직원 이름", 
    e1.mgr as "매니저 사번", e2.ename as "매니저 이름"
from emp e1 left join emp e2
    on e1.mgr = e2.empno;
    
-- Oracle right join
select e1.empno as "사번", e1.ename as "직원 이름", 
    e1.mgr as "매니저 사번", e2.ename as "매니저 이름"
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

-- ANSI right join
select e1.empno as "사번", e1.ename as "직원 이름", 
    e1.mgr as "매니저 사번", e2.ename as "매니저 이름"
from emp e1 right join emp e2
    on e1.mgr = e2.empno;
    
-- ANSI full join
select e1.empno as "사번", e1.ename as "직원 이름", 
    e1.mgr as "매니저 사번", e2.ename as "매니저 이름"
from emp e1 full join emp e2
    on e1.mgr = e2.empno;
    
-- Non-equi Join: join 조건이 부등식(x < y, x > y, ...)이 되는 경우.
-- 사번, 이름, 급여, 급여등급 검색(emp, salgrade 테이블)
-- Oracle
select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- ANSI
select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
    on e.sal between s.losal and s.hisal;
    
-- 부서번호, 부서이름, 부서의 사원수, 부서별 급여 최솟값, 부서의 급여 최댓값
-- 부서번호 오름차순
-- inner join
-- Oracle
select e.deptno, d.dname, count(*), min(e.sal), max(e.sal)
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname
order by deptno;

-- ANSI
select e.deptno, d.dname, count(*), min(e.sal), max(e.sal)
from emp e join dept d
    on e.deptno = d.deptno
group by e.deptno, d.dname
order by deptno;

-- 부서번호, 부서이름, 사번, 이름, 매니저 사번, 매니저 이름, 급여, 급여 등급을 검색.
-- 부서 테이블의 모든 부서 번호(10, 20, 30, 40)가 검색되도록.
-- 매니저가 없는 사원(KING)도 검색되도록.
-- 출력 순서: (1)부서번호 오름차순 (2) 사번 오름차순
-- Oracle
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename, e1.sal, s.grade
from emp e1, dept d, emp e2, salgrade s
where d.deptno = e1.deptno(+)
    and e1.mgr = e2.empno(+)
    and e1.sal between s.losal(+) and s.hisal(+)
order by d.deptno, e1.empno;

-- ANSI
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename, e1.sal, s.grade
from dept d left join emp e1 on d.deptno = e1.deptno
    left join emp e2 on e1.mgr = e2. empno
    left join salgrade s on e1.sal between s.losal and s.hisal
order by d.deptno, e1.empno;

-- 부서 이름, 부서 위치, 부서의 직원 수를 검색(inner join)
-- Oracle
select d.dname, d.loc, count(*)
from emp e, dept d
where e.deptno = d.deptno
group by d.dname, d.loc;

-- ANSI
select d.dname, d.loc, count(*)
from emp e join dept d
    on e.deptno = d.deptno
group by d.dname, d.loc;

-- 직원 이름, 부서 위치, 급여, 급여 등급을 검색(inner join)
-- 급여 3000 이상인 레코드만 선택. 직원 이름 오름차순 정렬.
-- Oracle
select e.ename,  d.loc, e.sal, s.grade
from emp e, salgrade s, dept d
where e.deptno = d.deptno 
    and e.sal between s.losal and s.hisal
    and e.sal >= 3000
order by e.ename;

--ANSI
select e.ename,  d.loc, e.sal, s.grade
from salgrade s join emp e on e.sal between s.losal and s.hisal
    join dept d on e.deptno = d.deptno
where e.sal >= 3000
order by e.ename;
