use furama_resort;

2. hiển thị thông tin tất cả các nhân viên có trong hệ thống có tên bắt đầu là
một trong các ký tự "H", "T", "K" và tối đa 15 kí tự
select *
from furama_resort.nhanvien
where (nhanvien.Ho_Ten LIKE 'T%' or nhanvien.Ho_Ten like 'H%' or nhanvien.Ho_Ten like 'K%')
  and length(nhanvien.Ho_Ten) <= 15;

3. Hiển thị thông tin của tất cả các khách hàng có độ tuổi từ 18-50 và có địa chỉ ở
"Đà Nẵng" Hoặc "Quảng Trị"
SELECT *
FROM furama_resort.khachhang
where khachhang.Dia_Chi in ('Đà Nẵng', 'Quảng Trị')
  AND (YEAR(CURDATE()) - YEAR(ngay_sinh)) BETWEEN 18 AND 50;

4. đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần, Kết quả hiển thị đc
sắp xếp tăng dần theo số lần đặt phòng của khách hàng. chỉ đếm những khách hàng nào có tên
loại khách hàng là "Diamond"

select khachhang.Ho_ten,
       khachhang.ID_LoaiKhach,
       count(hopdong.ID_HopDong) as 'Số lần đặt phòng'
from furama_resort.hopdong
         join furama_resort.khachhang on hopdong.ID_KhachHang = khachhang.ID_KhachHang
         join furama_resort.loaikhach on khachhang.ID_LoaiKhach = loaikhach.ID_LoaiKhach
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
from furama_resort.khachhang
         left join furama_resort.hopdong on khachhang.ID_KhachHang = hopdong.ID_KhachHang
         left join furama_resort.loaikhach on khachhang.ID_LoaiKhach = loaikhach.ID_LoaiKhach
         left join furama_resort.hopdongchitiet on hopdong.ID_HopDong = hopdongchitiet.ID_HopDong
         left join furama_resort.dichvu on hopdong.ID_DichVu = dichvu.ID_DichVu
         left join furama_resort.dichvudikem on hopdongchitiet.ID_DichVuDiKem = dichvudikem.ID_DichVuDiKem
group by khachhang.ID_KhachHang, khachhang.Ho_ten, loaikhach.Ten_LoaiKhach, hopdong.ID_HopDong, dichvu.Ten_DichVu,
         hopdong.NgayLamHopDong, hopdong.NgayKetThuc;

6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại
Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3)

select dichvu.ID_DichVu,
       dichvu.Ten_DichVu,
       dichvu.Dien_Tich,
       dichvu.ChiPhiThue,
       loaidichvu.Ten_LoaiDichVu
from furama_resort.dichvu
         join furama_resort.loaidichvu on dichvu.ID_LoaiDichVu = loaidichvu.ID_LoaiDichVu
         left join furama_resort.hopdong on dichvu.ID_DichVu = hopdong.ID_DichVu
    and hopdong.NgayLamHopDong between '2021-01-01' and '2021-03-31'
where hopdong.ID_HopDong is null;

7.Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2021
nhưng chưa từng được Khách hàng đặt phòng  trong năm 2022.

select dichvu.ID_DichVu,
       dichvu.Ten_DichVu,
       dichvu.Dien_Tich,
       dichvu.SoNguoiToiDa,
       dichvu.ChiPhiThue,
       loaidichvu.Ten_LoaiDichVu
from dichvu
         join loaidichvu on dichvu.ID_LoaiDichVu = loaidichvu.ID_LoaiDichVu
         left join furama_resort.hopdong on dichvu.ID_DichVu = hopdong.ID_DichVu
    and hopdong.NgayLamHopDong between '2021-1-1' and '2022-1-1'
where ID_HopDong is null;

8.Hiển thị thông tin HoTenKhachHang có trong hệ thống,
với yêu cầu HoThenKhachHang không trùng nhau;

select distinct khachhang.Ho_ten
from khachhang;

select khachhang.Ho_ten
from khachhang
group by Ho_ten;

select khachhang.Ho_ten
from khachhang
union
select khachhang.Ho_ten
from khachhang;

9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019
thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng;

select month(hopdong.NgayLamHopDong) as 'Tháng',
       count(hopdong.ID_HopDong)            as 'số lượng khách'
from hopdong
where year(NgayLamHopDong) = 2021
group by month(hopdong.NgayLamHopDong)
order by Tháng;

10.Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc,
SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).



