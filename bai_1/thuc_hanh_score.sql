create database quan_ly_diem_thi;
create table students(
id int primary key,
name_student varchar(45),class_student varchar(45),gender bit);
create table `subject`(id int primary key,name_subject varchar(45),
id_teacher int,foreign key (id_teacher) references teacher(id));
create table board_score(
id_student int,id_subject int,score int,date_exam date,
foreign key (id_student) references students(id),
foreign key (id_subject)references subject(id));
create table teacher(id int primary key,name_teacher varchar(45),number_phone int);