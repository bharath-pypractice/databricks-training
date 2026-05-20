-- =========================================
-- DAY 4 : STRING + NUMERIC FUNCTIONS
-- =========================================


-- Create Table

CREATE TABLE employee_payments (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(30),
base_salary DECIMAL(10,2),
bonus DECIMAL(10,2),
joining_date DATE
);


-- Insert Data

INSERT INTO employee_payments VALUES
(1,'karthik','Data',75000.75,5000.50,'2019-03-15'),
(2,'veena','HR',65000.40,4000.25,'2021-06-20'),
(3,'ravi','Data',85000.90,6000.75,'2016-01-10'),
(4,'anil','Finance',70000.10,NULL,'2020-09-01'),
(5,'suresh','HR',60000.55,3000.30,'2022-11-25');



-- Question 1
-- Convert names to uppercase

SELECT UPPER(emp_name)
FROM employee_payments;



-- Question 2
-- Convert names to lowercase

SELECT LOWER(emp_name)
FROM employee_payments;



-- Question 3
-- Proper case names

SELECT CONCAT(
       UPPER(LEFT(emp_name,1)),
       LOWER(SUBSTRING(emp_name,2))
       ) AS proper_name
FROM employee_payments;



-- Question 4
-- Calculate total income

SELECT emp_name,
       base_salary + IFNULL(bonus,0) AS total_income
FROM employee_payments;



-- Question 5
-- Round total income

SELECT emp_name,
       ROUND(base_salary + IFNULL(bonus,0))
       AS rounded_income
FROM employee_payments;



-- Question 6
-- Extract joining year

SELECT emp_name,
       YEAR(joining_date) AS joining_year
FROM employee_payments;



-- Question 7
-- Salary floor value

SELECT emp_name,
       FLOOR(base_salary)
FROM employee_payments;



-- Question 8
-- Salary ceil value

SELECT emp_name,
       CEIL(base_salary)
FROM employee_payments;



-- Question 9
-- ABS function

SELECT emp_name,
       ABS(base_salary)
FROM employee_payments;



-- Question 10
-- MOD function

SELECT emp_name,
       MOD(base_salary,10)
FROM employee_payments;



-- Question 11
-- POWER function

SELECT emp_name,
       POWER(2,3) AS power_value
FROM employee_payments;



-- Question 12
-- CASE statement for experience level

SELECT emp_name,
       TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS experience,
       CASE
           WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) > 7
                THEN 'Senior'

           WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
                BETWEEN 4 AND 7
                THEN 'Mid'

           ELSE 'Junior'
       END AS employee_level
FROM employee_payments;
