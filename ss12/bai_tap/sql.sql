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
select *
from users;

DELIMITER //
create procedure select_all()
begin
select *
from users;
END //
DELIMITER ;
call select_all();

-- sử dụng sp cho update 
DELIMITER //
create procedure update_user(name varchar(255),email varchar(255), country varchar(255),id int)
begin
update users
set name= name, email=email, country=country
where users.id = id;
END //
DELIMITER ;
set sql_safe_updates = 0;
call update_user('Kante','kaka@ken.com','Kenia',10);

-- sử dụng sp cho delete
DELIMITER //
create procedure delete_user(id int)
begin
delete
from users
where users.id = id;
end //
DELIMITER ;

call delete_user(9);
