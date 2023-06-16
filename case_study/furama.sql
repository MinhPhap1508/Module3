create database furama;
use furama;
create table `position`(id_position int primary key,
position_name varchar(45));
create table level (id_level int primary key,
level_name varchar(45));
create table departement (id_part int primary key,
part_name varchar(45));
create table employee(
id_employee int primary key,
employee_name varchar(45) not null,
birthday date not null,
id_card varchar(45) not null,
salary double not null,
number_phone varchar(10) not null,
email varchar(45),
address varchar(45),
id_position int, id_level int, id_part int,
foreign key (id_position) references `position`(id_position),
foreign key (id_level) references level(id_level),
foreign key (id_part) references departement(id_part)
);

create table customer_type(
id_customer_type int primary key,
customer_type_name varchar(45)
);
create table customer(
id_customer int primary key,
id_customer_type int,
customer_name varchar(45) not null,
birthday date not null,
gender bit(1) not null,
id_card varchar(45) not null,
number_phone varchar(45) not null,
email varchar(45),
address varchar(45),
foreign key (id_customer_type) references customer_type(id_customer_type));

create table rental_type(
id_rental_type int primary key,
rental_type_name varchar(45));
create table type_service(
id_type_service int primary key,
type_service_name varchar(45));
create table service(
id_service int primary key,
service_name varchar(45) not null,
area_service int,
rental_costs double not null,
max_people int,
id_rental_type int,
id_type_service int,
room_standard varchar(45),
convenient varchar(45),
area_pool double,
floors int,
foreign key (id_rental_type)references rental_type(id_rental_type),
foreign key (id_type_service)references type_service(id_type_service));
create table service_free(
id_service_free int primary key,
service_free_name varchar(45) not null,
price double not null,
unit varchar(45) not null,
status varchar(45));

create table contract(
id_contract int primary key,
contract_date datetime not null,
contract_end_date datetime not null,
deposits double not null,
id_employee int,
id_customer int,
id_service int,
foreign key (id_employee)references employee(id_employee),
foreign key (id_customer)references customer(id_customer),
foreign key (id_service)references service(id_service));

create table detail_contract(
id_detail_contract int primary key,
id_contract int,
id_service_free int,
quantity int not null,
foreign key(id_contract)references contract(id_contract),
foreign key(id_service_free)references service_free(id_service_free));