-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
 -- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
 select sf.id_service_free, sf.service_free_name
 from contract ctr
 join customer c on ctr.id_customer=c.id_customer
 join customer_type ct on c.id_customer_type=ct.id_customer_type
 join detail_contract dc on ctr.id_contract=dc.id_contract
 join service_free sf on dc.id_service_free=sf.id_service_free
 where ct.customer_type_name like 'Diamond' and (c.address like '%Vinh' or c.address like '%Quảng Ngãi')
 group by sf.id_service_free;
 -- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
 -- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem
 -- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
 -- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
 -- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 select
       ctr.id_contract,
       e.employee_name,
       c.customer_name,
       c.number_phone,
       s.service_name,
       s.id_service,
       sum(dc.quantity) as number_service_free,
       ctr.deposits
 from contract ctr
 join customer c on ctr.id_customer=c.id_customer
 join employee e on ctr.id_employee=e.id_employee
 join service s on ctr.id_service=s.id_service
 left join detail_contract dc on ctr.id_contract=dc.id_contract
where (ctr.contract_date between '2020-10-01' and '2020-12-31') and
ctr.contract_date not in (select contract_date
from contract
where contract_date between '2021-01-01' and '2021-06-31')
 group by ctr.id_contract;
 -- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
 select 	sf.id_service_free, sf.service_free_name, max(dc.quantity) as quantity_service_free
 from service_free sf
 join detail_contract dc on sf.id_service_free=dc.id_service_free
 join contract ctr on dc.id_contract=ctr.id_contract
 where dc.quantity in(
 select max(quantity)
 from detail_contract)
 group by sf.id_service_free;
 
 select sf.id_service_free, sf.service_free_name, sum(dc.quantity) as uses
 from service_free  sf
 join detail_contract dc on sf.id_service_free=dc.id_service_free
 group by sf.service_free_name, sf.id_service_free
 order by uses desc
 ;
 -- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
 -- (được tính dựa trên việc count các ma_dich_vu_di_kem).
 select ctr.id_contract, ts.type_service_name, sf.service_free_name, count(sf.id_service_free) as number_uses 
 from detail_contract dc
 join service_free sf on dc.id_service_free=sf.id_service_free
 join contract ctr on dc.id_contract=ctr.id_contract
 join service s on ctr.id_service=s.id_service
 join type_service ts on s.id_type_service=ts.id_type_service
 where sf.id_service_free in (
 select sf.id_service_free
 from service_free sf
 join  detail_contract dc on dc.id_service_free=sf.id_service_free
 join contract ctr on ctr.id_contract=dc.id_contract
 group by sf.id_service_free
 having count(dc.id_detail_contract)=1
 )
 group by dc.id_detail_contract
 order by ctr.id_contract;
 -- 15.Hiển thi thông tin của tất cả nhân viên bao gồm
 -- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới
 -- chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
 