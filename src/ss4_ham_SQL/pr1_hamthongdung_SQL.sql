use quanlysinhvien;

1. sử dụng hàm count để hiển thị số lượng sinh viên từng nơi
select student.Address, count(student.StudentID) as 'Số lượng học viên'
from student
group by student.Address;

2. tính điểm trung bình của các môn học của mỗi học viên

select student.StudentID, student.StudentName, avg(mark.Mark) as 'Điểm Trung Bình'
from student
         join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName;

3. hiển thị các bạn học viên có điểm trung bình lớn hơn 15

select student.StudentID, student.StudentName, avg(mark.Mark)
from student
         join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName
having avg(mark.Mark) > 15;

4. Hiển thị thông tin các học viên có điểm trung bình lớn nhất

select student.StudentID, student.StudentName, avg(mark.Mark)
from student
         join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName
having avg(mark.Mark) >= all (select avg(mark.Mark) from mark group by mark.StudentID);