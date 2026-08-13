-- USE TABLE SALEDW - Employee

SELECT * FROM Employee;

-- Q1. Display employee name and salary increased by ₹5,000.
SELECT First_name,Salary,
Salary+5000 as Revised_Salary
FROM Employee;

-- Display First_name, Last_name, Salary, and a calculated column Annual_Salary where Annual Salary = Salary × 12.
SELECT First_name,Last_name,Salary,
Salary*12 as Annual_Salary
FROM Employee;

-- Addition - Display First_name, Department, Salary, and a calculated column Salary_After_Allowance where every employee receives a ₹5,000 allowance.
SELECT First_name,Department,Salary,
Salary + 5000 As Salary_After_Allowance
FROM Employee;

-- subtraction - Display First_name, Last_name, Salary, and a calculated column Salary_After_Deduction where ₹2,000 is deducted from every employee's salary.
SELECT First_name,Last_name,Salary,
Salary - 2000 as Salary_After_Deduction
FROM Employee;

-- Division - Display First_name, Salary, and a calculated column called Monthly_Salary by dividing the employee's annual salary by 12.
SELECT First_name,Salary,
-- Salary*12 as annual_salary,
-- (Salary*12)/12 as monthly_salary,
Salary/12.0 as monthly_salary -- if provided salary is annual salary 
FROM Employee;

-- Multiplication + Percentage - Display First_name, Salary, and Salary_After_Increment, where every employee receives a 10% salary increment.
SELECT First_name,Salary,
Salary+Salary*0.10 as Salary_After_Increment
FROM Employee;

-- interview shortcut 
SELECT First_name,Salary,
Salary*1.10 as Salary_After_Increment -- Salary 100% plus 10%
FROM Employee;

-- Operator precedence
-- Write a query to calculate the employee's final salary using this formula:

-- Final Salary = Salary + 10% increment + ₹2,000 allowance

SELECT First_name,Salary,
Salary + (Salary*0.10) +2000 as Final_Salary
FROM Employee;

-- Modulus % 
-- Find all employees whose Employee_ID is an even number.
--An even number has a remainder of 0 when divided by 2.
SELECT Employee_ID,First_name,Last_name
FROM Employee
WHERE Employee_ID%2 =0;

-- Modulus + Filtering 
-- Find all Employee Whose Emp_ID is divisible by 5
SELECT Employee_ID,First_name,Department
FROM Employee
WHERE Employee_ID%5 =0;


-- operator precedence 
-- consider this query 
SELECT 100 + 20 * 5 AS Result;

-- What value will result return?
-- 200 
-- 20*5 - higher precedence * = 100
-- 100+ 100 = 200

SELECT 100 + (20 * 5) AS Result;

-- precedence Trap
SELECT 100 - 20 / 5 AS Result;
-- What will the result be?
--96
SELECT 100 - (20/5) as Result;

-- Integer Division 
SELECT 10/3 As Result;
-- result is 3 which provides quotient 
-- if you want decimal result cast 10 to decimal
SELECT CAST(10 AS DECIMAL(10,2))/3 As Result;

-- Also Remember 
-- / - division/quotient
-- % - remainder

SELECT 10/3 As Quotient,
10%3 as Remainder;

-- Assume Salary represents annual salary. Display First_name, Salary, and Monthly_Salary.
-- Make sure you get a decimal result, not integer division.
SELECT First_name,Salary, 
Salary/12 as Monthly_Salary
-- CAST(Salary/12 As DECIMAL(10,2)) as Monthly_Salary
FROM Employee;

-- NULL + Arithmetic
-- Some employees may have NULL in Salary.
-- Display First_name, Salary, and Salary_With_Allowance, where ₹5,000 is added to salary. If Salary is NULL, treat it as 0.
SELECT First_name,Salary,
ISNULL(Salary+5000,0)As Salary_With_Allowance
FROM Employee;

-- Incorrect Query 
-- if Salary = NULL : NULL + 5000 - NULL - ISNULL(NULL,0) - 0
SELECT First_name,Salary,
ISNULL(Salary,0)+5000 As Salary_With_Allowance
FROM Employee;

SELECT Salary, First_name
from Employee
WHERE  Salary = NULL;

-- Calculate the employee's Final Salary using:

/*Final Salary =
Salary
+ 10% Increment
+ ₹2,000 Allowance
- 5% Deduction*/

SELECT First_name,Salary,
Salary + (Salary*0.10) + 2000 - (Salary*0.05) as Final_Salary
FROM Employee;

/* Find employees whose salary after a 10% increment is greater than ₹60,000.

Return:

Employee_ID | First_name | Department | Salary | Salary_After_Increment
Requirement

You need to:

Calculate the 10% increment.
Filter employees based on the new salary.
Display the calculated new salary.*/
SELECT Employee_ID,First_name,Department,Salary,
Salary+ Salary*0.10 as Salary_After_Increment
FROM Employee
Where Salary+ Salary*0.10 > 60000;





