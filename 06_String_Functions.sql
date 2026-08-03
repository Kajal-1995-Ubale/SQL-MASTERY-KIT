-- String Functions
SELECT * from products;

-- Get all category in upper case
SELECT UPPER(category) as Category_Capital
from products;

-- Get all category in lower case
SELECT LOWER(category) as Category_lower
from products;

-- Concate product name and category together
SELECT CONCAT(product_name,'-',category)
from products;

-- substring first 5 characted
SELECT SUBSTRING(product_name,1,5)
From products;

 -- count length
 SELECT product_name, LENGTH(product_name) as Count_of_char
 from products;

 -- Remove leading and trailing spaces from string
 SELECT LENGTH(TRIM('  Monitor  ')) As trim_method

 -- REPLACEthe word 'phone' from product_name with 'device'
 SELECT REPLACE(product_name,'phone','device') as updated_name from products;

 -- LEFT
 SELECT LEFT(category,3) as category_capital
 from products;

-- RIGHT 

SELECT RIGHT(category,3) as category_capital
 from products;









 
 