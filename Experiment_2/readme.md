Worksheet–2: SQL SELECT Queries using PostgreSQL
👨‍🎓 Student Information

Name: Sanchit Katoch

UID: 25MCA20059

Branch: MCA

Section: 25MCA-1-A

Semester: 2nd

Subject: Technical Training I

Subject Code: 25CAP-652

Date of Performance: 13/01/2026

🎯 Aim

To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation concepts in PostgreSQL for efficient data retrieval and analytical reporting.

🎯 Objectives

Retrieve specific data using filtering conditions.

Sort query results using single and multiple attributes.

Perform aggregation using grouping techniques.

Apply conditions on aggregated data using HAVING.

Differentiate between row-level and group-level filtering.

🛠 Software Requirements

Oracle Database Express Edition

PostgreSQL

🧪 Experiment Overview

This experiment demonstrates how SQL SELECT queries can be used for:

Filtering records using WHERE

Sorting data using ORDER BY

Grouping records using GROUP BY

Applying aggregate functions like SUM()

Filtering aggregated results using HAVING

A sample table named customer_orders was created to simulate customer purchase data.

🗄 Database Structure
Table: customer_orders
Column Name	Data Type
order_id	INT (Primary Key)
customer_name	VARCHAR(50)
product	VARCHAR(50)
quantity	INT
price	INT
order_date	DATE
💻 SQL Implementation
1️⃣ Table Creation
CREATE TABLE customer_orders(
  order_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  product VARCHAR(50),
  quantity INT,
  price INT,
  order_date DATE
);

2️⃣ Insert Sample Data
INSERT INTO customer_orders (order_id,customer_name,product,quantity,price,order_date) VALUES
(1,'Sanchit Katoch','Laptop',1,85000,'2025-01-10'),
(2,'Roshan Kumar Singh','Mouse',2,1780,'2025-01-11'),
(3,'Anindita Dhar','Laptop',1,52250,'2025-01-12'),
(4,'Ashi Gupta','Keyboard',1,2575,'2025-01-12'),
(5,'Pratham','Mouse',3,1800,'2025-01-13'),
(6,'Swayam','Laptop',2,120000,'2025-01-14');

🔎 Query Operations
✅ Step 2: Filtering Data
SELECT * FROM customer_orders WHERE price > 40000;


Filters high-priced orders.

✅ Step 3: Sorting Results

Ascending Order

SELECT customer_name, product, price 
FROM customer_orders 
ORDER BY price ASC;


Descending Order

SELECT customer_name, product, price 
FROM customer_orders 
ORDER BY price DESC;


Multiple Column Sorting

SELECT customer_name, product, price 
FROM customer_orders 
ORDER BY product ASC, price DESC;

✅ Step 4: Grouping and Aggregation
SELECT product, SUM(price) AS total_sales 
FROM customer_orders 
GROUP BY product;


Calculates total sales per product.

✅ Step 5: Applying Condition on Aggregated Data
SELECT product, SUM(price) AS total_sales 
FROM customer_orders 
GROUP BY product 
HAVING SUM(price) > 50000;


Filters grouped results based on aggregate value.

📊 Key Concepts Covered
Concept	SQL Clause Used
Filtering	WHERE
Sorting	ORDER BY
Grouping	GROUP BY
Aggregation	SUM()
Group Filtering	HAVING
📚 Learning Outcomes

Understood how filtering retrieves relevant records.

Learned how sorting improves result presentation.

Gained practical knowledge of aggregation and grouping.

Clearly differentiated between:

Row-level filtering (WHERE)

Group-level filtering (HAVING)
