create database demo_web;
use demo_web;
create table users(
id int primary key auto_increment,
name varchar(120) not null,
email varchar(120) not null,
country varchar(120)
);
insert into users(name, email, country)
values('Minh', 'minh@codegym.vn','Viet Nam'), ('Kante', 'kante@che.uk','Kenia'); 