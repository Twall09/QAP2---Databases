-- Retrieve the names and stock quantities of all products.

SELECT product_name, stock_quantity 
FROM products;

-- Retrieve the product names and quantities for one of the orders placed.

SELECT p.product_name, oi.quantity 
FROM order_items oi
JOIN products p ON oi.product_id = p.id
WHERE oi.order_id = 4;

-- Retrieve all orders placed by a specific customer 
-- (including the ID’s of what was ordered and the quantities).

SELECT o.id AS order_id, oi.product_id, oi.quantity 
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
WHERE o.customer_id = 4;

-- UPDATE DATA:

-- I am simulating the reduction from product_id 1 (Apple Airpods). 
-- I redcued the quantity by 2 and set it as seen below.
UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE id = 1; 

-- DELETE DATA:

-- removed the order of a hockey stick and football.
DELETE FROM order_items
WHERE order_id = 2;

-- after that, you have to delete the order altogether from the system
DELETE FROM orders
WHERE id = 2;

