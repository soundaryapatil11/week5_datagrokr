USE ecommerce_dw;

-- Check query execution plan before/after indexing.
EXPLAIN
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name;

-- Verify indexes
SHOW INDEX FROM fact_sales;

-- Example optimized lookup
EXPLAIN
SELECT
    f.sales_id,
    f.sales_amount,
    f.product_id
FROM fact_sales f
WHERE f.product_id = 101;

-- Verify date filtering
EXPLAIN
SELECT
    f.sales_id,
    f.sales_amount,
    f.date_id
FROM fact_sales f
WHERE f.date_id BETWEEN 4 AND 9;
