create database quan_ly_ban_hang;
create table product(product_id int primary key,
product_name varchar(45),product_price double);
create table customer(customer_id int primary key,
customer_name varchar(45), customer_age int);
create table `order`(oder_id int primary key,
oder_date date, oder_total_price double,
customer_id int,
foreign key (customer_id) references customer(customer_id));
CREATE TABLE order_detail (
    order_id INT,
    product_id INT,
    order_quantity INT,
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id)
        REFERENCES `order` (oder_id),
    FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);