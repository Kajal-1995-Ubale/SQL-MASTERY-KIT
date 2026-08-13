-- Create Database  
CREATE DATABASE SQLDB;

-- Create Table
CREATE TABLE Employee(
Emp_ID SERIAL PRIMARY KEY,
Emp_Name VARCHAR(100) NOT NULL,
Position VARCHAR(50),
Department VARCHAR(50),
Hire_Date DATE,
Salary NUMERIC(10,2)
);

SELECT * FROM Employee;

-- INSERT INTO 
INSERT INTO Employee(
Emp_Name,
Position,
Department,
Hire_Date,
Salary
) VALUES(
'Kajal',
'Analyst',
'IT',
'2022-05-15',
70000.34
);

-- add multiple records 

INSERT INTO Employee(
Emp_Name,
Position,
Department,
Hire_Date,
Salary
) VALUES(
'Komal','Analyst','IT','2024-05-15',73400.34),
('Kabir','Software Engineer','IT','2023-05-16',55622.56),
('Neha','Engineer','Sales','2025-06-25',56458.45);

-- Truncate TABLE
TRUNCATE TABLE Employee;

SELECT * FROM Employee;

-- TABLE TRUNCATE - INSERT VALUE - SERIAL DISTURB Emp_id - It continues from where it left - 
-- That's why use below command to start from first record
TRUNCATE TABLE Employee RESTART IDENTITY;