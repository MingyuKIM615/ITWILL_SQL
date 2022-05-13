-- DDL(Data Query Language): 데이터 질의 언어. SELECT
-- DDL(Data Definition Language): 데이터 정의 언어.
--  CREATE, ALTER, TRUNCATE, DROP
--  테이블, 사용자 계정 등을 생성, 변경, 삭제하는 명령어
-- DML(Data Manipulation Language): 데이터 조작 언어.
--  INSERT, UPDATE, DELETE
--  테이블에 행(row, recode)을 추가, 변경, 삭제하는 명령어.
-- TCL(Transaction Control Language): 트랜잭션 관리 언어
--  COMMIT(변경 내용을 DB에 영구 저장), ROLLBACK(직전 commit 상태로 되돌리기)

/* 테이블 생성
create table 테이블이름(
    컬럼이름 데이터타입,
    ...
);
*/

-- 테이블 이름: students
-- 컬럼 이름/데이터 타입
--  (1) sid : 학생 아이디. 숫자(number 4자리 정수)
--  (2) sname : 학생이름. 문자열(varchar2, 10글자까지 저장 가능한 문자열)
--  (3) birthday : 학생 생일. 날짜(date)
create table students(
    sid       number(4),
    sname     varchar2(10 char),
    birthday  date
);

-- 생성된 테이블 students의 구조 (컬럼 이름, NULL 여부, 데이터 타입) 확인
desc students;

-- 전체 레코드 검색
select * from students;

/* 테이블에 데이터 추가
insert into 테이블이름(컬럼, ...) values (값,...);

테이블의 모든 컬럼에, 테이블 컬럼 순서대로 데이터를 추가하는 경우에는 컬럼 이름들을 생략 가능.
insert into 테이블이름 values (값,...);
*/

insert into students(sid, sname) 
values(1001,'강민서');

insert into students
values (1002, '강민지', '21/12/15');

insert into students(sname, birthday, sid)
values ('강병주', '2020/12/15', 1003);

commit; -- 작업내용(insert 3개)를 DB에 영구 저장

-- students와 똑같은 모양의 테이블 students2를 생성
create table students2(
sid         number(4),
sname       varchar2(10 char),
birthday    date
);

desc students2;

select * from students2;

-- students 테이블의 모든 행들ㅇ르 students2 테이블 삽입(insert)
-- insert select 구문
insert into students2
select * from students;

-- 다른 테이블의 구조(컬럼 이름, 데이터 타입) 그대로 새로운 테이블 생성
-- create table ~ as select 구문
create table students3
as select * from students;

desc students3;

select * from students3;

-- 다른 테이블의 구조(컬럼 이름, 데이터 타입)을 그대로 사용하면서, 데이터는 복사하지 않을 때
create table students4
as select * from students where sid = -1;

select * from students4;

-- 테이블을 생성할때
create table citizens(
    cid           number(4),
    cname         varchar2(10 char),
    age           number(3) default 0,
    birthday      date default sysdate
);

insert into citizens
values(1, '홍길동', 16, '2000/01/01');

insert into citizens (cid, cname)
values(2, '허균');
-- insert할 때 age와 birthday를 설정하지 않으면, 테이블의 기본값(0, 현재시간)이 자동으로 삽입됨.

insert into citizens 
values(3, '오쌤');
-- 에러 발생 : 모든 컬럼의 값을 설정하지 않아서.

select * from citizens;

commit;

-- 테이블 삭제:
-- truncate table : 테이블의 모든 레코드(행)가 삭제 되고, 테이블 이름만 남아 있는 경우
-- drop table: 테이블 자체가 삭제.
truncate table students3;
select * from students3;

select * from students2;
drop table students2;
