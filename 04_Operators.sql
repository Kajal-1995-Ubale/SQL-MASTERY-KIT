-- Arithmetic Operators
-- Q1 - Retrieve the first_name, Salary and Calculate a 10% bonus on the salary 

 SELECT first_name,salary,
 salary* 0.10 As Bonus
 FROM Employee;

 -- Q2- calculate the annual salary and salary increment by 5% - show the monthly new salary as well
 SELECT first_name, 
 Salary,
 Salary*12 as Annual_Salary,
 Salary*0.05 as increment_amount,
 (Salary+Salary*0.05) as new_salary,
 
 FROM Employee;

-- Comparison Operators
-- Give me employee whose ageis 30
SELECT first_name, 
age 
From Employee
WHERE age=30;

-- match all except 30 
SELECT first_name, 
age  FROM employee
WHERE Age!=30;

-- salary > than 500000
SELECT first_name, 
Salary  FROM employee
WHERE Salary>50000;

-- logical operators
-- AND - Salary>50000 and AGE > 40

SELECT first_name, 
Salary, Age  FROM employee
WHERE Salary>=50000 AND Age>=40;

-- using OR operator
SELECT first_name, 
Salary, Age  FROM employee
WHERE Salary>=50000 OR Age>=40;

-- using NOT operator

SELECT first_name, 
Salary, Age  FROM employee
WHERE NOT(department='IT');

-- BETWEEN, LIKE and IN operators
-- 1) Retrieve employees whose salary is between 40,000 and 60000 
SELECT first_name,last_name,Salary
FROM employee
WHERE Salary BETWEEN 40000 AND 60000;

-- 2) Find employee whose email id end with gmail.com

SELECT first_name,last_name,email
FROM employee
WHERE Email like '%gmail.com';

-- 3) retrive employee who belong to either thefinance and marketing department using in operators
SELECT first_name,last_name,Department
FROM employee
WHERE Department IN ('Finance','Marketing');

-- Other operators
-- ISNULL, ORDER BY, DISTINCT, LIMIT

-- Find employees where the email column is NULL
SELECT first_name,last_name,email
FROM Employee
WHERE email IS NULL;

-- list employee sorted by salary in DESCENDING ORDER
SELECT first_name,last_name,Salary
FROM Employee
ORDER BY Salary DESC;

-- Retrieve the to5 highest paid employee
SELECT first_name,last_name,Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 5;

-- Retrieve the list of unique Department

SELECT DISTINCT Department
FROM Employee;

-- set operators
DROP TABLE IF EXISTS students_2023;
CREATE TABLE students_2023(
student_id INT Primary Key,
student_name VARCHAR(100),
course VARCHAR(50)
);

INSERT INTO students_2023 (student_Id,student_name,course) VALUES
(1,'Aarav Sharma','Computer Science'),
(2,'Ishita Verma','Mechanical Engineering'),
(3, 'Kabir Patel','Electronics'),
(4,'Ananya Desai','Civil Engineering'),
(5,'Rahul Gupta','Computer Science');

SELECT * from Students_2023;


-- create another table with same columns

DROP TABLE IF EXISTS students_2024;
CREATE TABLE students_2024(
student_id INT Primary Key,
student_name VARCHAR(100),
course VARCHAR(50)
);
INSERT INTO students_2024 (student_Id,student_name,course) VALUES
(1,'Aarya Sharma','Computer Science'),
(2,'Nandini Verma','Mechanical Engineering'),
(3, 'Kavya Patel','Electronics'),
(4,'Parth Desai','Civil Engineering'),
(5,'Jeeva Gupta','Computer Science');

SELECT * fROM students_2024;

-- union -- combine results and remove duplicates


SELECT Student_name,course from Students_2023
UNION
SELECT Student_name,course fROM students_2024;

SELECT Student_name,course from Students_2023
UNION ALL
SELECT Student_name,course fROM students_2024; 

SELECT Student_name,course from Students_2023
EXCEPT
SELECT Student_name,course fROM students_2024;


SELECT Student_name,course from Students_2023
INTERSECT -- comman values
SELECT Student_name,course fROM students_2024;













 