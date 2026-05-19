-- =========================================
-- DAY 2 : SQL JOINS PRACTICE
-- =========================================


-- Question 1 : INNER JOIN
-- Display employee names and department names

SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;



-- Question 2 : LEFT JOIN
-- Show all employees even if department missing

SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;



-- Question 3 : RIGHT JOIN
-- Show all departments even if employees missing

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;



-- Question 4 : FULL OUTER JOIN
-- MySQL version using UNION

SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;



-- Question 5 : SELF JOIN
-- Employee and Manager names

SELECT e.emp_name AS Employee,
       m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;



-- Question 6
-- Employees and projects

SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;



-- Question 7
-- Employees with salaries

SELECT e.emp_name, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id;



-- Question 8
-- Employees with contact details

SELECT e.emp_name, c.phone, c.email
FROM employees e
LEFT JOIN contacts c
ON e.emp_id = c.emp_id;



-- Question 9
-- Count employees in each department

SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;



-- Question 10
-- Employees, departments and projects

SELECT e.emp_name,
       d.dept_name,
       p.project_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON e.emp_id = p.emp_id;
