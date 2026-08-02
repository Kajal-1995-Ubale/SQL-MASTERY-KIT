-- using Query 
-- CREATE Table 
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee(
Employee_ID INT Primary Key,
First_name VARCHAR(20) NOT NULL,
Last_name VARCHAR(20) NOT NULL,
Email VARCHAR(50) NOT NULL,
Department VARCHAR(20),
Salary NUMERIC(10,2),
Joining_Date DATE,
Age Int
);

SELECT * FROM Employee;

COPY
Employee (employee_id,	first_name,	last_name,	email, department,	salary,	joining_date,	age)
FROM 'D:\Data_Analyst_Bundle_Kit_By_Kajal\SQL Mastery Kit\Dataaset\employee_data.csv'
DELIMITER ','
CSV HEADER;

-- Import CSV File Directly in SQL 
-- Right click on table - import/export data - General -import - select file - format is csv , encoding NA keep blank, go to options and header enable
