create database demo;
use demo;
-- Tạo bảng Products với các trường dữ liệu
drop table products;
create table products(
id int primary key auto_increment,
product_code varchar(45),
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45));
insert into products (product_code,product_name,product_price,product_amount,product_description,product_status)
values ('P01','Lamborghini',100000000,3,'Aventador','Nhập khẩu nguyên chiếc'),
('P02','Roll royce',9999999999,1,'Phantom','Có hàng sẵn'),('P03','Audi',7777777777,5,'Audi R8','Liên hệ trước');
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
create unique index index_products on products(product_name);
create index composite on products(product_name,product_price);
explain select *
from products
where product_name='Lamborghini' and product_price=100000000;
explain select *
from products
where product_name='Audi';
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view
create view view_products as
select product_code,product_name, product_price, product_status
from products;
update view_products
set product_price=8888888888
where product_name='Lamborghini';
delete from view_products
where product_code='P02';
drop view view_products;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
	delimiter //
    create procedure display_all_product()
    begin
		select *
        from products;
	end //
    delimiter ;
    call display_all_product();
    
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addproducts(
product_code varchar(45),
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45))
begin
	insert into products (product_code,product_name,product_price,product_amount,product_description,product_status)
    values (
product_code,
product_name,
product_price,
product_amount,
product_description,
product_status);
end //
delimiter ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
drop procedure if exists `update_product` //
create procedure update_product(
id int ,
product_code varchar(45),
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45))
begin
	update products
    set product_code = product_code,
		product_name = product_name,
        product_price=product_price,
		product_amount=product_amount,
		product_description = product_description,
		product_status = product_status
    where products.id = id;
    end //
    delimiter ;
    set sql_safe_updates=0;
    -- Tạo store procedure xoá sản phẩm theo id
    delimiter //
    create procedure delete_products(
    id int)
			begin
            delete from products
            where products.id=id;
	end //
    delimiter ;
    