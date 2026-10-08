USE ecommerce_dw;

CREATE INDEX idx_sales_product
ON fact_sales(product_id);

CREATE INDEX idx_sales_date
ON fact_sales(date_id);

CREATE INDEX idx_sales_customer
ON fact_sales(customer_id);
