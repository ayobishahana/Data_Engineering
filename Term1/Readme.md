# Data Engineering Project Report:  Maven Pizza Challenge Dataset


This report includes a comprehensive description of my project. I used the Maven Pizza Challenge Dataset from Kaggle to complete this task. The dataset contains the annual sales data of a fictitious pizza place officially collected for the Maven Pizza Challenge. It includes the date and time of each order and the pizzas served, with additional details on pizza size, type, quantity, price, and ingredients. The link to the dataset can be found [here](https://www.kaggle.com/datasets/neethimohan/maven-pizza-challenge-dataset)

### Operational Layer

The Maven Pizza Challenge dataset records pizza sales from 2015-01-01 to 2015-12-31 of a fictitious pizza place and contains the following four relational tables: 
- The OrderDetails table includes 48620 rows containing order details regarding pizza type and order quantity. The Id of the order details is the primary key in this table.
- The Orders table records the order date and time indicators of the 21350 orders where the Order_Id is the primary key.
- The PizzaTypes table determines the name, category, and ingredient information about the 33 different pizza types offered by the pizza place. Pizza_type_id is the primary key here.
- The Pizzas table contains 97 rows consisting of the pricing details of pizzas based on the size and pizza type. Pizza_id is the primary key here.

The dataset can be found [here](https://github.com/ayobishahana/Data_Engineering/tree/main/Term1/Dataset) 

The following EER diagram better illustrates the relationship between the tables. The diagram shows the OrderDetails and Pizzas tables as the central tables which include substantial information that is vital for the analysis.  Further details about the creation of operational layer can be found [here](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/codes/Operational_Layer.sql)

![starSchema](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/Tables/EER_Diagram.png)

### Analytics

In order to analyze the data to help the pizza place find opportunities to increase sales and work more efficiently, I would require the data to provide me with the following information:
- what is the Total Revenue generated in January?
- What month created the highest revenue in 2015?
- What are the top 3 pizza sizes?
- what is the average price of a large pizza?
- what are the top 5 best-selling pizza types and what revenues have they generated in 2015?
In order to carry out the analysis, my analytics plan is as follows:
- Loading the four tables;
- Building an ETL pipeline to create a data warehouse called dw_sales_analysis;
- Building an ETL pipeline to create data marts to achieve the above-mentioned five views.

![Analytics](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/Tables/Analytics.png)

### Analytical Layer

In the analytical layer, I created a data warehouse called dw_sales_analysis in order to provide one single table for both qualitative and quantitative parameters. Then, I used the table to create my views.  It consists of four dimensions; order details, orders, pizza types, and pizzas, and the queries can be #found here#. 

![AnalyticalLayer](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/Tables/Analytical_Layer.png)


### Data Marts

Using the data warehouse created in the analytical layer, I generated data marts using views that would enable me to respond to the questions posed in my analytical plan. The five views are as follows:

#### View One: Total Revenue in 2015

This view was created to find the total revenue produced by the pizza place over the year. It can help the pizza place predict its future performance and plan any alterations accordingly. It includes total number of orders, total revenue, and order year columns.

#### View Two: Highest Revenue Month

This view displays revenues generated at the end of each month in a descending order. Our aim is to find the month with highest revenue and provide the pizza place an idea of when to expect higher pizza demands. This will assist the pizza place to plan efficiently. The view includes all month with their subsequent total revenues in a descending order.

#### View Three: Top 3 Pizza Sizes

This View will assist the pizza place to find what their top three highly demanded pizza sizes are. It displays pizza sizes and sorts it on the basis of most numbers of pizzas sold. 

#### View four: Average Price of a Large Pizza

The previous view displayed that Large Pizza Size was sold the most. In this view, I am interested to show what the average price of a large pizza is since price is one of the crucial parameters of higher demand of this particular size.

#### View Five: Top 5 Pizza Types and the Revenues Generated
This view displays pizza types and sorts them in a descending order by quantity sold. It includes Pizza Type Id, Pizza Name, sum of quantity sold, and total revenue for each of those 5 best-selling pizzas.
![TopPizzas](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/Tables/Top_5_Pizzas.png)

More information on the queries and results of the views can be found [here](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/codes/Data_Marts.sql).

### Extras:


#### View: Busiest time of the day:


By creating this view, I intend to find out what times of the day the pizza place is the busiest. This way, the pizza place can better work on efficiency and if possible try to increase productivity or personnel to serve customers in a timely manner during rush hours. The view displays the Times of the day (Morning, Afternoon, or Evening) and sorts it by the number of orders and quantity sold. Here, we find the Afternoon to be the busiest followed by Evening and then Morning with the least number of orders.
![BusiestTimes](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/Tables/Busiest_Times.png)
#### Event Scheduler:

I have then created an event scheduler for the above-mentioned view which call the view every hour in the coming 3 hours. More can be found [here](https://github.com/ayobishahana/Data_Engineering/blob/main/Term1/codes/Extras.sql).





