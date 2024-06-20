use quanlysinhvien;
1. hiển thị tất cả các thông tin môn học có credit lớn nhất
SELECT *
FROM subject
WHERE credit = (SELECT MAX(credit) FROM subject);
2. hiển thị thông tin môn học có điểm thi lớn nhất

select subject.SubID, SubName, MAX(Mark)
from subject
         join mark on subject.SubID = mark.SubID
GROUP BY subject.SubID, SubName
HAVING MAX(Mark) = (SELECT max(Mark) FROM mark);

3. hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
sắp xếp theo thứ tự giảm dần

select student.StudentID, student.StudentName, avg(mark.Mark) as 'Điểm TB'
from student
         join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName
order by avg(Mark) desc;



