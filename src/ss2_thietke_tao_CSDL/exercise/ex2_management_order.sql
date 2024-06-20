create database ex2_management_order;
use ex2_management_order;
create table Customer
(
cID int primary key,
cName varchar(50) not null,
cAge int
);
create table Orders
(
oID int primary key,
cID int not null,
oDate datetime not null,
oTotalPrice double not null,
foreign key(cID) references Customer(cID)
);
create table Product
(
pID int primary key,
pName varchar(30) not null,
pPrice double not null
);
create table OrderDetail
(
oID int,
pID int,
odQTY int not null,
primary key(oID, pID),
foreign key(oID) references Orders(oID),
foreign key(pID) references Product(pID)
);