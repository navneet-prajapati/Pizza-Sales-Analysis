SELECT * FROM pizza_sales;

-- KPI
-- 1. Total Revenue

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


-- 2. Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales;


-- 3. Average Order Value

SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) AS Avg_order_value FROM pizza_sales;


-- 4. Total Pizza Sold

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;


-- 5. Average Pizzas Per Order

SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS Avg_pizza_per_order FROM pizza_sales;




SELECT * FROM pizza_sales;
-- Analysis
-- 1. Monthly Trend for Total Revenue

SELECT
	TO_CHAR(ORDER_DATE, 'Mon') AS MONTH,
	SUM(TOTAL_PRICE) AS TOTAL_REVENUE
FROM
	PIZZA_SALES
GROUP BY
	MONTH;


-- 2. Daily Trend for Total Orders

SELECT
	TO_CHAR(ORDER_DATE, 'Day') AS DAY,
	COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM
	PIZZA_SALES
GROUP BY
	DAY;


-- 3. Percentage of Sales by Pizza Category

SELECT pizza_category, SUM(total_price) AS Total_revenue,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) AS Total_revenue FROM pizza_sales),2) AS Sales_percentage
FROM pizza_sales
GROUP BY pizza_category;


-- 4. Percentage of Sales by Pizza Size.

SELECT pizza_size, SUM(total_price) AS Total_revenue,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) AS Total_revenue FROM pizza_sales),2) AS Sales_percentage
FROM pizza_sales
GROUP BY pizza_size;


-- 5. Total Pizzas Sold by Pizza Size and Category.

SELECT pizza_size, pizza_category, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_size, pizza_category
ORDER BY pizza_size, pizza_category;


-- 6. Revenue by Pizza Name.

SELECT pizza_name, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC
LIMIT 5;



-- Top & Bottom Analysis
-- 1. Top Pizza by Revenue.
SELECT pizza_name, SUM(total_price) AS Total_revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC
LIMIT 5;


-- 2. Bottom Pizza by Revenue.

SELECT pizza_name, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue ASC
LIMIT 5;


-- 3. Top Pizza by Orders.

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC
LIMIT 5;


-- 4. Bottom Pizza by Orders.

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC
LIMIT 5;


-- 5. Top Pizza by Quantity Sold.

SELECT pizza_name, SUM(quantity) AS Total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity_sold DESC
LIMIT 5;


-- 6. Bottom Pizza by Quantity Sold.

SELECT pizza_name, SUM(quantity) AS Total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity_sold ASC
LIMIT 5;

















