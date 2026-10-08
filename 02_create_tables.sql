USE ecommerce_dw;

DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    segment VARCHAR(30)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT
);

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sales_amount DECIMAL(12,2) NOT NULL,

    CONSTRAINT fk_sales_date
        FOREIGN KEY (date_id) REFERENCES dim_date(date_id),

    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),

    CONSTRAINT fk_sales_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
