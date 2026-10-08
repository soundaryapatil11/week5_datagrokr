USE ecommerce_dw;

-- Quick verification queries

SELECT 'Customers' AS table_name, COUNT(*) AS row_count
FROM dim_customer
UNION ALL
SELECT 'Products', COUNT(*)
FROM dim_product
UNION ALL
SELECT 'Dates', COUNT(*)
FROM dim_date
UNION ALL
SELECT 'Sales', COUNT(*)
FROM fact_sales;

SELECT
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    SUM(sales_amount) AS revenue,
    ROUND(AVG(sales_amount), 2) AS avg_transaction_value
FROM fact_sales;
