-- 학과  (01-컴퓨터학과 / 02-교육학과 / 03-신문방송학과 / 04-인터넷비즈니스과 / 05-기술경영과)
create table subject( 
    no number,                  -- pk, seq
    num varchar2(2) not null,   -- 학과번호 01,02,03,04,05
    name varchar2(24) not null  -- 학과이름    
);

alter table subject add constraint subject_no_pk primary key(no);
alter table subject add constraint subject_num_uk unique(num);

create sequence subject_seq
start with 1
increment by 1;

-- 학생
create table student( 
no number not null,             -- pk, seq
num varchar2(8) not null,       -- 학번(년도,학과번호)
name varchar2(12) not null,     -- 이름
id varchar2(12) not null,       -- 아이디
passwd varchar2(12) not null,   -- 패스워드
s_num varchar2(2) not null,     -- 학과번호(fk)
birthday varchar2(8) not null,  -- 생년월일
phone varchar2(15) not null,    -- 전화번호  
address varchar2(80) not null,  -- 주소
email varchar2(40) not null,    -- 이메일
sdate date default sysdate      -- 등록일
);

alter table student add constraint student_no_pk primary key(no);
alter table student add constraint student_id_uk unique(id);
alter table student add constraint student_num_uk unique(num);
alter table student add constraint student_subject_num_fk 
foreign key(s_num) references subject(num) on delete set null;
alter table student drop constraint student_subject_num_fk ;

create sequence student_seq
start with 1
increment by 1;

-- lesson 과목
create table lesson( 
    no number,                  -- pk seq
    abbre varchar2(2) not null, -- 과목요약
    name varchar2(20) not null  -- 과목이름 
);
alter table lesson add constraint lesson_no_pk primary key(no);
alter table lesson add constraint lesson_abbre_uk unique(abbre);

create sequence lesson_seq 
start with 1
increment by 1;

select * from lesson;
delete from lesson where no = ?;
update lesson set abbre = '01',name = '컴퓨터구조론' where no = 10;
insert into lesson values(lesson_seq.nextval, '', '');
desc lesson;

drop table trainee;
-- trainee 수강 신청
create table trainee( 
    no number ,                     -- pk seq
    s_num varchar2(8) not null,     -- student(fk) 학생번호
    abbre varchar2(2) not null,     -- lesson(fk) 과목요약
    section varchar2(20) not null,  -- 전공,부전공,교양
    registdate date default sysdate      -- 수강신청일
);

alter table trainee add constraint trainee_no_pk primary key(no);
alter table trainee add constraint trainee_student_num_fk 
foreign key(s_num) references student(num) on delete set null;
alter table trainee add constraint trainee_lesson_abbre_fk 
foreign key(abbre) references lesson(abbre) on delete set null;


create sequence trainee_seq 
start with 1
increment by 1;

insert into subject(no, s_num, s_name) values (subject_seq.nextval, ?, ?);

-- 동일학과번호 총갯수
select LPAD(count(*),4,'0') as total_count from student where s_num = 10;


