-- 로그인 테이블 작성
-- log_no 글 번호 number(4) PK
-- log_lastname 작성자 성 varchar2(20 char) NN
-- log_firstname 작성자 이름 varchar2(20 char) NN
-- log_birthdate 작성자 생년월일 date NN
-- log_id 작성자 id varchar2(10 char) PK
-- log_pass 작성자 pass varchar2(10 char) NN
-- log_nick 작성자 닉네임 varchar2(10char) NN
-- log_date 작성자 로그인 완료 시간 timestamp. default sysdate.


create table login(
    log_lastname    varchar2(20 char)
                    not null,
    log_firstname   varchar2(20 char)
                    not null,
    log_id          varchar2(10 char)
                    PRIMARY KEY,
    log_pass        varchar2(10 char)
                    not null,
    log_nick        varchar2(10 char)
                    not null
);


-- JDBC(Java Database Connectivity)
-- Java 프로그램에서 데이터베이스 시스텝에 접속해서 select/insert/update/delete를 하기 위한 방법

-- 블로그 작성 테이블
-- blog_no: 글번호. number(4) PK
-- title: 글제목. varchar2(100 char) NN
-- content: 글 본문. varchar2(1000 char) NN
-- update_time: 글 최종 작성(업데이트) 시간. timestamp. default sysdate.

create table blogs(
    blog_no     number(4) 
                primary key,
    title       varchar2(100 char) 
                not null,
    content     varchar2(1000 char) 
                not null,
    update_time date default sysdate,

    log_id      varchar2(10 char) 
                REFERENCES login(log_id)
);

delete from login;
commit;
insert into login (log_lastname, log_firstname, log_id, log_pass, log_nick)
values ('a', 'b', 'c', 'd', 'e');
select * from login;
select log_id, log_pass from login where log_id = 'a' and log_pass = 'a';

drop table blogs;
select * from blogs;
insert into blogs (content,title)
values (1,2);
delete  from blogs;

select * from blogs;
delete from blogs
where blog_no = 2;



insert into blogs (title, content, log_id)
values(123,123,'a');
commit;