USE ecommerce_dw;

-- 1. Overall sales
SELECT
    SUM(quantity) AS total_quantity,
    SUM(sales_amount) AS total_sales
FROM fact_sales;

-- 2. Category-wise sales
SELECT
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- 3. Product ranking
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(f.sales_amount) DESC
    ) AS sales_rank
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

-- 4. Category-wise product ranking
SELECT
    p.category,
    p.product_name,
    SUM(f.sales_amount) AS total_sales,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(f.sales_amount) DESC
    ) AS category_rank
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category, p.product_id, p.product_name;

-- 5. Top 3 products
WITH ranked_products AS (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_sales,
        RANK() OVER (
            ORDER BY SUM(f.sales_amount) DESC
        ) AS ranking
    FROM fact_sales f
    JOIN dim_product p ON f.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT *
FROM ranked_products
WHERE ranking <= 3;

-- 6. Monthly sales
WITH monthly_sales AS (
    SELECT
        d.year,
        d.month,
        d.month_name,
        SUM(f.sales_amount) AS total_sales
    FROM fact_sales f
    JOIN dim_date d ON f.date_id = d.date_id
    GROUP BY d.year, d.month, d.month_name
)
SELECT *
FROM monthly_sales
ORDER BY year, month;

-- 7. Month-over-Month growth
WITH monthly_sales AS (
    SELECT
        d.year,
        d.month,
        d.month_name,
        SUM(f.sales_amount) AS total_sales
    FROM fact_sales f
    JOIN dim_date d ON f.date_id = d.date_id
    GROUP BY d.year, d.month, d.month_name
),
sales_with_previous AS (
    SELECT
        *,
        LAG(total_sales) OVER (
            ORDER BY year, month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    year,
    month_name,
    total_sales,
    previous_month_sales,
    ROUND(
        ((total_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0)) * 100,
        2
    ) AS mom_growth_percentage
FROM sales_with_previous
ORDER BY year, month;

-- 8. ROLLUP report
SELECT
    COALESCE(p.category, 'GRAND TOTAL') AS category,
    COALESCE(p.product_name, 'SUB TOTAL') AS product,
    SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category, p.product_name WITH ROLLUP;

-- 9. Customer sales report
SELECT
    c.customer_name,
    c.city,
    c.segment,
    SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.city, c.segment
ORDER BY total_sales DESC;

-- 10. Final business report
WITH monthly_sales AS (
    SELECT
        d.year,
        d.month,
        d.month_name,
        SUM(f.sales_amount) AS total_sales
    FROM fact_sales f
    JOIN dim_date d ON f.date_id = d.date_id
    GROUP BY d.year, d.month, d.month_name
),
monthly_growth AS (
    SELECT
        *,
        LAG(total_sales) OVER (
            ORDER BY year, month
        ) AS previous_sales
    FROM monthly_sales
)
SELECT
    year,
    month_name,
    total_sales,
    previous_sales,
    ROUND(
        ((total_sales - previous_sales)
        / NULLIF(previous_sales, 0)) * 100,
        2
    ) AS mom_growth
FROM monthly_growth
ORDER BY year, month;
