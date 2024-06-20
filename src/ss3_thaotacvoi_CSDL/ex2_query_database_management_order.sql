use ex2_management_order;
insert into customer
    value
    (1, 'Minh Quan', 10),
    (2, 'Ngoc Oanh', 20),
    (3, 'Hong Ha', 50);
alter table orders
    modify column oTotalPrice int null;
insert into orders(oID, cID, oDate)
    value
    (1, 1, '2006-3-21'),
    (2, 2, '2006-3-23'),
    (3, 1, '2006-3-13');
insert into product
    value
    (1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);
insert into orderdetail
    value
    (1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),
    (3, 1, 8),
    (2, 5, 4),
    (2, 3, 3);
# 1. hiển thị các thông tin gồm id, date, totalPrice trong bảng orders
select orders.oID, orders.oDate, orders.oTotalPrice from orders;
# 2. hiển thị danh sách khách hàng đã mua hàng, và danh sách sản phẩm đc mua bởi khách hàng
select customer.cName, product.pName from customer
join orders on customer.cID = orders.cID
join orderdetail on orders.oID = orderdetail.oID
join product on orderdetail.pID = product.pID
# 3. hiển thị thông tin khách hàng ko mua bất kì sản phẩm nào



