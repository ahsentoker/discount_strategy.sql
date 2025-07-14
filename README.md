# 📊 Discount Strategy Analyzer (SQL)

This project simulates a retail database with products, customers, orders, and discount strategies.  
It allows you to analyze how discount codes affect customer behavior and product sales.

---

## 📁 Tables

- `customers`: Customer profiles and signup dates  
- `products`: Items available for sale  
- `orders`: Customer orders  
- `order_items`: Products in each order, with quantity and discount  
- `discounts`: Discount codes with their percentages

---

## 📌 Sample Analyses

### 🧮 Total usage count per discount code:

💰 Most discounted product:
SELECT discount_code, COUNT(*) AS usage_count
FROM order_items
WHERE discount_code IS NOT NULL
GROUP BY discount_code;

SELECT p.name, COUNT(*) AS discounted_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE discount_code IS NOT NULL
GROUP BY p.name
ORDER BY discounted_sales DESC
LIMIT 1;

📅 Best-performing day by number of discounted items sold:
SELECT o.order_date, COUNT(*) AS total_discounted_items
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE discount_code IS NOT NULL
GROUP BY o.order_date
ORDER BY total_discounted_items DESC
LIMIT 1;

