CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employee VALUES
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

CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department VALUES
(1, 'Sales', 'New York'),
(2, 'Marketing', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'Human Resources', 'Houston'),
(5, 'Information Technology', 'San Francisco');

-- SYNTAX
/*
create procedure procedure_name
    @parameter1 datatype [optional]: input/output
    @parameter2 datatype [optional]: input/output
as
begin
    query
end
*/

create procedure GetEmployeesByDepartment
    @department_id int
as
begin
    select e.id, e.first_name, e.last_name, e.hire_date, d.name as department_name
    from employee e
    join department d on e.department_id = d.id
    where e.department_id = @department_id
    order by e.hire_date;
end

exec GetEmployeesByDepartment @department_id = 1;

-----------------------------------------------------------------------------------

-- Retrive Total Salary for a given Department

create procedure GetTotalSalaryByDepartment
    @department_id int
as
begin
    select distinct sum(salary) as total_salary
    from employee
    where department_id = @department_id;
end

exec GetTotalSalaryByDepartment @department_id = 1;

-----------------------------------------------------------------------------------

-- Procedure to insert new record into employee table

create procedure InsertEmployee
    @id int,
    @first_name varchar(50),
    @last_name varchar(50),
    @hire_date date,
    @salary decimal(10, 2),
    @department_id int
as
begin
    insert into employee(id, first_name, last_name, hire_date, salary, department_id)
    values (@id, @first_name, @last_name, @hire_date, @salary, @department_id);
end

exec InsertEmployee 11, 'New', 'Emloyee', '2020-02-01', 23000.00, 1;

select * from employee;