-- 테이블 설계하기(사원번호, 사원명, 급여)
-- class EMP01{
--    public int no;
--    public string name;
--    public double salary;
-- }
create table EMP01(
    no NUMBER(4),
    name VARCHAR2(20) not null,
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no),
    CONSTRAINT EMP01_name_uk UNIQUE(name)
);
--테이블 정보 구하기
select * from tab;
--테이블 삭제하기 ddl
drop table emp01;
--휴지통 보기
select * from recyclebin;
--테이블 복사
desc employees;
select count(*) from employees;
create table emple02 as select * from employees;
desc emple02;
select count(*) from emple02;
--제약조건 걸기 primary key
alter table emple02 add constraint emple02_id_pk primary key(employee_id);
alter table emple02 add constraint emple02_email_uk unique(email);
--제약조건 삭제하기 unique
alter table emple02 drop constraint emple02_email_uk;
--제약조건 정보 검색
select * from user_constraints where table_name = upper('emple02');
select table_name, constraint_name, constraint_type from user_constraints where table_name = upper('emple02'); 
--컬럼추가 emp01
alter table emp01 add job varchar2(10) not null;
desc emp01;
--컬럼제거 emp01
alter table emp01 drop COLUMN job;
--컬럼변경(주의 : 기존값이 존재할 때 생각을 할 것 -> 타입변경불가, 사이즈 큰 것으로 변경가능)
alter table emp01 modify job number(10) default 0;
--컬럼이름변경
alter table emp01 rename job to job2;

--테이블명을 변경 emp01 -> emp02 (create, alter, drop, rename, truncate)
rename emp01 to emp02; 
select * from tab;

drop table customer01;
create table customer01(
    user_id char(7),
    name VARCHAR2(10) not null,
    gender char(1) not null,
    birthcday char(8) not null,
    phone VARCHAR2(16),
    email VARCHAR2(30),
    bal_point number(10) default 0 
);
desc customer01;
alter table customer01 add constraint customer01_user_id_pk primary key(user_id);
alter table customer01 add constraint customer01_gender_ck check(gender in('M','W'));
alter table customer01 add constraint customer01_email_uk unique(email);

--제약조건 검색
select * from user_constraints where table_name = 'CUSTOMER01';

desc emp02;
--제약조건 NOT NULL
alter table emp02 modify salary number(10,2) not null;