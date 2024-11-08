-- 문제 1) TB_CUSTOMER 테이블에 아래 데이터를 추가하라

create table TB_CUSTOMER (
    CUSTOMER_CD NUMBER(7),  -- PK
    CUSTOMER_NM VARCHAR2(5) NOT NULL,
    MW_FLG VARCHAR2(1), -- CK
    BIRTH_DAY NUMBER(8) NOT NULL,
    PHONE_NUMBER VARCHAR2(12), -- UK
    EMAIL VARCHAR2(25), -- UK
    TOTAL_POINT NUMBER(10) NOT NULL,
    REG_DTTM NUMBER(15) NOT NULL
);
ALTER TABLE TB_CUSTOMER ADD CONSTRAINT TB_CUSTOMER_CD_PK PRIMARY KEY(CUSTOMER_CD);
ALTER TABLE TB_CUSTOMER ADD CONSTRAINT TB_CUSTOMER_MW_FLG_CK CHECK(MW_FLG IN('M','W'));
ALTER TABLE TB_CUSTOMER ADD CONSTRAINT TB_CUSTOMER_PHONE_NUMBER_UK UNIQUE(PHONE_NUMBER);
ALTER TABLE TB_CUSTOMER ADD CONSTRAINT TB_CUSTOMER_EMAIL_UK UNIQUE(EMAIL);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TB_CUSTOMER';
ALTER TABLE TB_CUSTOMER MODIFY(CUSTOMER_NM VARCHAR2(20));
ALTER TABLE TB_CUSTOMER MODIFY(PHONE_NUMBER VARCHAR2(20));
INSERT INTO TB_CUSTOMER VALUES(2017042, '강원진', 'M', 19810603, '010-8202-8790', 'wjgang@navi.com', 280300, 20170123132432);
INSERT INTO TB_CUSTOMER VALUES(2017053, '나경숙', 'W', 19891225, '010-4509-0043', 'ksna#boram.co.kr', 4500, 20170210180930);
INSERT INTO TB_CUSTOMER VALUES(2017108, '박승대', 'M', 19711430, NULL, 'sdpark@haso.com', 23450, 20170508203450);

-- 문제 2-1) EMP01 테이블을 삭제한 후 다음과 같은 구조로 EMP01테이블을 생성하라.
DELETE FROM EMP01;
CREATE TABLE EMP01 (
    NO NUMBER(4), -- PK
    NAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    MANAGER NUMBER(4),
    HIREDATE DATE NOT NULL,
    SALARY NUMBER(7,2) NOT NULL,
    COMMISSION NUMBER(7,2) DEFAULT 0.0,
    DEPTNO NUMBER(2)
);
ALTER TABLE EMP01 ADD CONSTRAINT EMP01_NO_PK PRIMARY KEY(NO);
-- 문제 2-2) EMP01 테이블에 다음과 같이 데이터를 추가하라.
INSERT INTO EMP01 VALUES(7369, 'SMITH', 'CLEAK', 7836, '80/12/17', 800, NULL, 20);
INSERT INTO EMP01 VALUES(7499, 'ALLEN', 'SALESMAN', 7369, '87/12/20', 1600, 300, 30);
INSERT INTO EMP01 VALUES(7839, 'KING', 'PRESIDENT', NULL, '81/02/08', 5000, NULL, 10);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP01';
SELECT * FROM EMP01;

-- 문제 3) 회원 정보를 저장하는 테이블을 MEMBERS란 이름으로 생성한다. MEMBERS 테이블은 다음과 같은 칼럼으로 구성된다. (PK는 PRIMARY KEY를 의미한다.)
CREATE TABLE MEMBERS (
    ID VARCHAR2(20), -- PK
    NAME VARCHAR2(2) NOT NULL,
    REGNO VARCHAR2(13) NOT NULL,
    HP VARCHAR2(13) NOT NULL,
    ADDRESS VARCHAR2(100) NOT NULL
);
ALTER TABLE MEMBERS ADD CONSTRAINT MEMBERS_ID_PK PRIMARY KEY(ID);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MEMBERS';
ALTER TABLE MEMBERS MODIFY(NAME VARCHAR2(20));
ALTER TABLE MEMBERS MODIFY(REGNO VARCHAR2(15));
INSERT INTO MEMBERS VALUES('ABC11', '김동률', '620103-1187912', '010-8982-9163', '서울시 강남구 청담동 718번지');
INSERT INTO MEMBERS VALUES('GANA23', '구라라', '931003-2179967', '010-7932-8173', '서울시 은평구 구산동 903번지');
SELECT * FROM MEMBERS;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MEMBERS';

-- 문제 4) 도서 정보를 저장하는 테이블을 BOOKS란 이름으로 생성한다. 테이블은 다음과 같은 칼럼으로 구성된다.
CREATE TABLE BOOKS (
    CODE NUMBER(4), -- PK
    TITLE VARCHAR2(50) NOT NULL,
    COUNT NUMBER(6) NOT NULL,
    PRICE NUMBER(10) NOT NULL,
    PUBLISH VARCHAR2(50) NOT NULL
);
ALTER TABLE BOOKS ADD CONSTRAINT BOOKS_CODE_PK PRIMARY KEY(CODE);
INSERT INTO BOOKS VALUES(1234, '이가 아파요', 3, 20000, '누리사');
INSERT INTO BOOKS VALUES(2214, '배가 아파요', 7, 22000, '누리사');
SELECT * FROM BOOKS;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'BOOKS';

-- 문제 5) 비디오 관리 시스템
CREATE TABLE v_gogek (
    g_code number(5), --pk
    g_name varchar2(20) not null,
    g_age number(3),
    g_addr varchar2(50),
    g_tel varchar2(20)
);
alter table v_gogek add constraint v_gogek_g_code_pk primary key(g_code);
select * from user_constraints where table_name = 'V_GOGEK';

create table video (
    v_code number(5), --pk
    v_title varchar2(50) not null,
    v_genre varchar2(30),
    v_pay number(7) not null,
    v_lend_state number(1),
    v_make_company varchar2(50),
    v_make_date date,
    v_view_age number(1)
);
alter table video add constraint video_v_code_pk primary key(v_code);
select * from user_constraints where table_name = 'VIDEO';

create table lend_return (
    lr_code number(5), --pk
    g_code number(5), --fk
    v_code number(5), --fk
    l_date date,
    r_plan_date date,
    l_total_pay number(7)
);
alter table lend_return add constraint lend_return_lr_code_pk primary key(lr_code);
alter table lend_return add constraint lend_return_g_code_fk foreign key(g_code) references v_gogek(g_code);
alter table lend_return add constraint lend_return_v_code_fk foreign key(v_code) references video(v_code);
select * from user_constraints where table_name = 'LEND_RETURN';