--1.  Find all employees who belong to the IT department.
SELECT * FROM Employee;

SELECT Employee_ID,
First_name,
Last_name,
Department,
Salary
FROM Employee
WHERE Department='IT'; -- Equal to operator

-- 2. Find all employees who do NOT belong to the IT department.
SELECT Employee_ID,
First_name,
Last_name,
Department,
Salary
FROM Employee
WHERE Department!='IT';
-- WHERE Department <> 'IT';


-- 3. Find all employees whose salary is greater than ₹50,000.
SELECT Employee_ID,
First_name,
Department,
Salary
FROM Employee
WHERE Salary > 50000;


-- 4. Find all employees whose age is less than 30.
SELECT Employee_ID,
First_name,
Last_name,
Age
FROM Employee
WHERE Age < 30;
-- 5. Find all employees whose salary is greater than or equal to ₹60,000.
SELECT Employee_ID,
First_name,
Department,
Salary
FROM Employee
WHERE Salary >= 60000;

-- 6. Find all employees whose age is less than or equal to 30.
SELECT Employee_ID,
First_name,
Last_name,
Age
FROM Employee
WHERE Age <= 30;

-- 7. Find all employees whose salary is between ₹40,000 and ₹70,000, including both ₹40,000 and ₹70,000.
SELECT Employee_ID,
First_name,
Department,
Salary
FROM Employee
WHERE Salary BETWEEN 40000 AND 70000;

-- 8. Find all employees whose salary is NOT between ₹40,000 and ₹70,000.
SELECT Employee_ID,
First_name,
Department,
Salary
FROM Employee
WHERE Salary NOT BETWEEN 40000 AND 70000;

-- 9. Find all employees who belong to either IT, HR, or Finance department.
SELECT Employee_ID,
First_name,
Department,
Salary
FROM Employee
WHERE Department IN ('HR','IT','Finance');