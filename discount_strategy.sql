-- Tablo: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name TEXT,
    signup_date DATE
);

-- Tablo: products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name TEXT,
    price DECIMAL(10,2)
);

-- Tablo: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);

-- Tablo: discounts
CREATE TABLE discounts (
    discount_code TEXT PRIMARY KEY,
    description TEXT,
    discount_percent DECIMAL(5,2)
);

-- Tablo: order_items
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    discount_code TEXT REFERENCES discounts(discount_code)
);

-- Örnek Veriler

-- customers
INSERT INTO customers VALUES
(1, 'Ahmet Yılmaz', '2024-12-01'),
(2, 'Ayşe Demir', '2025-01-15'),
(3, 'Mehmet Kara', '2025-03-22');

-- products
INSERT INTO products VALUES
(1, 'Bluetooth Kulaklık', 550.00),
(2, 'Laptop Standı', 320.00),
(3, 'Kablosuz Mouse', 180.00);

-- discounts
INSERT INTO discounts VALUES
('NEWYEAR10', 'Yılbaşı İndirimi', 10.00),
('SPRING15', 'Bahar Kampanyası', 15.00),
('WELCOME5', 'Hoşgeldin İndirimi', 5.00);

-- orders
INSERT INTO orders VALUES
(1, 1, '2025-04-01'),
(2, 2, '2025-04-03'),
(3, 1, '2025-04-05'),
(4, 3, '2025-04-06');

-- order_items
INSERT INTO order_items VALUES
(1, 1, 1, 1, 'NEWYEAR10'),
(2, 1, 2, 2, 'SPRING15'),
(3, 2, 2, 1, NULL),
(4, 3, 3, 3, 'WELCOME5'),
(5, 4, 1, 1, 'SPRING15');
