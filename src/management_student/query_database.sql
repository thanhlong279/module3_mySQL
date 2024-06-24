use management_student;

# 1. tìm học viên có họ nguyễn

select *
from students
where students.FullName like 'Nguyen%';

# 2. tìm kiếm học viên có tên Anh

select *
from students
where students.FullName like '%Anh%';

# 3. Tìm kiếm học viên có độ tuổi từ 18-25

select *
from students
where (year(curdate()) - year(students.Dob)) between 18 and 25;

# 4. tìm kiếm học viên có ID là 12 hoặc 13

select *
from students
where students.ID_Student in (12, 13);

# 5. thống kê số lượng học viên của lớp(count)
select count(students.ID_Student) as 'Số lượng học viên'
from students;

# 6. thống kê số lượng học viên tại các tính

select address.Name_Address,
       count(students.ID_Address) as 'Số lượng học viên'
from students
         join address on students.ID_Address = address.ID_Address
group by address.Name_Address;

# 7. Tính điểm trung bình của các khóa học

select course.Name_Course,
       avg(point.Point) as 'Điểm trung bình'
from point
         join course on point.ID_Course = course.ID_Course
group by course.Name_Course;

8. Lấy ra điểm cao nhất, thấp nhất
select
       min(point.Point) as 'Điểm thấp nhất',
       max(point.Point) as 'Điểm cao nhất'
from point;

9. lấy ra danh sách chuyển đổi học sinh thành chữ hoa
select UPPER(students.FullName) from students;

10. đưa ra khóa học có điểm trung bình vao nhất;
with DiemTB as(
select course.Name_Course,
       avg(point.Point) as 'Điểm TB'
from point
         join course on point.ID_Course = course.ID_Course
group by course.Name_Course
)

select
       DiemTB.Name_Course,
       DiemTB.`Điểm TB` as 'Điểm TB cao nhất'
from DiemTB
where DiemTB.`Điểm TB` = (select max(DiemTB.`Điểm TB`) from DiemTB);
