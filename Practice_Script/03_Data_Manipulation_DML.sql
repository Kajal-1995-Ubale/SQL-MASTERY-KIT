/* ==============================================================================
   SQL Data Manipulation Language (DML)
-------------------------------------------------------------------------------
   This guide covers the essential DML commands used for inserting, updating, 
   and deleting data in database tables.

   Table of Contents:
     1. INSERT - Adding Data to Tables
     2. UPDATE - Modifying Existing Data
     3. DELETE - Removing Data from Tables
=================================================================================
*/

/* ============================================================================== 
   INSERT
=============================================================================== */
/* #1 Method: Manual INSERT using VALUES */
-- Insert new records into the customers table
SELECT * FROM Customers;
INSERT INTO Customers values (6,'Kajal','ubale','India',650);

-- Incorrect column order 
INSERT INTO Customers(CustomerID,FirstName,Country,Score) VALUES(7,'MAX','Germany',NULL);
-- LAST NAME is not added. it returns NULL 
    
-- Incorrect data type in values
-- suppose in CustomerId we returned 'one'
INSERT INTO Customers VALUES('eight','Teena','Sharma','India',560);
-- ERROR : Conversion failed when converting the varchar value 'eight' to data type tinyint.
-- data type is int we have added string data 

-- Insert a new record with full column values

INSERT INTO Customers (CustomerID,FirstName,LastName,Country,Score) VALUES(8,'Teena','Sharma','India',560);

-- Insert a new record without specifying column names (not recommended)
INSERT INTO Customers VALUES(9,'Leena','Sharma','Germany',960);


-- Insert a record with only id and first_name (other columns will be NULL or default values)
INSERT INTO Customers (CustomerID,FirstName) VALUES (10,'Kabir');
-- Cannot insert because of Country has NOT NULL Constraint


/* #2 Method: INSERT DATA USING SELECT - Moving Data From One Table to Another */
-- Copy data from the 'customers' table into 'persons'
SELECT * FROM Customers;

CREATE TABLE Persons(
PersonID INT Primary key,
FirstName VARCHAR(20),
Country VARCHAR(30),
Score INT
);

-- Add Column Phone and Email

ALTER TABLE Persons
ADD  Phone VARCHAR(15), Email VARCHAR(30);

SELECT * FROM Persons;

INSERT INTO Persons(PersonID,FirstName,Country, Score)
SELECT 
CustomerID,
FirstName,
Country,
Score
FROM Customers;

/* ============================================================================== 
   UPDATE
=============================================================================== */

-- Change the score of customer with ID 6 to 0

SELECT * FROM Customers;
UPDATE Customers
SET Score = 0 
WHERE CustomerID=6;

-- Change the score of customer with ID 10 to 0 and update the country to 'UK'
UPDATE Customers
SET Score = 0, Country='UK'
WHERE CustomerID=5;

-- Update all customers with a NULL score by setting their score to 0
UPDATE customers
SET score = 0
WHERE score IS NULL;


-- Verify the update
SELECT *
FROM customers
WHERE score IS NULL

/* ============================================================================== 
   DELETE
=============================================================================== */

-- Select customers with an ID greater than 5 before deleting
SELECT * FROM Customers
WHERE CustomerID>5;

-- Delete all customers with an ID greater than 5
DELETE FROM Customers
WHERE CustomerID>5;
-- Delete all data from the persons table
DELETE FROM Persons;

SELECT * FROM Persons;

-- Faster method to delete all rows, especially useful for large tables
TRUNCATE TABLE persons
