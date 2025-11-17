CREATE DATABASE RetailDB;

USE RetailDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_clean VARCHAR(20),
    email VARCHAR(100),
    street VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    zip_code VARCHAR(10)
);

CREATE TABLE OrderItems (
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),
    PRIMARY KEY (order_id, item_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_status INT,
    order_date DATE,
    required_date DATE,
    store_id INT,
    staff_id INT,
    shipped_date_impute DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2)
);

CREATE TABLE Stocks (
    store_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (store_id, product_id)
);

CREATE TABLE Stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    street VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    zip_code VARCHAR(10)
);

CREATE TABLE Brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE Staffs (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    active BIT,
    store_id INT,
    manager_id_impute INT
);

INSERT INTO Customers (customer_id, first_name, last_name, phone_clean, email, street, city, state, zip_code) VALUES
(1, 'Debra', 'Burks', 'Not Mention', 'debra.burks@yahoo.com', '9273 Thorne Ave.', 'Orchard Park', 'NY', '14127'),
(2, 'Kasha', 'Todd', 'Not Mention', 'kasha.todd@yahoo.com', '910 Vine Street', 'Campbell', 'CA', '95008'),
(3, 'Tameka', 'Fisher', 'Not Mention', 'tameka.fisher@aol.com', '769C Honey Creek St.', 'Redondo Beach', 'CA', '90278'),
(4, 'Daryl', 'Spence', 'Not Mention', 'daryl.spence@aol.com', '988 Pearl Lane', 'Uniondale', 'NY', '11553'),
(5, 'Charolette', 'Rice', '(916) 381-6003', 'charolette.rice@msn.com', '107 River Dr.', 'Sacramento', 'CA', '95820');

INSERT INTO OrderItems (order_id, item_id, product_id, quantity, list_price, discount) VALUES
(1, 1, 20, 1, 599.99, 0.2),
(1, 2, 8, 2, 1799.99, 0.07),
(1, 3, 10, 2, 1549.00, 0.05),
(1, 4, 16, 2, 599.99, 0.05),
(1, 5, 4, 1, 2899.99, 0.2);

INSERT INTO Orders (order_id, customer_id, order_status, order_date, required_date, store_id, staff_id, shipped_date_impute) VALUES
(1, 259, 4, '2016-01-01', '2016-01-03', 1, 2, '2016-01-03'),
(2, 1212, 4, '2016-01-01', '2016-01-04', 2, 6, '2016-01-03'),
(3, 523, 4, '2016-01-02', '2016-01-05', 2, 7, '2016-01-03'),
(4, 175, 4, '2016-01-03', '2016-01-04', 1, 3, '2016-01-05'),
(5, 1324, 4, '2016-01-03', '2016-01-06', 2, 6, '2016-01-06');

INSERT INTO Products (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES
(1, 'Trek 820 - 2016', 9, 6, 2016, 379.99),
(2, 'Ritchey Timberwolf Frameset - 2016', 5, 6, 2016, 749.99),
(3, 'Surly Wednesday Frameset - 2016', 8, 6, 2016, 999.99),
(4, 'Trek Fuel EX 8 29 - 2016', 9, 6, 2016, 2899.99),
(5, 'Heller Shagamaw Frame - 2016', 3, 6, 2016, 1320.99);

INSERT INTO Stocks (store_id, product_id, quantity) VALUES
(1, 1, 27),
(1, 2, 5),
(1, 3, 6),
(1, 4, 23),
(1, 5, 22);

INSERT INTO Stores (store_id, store_name, phone, email, street, city, state, zip_code) VALUES
(1, 'Santa Cruz Bikes', '(831) 476-4321', 'santacruz@bikes.shop', '3700 Portola Drive', 'Santa Cruz', 'CA', '95060'),
(2, 'Baldwin Bikes', '(516) 379-8888', 'baldwin@bikes.shop', '4200 Chestnut Lane', 'Baldwin', 'NY', '11432'),
(3, 'Rowlett Bikes', '(972) 530-5555', 'rowlett@bikes.shop', '8000 Fairway Avenue', 'Rowlett', 'TX', '75088');

INSERT INTO Brands (brand_id, brand_name) VALUES
(1, 'Electra'),
(2, 'Haro'),
(3, 'Heller'),
(4, 'Pure Cycles'),
(5, 'Ritchey'),
(6, 'Strider'),
(7, 'Sun Bicycles'),
(8, 'Surly'),
(9, 'Trek');

INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Children Bicycles'),
(2, 'Comfort Bicycles'),
(3, 'Cruisers Bicycles'),
(4, 'Cyclocross Bicycles'),
(5, 'Electric Bikes'),
(6, 'Mountain Bikes'),
(7, 'Road Bikes');

INSERT INTO Staffs (staff_id, first_name, last_name, email, phone, active, store_id, manager_id_impute) VALUES
(1, 'Fabiola', 'Jackson', 'fabiola.jackson@bikes.shop', '(831) 555-5554', 1, 1, 'Not Mention'),
(2, 'Mireya', 'Copeland', 'mireya.copeland@bikes.shop', '(831) 555-5555', 1, 1, 1),
(3, 'Genna', 'Serrano', 'genna.serrano@bikes.shop', '(831) 555-5556', 1, 1, 2),
(4, 'Virgie', 'Wiggins', 'virgie.wiggins@bikes.shop', '(831) 555-5557', 1, 1, 2),
(5, 'Jannette', 'David', 'jannette.david@bikes.shop', '(516) 379-4444', 1, 2, 1),
(6, 'Marcelene', 'Boyer', 'marcelene.boyer@bikes.shop', '(516) 379-4445', 1, 2, 5),
(7, 'Venita', 'Daniel', 'venita.daniel@bikes.shop', '(516) 379-4446', 1, 2, 5),
(8, 'Kali', 'Vargas', 'kali.vargas@bikes.shop', '(972) 530-5555', 1, 3, 1),
(9, 'Layla', 'Terrell', 'layla.terrell@bikes.shop', '(972) 530-5556', 1, 3, 7),
(10, 'Bernardine', 'Houston', 'bernardine.houston@bikes.shop', '(972) 530-5557', 1, 3, 7);

Select count(*) From customers;
Select count(*) From orderitems;

# 1) Store-wise and Region-wise sales analysis
# a) Store-wise sales
Select s.store_name, round(sum(oi.quantity*oi.list_price*(1-oi.discount)),2) as Total_Sales,
count(distinct o.order_id) as Number_of_orders
from Stores as s 
join Orders as o on s.store_id = o.store_id
join OrderItems as oi on o.order_id  = oi.order_id
group by s.store_name
order by Number_of_orders desc;

# b) Region-wise sales
Select c.state, round(sum(oi.quantity*oi.list_price*(1-oi.discount)),2) as Total_Sales,
count(distinct o.order_id) as Number_of_orders
from Customers as c
join Orders as o on c.customer_id = o.customer_id
join OrderItems as oi on o.order_id  = oi.order_id
group by c.state
order by Number_of_orders desc;


# 2) Product-wise sales and inventory trends

Select p.product_id, p.product_name, round(sum(oi.quantity*oi.list_price*(1-oi.discount)),2) as Total_Sales
from Products as p
join OrderItems as oi on oi.product_id  = p.product_id
join Orders as o on o.order_id = oi.order_id
group by p.product_id, p.product_name
order by Total_Sales desc;

Select p.product_id, p.product_name, Year(o.order_date) as year, Month(o.order_date) as month, round(sum(oi.quantity*oi.list_price*(1-oi.discount)),2) as Total_Sales
from Products as p
join OrderItems as oi on oi.product_id  = p.product_id
join Orders as o on o.order_id = oi.order_id
group by p.product_id, p.product_name, Year(o.order_date), Month(o.order_date)
order by year, month;

Select p.product_id, p.product_name, sum(s.quantity) as Total_Inventory
from Products as p
join Stocks as s on s.product_id  = p.product_id
group by p.product_id, p.product_name
order by Total_Inventory desc;


# 3) Staff performance reports
Select s.staff_id, concat(s.first_name, " ", s.last_name) as Full_Name,
round(sum(oi.quantity * oi.list_price *(1- oi.discount)),2) as Total_Sales
from Staffs as s
join Orders as o on s.staff_id = o.staff_id
join OrderItems as oi on o.order_id = oi.order_id
group by s.staff_id, concat(s.first_name, " ", s.last_name)
order by Total_Sales desc;

# 4) Customer orders and order frequency
Select c.customer_id, concat(c.first_name, " ", c.last_name) as Full_Name, 
count(distinct o.order_id) as Total_Orders
from Customers as c
join Orders as o on o.customer_id = c.customer_id
join OrderItems as oi on o.order_id = oi.order_id
group by c.customer_id,  concat(c.first_name, " ", c.last_name)
order by Total_Orders desc;

Select c.customer_id, concat(c.first_name, " ", c.last_name) as Full_Name, 
count(distinct o.order_id) as Total_Orders, min(o.order_date) as First_Order_Date,
max(o.order_date) as Last_Order_Date, datediff(max(o.order_date),min(o.order_date)) as Days_Between_Orders 
from Customers as c
join Orders as o on o.customer_id = c.customer_id
group by c.customer_id,  concat(c.first_name, " ", c.last_name)
order by Total_Orders desc;

# 5) Revenue and discount analysis
Create view revenue_discount as
Select p.product_id, p.product_name,sum(oi.quantity * oi.list_price) as Gross_Revenue, 
round(sum(oi.quantity * oi.list_price*oi.discount),2) as Discount_Given,
round(sum(oi.quantity*oi.list_price *(1-oi.discount)),2) as Net_Revenue
from Products as p
join OrderItems as oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
order by Net_Revenue desc;

Select * from revenue_discount;

# 6)  Identify top-selling brands by region and store.
Create view brand_rank as
select s.state, s.city, s.store_name, b.brand_name, round(sum(oi.quantity*oi.list_price*(1-oi.discount)),2) as Total_Sales,
rank() over(partition by s.store_name order by round(sum(oi.quantity*oi.list_price*(1-oi.discount)),2) desc) as ranking
from Brands as b
join Products as p on b.brand_id = p.brand_id
join OrderItems as oi on p.product_id = oi.product_id
join Orders as o on oi.order_id = o.order_id
join Stores as s on o.store_id = o.store_id
group by  s.state, s.city, s.store_name, b.brand_name
order by ranking;

Select * from brand_rank;

# 7)  Identify the most profitable product categories.
Create view profitable_products as 
select c.category_id, c.category_name, round(sum(oi.quantity*oi.list_price*(1-oi.discount)),2) as Total_Sales
from OrderItems as oi
join products as p on p.product_id = oi.product_id
join Categories c on p.category_id = c.category_id
group by c.category_id, c.category_name
order by Total_Sales desc
limit 5;

Select * from profitable_products;

# 8) Analyze stock levels across stores to optimize inventory.
Create view Stock_view as
Select p.product_id, p.product_name, s.store_id, st.store_name, s.quantity as Current_Stock,
sum(oi.quantity) as Stock_Sold, (s.quantity-coalesce(sum(oi.quantity),0)) as Stock_Remaining,
case when (s.quantity-coalesce(sum(oi.quantity),0)) < 5 then "Low_Stock"
when (s.quantity-coalesce(sum(oi.quantity),0)) between 5 and 20 then "Moderate_Stock"
else "Enough_Stock" end as "Stock_Status"
from Stocks s
join Stores st on s.store_id = st.store_id
join Products p on s.product_id = p.product_id
left join OrderItems oi on p.product_id = oi.product_id
left join Orders o on oi.order_id = o.order_id and o.store_id = s.store_id
group by p.product_id, p.product_name, s.store_id, st.store_name, s.quantity 
order by Stock_Remaining asc ;

Select * from Stock_View;



# 9) Understand order trends across time (daily, weekly, monthly). Monitor delayed shipments vs. required delivery dates.
Create view Order_Trending as
Select o.order_date, week(o.order_date) as Weeks, date_format(o.order_date,"%M") as Months, 
count(distinct o.order_id) as Total_Orders, 
round(sum(oi.quantity * oi.list_price * (1 - oi.discount)),2) as Total_Revenue
from Orders o
join OrderItems oi on o.order_id = oi.order_id
group by o.order_date, Weeks, Months
order by Order_Date;

Create view Delivery_Performance as
Select o.order_id, o.order_date, o.required_date, o.shipped_date_impute as Shipped_Date,
datediff(o.shipped_date_impute, o.order_date) as Processing_Days,
datediff(o.required_date, o.order_date) as Promised_Days,
datediff(o.shipped_date_impute, o.required_date) as Delay_Days,
case when o.shipped_date_impute <= o.required_date then "On_Time"  else "Delayed" end as Delivery_Status
from Orders o
order by Delay_Days desc;

Select * from Order_Trending;
Select * from Delivery_Performance;


# 10)  Discover customer concentration and demographics.
Create view Customer_Concentration as
Select c.state, c.city, count(distinct c.customer_id) as Total_Customers,
round(sum(oi.quantity * oi.list_price * (1 - oi.discount)),2) as Total_Revenue
from Customers c
join Orders o on c.customer_id = o.customer_id
join OrderItems oi on o.order_id = oi.order_id
group by c.state, c.city
order by Total_Customers desc;

Select * from Customer_Concentration;
 
 
 -----------------------------------------------------
 
 # CONNECT TO POWER BI 
 
 ------------------------------------------------------
 
use RetailDB;
SELECT @@hostname AS ServerName;

SHOW VARIABLES LIKE 'port';
SHOW VARIABLES LIKE 'bind_address';
SELECT @@hostname AS server_hostname, @@version AS mysql_version;

SELECT user, host FROM mysql.user;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'powerbi_user'@'%' IDENTIFIED BY 'root';
GRANT SELECT ON RetailDB.* TO 'powerbi_user'@'%';
FLUSH PRIVILEGES;

