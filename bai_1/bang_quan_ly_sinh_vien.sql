create database `student-management`;
drop table student;
create table student(id int primary key auto_increment ,
name varchar(45),
age int,
country varchar(45));
create table class(id int primary key, name varchar(45));
create table teacher(id int primary key auto_increment, name varchar(45), age int, country varchar(45));
insert into class(id,name)
values (1,'C0323G1');
select*
from class;
insert into student (name,age,country)
values("Trần Minh Pháp",25,"Việt Nam"),("Võ Nhân Trí",18,"Quãng Ngãi");
select*
from student;
insert into student 
values("Võ Nhân Trí",18,"Việt Nam");
delete from student
where id=2;
set sql_safe_updates=1;
update student
set country="Huế"
where id=1;
update student
set country="Quảng Ngãi", age=16
where id=3;