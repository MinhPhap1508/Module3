create database quan_ly_vat_tu;
create table phieu_xuat(
so_px int primary key,ngay_xuat date);
create table chi_tiet_px(dg_xuat varchar(45),sl_xuat varchar(45),so_px int, ma_vtu varchar(45),
primary key(so_px,ma_vtu),
foreign key (so_px)references phieu_xuat(so_px),
foreign key (ma_vtu)references vat_tu(ma_vtu));
create table vat_tu (ma_vtu varchar(10) primary key, ten_vtu varchar(45));
create table chi_tiet_don_dh(ma_vtu varchar(45),so_dh int,
primary key(ma_vtu,so_dh),
foreign key (ma_vtu)references vat_tu(ma_vtu),
foreign key (so_dh)references don_dh(so_dh));
create table chi_tiet_pn(dg_nhap varchar(45),sl_nhap varchar(45),ma_vtu varchar(45),so_pn int,
primary key(ma_vtu,so_pn),
foreign key (ma_vtu)references vat_tu(ma_vtu),
foreign key (so_pn)references phieu_nhap(so_pn));
create table phieu_nhap(so_pn int primary key,ngay_nhap date);
create table don_dh(so_dh int primary key, ngay_dh date,ma_nhacc varchar(45),
foreign key (ma_nhacc)references nha_cc(ma_nhacc));
create table nha_cc(ma_nhacc varchar(45) primary key,ten_nhacc varchar(45),dia_chi varchar(45));
alter table sdt add ma_nhacc varchar(45);
alter table sdt 
add constraint id_nhacc
foreign key (ma_nhacc) references nha_cc(ma_nhacc);
create table sdt(id int primary key, sdt varchar(45) not null);
alter table nha_cc drop constraint id_sdt;
