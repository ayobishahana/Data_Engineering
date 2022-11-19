--- Creating the schema
drop schema if exists PizzaSales;
Create schema PizzaSales;
use PizzaSales;

show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

--- Creating the OrderDetails Table
drop table if exists orderDetails;
Create table OrderDetails
(Id integer not null,
order_id integer,
pizza_id varchar(50),
quantity integer, 
primary key(Id));

--- Loading the csv file into the table
load data local infile "/Users/shahanaayobi/Desktop/pizza/order_details.csv"
INTO TABLE OrderDetails
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
IGNORE 1 LINES 
(Id, order_id, pizza_id, quantity);

--- Creating table for orders
drop table if exists Orders;
create table Orders
(Order_id integer not null,
Order_date date,
Order_time time,
primary key(Order_id));

--- loading the csv file into the table
load data local infile "/Users/shahanaayobi/Desktop/pizza/orders.csv"
INTO TABLE Orders
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
IGNORE 1 LINES 
(Order_id,Order_date, Order_time);

--- Adding separate columns for day, month, and year extracte=d from OrderDate to ease our future analysis.
alter table orders add order_year varchar (4);
alter table orders add order_month varchar(2), add order_day varchar (2);
update orders set order_year= year(order_date);
update orders set order_month= month(order_date); 
 update orders set order_day=day(order_date);

--- Creating table PizzaTypes
drop table if exists PizzaTypes;
create table PizzaTypes
(Pizza_type_id varchar(50),
Pizza_name varchar (100),
Catagory varchar (50),
Ingredients varchar (100),
primary key(Pizza_type_id));

--- Loading the csv file into the table
load data local infile "/Users/shahanaayobi/Desktop/pizza/pizza_types.csv"
INTO TABLE PizzaTypes
CHARACTER SET latin1
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
IGNORE 1 LINES 
(Pizza_type_id, Pizza_name, Catagory, Ingredients);

--- Creating the table Pizzas
drop table if exists Pizzas;
create table Pizzas
(Pizza_id varchar (50),
Pizza_type_id varchar(50),
Size varchar (5),
Price double,
primary key (Pizza_id));

--- Loading the csv file into the table
load data local infile "/Users/shahanaayobi/Desktop/pizza/pizzas.csv"
INTO TABLE Pizzas
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
IGNORE 1 LINES 
(Pizza_id, Pizza_type_id, Size, Price);
