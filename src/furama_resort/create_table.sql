create database furama_resort;
use furama_resort;
drop database furama_resort;
create table ViTri
(
    ID_ViTri  int primary key,
    Ten_ViTri varchar(45)
);

create table TrinhDo
(
    ID_TrinhDo int primary key,
    TrinhDo    varchar(45)
);

create table BoPhan
(
    ID_BoPhan  int primary key,
    Ten_BoPhan varchar(45)
);

create table NhanVien
(
    ID_NhanVien int primary key,
    Ho_Ten      varchar(50),
    Ngay_Sinh   date,
    So_CMTND    varchar(45),
    Luong       varchar(45),
    SDT         varchar(45),
    Email       varchar(45),
    Dia_Chi     varchar(45),
    ID_ViTri    int,
    ID_TrinhDo  int,
    ID_BoPhan   int,
    foreign key fk_NhanVien_ViTri (ID_ViTri) references ViTri (ID_ViTri),
    foreign key fk_NhanVien_TrinhDo (ID_TrinhDo) references TrinhDo (ID_TrinhDo),
    foreign key fk_NhanVien_BoPhan (ID_BoPhan) references BoPhan (ID_BoPhan)
);

create table LoaiKhach
(
    ID_LoaiKhach  int primary key,
    Ten_LoaiKhach varchar(45)
);

create table KhachHang
(
    ID_KhachHang int primary key,
    Ho_ten       varchar(45),
    Ngay_Sinh    date,
    Gioi_Tinh    bit(1),
    So_CMTND     varchar(45),
    SDT          varchar(45),
    Email        varchar(45),
    Dia_Chi      varchar(45),
    ID_LoaiKhach int,
    foreign key fk_KhachHang_LoaiKhach (ID_LoaiKhach) references LoaiKhach (ID_LoaiKhach)
);

create table KieuThue
(
    ID_KieuThue  int primary key,
    Ten_KieuThue varchar(45)
);

create table LoaiDichVu
(
    ID_LoaiDichVu  int primary key,
    Ten_LoaiDichVu varchar(45)
);

create table DichVu
(
    ID_DichVu     int primary key,
    Ten_DichVu    varchar(45),
    Dien_Tich     double,
    ChiPhiThue    double,
    SoNguoiToiDa  int,
    Tieu_Chuan_Phong varchar(45),
    Mo_Ta_Tien_Nghi_Khac varchar(45),
    DienTich_HoBoi double,
    So_Tang       int,
    ID_KieuThue int,
    ID_LoaiDichVu int,
    foreign key fk_DichVu_KieuThue (ID_KieuThue) references KieuThue (ID_KieuThue),
    foreign key fk_DichVu_LoaiDichVu (ID_LoaiDichVu) references LoaiDichVu (ID_LoaiDichVu)
);

create table HopDong
(
    ID_HopDong     int primary key,
    NgayLamHopDong date,
    NgayKetThuc    date,
    TienDatCoc     double,
    ID_NhanVien    int,
    ID_KhachHang   int,
    ID_DichVu      int,
    foreign key fk_HopDong_NhanVien (ID_NhanVien) references NhanVien (ID_NhanVien),
    foreign key fk_HopDong_KhachHang (ID_KhachHang) references KhachHang (ID_KhachHang),
    foreign key fk_HopDong_DichVu (ID_DichVu) references DichVu (ID_DichVu)
);

create table DichVuDiKem
(
    ID_DichVuDiKem    int primary key,
    Ten_DichVuDiKem   varchar(45),
    Gia               double,
    DonVi             varchar(45),
    TrangThai_KhaDung varchar(45)
);

create table HopDongChiTiet
(
    ID_HopDongChiTiet int primary key,
    SoLuong           int not null,
    ID_HopDong        int,
    ID_DichVuDiKem    int,

    foreign key fk_HopDongChiTiet_HopDong (ID_HopDong) references HopDong (ID_HopDong),
    foreign key fk_HopDongChiTiet_DichVuDiKem (ID_DichVuDiKem) references DichVuDiKem (ID_DichVuDiKem)
);