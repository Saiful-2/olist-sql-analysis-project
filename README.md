# Olist E-Commerce SQL Analysis

## Project Overview

This project analyzes the Olist e-commerce dataset using SQL to uncover business insights related to customers, orders, products, revenue, and payment behavior. The analysis focuses on answering practical business questions through SQL queries and interpreting the results in a portfolio-ready format.

## Objective

The main objective of this project is to use SQL for:

* exploring e-commerce transaction data
* analyzing customer and order behavior
* measuring sales performance
* identifying top-performing products and categories
* understanding payment patterns
* generating business insights from raw relational data

## Dataset

This project uses the following five datasets:

* `olist_customers_dataset.csv`
* `olist_orders_dataset.csv`
* `olist_order_items_dataset.csv`
* `olist_products_dataset.csv`
* `olist_order_payments_dataset.csv`

## Database Schema

The project is built using five related tables:

* `customers`
* `orders`
* `order_items`
* `products`
* `payments`

### Table Relationships

* `customers.customer_id = orders.customer_id`
* `orders.order_id = order_items.order_id`
* `orders.order_id = payments.order_id`
* `order_items.product_id = products.product_id`

These relationships make it possible to connect customer information with order activity, purchased products, and payment details.

## SQL Skills Used

* `SELECT`
* `COUNT()`
* `DISTINCT`
* `GROUP BY`
* `ORDER BY`
* `JOIN`
* `SUM()`
* `AVG()`
* `ROUND()`
* `HAVING`
* subqueries
* `DATE_FORMAT()`

## Business Questions Answered

### Section A: Basic Exploration

1. Total number of customers
2. Total number of unique customers
3. Total number of orders
4. Order status distribution
5. Payment type distribution

### Section B: Sales Analysis

6. Total sales revenue
7. Average payment value
8. Average order value
9. Monthly revenue trend
10. Monthly order count

### Section C: Product Analysis

11. Top 10 products by number of items sold
12. Top 10 product categories by number of items sold
13. Top 10 product categories by revenue
14. Average product price by category

### Section D: Customer Analysis

15. Top 10 customers by number of orders
16. Top 10 customers by total spending
17. Customers with more than 3 orders
18. Top states by number of customers

### Section E: Payment Analysis

19. Average installment count by payment type
20. Total revenue by payment type

## Key Insights

### Section A: Basic Exploration

**Q1. Total number of customers**
The dataset contains **99,441 customer records**, showing a large transaction-level customer base for analysis.

**Q2. Total number of unique customers**
Out of all customer records, **96,096 are unique customers**, which indicates that some customers placed more than one order.

**Q3. Total number of orders**
There are **99,441 total orders** in the dataset, confirming a substantial volume of e-commerce transactions.

**Q4. Order status distribution**
The vast majority of orders were **delivered (96,478)**, indicating a very high completion rate. Only a relatively small number of orders were canceled, unavailable, shipped, invoiced, or processing. Overall, the order pipeline appears strongly completion-focused, with successful deliveries dominating the dataset.

**Q5. Payment type distribution**
**Credit card** is the dominant payment method with **76,795 payments**, followed by **boleto (19,784)**. Voucher and debit card were used much less frequently, while undefined payment records were almost negligible. This shows a strong customer preference for card-based payments, especially credit cards.

### Section B: Sales Analysis

**Q6. Total sales revenue**
The platform generated a total sales revenue of **16,008,872.12**, indicating a strong overall transaction volume and a marketplace operating at considerable business scale.

**Q7. Average payment value**
The average payment value is **154.10**, suggesting that most transactions are moderate in size rather than dominated by a small number of very expensive purchases.

**Q8. Average order value**
The average order value is **160.99**, meaning each order generated about **161** in revenue on average. Since this is slightly higher than the average payment value, it suggests that some orders may be split across multiple payments.

**Q9. Monthly revenue trend**
Monthly revenue shows a strong upward trend over time. Sales started at a very low level in the earlier months, then increased steadily throughout 2017 and into 2018. The highest revenue appears in the later period, suggesting business growth, rising customer demand, and stronger marketplace performance over time.

**Q10. Monthly order count**
Monthly order volume also increased significantly over time, peaking in **November 2017**. Order activity remained strong across most of 2018. The sharp drop in the final months of 2018 is likely due to incomplete data rather than an actual decline in business performance.

### Section C: Product Analysis

**Q11. Top 10 products by number of items sold**
A small group of products accounts for a disproportionately high number of item sales. The top-selling product was sold **527 times**, while several others were sold more than **300 times**. This indicates that customer demand is concentrated in a relatively limited set of highly popular products.

**Q12. Top 10 product categories by number of items sold**
Sales volume is concentrated in practical, lifestyle-oriented categories. **Bed, Bath & Table** recorded the highest number of items sold, followed by **Beauty & Health** and **Sports & Leisure**. This suggests that everyday household, personal care, and lifestyle goods were the strongest demand drivers in the marketplace.

**Q13. Top 10 product categories by revenue**
Revenue is led by **Beauty & Health**, followed by **Watches & Gifts** and **Bed, Bath & Table**. This shows that the categories generating the most revenue are not always the same as those with the highest number of items sold, indicating that some categories benefit from higher average selling prices.

**Q14. Average product price by category**
Average price varies widely across categories. Premium-priced categories such as **PCs**, **portable appliances**, and certain industrial or specialized products have much higher average prices, while categories like **flowers**, **food**, and **hygiene-related items** are much cheaper. This highlights the wide pricing diversity within the marketplace.

### Section D: Customer Analysis

**Q15. Top 10 customers by number of orders**
Customer ordering behavior is highly uneven. The top customer placed **17 orders**, while the next highest placed **9 orders**. This indicates that repeat customers exist, but very high-frequency buyers are relatively rare.

**Q16. Top 10 customers by total spending**
A small group of customers contributes significantly more revenue than the average buyer. The top-spending customer spent **13,664.08**, showing that a limited number of high-value customers play an important role in total marketplace revenue.

**Q17. Customers with more than 3 orders**
Only a relatively small group of customers placed more than three orders. Most repeat customers in this segment placed between **4 and 6 orders**, while a few placed much more. This suggests that repeat purchasing exists, but is concentrated within a modest loyal-customer segment.

**Q18. Top states by number of customers**
Customer distribution is heavily concentrated in a few Brazilian states. **São Paulo (SP)** leads by a very large margin, followed by **Rio de Janeiro (RJ)** and **Minas Gerais (MG)**. This shows that Olist’s customer base is strongest in Brazil’s largest and most economically active regions.

### Section E: Payment Analysis

**Q19. Average installment count by payment type**
Installment usage is strongly associated with **credit card** payments. Credit cards have an average of **3.51 installments**, while boleto, voucher, debit card, and undefined payment types all remain at **1 installment**. This indicates that installment-based purchasing is almost entirely driven by credit card usage.

**Q20. Total revenue by payment type**
**Credit card** generates by far the largest share of total revenue, greatly exceeding all other payment methods. **Boleto** ranks second, while voucher and debit card contribute only a small portion. This shows that the business relies heavily on credit card transactions for revenue generation.

## Overall Business Insights

* The marketplace shows a **high order completion rate**, with delivered orders overwhelmingly dominating the dataset.
* The business experienced **clear growth over time**, with both revenue and order volume rising strongly across 2017 and remaining high through much of 2018.
* Customer demand is concentrated in **practical consumer categories**, especially household, health, and lifestyle-related products.
* Revenue performance differs from sales volume in some categories, showing that **higher-priced products can drive strong revenue even without leading in units sold**.
* A small number of customers generate a disproportionately high share of orders and spending, indicating the importance of **customer retention and loyalty strategies**.
* The customer base is geographically concentrated in major Brazilian states, especially **São Paulo**, highlighting both market strength and regional dependence.
* **Credit card** is the dominant payment method in frequency, installment usage, and total revenue, making it the most important payment channel in the marketplace.

## Conclusion

This SQL project demonstrates how relational data can be transformed into practical business insights through structured querying and analysis. The Olist marketplace shows strong delivery performance, growing sales trends, concentrated demand in key product categories, and heavy dependence on credit card payments. Overall, the project highlights how SQL can be used not only for data extraction, but also for meaningful business analysis that supports portfolio development and real-world decision-making.

## Tools Used

* MySQL Workbench
* MySQL Server
* CSV datasets
* GitHub

## Project Structure

```
olist-sql-analysis-project/
│
├── data/
│   ├── olist_customers_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_products_dataset.csv
│   └── olist_order_payments_dataset.csv
│
├── sql/
│   ├── create_tables.sql
│   ├── import_notes.sql
│   └── analysis_queries.sql
│
├── images/
│   └── schema.png
│
└── README.md
```