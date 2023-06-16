insert into customer
values (1,'Minh Quan',10),(2,'Ngoc Anh',20),(3,'Hong Ha',50);
insert into `order`
values (1,'2006-3-21',null,1),(2,'2006-3-23',null,2),(3,'2006-3-16',null,1); 
insert into product
values (1,'May Giat',3),(2,'Tu Lanh',5),(3,'Dieu Hoa',7),(4,'Quat',1),(5,'Bep Dien',2);
insert into order_detail
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oder_id,oder_date,oder_total_price
from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customer_name,o.oder_date,p.product_name
from order_detail od
join `order` o on od.order_id=o.oder_id
join product p on od.product_id=p.product_id
join customer c on o.customer_id=c.customer_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.customer_name,o.oder_date,p.product_name
from order_detail od
join `order` o on od.order_id=o.oder_id
join product p on od.product_id=p.product_id
right join customer c on o.customer_id=c.customer_id
where o.customer_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
 -- Giá bán của từng loại được tính = odQTY*pPrice)
 
 