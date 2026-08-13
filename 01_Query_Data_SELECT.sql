/* ==============================================================================
   SQL SELECT Query
-------------------------------------------------------------------------------
   This guide covers various SELECT query techniques used for retrieving, 
   filtering, sorting, and aggregating data efficiently.

   Table of Contents:
     1. SELECT ALL COLUMNS
     2. SELECT SPECIFIC COLUMNS
     3. WHERE CLAUSE
     4. ORDER BY
     5. GROUP BY
     6. HAVING
     7. DISTINCT
     8. TOP
     9. Combining Queries
	 10. COOL STUFF - Additional SQL Features
=================================================================================
*/

/* ==============================================================================
   COMMENTS
=============================================================================== */

-- This is a single-line comment.

/* This
   is
   a multiple-line
   comment
*/

-- Drop Database which is currently in use

USE  master;

ALTER DATABASE EnterpriseSales
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO


DROP DATABASE EnterpriseSales;

--- Create Database on sales Database
CREATE DATABASE SalesDW;

USE SalesDw;


/* ==============================================================================
   SELECT ALL COLUMNS
=============================================================================== */

-- Retrieve All Customer Data
SELECT * FROM Customers;

-- Retrieve All Order Data
SELECT * FROM Orders;

/* ==============================================================================
   SELECT FEW COLUMNS
=============================================================================== */

-- Retrieve each customer's name, country, and score.
SELECT * FROM Customers;

SELECT FirstName, LastName, Country, Score
FROM Customers;

/* ==============================================================================
   WHERE
=============================================================================== */

-- Retrieve customers with a score not equal to 0
SELECT * 
FROM Customers 
WHERE Score!=0; -- or Score<>0 or Score>=0

-- Retrieve customers from Germany
SELECT * 
FROM Customers
WHERE Country='Germany';

-- Retrieve the name and country of customers from Germany
SELECT FirstName, Country
FROM Customers
WHERE Country='Germany';

/* ==============================================================================
   ORDER BY
=============================================================================== */

/* Retrieve all customers and 
   sort the results by the highest score first. */

SELECT * 
FROM Customers
ORDER BY Score DESC;


/* Retrieve all customers and 
   sort the results by the lowest score first. */
SELECT * 
FROM Customers
ORDER BY Score ASC;
-- OR 
SELECT * 
FROM Customers
ORDER BY Score;

/* Retrieve all customers and 
   sort the results by the country. */

SELECT * 
FROM Customers
ORDER BY Country DESC;


/* Retrieve all customers and 
   sort the results by the country and then by the highest score. */
SELECT * 
FROM Customers
ORDER BY Country ASC, Score DESC;

/* Retrieve the name, country, and score of customers 
   whose score is not equal to 0
   and sort the results by the highest score first. */

SELECT FirstName, Country, Score
FROM Customers
WHERE Score !=0
ORDER BY Score DESC;


/* ==============================================================================
   GROUP BY
=============================================================================== */

-- Find the total score for each country

SELECT * FROM Customers;

SELECT Country,
SUM(Score) as Total_Score
FROM Customers
GROUP BY Country;

/* This will not work because 'first_name' is neither part of the GROUP BY 
   nor wrapped in an aggregate function. SQL doesn't know how to handle this column. */

SELECT 
    country,
    FirstName,
    SUM(score) AS total_score
FROM customers
GROUP BY country;

-- Find the total score and total number of customers for each country

SELECT Country,
SUM(Score) As Total_Score,
COUNT(CustomerID) as Total_Customers
FROM Customers
GROUP BY Country;


/* ==============================================================================
   HAVING
=============================================================================== */

/* Find the average score for each country
   and return only those countries with an average score greater than 430 */
SELECT Country,
AVG(Score) As Total_Score
FROM Customers
GROUP BY Country
HAVING AVG(Score) >= 430;

/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

/* ==============================================================================
   DISTINCT
=============================================================================== */

-- Return Unique list of all countries
SELECT DISTINCT country 
From Customers;

/* ==============================================================================
   TOP
=============================================================================== */

-- Retrieve only 3 Customers
SELECT * FROM Customers;

SELECT TOP 3 *
FROM Customers; -- this will show first 3 records

-- Retrieve the Top 3 Customers with the Highest Scores
SELECT TOP 3 *
FROM Customers
ORDER BY Score DESC;

-- Retrieve the Lowest 2 Customers based on the score
SELECT TOP 2 *
FROM Customers
ORDER BY Score ASC;

-- Get the Two Most Recent Orders

SELECT * from Orders;
SELECT TOP 2 *
FROM Orders
ORDER BY OrderDate DESC;


/* ==============================================================================
   All Together
=============================================================================== */

/* Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first. */
   SELECT Country,
   AVG(Score) as AVG_Score
   FROM Customers
   WHERE Score<>0
   GROUP BY Country
   HAVING AVG(Score) > 430
   ORDER BY AVG_Score DESC;


/* ============================================================================== 
   COOL STUFF - Additional SQL Features
=============================================================================== */

-- Execute multiple queries at once
SELECT * FROM customers;
SELECT * FROM orders;

/* Selecting Static Data */
-- Select a static or constant value without accessing any table
SELECT 123 As Static_number;

SELECT 'Hello' AS static_string;
-- Assign a constant value to a column in a query
SELECT
    CustomerID,
    FirstName,
    'New Customer' AS customer_type
FROM customers;