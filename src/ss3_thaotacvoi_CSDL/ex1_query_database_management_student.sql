use quanlysinhvien;
# 1. hiển thị tất cả các sinh viên có tên bắt đầu bằng kí tự 'h'
select * from student
where student.StudentName LIKE 'h%';
# 2. Hiển thị thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class
where Status = true and MONTH(StartDate) = 12;
# 3. hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
select * from subject
where subject.Credit >= 3 and subject.Credit <= 5;
# 4. thay đổi mã lớp của sinh viên có tên 'Hung' thành 2
update student
set student.ClassID = 2
where student.studentName = 'Hung';
# 5. Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.StudentName, subject.SubName, mark.Mark
from student, subject, mark
ORDER BY mark.Mark DESC , student.StudentName ASC;