-- =========================================
-- DAY 5 : DATE FUNCTIONS PRACTICE
-- =========================================


-- Create Table

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
order_date DATE,
order_timestamp TIMESTAMP,
delivery_date DATE,
order_amount DECIMAL(10,2)
);


-- Insert Data

INSERT INTO orders VALUES
(1, 'Karthik', '2024-01-15', '2024-01-15 10:30:45', '2024-01-20', 2500.00),
(2, 'Veena', '2024-02-18', '2024-02-18 18:45:20', '2024-02-22', 3200.50),
(3, 'Ravi', '2024-03-02', '2024-03-02 09:15:10', '2024-03-08', 4100.75),
(4, 'Anil', '2024-03-09', '2024-03-09 14:05:55', '2024-03-15', 1800.00),
(5, 'Suresh', '2024-01-07', '2024-01-07 23:55:00', '2024-01-12', 2900.00);



-- Question 1
-- Current date

SELECT CURDATE();



-- Question 2
-- Current timestamp

SELECT NOW();



-- Question 3
-- Extract year

SELECT customer_name,
       YEAR(order_date) AS order_year
FROM orders;



-- Question 4
-- Extract month

SELECT customer_name,
       MONTH(order_date) AS order_month
FROM orders;



-- Question 5
-- Extract day

SELECT customer_name,
       DAY(order_date) AS order_day
FROM orders;



-- Question 6
-- Month name

SELECT customer_name,
       MONTHNAME(order_date) AS month_name
FROM orders;



-- Question 7
-- Day name

SELECT customer_name,
       DAYNAME(order_date) AS day_name
FROM orders;



-- Question 8
-- Delivery days

SELECT customer_name,
       DATEDIFF(delivery_date, order_date)
       AS delivery_days
FROM orders;



-- Question 9
-- Add 5 days

SELECT customer_name,
       DATE_ADD(order_date, INTERVAL 5 DAY)
FROM orders;



-- Question 10
-- Subtract 3 days

SELECT customer_name,
       DATE_SUB(order_date, INTERVAL 3 DAY)
FROM orders;



-- Question 11
-- Timestamp difference in months

SELECT customer_name,
       TIMESTAMPDIFF(MONTH,
       order_date,
       delivery_date) AS months_diff
FROM orders;



-- Question 12
-- Date formatting

SELECT customer_name,
       DATE_FORMAT(order_date, '%d-%m-%Y')
FROM orders;



-- Question 13
-- Weekend orders

SELECT customer_name,
       DAYNAME(order_date)
FROM orders
WHERE DAYNAME(order_date)
IN ('Saturday', 'Sunday');



-- Question 14
-- Weekday orders

SELECT customer_name,
       DAYNAME(order_date)
FROM orders
WHERE DAYOFWEEK(order_date)
BETWEEN 2 AND 6;



-- Question 15
-- Financial year logic

SELECT customer_name,
       order_date,

CASE
    WHEN MONTH(order_date) >= 4
         THEN CONCAT(YEAR(order_date),
         '-',
         YEAR(order_date)+1)

    ELSE CONCAT(YEAR(order_date)-1,
         '-',
         YEAR(order_date))
END AS financial_year

FROM orders;
