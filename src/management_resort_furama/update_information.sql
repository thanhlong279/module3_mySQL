use resort_fumara;

insert into ViTri
    value
    (1, 'Quản lý'),
    (2, 'Lễ tân'),
    (3, 'Nhân viên phòng'),
    (4, 'Đầu bếp'),
    (5, 'Nhân viên bảo vệ'),
    (6, 'Nhân viên dọn dẹp'),
    (7, 'Nhân viên phục vụ'),
    (8, 'Kế toán viên'),
    (9, 'Chuyên viên nhân sự'),
    (10, 'Nhân viên IT'),
    (11, 'Nhân viên kỹ thuật'),
    (12, 'Nhân viên chăm sóc khách hàng'),
    (13, 'Nhân viên hành chính'),
    (14, 'Nhân viên quản lý kho'),
    (15, 'Nhân viên bảo trì');

insert into TrinhDo
    value
    (1, 'Trung học phổ thông'),
    (2, 'Cao đẳng'),
    (3, 'Đại học'),
    (4, 'Thạc sĩ'),
    (5, 'Tiến sĩ'),
    (6, 'Chứng chỉ nghề'),
    (7, 'Chứng nhận đào tạo ngắn hạn'),
    (8, 'Chứng chỉ đào tạo nâng cao'),
    (9, 'Đào tạo nội bộ'),
    (10, 'Chứng chỉ quốc tế'),
    (11, 'Chứng chỉ ngoại ngữ'),
    (12, 'Chứng chỉ tin học'),
    (13, 'Chứng chỉ quản lý khách sạn'),
    (14, 'Chứng chỉ nấu ăn'),
    (15, 'Chứng chỉ an ninh');

insert into BoPhan
    value
    (1, 'Quản lý'),
    (2, 'Tiếp tân'),
    (3, 'Phòng ở'),
    (4, 'Nhà bếp'),
    (5, 'Bảo vệ'),
    (6, 'Dọn dẹp'),
    (7, 'Phục vụ'),
    (8, 'Kế toán'),
    (9, 'Nhân sự'),
    (10, 'CNTT'),
    (11, 'Kỹ thuật'),
    (12, 'Chăm sóc khách hàng'),
    (13, 'Hành chính'),
    (14, 'Kho'),
    (15, 'Bảo trì');

insert into NhanVien
    value
    (1, 'Nguyễn Văn An', 1, 3, 1, '1985-01-15', '123456789', '20000000', '0912345678', 'nguyenvanan@example.com',
     '123 Đường A'),
    (2, 'Lê Thị Bích', 2, 3, 2, '1990-05-20', '987654321', '15000000', '0923456789', 'lethibich@example.com',
     '456 Đường B'),
    (3, 'Trần Văn Cường', 3, 2, 3, '1988-07-25', '456123789', '12000000', '0934567890', 'tranvancuong@example.com',
     '789 Đường C'),
    (4, 'Phạm Thị Dung', 4, 4, 4, '1992-02-17', '321654987', '18000000', '0945678901', 'phamthidung@example.com',
     '012 Đường D'),
    (5, 'Hoàng Văn Em', 5, 1, 5, '1987-11-30', '654987321', '10000000', '0956789012', 'hoangvanem@example.com',
     '345 Đường E'),
    (6, 'Nguyễn Thị Phương', 6, 2, 6, '1995-03-12', '789321456', '11000000', '0967890123', 'nguyenthif@example.com',
     '678 Đường F'),
    (7, 'Lê Văn Giang', 7, 1, 7, '1991-09-18', '852963741', '13000000', '0978901234', 'levangiang@example.com',
     '910 Đường G'),
    (8, 'Trần Thị Hương', 8, 3, 8, '1989-06-22', '741852963', '17000000', '0989012345', 'tranthihuong@example.com',
     '111 Đường H'),
    (9, 'Phạm Văn Hải', 9, 5, 9, '1986-08-29', '963258741', '16000000', '0990123456', 'phamvanhai@example.com',
     '222 Đường I'),
    (10, 'Hoàng Thị Liên', 10, 3, 10, '1993-04-04', '258741963', '15000000', '0901234567', 'hoangthilien@example.com',
     '333 Đường J'),
    (11, 'Nguyễn Văn Khoa', 11, 2, 11, '1984-12-11', '147258369', '14000000', '0912345678', 'nguyenvankhoa@example.com',
     '444 Đường K'),
    (12, 'Lê Thị Lan', 12, 3, 12, '1994-07-07', '369147258', '13000000', '0923456789', 'lethilan@example.com',
     '555 Đường L'),
    (13, 'Trần Văn Minh', 13, 4, 13, '1996-05-14', '258369147', '12000000', '0934567890', 'tranvanminh@example.com',
     '666 Đường M'),
    (14, 'Phạm Thị Ngọc', 14, 2, 14, '1997-10-21', '159753486', '11000000', '0945678901', 'phamthingoc@example.com',
     '777 Đường N'),
    (15, 'Hoàng Văn Đông', 15, 3, 15, '1983-03-03', '753159842', '10000000', '0956789012', 'hoangvandong@example.com',
     '888 Đường O');

insert into LoaiKhach
    value
    (1, 'Khách thường xuyên'),
    (2, 'Khách VIP'),
    (3, 'Khách vãng lai'),
    (4, 'Khách đoàn'),
    (5, 'Khách nước ngoài'),
    (6, 'Khách gia đình'),
    (7, 'Khách lẻ'),
    (8, 'Khách nội địa'),
    (9, 'Khách quốc tế'),
    (10, 'Khách doanh nghiệp'),
    (11, 'Khách tour'),
    (12, 'Khách sự kiện'),
    (13, 'Khách hội nghị'),
    (14, 'Khách online'),
    (15, 'Khách trực tiếp');

insert into KhachHang
    value
    (1, 1, 'Nguyen Van A', '1980-01-01', '123456789', '0123456789', 'nguyenvana@example.com', '123 Duong ABC'),
    (2, 2, 'Le Thi B', '1985-02-02', '234567890', '0987654321', 'lethib@example.com', '456 Duong DEF'),
    (3, 3, 'Tran Van C', '1990-03-03', '345678901', '0123456780', 'tranvanc@example.com', '789 Duong GHI'),
    (4, 4, 'Pham Thi D', '1995-04-04', '456789012', '0987654320', 'phamthid@example.com', '101 Duong JKL'),
    (5, 5, 'Hoang Van E', '2000-05-05', '567890123', '0123456781', 'hoangvane@example.com', '202 Duong MNO'),
    (6, 6, 'Vo Thi F', '1981-06-06', '678901234', '0987654322', 'vothif@example.com', '303 Duong PQR'),
    (7, 7, 'Do Van G', '1986-07-07', '789012345', '0123456782', 'dovang@example.com', '404 Duong STU'),
    (8, 8, 'Nguyen Thi H', '1991-08-08', '890123456', '0987654323', 'nguyenthih@example.com', '505 Duong VWX'),
    (9, 9, 'Le Van I', '1996-09-09', '901234567', '0123456783', 'levani@example.com', '606 Duong YZ'),
    (10, 10, 'Tran Thi J', '2001-10-10', '012345678', '0987654324', 'tranthij@example.com', '707 Duong ABC'),
    (11, 11, 'Pham Van K', '1982-11-11', '123456780', '0123456784', 'phamvank@example.com', '808 Duong DEF'),
    (12, 12, 'Hoang Thi L', '1987-12-12', '234567891', '0987654325', 'hoangthil@example.com', '909 Duong GHI'),
    (13, 13, 'Vo Van M', '1992-01-13', '345678902', '0123456785', 'vovanm@example.com', '1010 Duong JKL'),
    (14, 14, 'Do Thi N', '1997-02-14', '456789013', '0987654326', 'dothin@example.com', '111 Duong MNO'),
    (15, 15, 'Nguyen Van O', '2002-03-15', '567890124', '0123456786', 'nguyenvano@example.com', '222 Duong PQR');

insert into KieuThue
    value
    (1, 'Thuê theo giờ', 50000),
    (2, 'Thuê theo ngày', 300000),
    (3, 'Thuê theo tuần', 1800000),
    (4, 'Thuê theo tháng', 7000000),
    (5, 'Thuê theo năm', 80000000),
    (6, 'Thuê theo sự kiện', 10000000),
    (7, 'Thuê theo hội nghị', 15000000),
    (8, 'Thuê theo đoàn', 2500000),
    (9, 'Thuê theo gia đình', 2000000),
    (10, 'Thuê theo lẻ', 150000),
    (11, 'Thuê theo tour', 3500000),
    (12, 'Thuê theo doanh nghiệp', 5000000),
    (13, 'Thuê trực tiếp', 280000),
    (14, 'Thuê online', 270000),
    (15, 'Thuê qua trung gian', 320000);

insert into LoaiDichVu
    value
    (1, 'Phòng ở'),
    (2, 'Biệt thự'),
    (3, 'Hội nghị'),
    (4, 'Giải trí'),
    (5, 'Thư giãn'),
    (6, 'Thể thao');

INSERT INTO DichVu
    value
    (1, 'Phòng tiêu chuẩn', 30, 1, 2, 300000, 'Có sẵn', 2, 1),
    (2, 'Phòng cao cấp', 50, 2, 3, 500000, 'Có sẵn', 2, 1),
    (3, 'Phòng suite', 70, 3, 4, 700000, 'Có sẵn', 2, 1),
    (4, 'Biệt thự', 200, 1, 10, 2000000, 'Có sẵn', 4, 2),
    (5, 'Căn hộ', 100, 1, 5, 1000000, 'Có sẵn', 4, 2),
    (6, 'Phòng hội nghị', 150, 1, 100, 5000000, 'Có sẵn', 7, 3),
    (7, 'Phòng sự kiện', 200, 1, 200, 7000000, 'Có sẵn', 6, 3),
    (8, 'Nhà hàng', 300, 1, 150, 3000000, 'Có sẵn', 9, 4),
    (9, 'Bar', 150, 1, 100, 2000000, 'Có sẵn', 10, 4),
    (10, 'Spa', 100, 1, 20, 1000000, 'Có sẵn', 8, 5),
    (11, 'Phòng Gym', 100, 1, 30, 1500000, 'Có sẵn', 10, 5),
    (12, 'Sân tennis', 500, 1, 50, 500000, 'Có sẵn', 8, 6),
    (13, 'Hồ bơi', 1000, 1, 100, 1000000, 'Có sẵn', 8, 6),
    (14, 'Phòng họp', 100, 1, 50, 2000000, 'Có sẵn', 12, 3),
    (15, 'Phòng Karaoke', 50, 1, 20, 1000000, 'Có sẵn', 10, 4);

insert into HopDong
    value
    (1, 1, 1, 1, '2024-01-01', '2024-01-05', 500000, 1500000),
    (2, 2, 2, 2, '2024-01-02', '2024-01-06', 700000, 2100000),
    (3, 3, 3, 3, '2024-01-03', '2024-01-07', 1000000, 3000000),
    (4, 4, 4, 4, '2024-01-04', '2024-01-08', 2000000, 8000000),
    (5, 5, 5, 5, '2024-01-05', '2024-01-09', 1000000, 4000000),
    (6, 6, 6, 6, '2024-01-06', '2024-01-10', 2500000, 10000000),
    (7, 7, 7, 7, '2024-01-07', '2024-01-11', 3500000, 14000000),
    (8, 8, 8, 8, '2024-01-08', '2024-01-12', 1500000, 6000000),
    (9, 9, 9, 9, '2024-01-09', '2024-01-13', 2000000, 8000000),
    (10, 10, 10, 10, '2024-01-10', '2024-01-14', 1000000, 4000000),
    (11, 11, 11, 11, '2024-01-11', '2024-01-15', 1500000, 6000000),
    (12, 12, 12, 12, '2024-01-12', '2024-01-12', 3400000, 60000000),
    (13, 13, 13, 13, '2024-03-11', '2024-03-21', 1000000, 4000000),
    (14, 14, 14, 14, '2024-02-17', '2024-05-18', 1500000, 6000000),
    (15, 15, 15, 15, '2024-06-13', '2024-07-22', 3400000, 60000000);

insert into dichvudikem
    value
    (1, 'Dọn phòng', 200000, 'Lần', 'Có sẵn'),
    (2, 'Giặt ủi', 100000, 'Kg', 'Có sẵn'),
    (3, 'Đưa đón sân bay', 500000, 'Lần', 'Có sẵn'),
    (4, 'Cho thuê xe', 300000, 'Ngày', 'Có sẵn'),
    (5, 'Gọi taxi', 100000, 'Lần', 'Có sẵn'),
    (6, 'Đặt vé máy bay', 1000000, 'Lần', 'Có sẵn'),
    (7, 'Đặt tour du lịch', 2000000, 'Lần', 'Có sẵn'),
    (8, 'Dịch vụ spa', 500000, 'Lần', 'Có sẵn'),
    (9, 'Dịch vụ xông hơi', 300000, 'Lần', 'Có sẵn'),
    (10, 'Dịch vụ massage', 400000, 'Lần', 'Có sẵn'),
    (11, 'Dịch vụ ăn uống', 150000, 'Lần', 'Có sẵn'),
    (12, 'Dịch vụ giải trí', 200000, 'Lần', 'Có sẵn'),
    (13, 'Dịch vụ phòng họp', 1000000, 'Lần', 'Có sẵn'),
    (14, 'Dịch vụ tổ chức sự kiện', 5000000, 'Lần', 'Có sẵn'),
    (15, 'Dịch vụ y tế', 200000, 'Lần', 'Có sẵn');

insert into hopdongchitiet
    value
    (1, 4, 2, 2),
    (2, 5, 4, 3),
    (3, 2, 6, 1),
    (4, 1, 5, 4),
    (5, 7, 7, 5),
    (6, 4, 8, 2),
    (7, 5, 11, 1),
    (8, 12, 12, 0),
    (9, 14, 13, 2),
    (10, 11, 4, 4),
    (11, 9, 5, 3),
    (12, 8, 3, 1),
    (13, 5, 7, 4),
    (14, 2, 2, 2),
    (15, 1, 12, 5);

update nhanvien
set Dia_Chi = 'Đà Nẵng'
where ID_NhanVien = 15;

update khachhang
set Dia_Chi = 'Quảng Trị'
where ID_KhachHang = 15;

update loaikhach
set Ten_LoaiKhach = 'Diamond'
where ID_LoaiKhach = 15;

update hopdong
set ID_KhachHang = 7
where ID_HopDong = 6;

update hopdong
set NgayKetThuc = 2019-01-05,
    NgayLamHopDong = 2019-01-01
where ID_HopDong = 6;