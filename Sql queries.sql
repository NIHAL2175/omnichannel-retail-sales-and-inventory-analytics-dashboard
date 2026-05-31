-- create database
CREATE DATABASE IF NOT EXISTS retail_dashboard;  
USE retail_dashboard;

Show tables;

SELECT COUNT(*) AS total_rows
FROM cleaned_train;  
 
SELECT * from cleaned_train  
LIMIT 10;

DESCRIBE cleaned_train;

-- total revenue 
SELECT 
ROUND(SUM(Sales), 2) AS total_revenue
FROM cleaned_train; 

-- total order average value 
SELECT ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS avg_order_value
FROM cleaned_train;

-- Total no.of orders
SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM cleaned_train;

-- total customers
SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM cleaned_train;

-- best selling product by revenue
SELECT `Product Name`,
ROUND(SUM(Sales), 2) AS product_revenue
FROM cleaned_train
GROUP BY `Product Name`
ORDER BY product_revenue DESC
LIMIT 10;

-- Best-Selling Products by Order Frequency
SELECT `Product Name`,
COUNT(*) AS times_sold
FROM cleaned_train
GROUP BY `Product Name`
ORDER BY times_sold DESC
LIMIT 10;

-- Category-wise Revenue
SELECT Category,
ROUND(SUM(Sales), 2) AS category_revenue
FROM cleaned_train
GROUP BY Category
ORDER BY category_revenue DESC;

-- Sub-Category-wise Revenue
SELECT `Sub-Category`,
ROUND(SUM(Sales), 2) AS subcategory_revenue
FROM cleaned_train
GROUP BY `Sub-Category`
ORDER BY subcategory_revenue DESC;

-- Segment-wise Revenue
SELECT Segment,
ROUND(SUM(Sales), 2) AS segment_revenue
FROM cleaned_train
GROUP BY Segment
ORDER BY segment_revenue DESC;

-- Region-wise Revenue (Geographic Sales Distribution)
SELECT Region,
ROUND(SUM(Sales), 2) AS region_revenue
FROM cleaned_train
GROUP BY Region
ORDER BY region_revenue DESC;

-- State-wise Revenue
SELECT State,
ROUND(SUM(Sales), 2) AS state_revenue
FROM cleaned_train
GROUP BY State
ORDER BY state_revenue DESC
LIMIT 10;

-- City-wise Revenue
SELECT City,
ROUND(SUM(Sales), 2) AS city_revenue
FROM cleaned_train
GROUP BY City
ORDER BY city_revenue DESC
LIMIT 10;

-- Ship Mode performance
SELECT `Ship Mode`,
ROUND(SUM(Sales), 2) AS ship_mode_revenue,
COUNT(DISTINCT `Order ID`) AS total_orders
FROM cleaned_train
GROUP BY `Ship Mode`
ORDER BY ship_mode_revenue DESC;

-- Top 10 Customers by Revenue
SELECT `Customer Name`,
ROUND(SUM(Sales), 2) AS customer_revenue
FROM cleaned_train
GROUP BY `Customer Name`
ORDER BY customer_revenue DESC
LIMIT 10;
