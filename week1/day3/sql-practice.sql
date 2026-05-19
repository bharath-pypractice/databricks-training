-- =========================================
-- DAY 3 : ADVANCED JOINS PRACTICE
-- =========================================


-- Question 1
-- Employees and their managers

SELECT e.emp_name AS Employee,
       m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;



-- Question 2
-- Employees without departments

SELECT emp_name
FROM employees
WHERE dept_id IS NULL;



-- Question 3
-- Departments without employees

SELECT d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;



-- Question 4
-- Employees without projects

SELECT e.emp_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;



-- Question 5
-- Employees with projects

SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id;



-- Question 6
-- Count employees department wise

SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;



-- Question 7
-- Average salary department wise

SELECT d.dept_name,
       AVG(s.salary) AS average_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
GROUP BY d.dept_name;



-- Question 8
-- Employees with salary and department

SELECT e.emp_name,
       d.dept_name,
       s.salary
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN salaries s
ON e.emp_id = s.emp_id;



-- Question 9
-- Employees with contact details

SELECT e.emp_name,
       c.phone,
       c.email
FROM employees e
LEFT JOIN contacts c
ON e.emp_id = c.emp_id;



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
