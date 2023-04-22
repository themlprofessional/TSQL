-- 1. NOT NULL constraint
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    department_id INT NOT NULL
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL
);

-- 2. DEFAULT constraint
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE DEFAULT GETDATE(),
    department_id INT
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(50) DEFAULT 'Unknown'
);

-- 3. UNIQUE constraint
CREATE TABLE employee(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary NUMERIC(10, 2),
    department_id INT,
    CONSTRAINT uc_employee UNIQUE(first_name, last_name)
);

CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(50),
    CONSTRAINT uc_department UNIQUE(name)
);

-- 4. PRIMARY KEY constraint
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary NUMERIC(10, 2),
    department_id INT
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(50)
);

-- 5. FOREIGN KEY constraint
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary NUMERIC(10, 2),
    department_id INT REFERENCES department(dept_id)
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(50)
);

-- 6. CHECK constraint
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary NUMERIC(10, 2),
    department_id INT CHECK(department_id > 0)
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    name VARCHAR(50),
    state VARCHAR(50)
)