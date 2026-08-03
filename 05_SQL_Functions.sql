-- Aggregate Functions

DROP TABLE IF EXISTS products;

CREATE TABLE products(
product_id SERIAL primary key,
product_name VARCHAR(50),
category VARCHAR(50),
price NUMERIC(10,2),
quantity INT,
added_date DATE,
discount_rate NUMERIC(5,2)
);

INSERT INTO products (product_name,category, price, quantity,added_date,discount_rate) VALUES
('Laptop','Electronics',75000.00,10,'2024-01-15',10.00),
('Smartphone','Electronics',45000.00,25,'2024-02-20',5.00),
('Headphone','Accessories',1500.75,50,'2024-03-05',15.00),
('OfficeChair','Furniture',5500.00,7,'2023-12-01',20.00),
('Desk','Furniture',8000.00,15,'2023-11-20',12.00),
('Monitor','Electronics',1200.00,8,'2024-01-10',8.00),
('Printer','Electronics',9500.00,6,'2024-02-01',7.50),
('Mouse','Accessories',750.00,4,'2024-03-18',10.80),
('Keyboard','Accessories',1250.00,6,'2025-03-18',23.00);

Select * from products;

--- Total Quantity of all products
SELECT SUM(quantity) As total_quantity
from products;

-- Total quantity of electronic category and price>20000

SELECT SUM(quantity) As quanity_of_Electronic
from products
WHERE category='Electronics' AND Price>20000;

-- total number of products

SELECT Count(*) As total_product
from products;

-- 'phone' word included in product name count that products
SELECT Count(*) As total_product
from products
WHERE product_name LIKE '%phone%';

-- aVg price of products
SELECT AVG(price) As Avg_Price
from products

-- avg price of products where Category is accessories
SELECT AVG(price) As Avg_Price
from products
WHERE Category = 'Accessories';


-- maximum and minimumprice
SELECT MAX(price) as MAX_Price,
MIN(Price) as MIN_Price
From products;







































