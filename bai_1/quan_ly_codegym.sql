create database codegym_management;
create table hoc_vien(
id int primary key,
name_student varchar(45),
date_of_birth date,
gender bit,
email varchar(45),
score int);
create table account_james(
account varchar(45) primary key,
password varchar(45) not null);
create table teacher(
id int primary key,
name_teacher varchar(45),
date_of_birth date,
salary int);
create  table class(name varchar(45) primary key);