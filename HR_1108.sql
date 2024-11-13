create table subject (
    no number(8),--pk
    s_num number(5) not null, --ck,fk
    s_name varchar2(20) not null 
);
alter table subject add constraint subject_no_pk primary key(no);
alter table subject add constraint subject_s_num_ck check (s_num in(01,02,03,04,05));
alter table subject add constraint subject_s_num_uk unique(s_num);
select * from user_constraints where table_name = upper('subject');
create table student01 (
    no number(8),--pk
    sd_num number(16) not null, --uk
    sd_name varchar2(20) not null,
    sd_id varchar2(20) not null,
    sd_passwd varchar2(30) not null,
    s_num number(5) not null, --uk,fk
    sd_jumin varchar2(20) not null,
    sd_phone varchar2(20) not null,
    sd_address varchar2(50) not null,
    sd_email varchar2(30) not null,
    sd_date date not null
);
alter table student01 add constraint student01_no_pk primary key(no);
alter table student01 add constraint student01_sd_num_uk unique(sd_num);
alter table student01 add constraint student01_s_num_uk unique(s_num);
alter table student01 add constraint student01_s_num_fk foreign key(s_num) references subject (s_num) on delete cascade;
select * from user_constraints where table_name = upper('student01');

create table lesson (
    no number(8),--pk
    l_num char(5) not null, --ck
    l_name varchar2(20) not null 
);
alter table lesson add constraint lesson_no_pk primary key(no);
alter table lesson add constraint lesson_l_num_ck check(l_num in('K', 'M', 'E', 'H', 'P', 'D', 'ed'));
select * from user_constraints where table_name = upper('lesson');

create table trainee (
    no number(8),--pk
    sd_num number(16) not null, --fk
    l_num char(5) not null, 
    t_section char(10) not null, --ck
    t_date date not null 
);
alter table trainee add constraint trainee_no_pk primary key(no);
alter table trainee add constraint trainee_t_section_ck check(t_section in('culture','major','minor'));
alter table trainee add constraint trainee_sd_num_fk foreign key(sd_num) references student01 (sd_num) on delete cascade;
select * from user_constraints where table_name = upper('trainee');