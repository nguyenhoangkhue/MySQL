create table Categories (
category_id int primary key auto_increment,
category_name text
);

create table Products(
product_id int primary key auto_increment,
product_name text,
category_id int,
foreign key (category_id) references Categories(category_id),
price int
);

create table Customers (
customer_id int primary key auto_increment,
customer_name text,
email text
);

create table Orders  (
order_id int primary key auto_increment,
customer_id int,
foreign key (customer_id) references Customers(customer_id),
order_date date
);

create table OrderDetails  (
order_detail_id int primary key auto_increment,
order_id int,
foreign key (order_id) references Orders(order_id),
product_id int,
foreign key (product_id) references Products(product_id),
quantity int
);

insert into Categories(category_name) values ('Phone');
insert into Categories(category_name) values ('Laptop');
insert into Categories(category_name) values ('GPU');
insert into Categories(category_name) values ('CPU');
select*from Categories;

insert into Products(product_name,category_id,price) values ('IP16',1,'4000');
insert into Products(product_name,category_id,price) values ('IP15',1,'3000');
insert into Products(product_name,category_id,price) values ('IP14',1,'2500');
insert into Products(product_name,category_id,price) values ('IP13',1,'2000');
insert into Products(product_name,category_id,price) values ('IP12',1,'1500');
insert into Products(product_name,category_id,price) values ('LG9',2,'5500');
insert into Products(product_name,category_id,price) values ('LG7',2,'3000');
insert into Products(product_name,category_id,price) values ('LG5Pr',2,'1500');
insert into Products(product_name,category_id,price) values ('LG5',2,'1000');
insert into Products(product_name,category_id,price) values ('40Series',3,'1000');
insert into Products(product_name,category_id,price) values ('30Series',3,'750');
insert into Products(product_name,category_id,price) values ('20Series',3,'500');
insert into Products(product_name,category_id,price) values ('10Series',3,'250');
insert into Products(product_name,category_id,price) values ('i9',4,'800');
insert into Products(product_name,category_id,price) values ('i7',4,'600');
insert into Products(product_name,category_id,price) values ('i5',4,'400');
insert into Products(product_name,category_id,price) values ('i3',4,'200');
select*from Products;

insert into Customers (customer_name,email)values('JENNIFER','bhasdbca');
insert into Customers (customer_name,email)values('JOHNNY','bhasdbca');
insert into Customers (customer_name,email)values('BETTE','bhasdbca');
insert into Customers (customer_name,email)values('GRACE','bhasdbca');
insert into Customers (customer_name,email)values('MATTHEW','bhasdbca');
insert into Customers (customer_name,email)values('JOE','bhasdbca');
insert into Customers (customer_name,email)values('CHRISTIAN','bhasdbca');
insert into Customers (customer_name,email)values('ZERO','bhasdbca');
insert into Customers (customer_name,email)values('KARL','bhasdbca');
select*from Customers;

insert into Orders(customer_id,order_date)values(1,'2022-1-1');
insert into Orders(customer_id,order_date)values(1,'2023-1-2');
insert into Orders(customer_id,order_date)values(2,'2024-1-12');
insert into Orders(customer_id,order_date)values(3,'2021-1-13');
insert into Orders(customer_id,order_date)values(4,'2020-1-2');
insert into Orders(customer_id,order_date)values(6,'2022-1-10');
insert into Orders(customer_id,order_date)values(2,'2023-1-1');
select*from Orders;

insert into OrderDetails (order_id,product_id,quantity)values(1,1,3);
insert into OrderDetails (order_id,product_id,quantity)values(1,3,2);
insert into OrderDetails (order_id,product_id,quantity)values(2,17,1);
insert into OrderDetails (order_id,product_id,quantity)values(2,13,3);
insert into OrderDetails (order_id,product_id,quantity)values(3,7,1);
insert into OrderDetails (order_id,product_id,quantity)values(3,1,1);
insert into OrderDetails (order_id,product_id,quantity)values(6,1,3);
insert into OrderDetails (order_id,product_id,quantity)values(4,1,3);
insert into OrderDetails (order_id,product_id,quantity)values(5,1,3);
insert into OrderDetails (order_id,product_id,quantity)values(7,1,3);
select*from OrderDetails ;

-- 1
SELECT*from Orders
INNER JOIN OrderDetails  ON Orders.order_id= OrderDetails .order_id
INNER JOIN Products ON OrderDetails .product_id = Products.product_id
where Orders.order_id=2;
-- 2
select sum(price*quantity)from Orders
INNER JOIN OrderDetails  ON Orders.order_id= OrderDetails .order_id
INNER JOIN Products ON OrderDetails .product_id = Products.product_id
where Orders.order_id=2;
-- 4
select category_id as category_name,count(product_name) as total_products from Products
group by category_id;
-- 5
select customer_id as customer_name ,sum(price) as total_ordered from Orders
INNER JOIN OrderDetails  ON Orders.order_id= OrderDetails .order_id
INNER JOIN Products ON OrderDetails .product_id = Products.product_id
group by customer_id;
-- 6
select max(category_id) as category_name, count(product_id) as product_count from Products
group by category_id
order by product_count desc
limit 1;
-- 7
select category_id as category_name ,sum(quantity) as total_ordered from Orders
INNER JOIN OrderDetails  ON Orders.order_id= OrderDetails .order_id
INNER JOIN Products ON OrderDetails .product_id = Products.product_id
group by category_id;
-- 8
select customer_id,customer_name, sum(quantity) as total_ordered from Customers
inner join OrderDetails on Customers.customer_id=OrderDetails.customer_id
inner join OrderS on OrderDetails.order_id=Orders.oder_id
group by customer_id
order by total_ordered desc
limit 3;
-- 9
select customer_id, customer_name, sum(quantity) as total_ordered from OrderDetails
inner join Orders on OrderDetails.order_id=Orders.order_id
inner join Customers on Orders.customer_id=Customers.customer_id
group by customer_id
having (Orders.order_date between '2023-1-1' and curdate())>1;
-- 10
select product_id,product_name ,quantity as total_ordered from Products
inner join OrderDetails on Products.product_id=OrderDetails.product_id
inner join Orders on OrderDetails.order_id=Orders.order_id
group by product_id
having order_detail_id>1;