create database ex1_quanly_sanpham;
use ex1_quanly_sanpham;
-- tạo các bảng chính
create table PhieuXuat
(
SoPX int primary key,
NgayXuat datetime not null
);
create table VatTu
(
MaVTU varchar(50) primary key,
TenVTU varchar(50) not null
);
create table PhieuNhap
(
SoPN int primary key,
NgayNhap datetime not null
);
create table DonDH
(
SoDH int primary key,
NgayDH datetime not null,
MaNCC varchar(20) not null,
foreign key (MaNCC) references NhaCC(MaNCC)
);
create table NhaCC
(
MaNCC varchar(50) primary key,
TenNCC varchar(50) not null,
DiaChi varchar(100) not null
);
-- tạo bảng trung gian sinh ra từ mối quan hệ n-m
-- bảng trung gian ChiTietPX từ mối quan hệ PhieuXuat-VatTu
create table ChiTietPX
(
DGXuat float not null,
SLXuat float not null,
SoPX int not null,
MaVTU varchar(50) not null,
primary key(SoPX, MaVTU),
foreign key fk_PhieuXuat_VatTu(SoPX) references PhieuXuat(SoPX),
foreign key fk_PhieuXuat_VatTu2(MaVTU) references VatTu(MaVTU)
);
-- bảng trung gian ChiTietPN từ mối quan hệ PhieuNhap-VatTu
create table ChiTietPN
(
DGNhap float not null,
SLNhap float not null,
SoPN int not null,
MaVTU varchar(50) not null,
primary key(SoPN, MaVTU),
foreign key fk_PhieuNhap_VatTu(SoPN) references PhieuNhap(SoPN),
foreign key fk_PhieuNhap_VatTu2(MaVTU) references VatTu(MaVTU)
);
-- bảng trung gian ChiTietDDH từ mối quan hệ VatTu-DonDH
create table ChiTietDHH
(
MaVTU varchar(50) not null,
SoDH int not null,
primary key(MaVTU, SoDH),
foreign key fk_VatTu_DonDH(MaVTU) references VatTu(MaVTU),
foreign key fk_VatTu_DonDH2(SoDH) references DonDH(SoDH)
);
-- xác định thuộc tính đa trị tạo bảo SDT_NhaCC
create table SDT_NhaCC
(
MaNCC varchar(50) not null,
SDT varchar(20) not null,
primary key(MaNCC, SDT),
foreign key(MaNCC) references NhaCC(MaNCC)
);
 
