CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE,
salary DECIMAL(10, 2),
department_id INT
);

INSERT INTO employees VALUES
(1, 'John', 'Doe', '2021-01-01', 50000.00, 1),
(2, 'Jane', 'Doe', '2021-02-15', 60000.00, 1),
(3, 'Bob', 'Smith', '2021-03-01', 55000.00, 2),
(4, 'Sara', 'Johnson', '2021-04-01', 65000.00, 2),
(5, 'Tom', 'Williams', '2021-05-01', 70000.00, 3),
(6, 'Emily', 'Jones', '2021-06-01', 80000.00, 3),
(7, 'Mike', 'Brown', '2021-07-01', 75000.00, 4),
(8, 'Lisa', 'Davis', '2021-08-01', 85000.00, 4),
(9, 'David', 'Wilson', '2021-09-01', 90000.00, 5),
(10, 'Laura', 'Taylor', '2021-10-01', 95000.00, 5);

CREATE TABLE departments (
department_id INT PRIMARY KEY,
name VARCHAR(50),
location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Sales', 'New York'),
(2, 'Marketing', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'Human Resources', 'Houston'),
(5, 'Information Technology', 'San Francisco');

------------------------------------------------------------------------------------------------------------------------------------------------

-- 1) Basic CTE

-- It returns employees with their corresponding departments
with EmployeeDepartment as (
select e.employee_id, e.first_name, e.last_name, d.name as department_names
from employees e
inner join departments d on e.department_id = d.department_id
  )
select * from EmployeeDepartment;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- 2) CTE with aggregation

-- This query returns total salary for each department
with DepartmentSalary as (
select d.name as department_name, sum(e.salary) as total_salary
from employees e
inner join departments d
on e.department_id = d.department_id
group by d.name
  )
  
select * from DepartmentSalary;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- 3) CTE with multiple CTE's

-- This query returns highest and lowest salary for each department
with DepartmentHighestSalary as (
select d.name as department_name, max(e.salary) as highest_salary
from employees e
inner join departments d on
e.department_id = d.department_id
group by d.name
  ),
DepartmentLowestSalary as (
select d.name as department_name, min(e.salary) as lowest_salary
from employees e
inner join departments d on
e.department_id = d.department_id
group by d.name
  )

select h.department_name, h.highest_salary, l.lowest_salary
from DepartmentHighestSalary h
inner join DepartmentLowestSalary l on
h.department_name = l.department_name;

----------------------------------------------------------------------------------------------------------------------------------------------

-- 4) Recursive CTE

-- employee hierarchy
alter table employees add manager_id int;

update employees set manager_id = null where employee_id = 1;
update employees set manager_id = 1 where employee_id in (2,3);
update employees set manager_id = 2 where employee_id in (4,5);
update employees set manager_id = 3 where employee_id in (6,7);
update employees set manager_id = 4 where employee_id in (8,9);
update employees set manager_id = 5 where employee_id = 10;

-- this query returns employee hierarchy
with EmployeeHierarchy(employee_id, first_name, last_name, manager_id, level) as (
select employee_id, first_name, last_name, manager_id, 0 as level
from employees
where manager_id is null
union all
select e.employee_id, e.first_name, e.last_name, e.manager_id, level + 1
from employees e
inner join EmployeeHierarchy eh
on e.manager_id = eh.employee_id
)

select * from EmployeeHierarchy;
