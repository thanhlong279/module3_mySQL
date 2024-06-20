drop database c0324H1;
create database c0324H1;
use c0324H1;
create table teachers
(
    id     int primary key,
    name   varchar(100),
    gender bit(1),
    phone  varchar(11),
    dob    date
);
create table classes
(
    id   int primary key auto_increment,
    name varchar(50)
);
create table account_student
(
    username varchar(100) primary key,
    password varchar(200)
);
create table teachers_teach_classes
(
    id_teacher int,
    id_class   int,
    primary key (id_teacher, id_class),
    foreign key fk_classes_teachers (id_class) references classes (id),
    foreign key fk_classes_teachers2 (id_teacher) references teachers (id)
);
create table students
(
    id       int primary key auto_increment,
    name     varchar(100),
    gender   bit(1),
    phone    varchar(11),
    dob      date,
    id_class int,
    username varchar(100) unique,
    foreign key fk_classes_students (id_class) references classes (id),
    foreign key fk_account_students (username) references account_student (username)
);

insert into teachers(id, name, gender, phone, dob) VALUE
    (1, 'Long', 1, 0987654321, '2000-10-17');
insert into teachers value
    (5, 'Nam', 0, 098765341, '2000-10-11'),
    (2, 'Long', 1, 0978654321, '2003-11-13'),
    (3, 'Long', 1, 0987655521, '2002-11-12'),
    (4, 'Long', 1, 0987653321, '2001-10-14');

insert into classes(name) value
    ('C03'),
    ('C04'),
    ('C05'),
    ('C06'),
    ('C01');

insert into teachers_teach_classes value
    (1, 3),
    (2, 4),
    (1, 5),
    (1, 2),
    (3, 3);
insert into account_student value
    ('long_c03', '123456'),
    ('hoang_c03', '111456'),
    ('tinh_c03', '122456'),
    ('khoa_c01', '123356'),
    ('hieu_c02', '123556');
insert into students(name, gender, phone, dob, id_class, username) value
    ('Long', 1, 0989094093, '2000-12-12', 1, 'long_c03'),
    ('Long', 1, 0989094321, '2000-11-19', 2, 'hoang_c03'),
    ('Long', 1, 0989345093, '2000-10-12', 3, 'tinh_c03'),
    ('Long', 1, 0985554093, '2000-8-22', 4, 'khoa_c01'),
    ('Long', 1, 0983334093, '2000-7-02', 5, 'hieu_c02');

# câu 1: lấy thông tin các học viên và cho các học viên đang theo học lớp nào?
select students.name, classes.name from students
join classes on students.id_class = classes.id;
# câu 2: lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào, lớp đó giảng viên nào dạy
select students.name, classes.name, teachers.name from students
join classes on students.id_class = classes.id
join teachers_teach_classes on classes.id = teachers_teach_classes.id_class
join teachers on teachers_teach_classes.id_class = teachers.id;
# câu 3: lấy ra thông tin các học viên đang theo học tại các lớp kể cả các học viên ko theo học tại lớp nào
select * from students;
# câu 4: Lấy thông tin của các học viên tiên 'Tien' và 'Toan'
select * from students
where students.name = 'Tien' or students.name = 'Toan';
# câu 5: lấy ra số lượng sinh viên của từng lớp
select classes.name, count(students.id)
from students
join classes on students.id_class = classes.id
group by classes.name ;
# câu 6: lấy ra danh sách học viên đã đc sắp xếp
select * from students
order by students.name;
