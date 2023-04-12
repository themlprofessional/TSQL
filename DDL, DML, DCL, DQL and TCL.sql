-- DDL (Data Definition Language)
-- DDL commands are used to define or modify the structure of a database and its objects (tables, views, indexes, etc.).
CREATE TABLE employee (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  department_id INT
);


-- DML (Data Manipulation Language)
-- DML commands are used to manipulate the data stored in a database, such as inserting, updating, or deleting records.
INSERT INTO employee (id, first_name, last_name, age, department_id)
VALUES (1, 'John', 'Doe', 30, 1),
       (2, 'Jane', 'Smith', 28, 2);


-- DCL (Data Control Language)
-- DCL commands are used to manage user access, privileges, and roles in a database.
GRANT SELECT ON employee TO some_user;


-- DQL (Data Query Language)
-- DQL commands are used to query the data stored in a database and retrieve specific information.
SELECT * FROM employee;


-- TCL (Transaction Control Language)
-- TCL commands are used to manage transactions in a database, ensuring that changes are either committed or rolled back.

-- 1. BEGIN TRANSACTION:
-- It is used to start a new transaction
-- A transaction is a sequence of database operations that are executed as a single unit of work.
-- If any operation within a transaction fails, the entire transaction can be rolled back to maintain data consistency.
-- It ensures that either all operations succeed or none of them succeed.
BEGIN TRANSACTION;

-- 2. COMMIT TRANSACTION:
-- It permanently saves the changes made during a transaction to the database.
COMMIT TRANSACTION;

-- 3. ROLLBACK TRANSACTION:
-- It undos changes made during a transaction and restores the database to its state before the transaction started.
ROLLBACK TRANSACTION;

-- 4. SAVE TRANSACTION
-- It creates a savepont within a transaction.
-- A savepont is a point in a transaction where we can roll back to if necessary.
SAVE TRANSACTION my_savepoint;

-- Querying
begin transaction;

update employee set age = age + 1 where department_id = 1;

save transaction my_savepoint;

update employee set age = age + 1 where department_id = 2;

rollback transaction my_savepoint;

commit transaction;