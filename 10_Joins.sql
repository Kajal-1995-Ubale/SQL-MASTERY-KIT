-- Table creation for joins
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(101, 'John', 'Mumbai'),
(102, 'Emma', 'Pune'),
(103, 'David', 'Delhi'),
(104, 'Sophia', 'Bangalore');

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    Amount DECIMAL(10,2),

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, Product, Amount)
VALUES
(1, 101, 'Laptop', 50000.00),
(2, 102, 'Mobile', 25000.00),
(3, 101, 'Keyboard', 2000.00);

-- SQL JOIN is used to combine data from two or more tables based on a related column (usually a Primary Key and Foreign Key).
/*
Real-world example:

Customers table stores customer details.
Orders table stores order details.
Both tables are linked using CustomerID.
*/

-- 1. INNER JOIN - Returns only matching Records from both tables
SELECT * from Customers;
sELECT * from Orders;

SELECT C.customerid,C.customername,
O.product, O.amount
FROM Customers C
INNER JOIN Orders O
ON C.customerid=O.customerid;


--2. LEFT Join
/*Returns

All rows from the left table
Matching rows from right table
If no match → NULL
*/
SELECT C.customerid,C.customername,
O.product, O.amount
FROM Customers C
LEFT JOIN Orders O
ON C.customerid=O.customerid;

-- 3. Right Join
-- Returns
-- All rows from right table
-- Matching rows from left
SELECT C.customerid,C.customername,
O.product, O.amount
FROM Customers C
RIGHT JOIN Orders O
ON C.customerid=O.customerid;

-- 4. FULL OUTER JOIN
-- Returns

-- All matching rows
-- All non-matching rows from both tables

SELECT C.customerid,C.customername,
O.product, O.amount
FROM Customers C
FULL JOIN Orders O
ON C.customerid=O.customerid;

-- 5. CROSS JOIN 
-- Returns the cartesian product
-- Every customer is paired with every order

SELECT
CustomerName,
Product
FROM Customers
CROSS JOIN Orders;

-- 6. SELF JOIN - Table joins with itself 

/*
| EmpID | Name   | ManagerID |
| ----- | ------ | --------- |
| 1     | John   | NULL      |
| 2     | Emma   | 1         |
| 3     | David  | 1         |
| 4     | Sophia | 2         |

*/

SELECT
e.Name AS Employee,
m.Name AS Manager
FROM Employee e
LEFT JOIN Employee m
ON e.ManagerID=m.EmpID;







