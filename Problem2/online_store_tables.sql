--  CREATE THE TABLES

-- products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- customers tables
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(75) NOT NULL
);

-- orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    customer_id INT REFERENCES customers(id) NOT NULL,
    order_date DATE NOT NULL
);

-- order items table
CREATE TABLE order_items (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id)
);


-- INSERT DATA

-- 5 products

INSERT INTO products (product_name, price, stock_quantity)
VALUES
    ('Apple Airpods', 299.99, 30),
    ('Hockey Stick', 199.99, 20),
    ('Water Bottle', 29.99, 50),
    ('Desk Lamp', 49.99, 15),
    ('Football', 19.99, 100);

-- 4 customers

INSERT INTO customers (first_name, last_name, email)
VALUES
    ('Mark', 'Wall', 'M.Wall@example.com'),
    ('Joe', 'Johnson', 'joe.johnson@example.com'),
    ('Al', 'Kittle', 'al.kittle85@example.com'),
    ('Johnny', 'Gaudreau', 'johnny.hockey@example.com');

-- 5 orders

INSERT INTO orders (customer_id, order_date)
VALUES
    (1, '2024-10-10'),
    (2, '2024-11-22'),
    (3, '2024-12-20'),
    (4, '2024-10-12'),
    (1, '2024-10-10');

-- Each order should have at least 2 items ordered.

INSERT INTO order_items (order_id, product_id, quantity) VALUES

    (1, 1, 1),  -- Apple Airpods   
    (1, 3, 2),  -- Water Bottle

    (2, 2, 1),  -- Hockey Stick
    (2, 5, 1),  -- Football

    (3, 5, 1),  -- Football
    (3, 1, 1),  -- Apple Airpods

    (4, 3, 1),  -- Water Bottle
    (4, 2, 2),  -- Hockey Stick

    (5, 4, 1);  -- Desk Lamp
    (5, 3, 1);  -- Water Bottle