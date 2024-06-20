use resort_fumara;

2. hiển thị thông tin tất cả các nhân viên có trong hệ thống có tên bắt đầu là
một trong các ký tự "H", "T", "K" và tối đa 15 kí tự
select *
from resort_fumara.nhanvien
where (nhanvien.Ho_Ten LIKE 'T%' or nhanvien.Ho_Ten like 'H%' or nhanvien.Ho_Ten like 'K%')
  and length(nhanvien.Ho_Ten) <= 15;

3. Hiển thị thông tin của tất cả các khách hàng có độ tuổi từ 18-50 và có địa chỉ ở
"Đà Nẵng" Hoặc "Quảng Trị"
select *
from resort_fumara.khachhang
# where (khachhang.Dia_Chi = 'Đà Nẵng' or khachhang.Dia_Chi = 'Quảng Trị')
  where khachhang.Dia_Chi in ('Đà Nẵng', 'Quảng Trị')
  and (year(current_date) - year(khachhang.Ngay_Sinh)) between 18 and 50;

4. đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần, Kết quả hiển thị đc
sắp xếp tăng dần theo số lần đặt phòng của khách hàng. chỉ đếm những khách hàng nào có tên
loại khách hàng là "Diamond"

select khachhang.Ho_ten,
       khachhang.ID_LoaiKhach,
       count(hopdong.ID_HopDong) as 'Số lần đặt phòng'
from resort_fumara.hopdong
         join resort_fumara.khachhang on hopdong.ID_KhachHang = khachhang.ID_KhachHang
         join resort_fumara.loaikhach on khachhang.ID_LoaiKhach = loaikhach.ID_LoaiKhach
where loaikhach.Ten_LoaiKhach = 'Diamond'
group by khachhang.Ho_ten, khachhang.ID_LoaiKhach
order by count(hopdong.ID_HopDong);

5.Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
(Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra);

select khachhang.ID_KhachHang,
       khachhang.Ho_ten,
       loaikhach.Ten_LoaiKhach,
       hopdong.ID_HopDong,
       dichvu.Ten_DichVu,
       hopdong.NgayLamHopDong,
       hopdong.NgayKetThuc,
       sum(dichvu.ChiPhiThue + hopdongchitiet.SoLuong * dichvudikem.Gia) as 'Tính tổng tiền'
from resort_fumara.khachhang
         left join resort_fumara.hopdong on khachhang.ID_KhachHang = hopdong.ID_KhachHang
         left join resort_fumara.loaikhach on khachhang.ID_LoaiKhach = loaikhach.ID_LoaiKhach
         left join resort_fumara.hopdongchitiet on hopdong.ID_HopDong = hopdongchitiet.ID_HopDong
         left join resort_fumara.dichvu on hopdong.ID_DichVu = dichvu.ID_DichVu
         left join resort_fumara.dichvudikem on hopdongchitiet.ID_DichVuDiKem = dichvudikem.ID_DichVuDiKem
group by khachhang.ID_KhachHang, khachhang.Ho_ten, loaikhach.Ten_LoaiKhach, hopdong.ID_HopDong, dichvu.Ten_DichVu,
         hopdong.NgayLamHopDong, hopdong.NgayKetThuc;

6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại
Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3)

select dichvu.ID_DichVu,
       dichvu.Ten_DichVu,
       dichvu.Dien_Tich,
       dichvu.ChiPhiThue,
       loaidichvu.Ten_LoaiDichVu
from resort_fumara.dichvu
         join resort_fumara.loaidichvu on dichvu.ID_LoaiDichVu = loaidichvu.ID_LoaiDichVu
         left join resort_fumara.hopdong on dichvu.ID_DichVu = hopdong.ID_DichVu
    and hopdong.NgayLamHopDong between '2024-01-01' and '2024-03-31'
where hopdong.ID_HopDong is null ;




