--- Extras
--- What is the busiest time of the day?
--- To answer the question, I first created a new column to transform the OrderTime variable into 3 different times of the day as below:

alter table dw_sales_analysis add TimeOfDay varchar (20);
alter table orders add order_month varchar(2), add order_day varchar (2);
update dw_sales_analysis set TimeOfDay= 'Morning' where OrderTime>='11:00:00' and OrderTime<='12:00:00';
update dw_sales_analysis set TimeOfDay= 'Afternoon' where OrderTime>'12:00:00' and OrderTime<='17:00:00';
update dw_sales_analysis set TimeOfDay= 'Evening' where OrderTime>'17:00:00';

--- Creating the view to find the busiest time of the day.

drop view if exists Busiest_Time;
create view Busiest_Time as
select d.TimeOfDay, count(orderId) as NumOfOrders, sum(d.quantity) as QuantitySold
from dw_sales_analysis as d
group by d.TimeOfDay
order by NumOfOrders desc limit 3;
SELECT * FROM PizzaSales.busiest_time;
--- The view shows Afternoon as the busiest time of the day with 23,618 orders in 2015.

--- Creating Event Scheduler which will call the Busiest_Time view every one hour in the coming 3 hours.
drop table if exists messages;
create table messages (message varchar(250));
truncate messages;

set global event_scheduler = ON;
show variables like "event_scheduler";

Delimiter $$
create event BusiestTimeEvent
on schedule every 1 hour
starts current_timestamp
ends current_timestamp + interval 3 hour
do
	begin
		insert into messages select concat('evet:',NOW());
        call busiest_time();
	END $$
Delimiter ;

select * from messages;
show events;
drop event if exists BusiestTimeEvent;





