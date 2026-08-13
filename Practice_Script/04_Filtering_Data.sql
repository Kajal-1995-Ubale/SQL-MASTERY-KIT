/* ============================================================================== 
   SQL Filtering Data
-------------------------------------------------------------------------------
   This document provides an overview of SQL filtering techniques using WHERE 
   and various operators for precise data retrieval.

   Table of Contents:
     1. Comparison Operators
        - =, <>, >, >=, <, <=
     2. Logical Operators
        - AND, OR, NOT
     3. Range Filtering
        - BETWEEN
     4. Set Filtering
        - IN
     5. Pattern Matching
        - LIKE
=================================================================================
*/

/* ============================================================================== 
   COMPARISON OPERATORS
=============================================================================== */

-- Retrieve all customers from Germany.
SELECT * FROM Customers
WHERE Country='Germany';


-- Retrieve all customers who are not from Germany.
SELECT * FROM Customers
WHERE Country!='Germany';

-- Retrieve all customers with a score greater than 500.
SELECT * FROM Customers
WHERE Score > 500;
-- Retrieve all customers with a score of 500 or more.
SELECT * FROM Customers
WHERE Score >= 500;

-- Retrieve all customers with a score less than 500.SELECT * FROM Customers
SELECT * FROM Customers
WHERE Score < 500;

-- Retrieve all customers with a score of 500 or less.
SELECT * FROM Customers
WHERE Score <= 500;

/* ============================================================================== 
   LOGICAL OPERATORS
=============================================================================== */

/* Combining conditions using AND, OR, and NOT */

-- Retrieve all customers who are from the USA and have a score greater than 500.
SELECT * FROM Customers
WHERE Country='USA' AND Score > 500;

-- Retrieve all customers who are either from the USA or have a score greater than 500.
SELECT * FROM Customers
WHERE Country='USA' OR Score > 500;

-- Retrieve all customers with a score not less than 500.
SELECT * FROM Customers
WHERE NOT Score <500;

/* ============================================================================== 
   RANGE FILTERING - BETWEEN
=============================================================================== */

-- Retrieve all customers whose score falls in the range between 100 and 500.
SELECT * FROM Customers
WHERE Score BETWEEN 100 AND 500;
-- Alternative method (Equivalent to BETWEEN)
SELECT * FROM Customers
WHERE Score>=100 AND Score <=500;

/* ============================================================================== 
   SET FILTERING - IN
=============================================================================== */

-- Retrieve all customers from either Germany or the USA.
SELECT * FROM Customers
WHERE Country IN ('Germany','USA');

/* ============================================================================== 
   PATTERN MATCHING - LIKE
=============================================================================== */

-- Find all customers whose first name starts with 'M'.
SELECT * FROM Customers
WHERE FirstName like 'M%';

-- Find all customers whose first name ends with 'n'.
SELECT * FROM Customers
WHERE FirstName like '%n';

-- Find all customers whose first name contains 'r'.
SELECT * FROM Customers
WHERE FirstName like '%r%';

-- Find all customers whose first name has 'r' in the third position.
SELECT * FROM Customers
WHERE FirstName like '__r%';