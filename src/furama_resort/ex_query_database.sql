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
where (khachhang.Dia_Chi like '%Đà Nẵng' or khachhang.Dia_Chi like '%Quảng Trị')
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
       sum(ifnull(dichvu.ChiPhiThue, 0) +
           ifnull(hopdongchitiet.SoLuong, 0) * ifnull(dichvudikem.Gia, 0)) as 'Tính tổng tiền'
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
của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2020
nhưng chưa từng được Khách hàng đặt phòng  trong năm 2021.

select dichvu.ID_DichVu,
       dichvu.Ten_DichVu,
       dichvu.Dien_Tich,
       dichvu.SoNguoiToiDa,
       dichvu.ChiPhiThue,
       loaidichvu.Ten_LoaiDichVu
from dichvu
         join loaidichvu on dichvu.ID_LoaiDichVu = loaidichvu.ID_LoaiDichVu
where dichvu.ID_DichVu in
      (select distinct hopdong.ID_DichVu
       from hopdong
       where hopdong.NgayLamHopDong between '2020-1-1' and '2020-12-31')
  and dichvu.ID_DichVu not in
      (select distinct ID_DichVu
       from hopdong
       where hopdong.NgayLamHopDong between '2021-1-1' and '2021-12-31');

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
       count(hopdong.ID_HopDong)     as 'số lượng khách'
from hopdong
where year(NgayLamHopDong) = 2021
group by month(hopdong.NgayLamHopDong)
order by Tháng;

10.Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc,
SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet);

select hopdong.ID_HopDong,
       hopdong.NgayLamHopDong,
       hopdong.NgayKetThuc,
       hopdong.TienDatCoc,
       sum(hopdongchitiet.SoLuong) as 'Số lượng dịch vụ đi kèm'
from hopdong
         left join hopdongchitiet on hopdong.ID_HopDong = hopdongchitiet.ID_HopDong
         left join dichvudikem on hopdongchitiet.ID_DichVuDiKem = dichvudikem.ID_DichVuDiKem
group by hopdong.ID_HopDong, hopdong.NgayLamHopDong, hopdong.NgayKetThuc, hopdong.TienDatCoc;

11.Hiển thị thông tin các dịch vụ đi kèm đã đc sử dụng bởi những khách hàng có
TenLoaiKhachHang là 'Diamond' và có địa chỉ là 'Vinh'or 'Quảng Ngãi'

select dichvudikem.ID_DichVuDiKem,
       dichvudikem.Ten_DichVuDiKem
from dichvudikem
         join hopdongchitiet on dichvudikem.ID_DichVuDiKem = hopdongchitiet.ID_DichVuDiKem
         join hopdong on hopdongchitiet.ID_HopDong = hopdong.ID_HopDong
         join khachhang on hopdong.ID_KhachHang = khachhang.ID_KhachHang
         join loaikhach on khachhang.ID_LoaiKhach = loaikhach.ID_LoaiKhach
where loaikhach.Ten_LoaiKhach = 'Diamond'
  and (khachhang.Dia_Chi like '%Vinh' or khachhang.Dia_Chi like '%Quảng Ngãi');

12.Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu,
SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các
dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được
khách hàng đặt vào 6 tháng đầu năm 2019;

select hopdong.ID_HopDong,
       nhanvien.Ho_Ten,
       khachhang.Ho_ten,
       khachhang.SDT,
       dichvu.Ten_DichVu,
       sum(hopdongchitiet.SoLuong) as 'Số Lượng DVĐK',
       hopdong.TienDatCoc
from hopdong
         left join hopdongchitiet on hopdongchitiet.ID_HopDong = hopdong.ID_HopDong
         left join dichvu on hopdong.ID_DichVu = dichvu.ID_DichVu
         left join khachhang on hopdong.ID_KhachHang = khachhang.ID_KhachHang
         left join nhanvien on hopdong.ID_NhanVien = nhanvien.ID_NhanVien
where NgayLamHopDong in (select NgayLamHopDong
                         from hopdong
                         where NgayLamHopDong between '2020-10-1' and '2020-12-31')
  and NgayLamHopDong not in (select NgayLamHopDong
                             from hopdong
                             where NgayLamHopDong between '2021-1-1' and '2021-6-30')
group by hopdong.ID_HopDong, nhanvien.Ho_Ten, khachhang.Ho_ten, khachhang.SDT,
         dichvu.Ten_DichVu, hopdong.TienDatCoc;

13. hiển thị các thông tin các dịch vụ đi kèm đc sử dụng nhiều nhất bởi các khách hàng
đã đặt phòng(lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau);

with SoLuongDichVu as (select dichvudikem.ID_DichVuDiKem,
                              dichvudikem.Ten_DichVuDiKem,
                              sum(hopdongchitiet.SoLuong) as SoLuongDV
                       from hopdongchitiet
                                join dichvudikem on hopdongchitiet.ID_DichVuDiKem = dichvudikem.ID_DichVuDiKem
                       group by dichvudikem.ID_DichVuDiKem, Ten_DichVuDiKem)
select SoLuongDichVu.ID_DichVuDiKem,
       SoLuongDichVu.Ten_DichVuDiKem,
       SoLuongDV as 'Số Lượng DVĐK'
from SoLuongDichVu
where SoLuongDV = (select MAX(SoLuongDV) from SoLuongDichVu);

14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung;

select
       dichvudikem.Ten_DichVuDiKem,
       count(hopdongchitiet.ID_DichVuDiKem) as 'Số Lần SD DV'
from hopdongchitiet
        left join dichvudikem on hopdongchitiet.ID_DichVuDiKem = dichvudikem.ID_DichVuDiKem
group by dichvudikem.Ten_DichVuDiKem
having `Số Lần SD DV` = 1;

15. Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan
   , SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019;

select nhanvien.ID_NhanVien,
       nhanvien.Ho_Ten,
       trinhdo.TrinhDo,
       bophan.Ten_BoPhan,
       nhanvien.SDT,
       nhanvien.Dia_Chi,
       count(hopdong.ID_NhanVien) as 'số Hợp Đồng'
from hopdong
         join nhanvien on hopdong.ID_NhanVien = nhanvien.ID_NhanVien
         join trinhdo on nhanvien.ID_TrinhDo = trinhdo.ID_TrinhDo
         join bophan on nhanvien.ID_BoPhan = bophan.ID_BoPhan
group by nhanvien.ID_NhanVien, nhanvien.Ho_Ten, trinhdo.TrinhDo,
         bophan.Ten_BoPhan, nhanvien.SDT, nhanvien.Dia_Chi
having `số Hợp Đồng` <= 3;

16.xóa những nhân viên chưa từng lập được hợp đồng nào từ năm 2020 đến năm 2022;

delete
from nhanvien
where nhanvien.ID_NhanVien not in (select hopdong.ID_NhanVien
                                   from nhanvien
                                            join hopdong on nhanvien.ID_NhanVien = hopdong.ID_NhanVien
                                   where hopdong.NgayLamHopDong between '2020-01-01' and '2022-12-31');

delete
from nhanvien
where not exists(select *
                 from hopdong
                 where nhanvien.ID_NhanVien = hopdong.ID_NhanVien
                   and hopdong.NgayLamHopDong between '2020-01-01' and '2022-12-31');

17.Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019
là lớn hơn 10.000.000 VNĐ;

with TongTienThanhToan as (select khachhang.ID_KhachHang,
                                  khachhang.Ho_ten,
                                  loaikhach.Ten_LoaiKhach,
                                  hopdong.ID_HopDong,
                                  dichvu.Ten_DichVu,
                                  hopdong.NgayLamHopDong,
                                  hopdong.NgayKetThuc,
                                  sum(ifnull(dichvu.ChiPhiThue, 0) +
                                      ifnull(hopdongchitiet.SoLuong, 0) *
                                      ifnull(dichvudikem.Gia, 0)) as 'Tính tổng tiền'
                           from furama_resort.khachhang
                                    left join furama_resort.hopdong on khachhang.ID_KhachHang = hopdong.ID_KhachHang
                                    left join furama_resort.loaikhach on khachhang.ID_LoaiKhach = loaikhach.ID_LoaiKhach
                                    left join furama_resort.hopdongchitiet
                                              on hopdong.ID_HopDong = hopdongchitiet.ID_HopDong
                                    left join furama_resort.dichvu on hopdong.ID_DichVu = dichvu.ID_DichVu
                                    left join furama_resort.dichvudikem
                                              on hopdongchitiet.ID_DichVuDiKem = dichvudikem.ID_DichVuDiKem
                           where year(hopdong.NgayLamHopDong) = 2021
                           group by khachhang.ID_KhachHang, khachhang.Ho_ten, loaikhach.Ten_LoaiKhach,
                                    hopdong.ID_HopDong, dichvu.Ten_DichVu,
                                    hopdong.NgayLamHopDong, hopdong.NgayKetThuc)

update khachhang
    join TongTienThanhToan on khachhang.ID_KhachHang = TongTienThanhToan.ID_KhachHang
    join loaikhach on khachhang.ID_LoaiKhach = loaikhach.ID_LoaiKhach
set khachhang.ID_LoaiKhach = 1
where TongTienThanhToan.`Tính tổng tiền` > 10000000
  and khachhang.ID_LoaiKhach = 2;

18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràngbuộc giữa các bảng);

delete hopdongchitiet
from hopdongchitiet join hopdong on hopdongchitiet.ID_HopDong = hopdong.ID_HopDong
where year(hopdong.NgayLamHopDong) < 2021;

delete from hopdong
where year(hopdong.NgayLamHopDong) < 2021;

delete
from khachhang
where not exists (select *
                  from hopdong
                  where khachhang.ID_KhachHang = hopdong.ID_KhachHang);

19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi;

update dichvudikem
join hopdongchitiet on dichvudikem.ID_DichVuDiKem = hopdongchitiet.ID_DichVuDiKem
set dichvudikem.Gia = dichvudikem.Gia*2
where hopdongchitiet.SoLuong > 10;

20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai,
NgaySinh, DiaChi;

select nhanvien.ID_NhanVien,
       nhanvien.Ho_Ten,
       nhanvien.Email,
       nhanvien.SDT,
       nhanvien.Ngay_Sinh,
       nhanvien.Dia_Chi,
       'Nhân Viên' as "role"
from nhanvien
union
select khachhang.ID_KhachHang,
       khachhang.Ho_ten,
       khachhang.Email,
       khachhang.SDT,
       khachhang.Ngay_Sinh,
       khachhang.Dia_Chi,
       'Khách Hàng' as "role"
from khachhang;

