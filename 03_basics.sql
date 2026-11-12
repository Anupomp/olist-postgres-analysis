-- Query 1: Revenue by month
SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
       COUNT(DISTINCT o.order_id) AS orders,
       ROUND(SUM(oi.price), 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;
-- Query 2: Orders by customer state
SELECT c.customer_state, COUNT(*) AS orders
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY orders DESC;

-- Query 3: Top 10 product categories by revenue
SELECT COALESCE(t.product_category_name_english, p.product_category_name) AS category,
       COUNT(*) AS items_sold,
       ROUND(SUM(oi.price), 2) AS revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
LEFT JOIN product_category_translation t
       ON t.product_category_name = p.product_category_name
GROUP BY 1
ORDER BY revenue DESC
LIMIT 10;