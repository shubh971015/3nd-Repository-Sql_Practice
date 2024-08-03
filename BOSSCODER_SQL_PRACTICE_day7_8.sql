##########    day7   ###########
-- write sql query to	retrive current data and time
select now() as currenttime;
select day(now()); 
select month(now());
select year(now());
select hour(now());	
select minute(now());
select second(now());

-- write  sql query to retirve upper case name  of all employees	
select upper(employee_name) from employee;

-- write query to find avg price of product after applying 10% discount
select product_name, price, round((price*0.9)) as price_after_10per_dis,
round(avg(price*0.9) over(partition by product_name )) ,
round(avg(price*0.9) over()) 
from product; 

##########    day8   ###########
-- write query to retive product who higher than avg price 
select * from product
where price> (
select avg(price) as avg_price from product
);
-- write query to retrive salary who have higher salary thar max of sales department 
select * from company
where salary > (select max(salary) from company);
-- write retrieves all customers who have placed an order after the latest order date for a specific product
SELECT DISTINCT CustomerID
FROM Orders
WHERE OrderDate > (
  SELECT MAX(OrderDate)
  FROM Orders
  WHERE ProductID = 'laptop'
);
--  all products that belong to categories with more than 10 products:

SELECT p.ProductName
FROM Products p
JOIN (
  SELECT CategoryID
  FROM Products
  GROUP BY CategoryID
  HAVING COUNT(*) > 10
) c ON p.CategoryID = c.CategoryID;




##########    day 9   ###########
-- create a view named ‘order_summary’ that retrieves the total order 
-- amount and the number of orders for each customer from the ‘orders’ table:
create view order_summary as
select sum(total_amount),
		customer_id,
		count(order_id)
from order_details
group by customer_id;





