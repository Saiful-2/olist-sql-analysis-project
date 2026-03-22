USE olist_project;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM payments;

# ## Import customers table
USE olist_project;
TRUNCATE TABLE customers;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
USE olist_project;
TRUNCATE TABLE customers;

LOAD DATA LOCAL INFILE 'D:/DSML/sql project/olist-sql-analysis-project/data/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state);

TRUNCATE TABLE orders;
--------------------------------------------------------------------------------------
# ## Import orders table

USE olist_project;

DROP TABLE orders;

CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp TEXT,
    order_approved_at TEXT,
    order_delivered_carrier_date TEXT,
    order_delivered_customer_date TEXT,
    order_estimated_delivery_date TEXT
);

LOAD DATA LOCAL INFILE 'D:/DSML/sql project/olist-sql-analysis-project/data/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date);

SELECT COUNT(*) FROM orders;
SELECT * FROM orders LIMIT 5;
--------------------------------------------------------------------------------------
# ## Import order_items table

USE olist_project;

TRUNCATE TABLE order_items;

LOAD DATA LOCAL INFILE 'D:/DSML/sql project/olist-sql-analysis-project/data/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value);

SELECT COUNT(*) FROM order_items;
SELECT * FROM order_items LIMIT 5;
-----------------------------------------------------------------------------------
## ## Import products table
USE olist_project;

TRUNCATE TABLE products;

LOAD DATA LOCAL INFILE 'D:/DSML/sql project/olist-sql-analysis-project/data/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm);

SELECT COUNT(*) FROM products;
SELECT * FROM products LIMIT 5;
-----------------------------------------------------------------------------------
## Import payments table
USE olist_project;

TRUNCATE TABLE payments;

LOAD DATA LOCAL INFILE 'D:/DSML/sql project/olist-sql-analysis-project/data/olist_order_payments_dataset.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, payment_sequential, payment_type, payment_installments, payment_value);
----------------------------------------------------------------------------------------
# All check
SELECT COUNT(*) FROM payments;
SELECT * FROM payments LIMIT 5;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;


