-- inline comment
/* block comment
*/

select sysdate
from dual;  -- DBMS의 현재 시간 정보 출력
-- SQL 문장은 세미콜론(;)으로 끝남.
-- Ctrl+Enter: 커서가 위치한 곳의 SQL 한 문장(명령어)를 실행.
-- F5: 스크립트 실행. 파일의 처음부터 끝까지 모든 문장(명령어)를 실행.
-- select 문의 실행 결과는 [질의 결과] 탭에 출력.

show user;
-- Oracle에서만 사용하는 비표준 명령어. DBMS에 접속한 현재 사용자 이름 보여주기.
-- select 이외의 명령문 실행 결과는 [스크립트 출력] 탭에 출력됨.

describe emp;
-- describe 테이블 이름;
-- 테이블의 구조(컬럼 이름, NULL 가능 여부, 데이터 타입)를 출력.
-- describe는 desc로 줄여서 쓸 수 있음.

desc dept;

-- SQL 명령어(키워드)는 대/소문자를 구별하지 않음.
-- 명령어(키워드)를 모두 대문자로 사용하거나 또는 모두 소문자로 사용하는 것을 권장.
DESC dept;

-- Oracle 데이터베이스에서 테이블 이름, 컬럼 이름들도 대/소문자를 구별하지 않음.
-- Oracle 데이터베이스는 테이블 이름과 컬럼 이름은 대문자로 관리!
-- 데이터베이스 테이블에 저장되는 문자열 데이터들은 대/소문자를 구별함!
desc DEPT;

-- Oracle의 데이터 타입(data type)
-- number: 숫자 타입(정수, 실수).
--   (예) number(2): 2자리 정수. number(7, 2): 소수점 이하 2자리까지 표현가능한 실수.
-- varchar2: variable-length characters. 가변길이 문자열.
--   (예) varchar2(10 byte): 최대 10바이트까지 저장할 수 있는 문자열.
--   (예) varchar2(10 char): 최대 10글자까지 저장할 수 있는 문자열.
-- date: 날짜와 시간.