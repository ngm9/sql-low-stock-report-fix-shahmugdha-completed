CREATE TABLE sellers (
    seller_id SERIAL PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    seller_id INTEGER NOT NULL REFERENCES sellers(seller_id),
    product_name VARCHAR(150) NOT NULL,
    reorder_threshold INTEGER NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE inventory_moves (
    move_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id),
    quantity_change INTEGER NOT NULL,
    move_type VARCHAR(10) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

INSERT INTO sellers (seller_name, country) VALUES
('Alpha Gadgets', 'US'),
('Beta Supplies', 'IN'),
('Creative Books', 'UK'),
('Digital Learning Hub', 'US'),
('Everyday Essentials', 'DE');

INSERT INTO products (seller_id, product_name, reorder_threshold, active) VALUES
(1, 'USB-C Cable 1m', 20, TRUE),
(1, 'Wireless Mouse', 15, TRUE),
(1, 'Laptop Stand', 10, TRUE),
(2, 'Notebook Pack (5 pcs)', 30, TRUE),
(2, 'Ballpoint Pen Box', 50, TRUE),
(2, 'Stapler Medium', 8, TRUE),
(3, 'Agile Practices Handbook', 25, TRUE),
(3, 'SQL Basics Workbook', 15, TRUE),
(3, 'Data Modeling Guide', 10, TRUE),
(4, 'Online Course Voucher A', 40, TRUE),
(4, 'Online Course Voucher B', 35, TRUE),
(4, 'Cloud Certification Prep Book', 12, TRUE),
(5, 'Coffee Mug', 18, TRUE),
(5, 'Water Bottle', 22, TRUE),
(5, 'Desk Organizer', 16, TRUE),
(5, 'Wireless Charger', 14, TRUE);

INSERT INTO inventory_moves (product_id, quantity_change, move_type, created_at) VALUES
-- Alpha Gadgets (seller 1)
(1, 50, 'IN', '2024-01-01 09:00:00'),
(1, -10, 'OUT', '2024-01-05 10:15:00'),
(1, -15, 'OUT', '2024-01-10 14:30:00'),
(2, 40, 'IN', '2024-01-02 11:00:00'),
(2, -20, 'OUT', '2024-01-07 16:00:00'),
(2, -8, 'OUT', '2024-01-12 09:45:00'),
(3, 15, 'IN', '2024-01-03 08:30:00'),
(3, -4, 'OUT', '2024-01-08 13:20:00'),

-- Beta Supplies (seller 2)
(4, 60, 'IN', '2024-01-01 10:00:00'),
(4, -10, 'OUT', '2024-01-04 15:00:00'),
(4, -8, 'OUT', '2024-01-09 12:00:00'),
(5, 100, 'IN', '2024-01-02 10:30:00'),
(5, -20, 'OUT', '2024-01-06 11:10:00'),
(5, -15, 'OUT', '2024-01-11 17:25:00'),
(6, 20, 'IN', '2024-01-03 09:15:00'),
(6, -5, 'OUT', '2024-01-07 10:05:00'),
(6, -5, 'OUT', '2024-01-13 16:45:00'),

-- Creative Books (seller 3)
(7, 30, 'IN', '2024-01-02 09:00:00'),
(7, -5, 'OUT', '2024-01-06 10:00:00'),
(7, -10, 'OUT', '2024-01-14 15:30:00'),
(8, 20, 'IN', '2024-01-03 13:00:00'),
(8, -8, 'OUT', '2024-01-08 09:00:00'),
(8, -5, 'OUT', '2024-01-15 11:45:00'),
(9, 10, 'IN', '2024-01-04 14:00:00'),
(9, -2, 'OUT', '2024-01-09 16:00:00'),

-- Digital Learning Hub (seller 4)
(10, 50, 'IN', '2024-01-01 08:00:00'),
(10, -10, 'OUT', '2024-01-05 13:30:00'),
(10, -15, 'OUT', '2024-01-10 09:20:00'),
(11, 40, 'IN', '2024-01-02 15:00:00'),
(11, -5, 'OUT', '2024-01-06 12:10:00'),
(12, 12, 'IN', '2024-01-03 10:30:00'),
(12, -3, 'OUT', '2024-01-09 11:55:00'),

-- Everyday Essentials (seller 5)
(13, 30, 'IN', '2024-01-01 09:30:00'),
(13, -10, 'OUT', '2024-01-07 10:00:00'),
(13, -5, 'OUT', '2024-01-12 15:40:00'),
(14, 25, 'IN', '2024-01-02 16:20:00'),
(14, -4, 'OUT', '2024-01-08 14:35:00'),
(14, -5, 'OUT', '2024-01-13 09:50:00'),
(15, 18, 'IN', '2024-01-03 11:45:00'),
(15, -6, 'OUT', '2024-01-09 08:25:00'),
(16, 20, 'IN', '2024-01-04 12:10:00'),
(16, -5, 'OUT', '2024-01-10 10:15:00'),
(16, -7, 'OUT', '2024-01-16 16:05:00');
