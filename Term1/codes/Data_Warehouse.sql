--- Creating the data warehouse dw_sales_analysis to assemble all the relevant tables together

drop procedure if exists pizza_warehouse;
Delimiter $$
create procedure pizza_warehouse()

Begin
Drop table if exists dw_sales_analysis;
create table dw_sales_analysis as 

select
o.order_id as OrderID,
o.Order_date as OrderDate,
o.Order_time as OrderTime,
o.order_year as OrderYear,
o.order_month as OrderMonth,
o.order_day as OrderDay,

d.Id as DetailsId,
d.pizza_id as PizzaID,
d.quantity as Quantity,

p.Pizza_type_id as PizzaTypeId,
p.Size as Size,
p.Price as Price,

t.Pizza_name as PizzaName,
t.Catagory as Catagory,
t.Ingredients as Ingredients

from Orders o
inner join OrderDetails d using(Order_id)
inner join Pizzas p using(pizza_id)
inner join PizzaTypes t using(pizza_type_id)

order by Order_id;

End $$
Delimiter ;

call pizza_warehouse();
