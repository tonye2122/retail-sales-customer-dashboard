-- Retail Sales & Customer Performance Analysis
-- PostgreSQL

-- 1. Dataset Overview
SELECT COUNT(*) AS total_rows
FROM retail_sales_cleaned;


-- 2. Core KPIs
SELECT
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    SUM("Quantity") AS total_quantity
FROM retail_sales_cleaned;


-- 3. Total Orders and Average Order Value
SELECT
    COUNT(DISTINCT "Order ID") AS total_orders,
    ROUND(
        SUM("Sales") / COUNT(DISTINCT "Order ID"),
        2
    ) AS average_order_value
FROM retail_sales_cleaned;


-- 4. Sales and Profit by Category
SELECT
    "Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM retail_sales_cleaned
GROUP BY "Category"
ORDER BY total_sales DESC;


-- 5. Sales and Profit by Region
SELECT
    "Region",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM retail_sales_cleaned
GROUP BY "Region"
ORDER BY total_sales DESC;


-- 6. Customer Segment Performance
SELECT
    "Segment",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_cleaned
GROUP BY "Segment"
ORDER BY total_sales DESC;


-- 7. Sub-Category Performance
SELECT
    "Sub-Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM retail_sales_cleaned
GROUP BY "Sub-Category"
ORDER BY total_sales DESC;


-- 8. Discount Analysis
SELECT
    "Sub-Category",
    ROUND(AVG("Discount"), 3) AS avg_discount,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM retail_sales_cleaned
GROUP BY "Sub-Category"
ORDER BY avg_discount DESC;


-- 9. Yearly Performance
SELECT
    EXTRACT(YEAR FROM "Order Date"[1]) AS year,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit,
    COUNT(DISTINCT "Order ID") AS total_orders
FROM retail_sales_cleaned
GROUP BY EXTRACT(YEAR FROM "Order Date"[1])
ORDER BY year;


-- 10. Year-over-Year Sales Growth
WITH yearly_sales AS (
    SELECT
        EXTRACT(YEAR FROM "Order Date"[1]) AS year,
        SUM("Sales") AS total_sales
    FROM retail_sales_cleaned
    GROUP BY EXTRACT(YEAR FROM "Order Date"[1])
)
SELECT
    year,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        ((total_sales - LAG(total_sales) OVER (ORDER BY year))
        / LAG(total_sales) OVER (ORDER BY year)) * 100,
        2
    ) AS yoy_growth_percent
FROM yearly_sales
ORDER BY year;
