-- Indexes
-- Index is a data structure that helps database to find data quickly.
-- There can be only one clustered index per table in sql server

-- Clustered vs Non Clustered Index
-- Clustered Index is a unique index that physically orderes rows of a table.
-- Non Clustered index is an index that stores the subset of table's data in a different location than the table itself.

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


-- Creating a unique clustered index on employee.id column
create unique clustered index employee_id_index on employee(id);

-- Creating a clustered index on primary key for the employee table
create clustered index employee_clustered_index on employee(id);

-- Creating a nonclustered index on first_name and last_name columns in the employee table
create index employee_name_index on employee(first_name, last_name);

-- Creating a nonclustered index on department_id and salary columns in the employee table
create index employeee_department_salary_index on employee(department_id, salary);