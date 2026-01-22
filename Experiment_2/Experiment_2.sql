CREATE TABLE customer_orders(
    order_id INT PRIMARY KEY ,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price INT,
    order_date DATE
);

INSERT INTO customer_orders (order_id,customer_name,product,quantity,price,order_date)VALUES
(1,'Sanchit Katoch','Laptop',1,85000,'2025-01-10'),
(2,'Roshan Kumar Singh','Mouse',2,1780,'2025-01-11'),
(3,'Anindita Dhar','Laptop',1,52250,'2025-01-12'),
(4,'Ashi Gupta','Keyboard',1,2575,'2025-01-12'),
(5,'Pratham','Mouse',3,1800,'2025-01-13'),
(6,'Swayam','Laptop',2,120000,'2025-01-14');

--step 2
SELECT * FROM customer_orders WHERE price>40000;

--step3
--asc
SELECT customer_name,product,price FROM customer_orders ORDER BY price ASC;
--desc
SELECT customer_name,product,price FROM customer_orders ORDER BY price DESC;
--mul col
SELECT customer_name,product,price FROM customer_orders ORDER BY product ASC, price DESC;

--step4
SELECT product, SUM(price) AS total_sales FROM customer_orders GROUP BY product;

--step5
SELECT product, SUM(price) AS total_sales FROM customer_orders GROUP BY product HAVING SUM(price)>50000;

--step6
SELECT product, SUM(price) FROM customer_orders GROUP BY product HAVING SUM(price)>50000;
