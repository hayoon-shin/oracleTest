-- employees 복사 
create table emp03 as select * from employees;

-- 모든 사원의 부서번호를 30번으로 수정하자
select * from emp03;
update emp03 set department_id = 30;
ROLLBACK;

-- 모든 사원의 급여를 10% 인상한다.
UPDATE EMP03 SET SALARY = SALARY * 1.1;
ROLLBACK;

-- 입사일을 오늘로 수정한다 
UPDATE EMP03 SET HIRE_DATE = SYSDATE;
ROLLBACK;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
UPDATE EMP03 SET department_id = 30 WHERE department_id = 10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
UPDATE EMP03 SET SALARY = SALARY * 1.10 WHERE SALARY >= 3000;

-- 2007년에 입사한 사원의 입사일을 오늘로 수정한다.
UPDATE EMP03 SET HIRE_DATE = SYSDATE WHERE SUBSTR(HIRE_DATE, 1, 2) = '07';
ROLLBACK;
-- 이름이 SUSAN의 부서번호는 20번으로, 직급은 FI_MGR
UPDATE EMP03 SET DEPARTMENT_ID = 20, JOB_ID = 'FI_MGR' WHERE UPPER(FIRST_NAME) = UPPER('SUSAN');
SELECT * FROM EMP03 WHERE FIRST_NAME = 'Susan';

-- LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다. 
update emp03 set salary = 17000, commission_pct = 0.45 where upper(last_name) = upper('Russell');

-- 30번 부서를 삭제
delete from emp03 where department_id = 30;
select * from emp03 where department_id = 30;

-- 실습을 위해 테이블을 생성
create table mycustomer (
    code varchar2(7),
    name varchar2(10) not null,
    gender char(1) not null,
    birthday varchar2(8) not null,
    phone_number varchar2(16) 
);
alter table mycustomer add constraint mycustomer_code_pk primary key (code);
alter table mycustomer add constraint mycustomer_gender_ck check (gender in('M','W'));
alter table mycustomer add constraint mycustomer_phone_number_uk unique(phone_number);
desc mycustomer;

-- 제약조건 검색기능(반드시 알아둘 것)
select * from user_constraints where table_name = 'MYCUSTOMER';
select * from user_tables;
select * from user_cons_columns where table_name = 'CUSTOMER01';
ALTER TABLE CUSTOMER01 DROP CONSTRAINT CUSTOMER01_EMAIL_UK;

INSERT INTO MYCUSTOMER VALUES ('2017108','박승대','M','19711430','010-2580-9919');
INSERT INTO MYCUSTOMER VALUES ('2019302','전미래','W','19740812','010-8864-0232');
SELECT * FROM mycustomer;

-- MERGE MYCUSTOMER-> CUSTOMER01 병합을 진행하는데 없으면 INSERT, 있으면 UPDATE
MERGE INTO CUSTOMER01 C
    USING MYCUSTOMER M
    ON (C.USER_ID = M.CODE)
    WHEN MATCHED THEN
    UPDATE SET C.NAME = M.NAME, C.GENDER = M.GENDER, C.BIRTHCDAY = M.BIRTHDAY, C.PHONE = M.PHONE_NUMBER
    WHEN NOT MATCHED THEN 
    INSERT (C.USER_ID,C.NAME,C.GENDER,C.BIRTHCDAY,C.PHONE) VALUES(M.CODE,M.NAME,M.GENDER,M.BIRTHDAY,M.PHONE_NUMBER);
    
SELECT * FROM CUSTOMER01;
SELECT * FROM MYCUSTOMER;
UPDATE MYCUSTOMER SET NAME = '박승우' WHERE CODE = '2017108';

-- 두 테이블을 관계설정하기
select * from DEPT01;
create table staff01 (
    staff_no number(8),
    staff_name varchar2(8),
    grade varchar2(8),
    salary number(5),
    dept_code number(8)
);
alter table staff01 add constraint staff01_staff_no_pk primary key(staff_no);
alter table staff01 add constraint staff01_dept_code_fk foreign key(dept_code) REFERENCES dept01(dept_code);
select * from user_constraints where table_name = 'DEPT01';
select * from user_constraints where table_name = 'STAFF01';

insert into dept01 values(10, 'ACCOUNTING');
insert into dept01 values(20, 'RESEARCH');
insert into dept01 values(30, 'SALES');
insert into dept01 values(40, 'OPERATIONS');

insert into staff01 values(7499, 'ALLEN','SALESMAN',10000,30);
insert into staff01 values(7566, 'JONES','MANAGER',17000,50);