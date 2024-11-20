-- employees
SELECT * FROM EMPLOYEES;
DESC EMPLOYEES;
select * from books;
DROP TABLE BOOKS;
CREATE TABLE books (
    id number(4),
    title varchar2(50),
    publisher varchar2(30),
    year varchar2(10),
    price number(6)
);

ALTER TABLE BOOKS ADD CONSTRAINT BOOKS_ID_PK PRIMARY KEY(ID);
CREATE SEQUENCE BOOKS_ID_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'Operating System Concepts', 'Wiley', '2003',30700);
INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'Head First PHP and MYSQL', 'OReilly', '2009', 58000);
INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'C Programming Language', 'Prentice-Hall', '1989', 35000);
INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'Head First SQL', 'OReilly', '2007', 43000);
commit;
SELECT * FROM BOOKS;
DESC BOOKS;
SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME='BOOKS';

UPDATE BOOKS SET TITLE = 'KKK', PUBLISHER = 'JAVA', YEAR = '2024', PRICE = 33000 WHERE ID = 3;

drop table student;
create table student(
NO NUMBER(10),   
NAME VARCHAR2(10) NOT NULL, 
KOR NUMBER(10) NOT NULL ,   
ENG NUMBER(10) NOT NULL ,   
MAT NUMBER(10) NOT NULL ,   
TOT NUMBER(20),   
AVR NUMBER(20)
);

alter table student add constraint student_no_pk primary key(no);
SELECT * FROM STUDENT;
desc student;
select * from user_cons_columns where table_name = 'STUDENT';

CREATE SEQUENCE STUDNET_ID_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO STUDENT VALUES (STUDENT_ID_SEQ.nextval, '김하연', 90, 100, 80);
INSERT INTO STUDENT VALUES (STUDENT_ID_SEQ.nextval, 'Head First PHP and MYSQL', 'OReilly', '2009', 58000);
INSERT INTO STUDENT VALUES (STUDENT_ID_SEQ.nextval, 'C Programming Language', 'Prentice-Hall', '1989', 35000);
INSERT INTO STUDENT VALUES (STUDENT_ID_SEQ.nextval, 'Head First SQL', 'OReilly', '2007', 43000);
commit;