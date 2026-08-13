/* ==============================================================================
   SQL Data Definition Language (DDL)
-------------------------------------------------------------------------------
   This guide covers the essential DDL commands used for defining and managing
   database structures, including creating, modifying, and deleting tables.

   Table of Contents:
     1. CREATE - Creating Tables
     2. ALTER - Modifying Table Structure
     3. DROP - Removing Tables
=================================================================================
*/

/* ============================================================================== 
   CREATE
=============================================================================== */

/* Create a new table called persons 
   with columns: id, person_name, birth_date, and phone */

   CREATE TABLE Person (
   PersonID INT Primary key,
   Person_name VARCHAR(50) NOT NULL,
   Birthdate DATE,
   Phone VARCHAR(12) NOT NULL
   );

/* ============================================================================== 
   ALTER
=============================================================================== */

-- Add a new column called email to the persons table

ALTER TABLE Person
ADD  Email VARCHAR(30) NOT NULL;

SELECT * FROM Person;

-- Remove the phone from person table
ALTER TABLE Person
DROP COLUMN Phone;

/* ============================================================================== 
   DROP
=============================================================================== */

-- Delete the table persons from the database

DROP TABLE Person;
