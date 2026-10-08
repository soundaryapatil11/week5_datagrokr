USE ecommerce_dw;

INSERT INTO dim_customer VALUES
(1,'Rahul','Bangalore','Karnataka','Regular'),
(2,'Priya','Mumbai','Maharashtra','Premium'),
(3,'Aman','Delhi','Delhi','Regular'),
(4,'Sneha','Chennai','Tamil Nadu','Premium'),
(5,'Rohit','Hyderabad','Telangana','Regular'),
(6,'Neha','Pune','Maharashtra','Premium'),
(7,'Arjun','Bangalore','Karnataka','Regular'),
(8,'Kavya','Delhi','Delhi','Premium');

INSERT INTO dim_product VALUES
(101,'Laptop','Electronics','Computers',65000),
(102,'Smartphone','Electronics','Mobiles',30000),
(103,'Headphones','Electronics','Accessories',3000),
(104,'Office Chair','Furniture','Chairs',8000),
(105,'Keyboard','Electronics','Accessories',2000),
(106,'Monitor','Electronics','Computers',15000);

INSERT INTO dim_date VALUES
(1,'2026-01-05',5,1,'January',1,2026),
(2,'2026-01-10',10,1,'January',1,2026),
(3,'2026-01-20',20,1,'January',1,2026),
(4,'2026-02-05',5,2,'February',1,2026),
(5,'2026-02-12',12,2,'February',1,2026),
(6,'2026-02-25',25,2,'February',1,2026),
(7,'2026-03-03',3,3,'March',1,2026),
(8,'2026-03-15',15,3,'March',1,2026),
(9,'2026-03-28',28,3,'March',1,2026),
(10,'2026-04-05',5,4,'April',2,2026),
(11,'2026-04-18',18,4,'April',2,2026),
(12,'2026-04-25',25,4,'April',2,2026);

INSERT INTO fact_sales VALUES
(1,1,1,101,1,65000),
(2,2,2,102,2,60000),
(3,3,3,103,3,9000),
(4,4,4,101,1,65000),
(5,5,5,104,2,16000),
(6,6,6,102,1,30000),
(7,7,7,105,4,8000),
(8,8,8,106,2,30000),
(9,9,1,101,1,65000),
(10,10,2,103,5,15000),
(11,11,3,102,2,60000),
(12,12,4,106,3,45000);
