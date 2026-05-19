-- Current product-level low stock report used by analysts
SELECT
    s.seller_id,
    s.seller_name,
    p.product_id,
    p.product_name,
    SUM(im.quantity_change) AS current_stock,
    p.reorder_threshold
FROM sellers s
JOIN products p ON p.seller_id = s.seller_id
JOIN inventory_moves im ON im.product_id = p.product_id
WHERE im.move_type = 'IN'
GROUP BY s.seller_id, s.seller_name, p.product_id, p.product_name, p.reorder_threshold
HAVING SUM(im.quantity_change) <= p.reorder_threshold
ORDER BY current_stock ASC;

-- Current seller-level summary of low stock products
SELECT
    s.seller_id,
    s.seller_name,
    COUNT(*) AS low_stock_product_count
FROM sellers s
JOIN products p ON p.seller_id = s.seller_id
JOIN inventory_moves im ON im.product_id = p.product_id
WHERE im.move_type = 'IN'
GROUP BY s.seller_id, s.seller_name
HAVING COUNT(*) > 0
ORDER BY low_stock_product_count DESC;

-- Example EXPLAIN ANALYZE to inspect performance of the current product-level report
EXPLAIN ANALYZE
SELECT
    s.seller_id,
    s.seller_name,
    p.product_id,
    p.product_name,
    SUM(im.quantity_change) AS current_stock,
    p.reorder_threshold
FROM sellers s
JOIN products p ON p.seller_id = s.seller_id
JOIN inventory_moves im ON im.product_id = p.product_id
WHERE im.move_type = 'IN'
GROUP BY s.seller_id, s.seller_name, p.product_id, p.product_name, p.reorder_threshold
HAVING SUM(im.quantity_change) <= p.reorder_threshold
ORDER BY current_stock ASC;
