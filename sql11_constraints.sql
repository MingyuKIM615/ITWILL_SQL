-- 제약조건(constraints)
-- 테이블에 데이터들이 insert될 때 조건을 만족하는 값들만 insert될 수 있도록 만들어 주는 제약.
-- 테이블을 create할 때
-- 테이블을 alter(변경)할 때
-- 종류 : primary key(고유키), not null, unique, check, foreign key(외래키)

-- 테이블을 생성할 때 제약 조건을 주는 방법 1:
create table ex01(
    ex_id       number(2) 
                primary key,
    ex_name     varchar2(10 char) 
                not null,
    ex_ucol     varchar2(10 char) 
                unique,
    ex_ccol     number(2) 
                check(ex_ccol >= 0),
    ex_col      number(2)
);

insert into ex01
values (1, '홍길동', 'test', 10, 99);

select * from ex01;

insert into ex01 (ex_id, ex_name, ex_ucol)
values (1, '홍길동', '테스트');
-- Primary Key : Unique(유일한 값, 중복되지 않는 값) + Not Null
-- 이미 ex_id에 값 1이 insert가 되어 있어서 같은 값이 또 insert될 수 없음!

insert into ex01 (ex_id, ex_name, ex_ucol)
values (null, '홍길동', '테스트');
-- Primary key는 null이 될 수 없다!

insert into ex01(ex_id)
values(2);
-- ex_name 은 null이 될 수 없다!!

insert into ex01(ex_id, ex_name, ex_ucol)
values (2, '홍길동', 'test');
-- ex_ucol의 unique 제약 조건 위배!

insert into ex01(ex_id, ex_name)
values (2, '홍길동');
-- 성공(PK 만족, Not null 만족). unique와 check 제약 조건은 not null은 관심 없음.

insert into ex01(ex_id, ex_name, ex_ccol)
values (3, '홍길동', -1);
-- ex_ccol의 값은 0 이상이어야 한다는 check 제약 조건을 위배!

insert into ex01 (ex_id, ex_name, ex_ccol)
values (3, '홍길동', 0);

select * from ex01;
commit;


-- 테이블을 생성할 때 제약 조건을 주는 방법 2: 제약 조건 이름 주기
create table ex02 (
    id      number(2)
            constraint pk_ex02_id primary key,
    name    varchar2(100) --- 100 byte
            constraint nn_ex02_name not null,
    code    varchar2(3)
            constraint uq_ex02_code unique,
    age     number(3)
            constraint ck_ex02_age check (age >= 0),
    gender  varchar2(1)
            constraint ck_ex02_gender check (gender in ('M', 'F'))
    
);

-- 테이블을 생성할 때 제약 조건을 주는 방법 3: 컬럼 정의와 제약 조건 정의
create table ex03(
    -- 컬럼 이름, 데이터 타입 선언
    id      number(2) default 0,
    name    varchar2(100),
    code    varchar2(3),
    age     number(3),
    gender  varchar(1),
    -- 제약 조건 선언
    constraint pk_ex03_id primary key(id),
    constraint nn_ex03_name check (name is not null),
    constraint uq_ex03_code unique (code),
    constraint ck_ex03_age check (age >= 0),
    constraint ck_ex03_gender check (gender in ('M', 'F'))
);


-- foreign key : 다른 테이블의 primary key를 참조하는 제약 조건.
-- insert할 때 다른 테이블 PK에 없는 값은 insert되지 않도록 하기 위해서.
create table ex_dept(
    deptno      number(2) primary key,
    dname       varchar2(10) not null
);

select * from ex_dept;

create table ex_emp(
    empno       number(4) primary key,
    ename       varchar2(10) not null,
    deptno      number(2) references ex_dept(deptno) -- 외래키(foreign key)
);

select * from ex_emp;

insert into ex_emp values (100,'abc', 10);
-- 에러 : ex_dept 테이블에 deptno = 10 인 레코드가 없기 때문에.

-- ex_dept 테이블에 데이터 삽입
insert into ex_dept values(10, 'HR');
insert into ex_dept values(20, '회계');

select * from ex_dept;

insert into ex_emp values (100,'abc', 10);
-- 성공: ex_dept 테이블에 deptno=10 레코드가 있기 때문에.

insert into ex_emp values(200, '홍길동', 20);
-- 성공: ex_dept 테이블에 deptno=20 레코드가 있기 때문에.

insert into ex_emp values(300, '오쌤', 30); -- 실패..

insert into ex_emp values(300, '오쌤', 10);

commit;