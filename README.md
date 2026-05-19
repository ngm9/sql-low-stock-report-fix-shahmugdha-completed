# Task Overview
The analytics team at a skills marketplace uses a PostgreSQL database to monitor product inventory for multiple sellers. A key report highlights products that are at or below their reorder threshold so that operations can proactively request restocking. The database is already deployed and fully populated through Docker in a single step, but the existing low-stock reporting queries are intentionally written in a naive way and exhibit both correctness and basic performance issues that you must resolve using SQL only.

## Database Access
- Host: `<DROPLET_IP>`
- Port: `5432`
- Database name: `marketplace`
- Username: `utkrusht`
- Password: `utkrusht`

You can connect using any PostgreSQL client you prefer, such as psql, pgAdmin, DBeaver, DataGrip, or any other SQL client that supports PostgreSQL. Once the Docker environment is running, the database is already initialized with schema and data; you only need to connect and run SQL queries and DDL statements against it.

### Objectives
- Inspect the existing low-stock report queries in sample_queries.sql and understand how current stock and low-stock conditions are being calculated.
- Write a new product-level low-stock report query that:.
- Computes current stock per product from the inventory_moves table.
- Compares current stock against each product's reorder_threshold.
- Returns seller name, product name, current_stock, reorder_threshold, and the timestamp of the latest inventory move for that product.
- Lists only products that are at or below their reorder threshold.
- Orders products by current_stock ascending (lowest stock first).
- Write a seller-level summary query that returns one row per seller.

### How to Verify
- Run the existing queries from sample_queries.sql to observe the current behavior:.
- Check the product-level low-stock report results for obvious inconsistencies.
- Note any sellers that you know exist in the database but do not appear in the current seller-level summaries.
- After writing your corrected product-level low-stock report query:.
- Verify that each row includes seller_name, product_name, current_stock, reorder_threshold, and the latest inventory move timestamp for that product.

### Helpful Tips
- Consider which columns are used to relate tables in joins and how this affects performance if they are not indexed.
- Consider how current stock should be computed from a series of positive and negative inventory movements, and whether filtering some movement types out of the aggregation might distort the result.
- Think about the difference between INNER JOIN and LEFT JOIN when you want to keep sellers or products that may have no matching inventory records or no low-stock items.
- Review how to use GROUP BY and HAVING to filter on aggregated values.
- Explore the use of a subquery or derived table to compute current stock per product or the latest inventory move timestamp, and then join that back into your main report.
