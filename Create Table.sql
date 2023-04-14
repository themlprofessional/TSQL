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

