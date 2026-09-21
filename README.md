# Decathlon-Style Product Catalog: End-to-End Data Cleaning & KPI Analysis

**Author:** Parth Sanjay Nikam

## Overview
This project analyzes a Decathlon-style product sales dataset using SQL, covering data cleaning and key business KPIs across sales, products, and cities.

## KPIs Covered
- Revenue by category
- Best-selling vs. slow-selling products
- Actual profit after discount
- Sales trend over time
- Demand by city

## Sample Query: Revenue by Category

```sql
SELECT
    p.category,
    SUM(s.quantity_sold * s.unit_price_at_sale * (1 - s.discount_pct)) AS Total_revenue,
    SUM(s.quantity_sold) AS Total_quantity
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY
    p.category
ORDER BY
    Total_revenue DESC
LIMIT 5;
```

**Result (top categories by revenue):**

| category            | Total_revenue | Total_quantity |
|----------------------|---------------|-----------------|
| Hiking & Trekking     | 89,064.25     | 41              |
| Camping & Bivouac     | 75,039.05     | 11              |

## Tools Used
- SQL (practiced via DB Fiddle)

## Notes
This README covers the queries visible in the project file. Additional KPI queries (best/slow sellers, profit after discount, sales trend, demand by city) can be added here as they're finalized.
