--- What is the Total Revenue generated in 2015?

drop view if exists Total_Revenue;
create view Total_Revenue as
select OrderYear, count(orderId) as NumofOrders, round(sum(d.quantity * d.price)) as TotalRevenue
from dw_sales_analysis as d
where OrderYear= 2015;
SELECT * FROM PizzaSales.total_revenue;
--- The total Revenue generated in by the pizza place in 2015 was $817,860 for a total of 48,620 orders.


--- What month created the highest revenue?

drop view if exists Highest_Revenue;
create view Highest_Revenue as
select d.OrderMonth, round(sum(d.quantity * d.price)) as TotalRevenue
from dw_sales_analysis as d
group by d.OrderMonth
order by TotalRevenue desc;
SELECT * FROM PizzaSales.highest_revenue;
--- July generated the highest revenue amounting to $72,558 followed by May, and March amounting to $71,403 and $70,397. 
    
--- What are the top 3 pizza sizes?

drop view if exists Pizza_size;
create view Pizza_size as
select d.size, sum(d.quantity) as PizzaQuantity
from dw_sales_analysis as d
group by d.size
order by PizzaQuantity desc LIMIT 3;
SELECT * FROM PizzaSales.pizza_size;
--- The top 3 pizza sizes are Large, Medium, and Small sequentially with number of pizzas.

--- Since large pizza is sold the most, I want to investigate the following question:
--- what is average price of a large pizza?

drop view if exists Avg_PriceL;
create view Avg_PriceL as 
select d.size, round(avg(price)) as AveragePrice
from dw_sales_analysis as d
where d.size='L';
SELECT * FROM PizzaSales.avg_pricel;
--- The average price of a large pizza is $20 when rounded.

--- what are the top 5 best selling pizza types and what revenues have they generated in 2015?

drop view if exists Best_Selling;
create view Best_Selling as
select d.PizzaTypeId, d.PizzaName, 
sum(d.quantity) as PizzaQuantity,
sum(d.quantity * d.price) as TotalRevenue
from dw_sales_analysis as d
group by d.PizzaTypeId, d.PizzaName
order by PizzaQuantity desc limit 5;
SELECT * FROM PizzaSales.best_selling;
