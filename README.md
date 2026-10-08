# SQL Dimensional Report — Week 5

## Project
E-Commerce Sales Analytics using SQL Dimensional Modeling.

## Topics Covered
- Star Schema
- Fact and Dimension tables
- Window Functions and Rankings
- CTE (Common Table Expression)
- Month-over-Month (MoM) analysis
- ROLLUP
- EXPLAIN query optimization
- Indexing
- Business reports

## Requirements
- MySQL 8.0+
- MySQL Workbench or any MySQL client

## How to Run
1. Open MySQL Workbench.
2. Run `01_create_database.sql`.
3. Run `02_create_tables.sql`.
4. Run `03_insert_data.sql`.
5. Run `04_indexes.sql`.
6. Run `05_reports.sql`.
7. Run `06_explain_optimization.sql`.

## Star Schema
`fact_sales` is the central fact table connected to:
- `dim_customer`
- `dim_product`
- `dim_date`

## Main Reports
- Total sales
- Category-wise sales
- Product ranking
- Category-wise ranking
- Top 3 products
- Monthly sales
- Month-over-Month growth
- ROLLUP subtotal/grand total
- Customer sales
- EXPLAIN-based optimization

## Author
soundarya
