-- CTE (common Table Expression)
select * from customers;
select * from orders;

SELECT *, AVG(amount) OVER (ORDER BY o.customerid) AS avg_price,
COUNT(c.customerid) OVER (ORDER BY c.customerid) as Count_customer
FROM orders o 
INNER JOIN customers c
ON o.customerid = c.customerid;

-- using CTES
with my_cte as (
	SELECT *, AVG(amount) OVER (ORDER BY o.customerid) AS avg_price,
COUNT(c.customerid) OVER (ORDER BY c.customerid) as Count_customer
FROM orders o 
INNER JOIN customers c
ON o.customerid = c.customerid
)
SELECT  product, amount
from my_cte;

-- we can add multiple CTEs in One query 

