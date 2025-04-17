CREATE DATABASE PIZZA;
USE PIZZA;


-- IMPORT DATA DIRECTLY
SELECT * FROM pizza_sales;


-- KPI's
-- Q1  total revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
-- ans- 817860.049999993

-- Q2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;
-- 38.307262295081635

-- Q3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;
-- 49574

-- Q4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
-- 21350

-- Q5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

-- 2.32

-- Q6 . Hourly Trend for Orders
SELECT HOUR(order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by HOUR(order_time)
order by HOUR(order_time);
-- 9	1
-- 10	8
-- 11	1231
-- 12	2520

-- Q7 . % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;
-- Classic	220053.10	26.91

-- Q8 . % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- Q9 . Top 5 Best Sellers by Total Pizzas Sold
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- Q10 Bottom 5 Best Sellers by Total Pizzas Sold
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;
-- The Brie Carre Pizza	490








