create database management_student;
use management_student;
drop database management_student;

create table Address
(
    ID_Address   int primary key auto_increment,
    Name_Address varchar(100)
);

create table Classes
(
    ID_Class    int primary key auto_increment,
    Name_Class  varchar(50),
    language    varchar(50),
    description varchar(200)
);

create table Students
(
    ID_Student int primary key auto_increment,
    FullName   varchar(50),
    Dob        date,
    Phone      varchar(15) unique,
    ID_Address int,
    ID_Class   int,
    foreign key fk_Student_Class (ID_Class) references Classes (ID_Class),
    foreign key fk_Student_Address (ID_Address) references Address (ID_Address)
);

create table Course
(
    ID_Course   int primary key auto_increment,
    Name_Course varchar(50),
    description varchar(200)
);

create table Point
(
    ID_Point   int primary key auto_increment,
    ID_Course  int,
    ID_Student int,
    Point      int,
    foreign key fk_Point_Course (ID_Course) references Course (ID_Course),
    foreign key fk_Point_Students (ID_Student) references Students (ID_Student)
);

INSERT INTO Address (Name_Address)
VALUES ('123 Phan Dinh Phung'),
       ('456 Tran Hung Dao'),
       ('789 Le Loi'),
       ('101 Nguyen Trai'),
       ('202 Hai Ba Trung');

INSERT INTO Classes (Name_Class, language, description)
VALUES ('Lop 1', 'Tieng Viet', 'Lop hoc tieng Viet'),
       ('Lop 2', 'Tieng Anh', 'Lop hoc tieng Anh'),
       ('Lop 3', 'Tieng Phap', 'Lop hoc tieng Phap'),
       ('Lop 4', 'Tieng Trung', 'Lop hoc tieng Trung'),
       ('Lop 5', 'Tieng Duc', 'Lop hoc tieng Duc');

INSERT INTO Students (FullName, Dob, Phone, ID_Address, ID_Class)
VALUES ('Nguyen Van A', '2000-01-01', '0912345670', 1, 1),
       ('Le Thi B', '2001-02-02', '0912345671', 2, 2),
       ('Tran Van C', '2002-03-03', '0912345672', 3, 3),
       ('Pham Thi D', '2003-04-04', '0912345673', 4, 4),
       ('Nguyen Van E', '2004-05-05', '0912345674', 5, 5),
       ('Nguyen Thi F', '2000-06-06', '0912345675', 1, 2),
       ('Le Van G', '2001-07-07', '0912345676', 2, 3),
       ('Tran Thi H', '2002-08-08', '0912345677', 3, 4),
       ('Pham Van I', '2003-09-09', '0912345678', 4, 5),
       ('Nguyen Anh J', '2004-10-10', '0912345679', 5, 1);

INSERT INTO Course (Name_Course, description)
VALUES ('Toán', 'Khóa học Toán'),
       ('Lý', 'Khóa học Lý'),
       ('Hóa', 'Khóa học Hóa'),
       ('Văn', 'Khóa học Văn'),
       ('Sử', 'Khóa học Sử'),
       ('Địa', 'Khóa học Địa'),
       ('Sinh', 'Khóa học Sinh'),
       ('Anh', 'Khóa học Anh'),
       ('Pháp', 'Khóa học Pháp'),
       ('Trung', 'Khóa học Trung'),
       ('Nhật', 'Khóa học Nhật'),
       ('Hàn', 'Khóa học Hàn'),
       ('Nga', 'Khóa học Nga'),
       ('Ý', 'Khóa học Ý'),
       ('Tây Ban Nha', 'Khóa học Tây Ban Nha'),
       ('Bồ Đào Nha', 'Khóa học Bồ Đào Nha'),
       ('Đức', 'Khóa học Đức'),
       ('Thụy Điển', 'Khóa học Thụy Điển'),
       ('Phần Lan', 'Khóa học Phần Lan'),
       ('Na Uy', 'Khóa học Na Uy');

INSERT INTO Point (ID_Course, ID_Student, Point)
VALUES (1, 1, 9),
       (2, 1, 8),
       (3, 1, 7),
       (4, 2, 9),
       (5, 2, 8),
       (6, 3, 7),
       (7, 3, 9),
       (8, 4, 8),
       (9, 4, 7),
       (10, 5, 9),
       (11, 5, 8),
       (12, 6, 7),
       (13, 6, 9),
       (14, 7, 8),
       (15, 7, 7);

