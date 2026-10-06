-- NAME: PARTH SANJAY NIKAM
-- TOPIC: Decathlon-Style Product Catalog: End-to-End Data Cleaning & KPI Analysis
--
-- KPIs
-- 1. Find Revenue By Category
-- 2. Analyse Best Selling Vs Slow Selling Products
-- 3. Measure Sales Trend Over Time
-- 4. Analyse Demand By Cities


-- ------------------------------------------------------------
-- Q1. Find Revenue By Category
-- ------------------------------------------------------------

SELECT
    p.category,
    SUM(s.quantity_sold * s.unit_price_at_sale * (1 - s.discount_pct)) AS Total_revenue,
    SUM(s.quantity_sold) AS Total_quantity
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY Total_revenue DESC
LIMIT 5;

-- Query Results:
-- category | Total_revenue | Total_quantity
-- Hiking & Trekking | 89064.25 | 41
-- Camping & Bivouac | 75039.05 | 11


-- ------------------------------------------------------------
-- Q2. Analyse Best Selling Vs Slow Selling Products
-- ------------------------------------------------------------

SELECT
    p.product_name,
    SUM(quantity_sold) AS unit_sold,
    RANK() OVER (ORDER BY SUM(quantity_sold) DESC) AS sales_rank
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY sales_rank;

-- Query Results:
-- product_name | unit_sold | sales_rank
-- CampLight LED Lantern | 7 | 1
-- ThermoFlask 1L | 7 | 1
-- Trailblazer 40L Backpack | 5 | 3
-- AquaFlow 2L Hydration Pack | 5 | 3
-- GripTrek Trekking Poles (Pair) | 4 | 5
-- RainArmor Waterproof Jacket | 4 | 5
-- Summit Pro 65L Backpack | 3 | 7
-- StormShield 2-Person Tent | 3 | 7
-- StormShield 4-Person Tent | 3 | 7
-- FrostGuard Sleeping Bag -5C | 3 | 7
-- TrailRunner Hiking Boots | 2 | 11
-- BaseCamp Folding Chair | 2 | 11
-- TrailMap GPS Handheld | 2 | 11
-- SolarCharge Power Bank 20000 | 2 | 11


-- ------------------------------------------------------------
-- Q3. Sales Trend Over Time
-- ------------------------------------------------------------

SELECT
    DATE_FORMAT(s.sale_date, '%Y_%m') AS Sales_month,
    SUM(s.quantity_sold * s.unit_price_at_sale * (1 - discount_pct)) AS Monthly_sales
FROM sales s
GROUP BY sales_month
ORDER BY sales_month;

-- Query Results:
-- Sales_month | Monthly_sales
-- 2023_02 | 48563.2
-- 2023_03 | 55408.05
-- 2023_04 | 58133.05
-- 2023_09 | 1999.0


-- ------------------------------------------------------------
-- Q4. Analyse Demand By Cities
-- ------------------------------------------------------------

SELECT
    customer_city,
    SUM(s.quantity_sold * s.unit_price_at_sale * (1 - s.discount_pct)) AS Total_revenue,
    COUNT(DISTINCT(s.sale_id)) AS Total_sales
FROM sales s
GROUP BY customer_city
ORDER BY Total_revenue DESC;

-- Query Results:
-- customer_city | Total_revenue | Total_sales
-- Delhi | 33996.0 | 4
-- Amritsar | 20998.0 | 2
-- Mumbai | 20891.1 | 4
-- Kochi | 11999.0 | 1
-- Kolkata | 10996.0 | 2
-- Bengaluru | 9298.0 | 2
-- Lucknow | 8998.0 | 2
-- Pune | 8297.0 | 2
-- Trivandrum | 7223.05 | 2
-- Chandigarh | 6578.1 | 2
-- Goa | 5094.0 | 2
-- Hyderabad | 4448.05 | 2
-- Indore | 3198.0 | 2
-- Jaipur | 3197.0 | 2
-- Chennai | 2799.0 | 1
-- Coimbatore | 2398.0 | 1
-- Ludhiana | 2097.0 | 1
-- Nagpur | 1598.0 | 1
