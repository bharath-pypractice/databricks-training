-- Question 1: Select all columns from Employee table
select * from Employee;

-- Question 2: Select name and salary
select name, salary from Employee;

-- Question 3: Employees older than 30
select * from Employee where age > 30;

-- Question 4: Names of all departments
select name from Department

-- Question 5: Employees who work in IT department
select * from Employee where department_id = 1;

-- Question 6: Names start with 'J'
select * from Employee Where name like 'J%'

-- Question 7: Names end with 'e'
select * from Employee Where name like '%e'

-- Question 8: Names contain 'a'
select * from Employee Where name like '%a%'

-- Question 9: Names with exactly 9 characters
select * from Employee Where length(name) = 9;

-- Question 10: Names with 'o' as second character
select * from Employee Where name like '_o%'

-- Question 11: Employees hired after 2020
select * from Employee where hire_date > '2020-01-01';

-- Question 12: Employees hired before 2020
select * from Employee where hire_date < '2020-01-01';

-- Question 13: Employees hired between 2019 and 2021
select * from Employee where hire_date between '2019-01-01' and '2021-12-31';

-- Question 14: Sort employees by salary (ascending)
  select * from Employee order by salary asc;

-- Question 15: Sort employees by salary (descending)
  select * from Employee order by salary desc;

-- Question 16: Sort employees by age (youngest first)
select * from Employee order by age asc; 

-- Question 17: Sort employees by age (oldest first)
select * from Employee order by age desc; 

-- Question 18: Employees with salary greater than 50000
select * from Employee where salary > 50000;

-- Question 19: Employees with salary less than 60000
select * from Employee where salary  < 60000;

-- Question 20: Employees with salary between 50000 and 70000
select * from Employee where salary between 50000 and 60000;

-- Question 21: Count total number of employees
select count(*) from Employee

-- Question 22: Average salary of employees
select avg(salary) from Employee

-- Question 23: Maximum salary
select max(salary) from Employee

-- Question 24: Minimum salary
select min(salary) from Employee

-- Question 25: Total salary of all employees
select sum(salary) from Employee

-- Question 26: Count employees in each department
select department_id, count(*)
from Employee
group by department_id;

-- Question 27: Average salary per department
select department_id , avg(salary)
from Employee
group by department_id;

-- Question 28: Maximum salary in each department
select department_id , max(salary)
from Employee
group by department_id;

-- Question 29: Departments with more than 1 employee
select department_id, count(*)
from Employee group by department_id
having count(*) > 1;

-- Question 30: Departments with average salary > 50000
select department_id, avg(salary)
from Employee group by department_id
having avg(salary) > 50000;

-- Question 31: Employees with their department names (INNER JOIN)
select e.name, d.name as department_name
from Employee e
inner join Department d
on e.department_id = d.department_id;

-- Question 32: All employees with department names (LEFT JOIN)
select e.name, d.name  as department_name
from Employee e
inner join Department d
on e.department_id = d.department_id

-- Question 33: All departments with employees (RIGHT JOIN)
select e.name, d.name  as department_name
from Employee e
right join Department d
on e.department_id = d.department_id

-- Question 34: Employees and their projects
select e.name, p.name as projrct_name
from Employee e
join Department d on e.department_id = d.department_id
join Project p on d.department_id = p.department_id

-- Question 35: Count employees in each department (with names)
select d.name, count(e.emp_id) as total_employees
from Department d
left join Employee e on d.department_id = e.department_id
group by d.name;

-- Question 36: Departments without employees
select d.name
from Department d
left join Employee e on d.department_id = e.department_id
where e.emp_id is null;

-- Question 37: Employees without department
select name from Employee where department_id is null;

-- Question 38: Projects with department names
select p.name,d.name as department_name
from Project p
left join Department d
on p.department_id = d.department_id

-- Question 39: Employees and their department + project
select e.name, d.name as department_name, p.name as project_name
from Employee e
join Department d on e.department_id = d.department_id
join Project p on d.department_id = p.department_id;

-- Question 40: Count projects per department
SELECT d.name, COUNT(p.project_id) AS total_projects
 from Department d
 left join Project p on d.department_id = p.department_id
 group by d.name
