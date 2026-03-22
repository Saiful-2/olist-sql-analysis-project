## Section A: Basic exploration
USE olist_project;

SELECT 'Total customers' AS metric, COUNT(*) AS value FROM customers
UNION ALL
SELECT 'Unique customers', COUNT(DISTINCT customer_unique_id) FROM customers
UNION ALL
SELECT 'Total orders', COUNT(*) FROM orders;

USE olist_project;

SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

USE olist_project;

SELECT payment_type, COUNT(*) AS total_payments
FROM payments
GROUP BY payment_type
ORDER BY total_payments DESC;
----------------------------------------------------------------------
----------------------------------------------------------------------
## Section B: Sales analysis
# Q6. Total sales revenue
SELECT ROUND(SUM(payment_value), 2) AS total_revenue
FROM payments;
# Q7. Average payment value
SELECT ROUND(AVG(payment_value), 2) AS avg_payment_value
FROM payments;
# Q8. Average order value
SELECT ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT order_id, SUM(payment_value) AS order_total
    FROM payments
    GROUP BY order_id
) t;
# Q9. Monthly revenue trend
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.payment_value), 2) AS monthly_revenue
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY month;
# Q10. Monthly order count
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_purchase_timestamp, '%Y-%m')
ORDER BY month;
-----------------------------------------------------------------------
-----------------------------------------------------------------------
## Section C: Product analysis
# Q11. Top 10 products by number of items sold
SELECT 
    oi.product_id,
    COUNT(*) AS times_sold
FROM order_items oi
GROUP BY oi.product_id
ORDER BY times_sold DESC
LIMIT 10;
# Q12. Top 10 product categories by number of items sold
SELECT 
    pr.product_category_name,
    COUNT(*) AS items_sold
FROM order_items oi
JOIN products pr
    ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY items_sold DESC
LIMIT 10;
# Q13. Top 10 product categories by revenue
SELECT 
    pr.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
JOIN products pr
    ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;
# Q14. Average product price by category
SELECT 
    pr.product_category_name,
    ROUND(AVG(oi.price), 2) AS avg_price
FROM order_items oi
JOIN products pr
    ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY avg_price DESC;
-------------------------------------------------------------------
-------------------------------------------------------------------
## Section D: Customer analysis
# Q15. Top 10 customers by number of orders
SELECT 
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 10;
# Q16. Top 10 customers by total spending
SELECT 
    c.customer_unique_id,
    ROUND(SUM(p.payment_value), 2) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;
# Q17. Customers with more than 3 orders
SELECT 
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 3
ORDER BY total_orders DESC;
# Q18. Top states by number of customers
SELECT 
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
## Section E: Payment analysis
# Q19. Average installment count by payment type
SELECT 
    payment_type,
    ROUND(AVG(payment_installments), 2) AS avg_installments
FROM payments
GROUP BY payment_type
ORDER BY avg_installments DESC;
# Q20. Total revenue by payment type
SELECT 
    payment_type,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM payments
GROUP BY payment_type
ORDER BY total_revenue DESC;


