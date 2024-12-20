drop table student;
CREATE TABLE STUDENT (
    NO NUMBER,                      -- 학번(PK)
    NAME VARCHAR2(12) NOT NULL,     -- 이름
    EMAIL VARCHAR2(30) NOT NULL,        -- 이메일
    ADDRESS VARCHAR2(50) NOT NULL,      -- 주소
    PHONE VARCHAR2(20) NOT NULL,        -- 전화번호
    REGDATE DATE               -- 등록일
);

ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_NO_PK PRIMARY KEY(NO);
select * from student;
CREATE SEQUENCE STUDENT_SEQ
START WITH 1
INCREMENT BY 1;

drop table subject;
CREATE TABLE SUBJECT (
    NO NUMBER,                      -- 과목코드(PK)
    NAME VARCHAR (20) NOT NULL,     -- 과목이름
    SCORE NUMBER NOT NULL              -- 학점
);
ALTER TABLE SUBJECT ADD CONSTRAINT SUBJECT_NO_PK PRIMARY KEY(NO);


insert into subject values(subject_seq.nextval,'C언어',4);


-- trainee 

drop table trainee;
CREATE TABLE TRAINEE (
    NO NUMBER,                      -- 수강번호(PK)
    STUNO NUMBER,                      -- 학번(FK)
    SUBNO NUMBER                       -- 과목코드(FK)
);

ALTER TABLE TRAINEE ADD CONSTRAINT TRAINEE_TRA_NO_PK PRIMARY KEY(NO);
ALTER TABLE TRAINEE ADD CONSTRAINT TRAINEE_STUDENT_STUNO_FK FOREIGN KEY(STUNO) REFERENCES STUDENT(NO) ON DELETE SET NULL;
ALTER TABLE TRAINEE ADD CONSTRAINT TRAINEE_SUBJECT_SUBNO_FK FOREIGN KEY(SUBNO) REFERENCES SUBJECT(NO) ON DELETE SET NULL;
select T.NO, STUNO, SUBNO, NAME, SCORE from trainee T inner join subject S on S.no = T.SUBNO;

CREATE SEQUENCE TRAINEE_SEQ
START WITH 1
INCREMENT BY 1;