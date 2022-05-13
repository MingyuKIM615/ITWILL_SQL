-- DML(Data Manipulation Language): insert, update, delete
-- insert into 테이블 이름(컬럼, ...) values(값, ...);
-- insert into 테이블 select ~;
-- update 테이블 이름 set 컬럼 = 값, ... where 조건식;
-- delete from 테이블 이름 [where 조건식];
-- update와 delete에서 where 조건 구문이 없는 경우에는 테이블의 모든 행이 변경/삭제됨.

-- emp 테이블의 모든 내용을 emp2테이블로 복사
create table emp2
as select * from emp;

select * from emp2;

-- emp2에서 empno = 1004의 sal를 10000으로 변경
update emp2
set sal = 10000; -- 테이블의 모든 행(15개)이 업데이트

rollback; -- 최종 commit 상태로 되돌리기

update emp2
set sal = 10000
where empno  = 1004;

commit;
delete from emp2;
select * from emp2;
rollback;
-- delete는 rollback이 가능한 DML
-- truncate는 rollback이 불가능한 DDL

-- emp2 테이블에서 사번 1004를 삭제
delete from emp2
where empno = 1004;

commit;
