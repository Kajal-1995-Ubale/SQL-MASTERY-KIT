-- window functions
-- perform calculations across set of table rows related to the current row.
-- They are useful for ranking, calculating running totals, percentages and much more

select * from products
-- Assign unique row number to each product within same category 

SELECT product_name, category, price,
ROW_NUMBER() OVER (PARTITION BY  category ORDER BY price)
from products;

SELECT product_name, category, price,
DENSE_RANK() OVER (PARTITION BY  category ORDER BY price)
from products;

/*
Window Functions perform calculations across a set of rows related to the current row without grouping the data. Unlike GROUP BY, they do not reduce the number of rows.

They are commonly used in Data Analyst interviews and real-world dashboards.

Syntax
Function_Name() OVER (
    [PARTITION BY column]
    [ORDER BY column]
)
Components
OVER() → Converts a normal function into a window function.
PARTITION BY → Divides data into groups.
ORDER BY → Defines the order within each partition.
*/
-- 1. ROW_NUMBER() - Assigns a unique sequential number to each row.
SELECT
product_name,Category,
price,
ROW_NUMBER() OVER (ORDER BY price DESC) AS Rownum
from Products;


-- category wise row_number
SELECT
product_name,Category,
price,
ROW_NUMBER() OVER (Partition by Category ORDER BY price DESC) AS Rownum
from Products;

-- 2. RANK() - Assigns Rank
-- If price tie, ranks are the same and the next rank is skipped.
-- my table dont have duplicate price 
UPDATE  products
SET price=1500.75
WHERE product_name='Keyboard';

select * from products;

SELECT
product_name,Category,
price,
RANK() OVER (Partition by Category ORDER BY price DESC) AS Rownum
from Products;
-- output is for accessories 1,1,3 skips 2

-- 3. DENSE_RANK() - same as RANK but does not skip numbers

SELECT
product_name,Category,
price,
DENSE_RANK() OVER (Partition by Category ORDER BY price DESC) AS Rownum
from Products;
-- output is 1,1,2

-- 4. NTILE() - Divides rows into equal group
SELECT product_name,
price, 
NTILE(2) OVER ( order by price DESC) as quartile
from products;

-- 5. LAG() - Returns previous row value 
SELECT product_name,
price, 
LAG(price) OVER (order by price DESC) as previousalary
from products;

-- 6. LEAD() - Returns next row value
SELECT product_name,
price, 
LEAD(price) OVER (order by price DESC) as previousalary
from products;

-- FIRST_VALUE() - Returns FIrst value in the window
SELECT product_name,
price, 
FIRST_VALUE(price) OVER (order by price DESC) as previousalary
from products;











