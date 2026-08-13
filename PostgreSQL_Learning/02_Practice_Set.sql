-- Q1

-- Create a table Employees with:

-- EmployeeID (Auto Increment)
-- EmployeeName
-- Age
-- Salary (2 decimal places)
-- Bonus (Approximate value)

DROP TABLE IF EXISTS Employee;

CREATE TABLE IF NOT EXISTS Employee(
EmployeeID SERIAL Primary Key,
EmployeeName VARCHAR(100),
Age INT NOT NULL,
Salary DECIMAL(10,2),
Bonus REAL
);

-- Q2
-- Why should Salary use NUMERIC(10,2) instead of REAL?
-- I have used DECIMAL(10,2) or we can use NUMERIC(10,2) Because REAL shows Approximate value after decimal point where can be appropriate value.

-- Q3. A company's customer IDs crossed 3 billion.
-- Question

-- A company's customer IDs crossed 3 billion.

-- Which datatype should you use?

-- INTEGER
-- BIGINT
-- SERIAL

-- Explain why.

-- INTEGER stores 4BYTES
-- SERIAL - 4 BYTES
-- BIGINT - 8 Bytes
-- Answer : BIGINT


