/* Question 1 — Create Employee Database

Scenario

Your company "ABC Technologies" is starting a new HR system.

Create a database named HR_DB.

Inside it, create an Employee table having:

Emp_ID (Auto Increment)
Emp_Name
Email (Unique)
Phone
Department
Hire_Date
Salary
Status (Default = 'Active')

*Expected Skills*
CREATE DATABASE
CREATE TABLE
SERIAL
PRIMARY KEY
UNIQUE
DEFAULT
NOT NULL */

-- Creating HR_DB
CREATE DATABASE HR_DB;

-- Once Created RightClick HR_DB - Open New Query tool 

-- CREATE Employee Table in HR_DB
CREATE TABLE Employee
(
Emp_ID SERIAL PRIMARY KEY,
Emp_Name VARCHAR(100),
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(100),
Department VARCHAR(50),
Hire_Date DATE,
Salary NUMERIC(10,2),
Status VARCHAR(50) DEFAULT 'active'
);

SELECT * FROM Employee;

-- *******************************************************************************
/*
Question 2 — Insert Employee Records

Insert 10 employees into the Employee table.

Requirements

Different Departments
Different Salaries
Different Joining Dates

After insertion display all records.

Expected SQL

INSERT
SELECT *

*/

-- single value
INSERT INTO Employee
(Emp_Name,Email,Phone,Department,Hire_Date,Salary,Status)
VALUES ('Kajal','kajal@gmail.com','9786569688','IT','2025-5-16',55000,DEFAULT)

SELECT * FROM Employee;

-- multiple values
INSERT INTO Employee
(Emp_Name,Email,Phone,Department,Hire_Date,Salary,Status)
VALUES ('Kabir','kabir@gmail.com','9733369688','Sales','2024-5-16',70000,DEFAULT),
	   ('Komal','komal@gmail.com','8989898989','HR','2023-6-16',85000,'Inactive'),
	   ('Kusum','kusum@gmail.com','9879879871','Marketing','2026-01-01',56000,'Active');

-- *********************************************************************************************
/*
Question 3 — SERIAL vs INT

Your manager says:

"Don't use SERIAL. Employee IDs will come from SAP."

Modify your design.

Create another table Employee_Master using

Emp_ID INT PRIMARY KEY

Insert

1001
1002
1003

Explain

Why SERIAL wasn't used
Difference between INT and SERIAL
*/
CREATE TABLE Employee_MASTER
(
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(100),
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(100),
Department VARCHAR(50),
Hire_Date DATE,
Salary NUMERIC(10,2),
Status VARCHAR(50) DEFAULT 'active'
);

SELECT * FROM Employee_MASTER;

INSERT INTO Employee_MASTER
(Emp_Id,Emp_Name,Email,Phone,Department,Hire_Date,Salary,Status)
VALUES (1001,'Kabir','kabir@gmail.com','9733369688','Sales','2024-5-16',70000,DEFAULT),
	   (1002,'Komal','komal@gmail.com','8989898989','HR','2023-6-16',85000,'Inactive'),
	   (1003,'Kusum','kusum@gmail.com','9879879871','Marketing','2026-01-01',56000,'Active');

-- ************************************************************************************************

/*
Question 4 — Constraint Validation

Insert the following records.

Employee Name = NULL

What happens?

Insert duplicate email.

What happens?

Insert duplicate Employee ID.

What happens?

Explain every error.
*/

-- Insert Duplicate Email 
-- ERROR:  duplicate key value violates unique constraint "employee_email_key"
-- Becuase I used UNIQUE Constraint which does not take duplicate values.

-- Employee name = null
-- It inserts the value but shows NULL value into Table cell

-- Duplicate Employee ID
-- I used primary key which uniquely identify each table.

INSERT INTO Employee
(Emp_Name,Email,Phone,Department,Hire_Date,Salary,Status)
VALUES (NULL,'kajal1@gmail.com','9786569688','IT','2025-5-16',55000,DEFAULT);

SELECT * FROM Employee;

-- ****************************************************************************

/*
Question 5 — Department Cleanup

Sales department closed.

Delete only Sales employees.

Do NOT delete other employees.

After deletion display remaining employees.

Expected Commands

DELETE

WHERE

SELECT
*/

DELETE FROM Employee
WHERE department='Sales';

SELECT DISTINCT Department 
FROM Employee;

SELECT * FROM Employee;

--***********************************************************************************
/*
Question 6 — Salary Column Mistake

Business team says

Salary should not be stored.

Delete only Salary column.

Do NOT delete table.

Expected

ALTER TABLE

DROP COLUMN
*/
ALTER TABLE Employee
DROP COLUMN Salary;

SELECT * FROM Employee;
--************************************************************

/*
Question 7 — Wrong Column Name

You accidentally created

Department

instead of

Emp_Department

Rename it.

Expected

ALTER TABLE

RENAME COLUMN
*/

ALTER TABLE Employee
RENAME COLUMN department to Emp_Department;

SELECT * FROM Employee;

-- ******************************************************************************

/*
Question 8 — Fresh Testing Environment

QA team wants completely empty Employee table.

Requirements

Remove all records.

Keep structure.

Reset Employee ID from 1.

Which command should you use?

Explain difference between

DELETE

TRUNCATE

TRUNCATE RESTART IDENTITY
*/

TRUNCATE TABLE Employee RESTART IDENTITY;
---***************************************************

/*
Question 9 — Remove Test Table

Testing completed.

Delete Employee_Test table completely.

If table doesn't exist, SQL should not fail.

Expected

DROP TABLE IF EXISTS
*/
DROP TABLE IF EXISTS Employee_Test;
---*************************************
/*
Question 10 — Employee Report

Display all employees.

Display only

Employee Name

Department

Salary

Display only IT employees.

Display employees earning more than 50,000.

Sort salary highest first.

Concepts

SELECT

WHERE

ORDER BY
*/

SELECT * FROM Employee_Master;

SELECT emp_name,department,Salary
FROM Employee_Master;

SELECT * FROM Employee_Master
WHERE department='HR';

SELECT * FROM Employee_Master
WHERE Salary>50000;

SELECT * FROM Employee_Master
WHERE Salary>50000
ORDER BY Salary DESC;










