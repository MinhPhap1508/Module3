use furama;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
--  một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from employee
where employee_name like 'H%' or employee_name like 'T%' or employee_name like 'K%'
and length(employee_name) <15;
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from customer
where (address like '%Đà Nẵng' or address like '%Quảng Trị') and datediff(now(),birthday)/365>18 and datediff(now(),birthday)/365 < 50;
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
 -- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select c.id_customer,c.customer_name,ct.customer_type_name, count(*) number_bookings
from customer c
join customer_type ct on c.id_customer_type=ct.id_customer_type
join contract on c.id_customer=contract.id_customer
where ct.customer_type_name='Diamond'
group by contract.id_customer
order by number_bookings;
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
 -- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và
 -- Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
 -- cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select c.id_customer,customer_name,customer_type_name,contract.id_contract,s.service_name,contract.contract_date,contract.contract_end_date,
(s.rental_costs+dc.quantity*sf.price) as `total_price`
from customer c
left join customer_type ct on c.id_customer_type=ct.id_customer_type
left join contract on c.id_customer=contract.id_customer
left join service s on contract.id_service=s.id_service
left join detail_contract dc on contract.id_contract=dc.id_contract
left join service_free sf on dc.id_service_free=sf.id_service_free;
-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng 
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3). 

select s.id_service, s.service_name, s.area_service, s.rental_costs, ts.type_service_name
from contract ctr
join service s on ctr.id_service=s.id_service
join type_service ts on s.id_type_service=ts.id_type_service
where s.id_service not in(
select id_service
from contract
where (month(contract_date)=1 or month(contract_date)=2 or month(contract_date)=3) and year(contract_date)=2021)
group by s.id_service;
-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich,
-- so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại 
-- dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng 
-- chưa từng được khách hàng đặt phòng trong năm 2021.
select s.id_service, s.service_name, s.area_service, s.max_people,s.rental_costs, ts.type_service_name
from contract ctr
join service s on ctr.id_service=s.id_service
join type_service ts on s.id_type_service=ts.id_type_service
where s.id_service not in(select id_service
from contract
 where year(contract_date)=2021)
group by s.id_service;
-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- cách 1
select customer_name
from customer
group by customer_name;
-- cách 2
select distinct customer_name
from customer;
-- cách 3
select customer_name
from customer
union
select customer_name
from customer;
-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi 
-- tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
select month(ctr.contract_date) as month,
count(ctr.id_customer) as quantity_customer
from contract ctr
where ctr.contract_date between '2021-01-01' and '2022-01-01'
group by month
order by month;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
 -- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select ctr.id_contract, ctr.contract_date,ctr.contract_end_date,ctr.deposits,
sum(dc.quantity) as number_service_free
from contract ctr
left join detail_contract dc on ctr.id_contract=dc.id_contract
group by ctr.id_contract;