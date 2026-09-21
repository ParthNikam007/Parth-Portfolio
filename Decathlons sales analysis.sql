-- NAME : PARTH SANJAY NIKAM
-- TOPIC : Decathlon-Style Product Catalog: End-to-End Data Cleaning & KPI Analysis
-- 	KPIS 
--	Find Revenue By Category
--	Analyse Best Selling Vs Slow Selling Products   
--	Identify Actual Profit After Discount
--	Measure Sales Trend Over Time
--       Analyse Demand By Cities

-- ---------------------------------------------
-- Q1. Find Revenue By Category
-- ---------------------------------------------

SELECT
	p.category,
	SUM(s.quantity_sold * s.unit_price_at_sale *(1 - s.discount_pct)) AS Total_revenue,
	SUM(s.quantity_sold) AS Total_quantity
FROM sales s
JOIN products p 
	on 
    s.product_id = p.product_id
GROUP BY 
	p.category
ORDER BY 
	Total_revenue DESC
LIMIT 5;    















-- ----------------------------------------------------------
-- Q2. Analyse Best Selling Vs Slow Selling Products 
-- ----------------------------------------------------------
SELECT
	p.product_name,
    SUM(quantity_sold) AS unit_sold,
    RANK() OVER( ORDER BY SUM(quantity_sold)DESC) AS sales_rank
FROM products p 
JOIN sales s 
	ON
    p.product_id = s.product_id
GROUP BY 
	p.product_name
ORDER BY sales_rank;





-- ----------------------------------------------
-- Q3. Sales Trend Over Time
-- ----------------------------------------------
SELECT 
	DATE_FORMAT( s.sale_date , '%Y_%m') AS Sales_month,
    SUM( s.quantity_sold * s.unit_price_at_sale * (1 - discount_pct)) AS Monthly_sales
FROM sales s
GROUP BY 
	sales_month
ORDER BY 
	sales_month;


-- ----------------------------------------------
-- Q4. Analyse Demand By Cities
-- ----------------------------------------------
SELECT
	customer_city,
	SUM(s.quantity_sold * s.unit_price_at_sale * ( 1 - s.discount_pct )) AS Total_revenue,
	COUNT(DISTINCT(s.sale_id)) AS Total_sales
FROM sales s 
GROUP BY
	customer_city 
ORDER BY 
	Total_revenue DESC;
