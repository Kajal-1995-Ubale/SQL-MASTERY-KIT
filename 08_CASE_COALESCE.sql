select * from products;

-- we will categorize products into price ranges
-- 01 Expensive if the price is greater than or equal to 50000
-- 02 moderate if the price is between 10,000 and 49,999 
-- 03 Affordable if the price is less than 10000

SELECT Product_name, price,
CASE WHEN price >=50000 THEN 'Expensive'
	 WHEN price>=10000 AND price<=49999 THEN 'moderate'
	 ELSE 'Affordable'
 END as price_category
from products;

-- assignment on case function 

-- CASE with AND & OR statement - Stock Status
-- we will classify products based on quantity available.
-- in Stock of quantity is 10 or more 
-- in limited stock if quantity is between 5 and 9
-- out of stock if the quantity is less then 5 
	SELECT Product_name, quantity,
	CASE WHEN quantity=10 OR quantity>=10 THEN 'Stock available'
	WHEN quantity BETWEEN 5 AND 9 THEN 'limited Stock'
	WHEN quantity <5 THEN 'Out of stock soon'
	END as Quantity_Status
	from products;

-- CASE with like operators
-- check if the category name contains "Electronic Item" Or "Furniture Item" or "accessory Item"
	SELECT product_name,category,
	CASE WHEN category LIKE '%Elect%' THEN 'Electronic Item'
	WHEN category LIKE '%Furni%' THEN 'Furniture Item'
	WHEN category LIKe '%Access%' THEN 'Accessory Item'
	END as Category_Type
	from products;

--- COALESCE Function
-- Handling NULL Value
select * from products;

-- add discount_price column with null value 
ALTER TABLE products
ADD COlumn discount_price NUMERIC(10,2) ;

UPDATE products
SET discount_price = NULL
WHERE product_name IN  ('Laptop','Desk');

UPDATE products
SET discount_price = price*0.9
WHERE product_name NOT IN  ('Laptop','Desk');

SELECT product_name,price,discount_price
from products;
-- on two products we dont have discount that whys show price value laptop and Desk from price column 
-- using coalesce()

SELECT product_name,
COALESCE(discount_price,price) as discount_final_price
from products;




















