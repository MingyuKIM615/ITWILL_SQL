-- DDL(Data Definition Language) : create, truncate, drop
-- alteruser scott account unlock;
-- alter user scott identified by tiger;

-- alter table 테이블 이름 변경 내용;

-- 이름 변경(rename) : (1) 테이블 이름 변경 (2) 컬럼 이름 변경 (3) 제약 조건 이름 변경
-- (1) 테이블 이름 변경 : students4 --> students2
alter table students4 rename to students2;

--(2) 컬럼 이름 변경
alter table students2 rename column name to stu_name;

-- (3) 제약 조건 이름 변경:
-- 제약 조건들을 관리하는 메타(meta), 테이블(user_constraints)
desc user_constraints;
select Constraint_name, table_name from user_constraints;
select constraint_name, constraint_type 
from user_constraints 
where table_name = 'EX01'; -- 제약 조건 이름/타입(종류)

-- ex01 제약 조건 SYS_C007005 이름을 PK_EX01로 변경
alter table ex01 rename constraint SYS_C007005 to PK_EX01;

-- 추가(add) : (1) 컬럼 (2) 제약 조건
-- (1) 컬럼 추가: alter table 이름 add 컬럼 데이터 타입[기본값 제약조건];
-- (2) 제약조건 추가 : alter table 이름 add constraint 제약조건이름 내용;
alter table ex01
add col_added date default sysdate;

alter table ex01
add constraint nn_ex01 check (col_added is not null);

-- 삭제(drop) : (1) 컬럼 (2) 제약 조건
-- (1) 컬럼 삭제 : alter table 이름 drop column 컬럼이름;
-- (2) 제약 조건 삭제 : alter table 이름 drop constraint 제약조건이름;

alter table ex01 drop column ex_col;
alter table ex01 drop constraint nn_ex01;

-- 변경(modify): 컬럼의 내용(데이터 타입, null 가능 -> not null)
-- 제약 조건의 내용을 변경하는 modify 구문은 제공되지 않음.
-- 제약 조건 내용 변경 : drop constraint --> add constraint 

-- ex01 테이블의 ex_name 컬럼의 데이터 타입을 varchar2(100 byte)로 변경
alter table ex01 modify ex_name varchar2(100 byte);


