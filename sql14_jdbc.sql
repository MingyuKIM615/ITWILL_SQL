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
    update_time date default sysdate
);

-- 테이블 편집 --> blog_no 컬럼에 열 시퀀스를 설정.
-- --> insert할 때 blog_no의 숫자가 자동으로 1씩 증가되면서 삽입되도록 하기 위해서.

-- 새 블로그 글 작성(insert)
insert into blogs (title, content)
values ('새 글 작성 테스트', '안녕하세요... 블로그 첫 작성글입니다...');

insert into blogs (title, content)
values('두번째 작성글', 'Hello, This is my second bolg content...');

insert into blogs(title, content)
values('test3', 'test content 3...');

select * from blogs;

commit;

UPDATE blogs
SET title = 'title 변경', content = 'Hello, 첫번째 변경 테스트...', update_time = sysdate
WHERE blog_no = 1;

commit;

DELETE FROM blogs WHERE blog_no = 6;
select * from blogs;
rollback;