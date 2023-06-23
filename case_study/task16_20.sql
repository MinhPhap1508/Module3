use furama;
-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates =0;
delete from employee 
where employee.id_employee not in(
select distinct id_employee
from contract
where year(contract_date) between 2019 and 2021);
set sql_safe_updates =1;
select *
from employee;
-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
create view view_total as
select c.id_customer,
sum(s.rental_costs+dc.quantity*sf.price) as total_price
from customer c
join customer_type ct on c.id_customer_type=ct.id_customer_type
join contract on c.id_customer=contract.id_customer
join service s on contract.id_service=s.id_service
join detail_contract dc on contract.id_contract=dc.id_contract
join service_free sf on dc.id_service_free=sf.id_service_free
group by c.id_customer;
update customer c
join customer_type ct on c.id_customer_type=ct.id_customer_type
join view_total vt on c.id_customer=vt.id_customer
set
c.id_customer_type=1
where c.id_customer_type=2 and vt.total_price > 10000000;
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set foreign_key_checks=0;
delete c
from customer c
join contract ctr on c.id_customer=ctr.id_customer
where year(contract_date) <2021;
set foreign_key_checks=1;
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates=0;
update service_free sf
join detail_contract dc on sf.id_service_free = dc.id_service_free
join contract ctr on dc.id_contract=ctr.id_contract
set sf.price=sf.price*2
where dc.quantity > 10 and year(contract_date)='2020';
set sql_safe_updates=1;
select sf.service_free_name,sf.price
from service_free sf;
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm
--  id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select e.id_employee as id, e.employee_name as name, e.email, e.number_phone, e.birthday, e.address
from employee e
union all
select c.id_customer, c.customer_name, c.email, c.number_phone, c.birthday, c.address
from customer c;