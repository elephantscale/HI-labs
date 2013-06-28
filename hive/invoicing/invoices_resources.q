SELECT customer_id, SUM(cost) FROM resource_log
GROUP BY customer_id