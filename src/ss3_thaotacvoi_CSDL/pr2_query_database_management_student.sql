use quanlysinhvien;
select * from student;
select * from student
where Status = true;
select * from subject
where Credit < 10;
select student.StudentID, student.StudentName, class.ClassName
from student join class on student.StudentID = class.ClassID
where class.ClassName = 'A1';
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';