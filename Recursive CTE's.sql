CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE,
salary DECIMAL(10, 2),
department_id INT,
manager_id INT
);

INSERT INTO employees VALUES
(1, 'John', 'Doe', '2021-01-01', 50000.00, 1, NULL),
(2, 'Jane', 'Doe', '2021-02-15', 60000.00, 1, 1),
(3, 'Bob', 'Smith', '2021-03-01', 55000.00, 2, NULL),
(4, 'Sara', 'Johnson', '2021-04-01', 65000.00, 2, 3),
(5, 'Tom', 'Williams', '2021-05-01', 70000.00, 3, NULL),
(6, 'Emily', 'Jones', '2021-06-01', 80000.00, 3, 5),
(7, 'Mike', 'Brown', '2021-07-01', 75000.00, 4, NULL),
(8, 'Lisa', 'Davis', '2021-08-01', 85000.00, 4, 7),
(9, 'David', 'Wilson', '2021-09-01', 90000.00, 5, NULL),
(10, 'Laura', 'Taylor', '2021-10-01', 95000.00, 5, 9);

with managers(employee_id, first_name, last_name, manager_id) as (
    select employee_id, first_name, last_name, manager_id
    from employees
    where manager_id is null
    union all
    select e.employee_id, e.first_name, e.last_name, e.manager_id
    from employees e
    inner join managers m on
    e.manager_id = m.employee_id
)
select * from managers;


-- Employees who report to a specific manager
with managers(employee_id, first_name, last_name, manager_id) as (
    select employee_id, first_name, last_name, manager_id
    from employees
    where manager_id = 3
    union all
    select e.employee_id, e.first_name, e.last_name, e.manager_id
    from employees e
    inner join managers m on
    e. manager_id = m.employee_id
)
select * from managers;


-- Total salary of employees who report to a specific manager
with managers(employee_id, salary) as (
    select employee_id, salary
    from employees
    where manager_id = 1
    union all
    select e.employee_id, e.salary
    from employees e
    inner join managers m on
    e.manager_id = m.employee_id
)
select sum(salary) from managers;


-- Employees who have never managed other employees
with non_managers as (
  select employee_id, first_name, last_name, manager_id
  from employees
  where employee_id not in (select manager_id from employees where manager_id is not null)
  union all
  select e.employee_id, e.first_name, e.last_name, e.manager_id
  from employees e
  inner join non_managers n on e.manager_id = n.employee_id
)
select * from non_managers;


-- Highest paid employee in each department
with department_employees as (
  select employee_id, first_name, last_name, department_id, salary
  from employees
  where manager_id is null
  union all
  select e.employee_id, e.first_name, e.last_name, e.department_id, e.salary
  from employees e
  inner join department_employees d on e.manager_id = d.employee_id
)
select department_id, first_name, last_name, salary
from
(
select department_id, first_name, last_name, salary,
row_number() over(partition by department_id order by salary desc) as rank
from department_employees
) t
where rank = 1


-- Longest chain of managers for each employee.
with manager_chain as (
  select employee_id, first_name, last_name, manager_id, 1 as chain_length
  from employees
  where manager_id is null
  union all
  select e.employee_id, e.first_name, e.last_name, e.manager_id, chain_length + 1
  from employees e
  inner join manager_chain m on e.manager_id = m.employee_id
)
select employee_id, first_name, last_name, max(chain_length) as longest_chain
from manager_chain
group by employee_id, first_name, last_name;