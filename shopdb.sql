CREATE SCHEMA IF NOT EXISTS shopdb;
use shopdb;

CREATE TABLE IF NOT EXISTS products (
product_id INT AUTO_INCREMENT,
p_name VARCHAR(50) NOT NULL, 
p_price DEC(6,2) NOT NULL,
PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS users (
user_id INT AUTO_INCREMENT,
forename VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
postcode VARCHAR(12) NOT NULL,
PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS orders(
order_id INT AUTO_INCREMENT,
order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
fk_user_id INT NOT NULL, 
PRIMARY KEY(order_id),
FOREIGN KEY (fk_user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS orderline (
ol_id INT AUTO_INCREMENT,
fk_order_id INT NOT NULL, 
fk_product_id INT NOT NULL,
PRIMARY KEY (ol_id),
FOREIGN KEY (fk_order_id) REFERENCES orders(order_id),
FOREIGN KEY (fk_product_id) REFERENCES products(product_id)
);

CREATE TABLE IF NOT EXISTS reviews(
review_id INT AUTO_INCREMENT,
review_details VARCHAR(200), 
rating DEC(2,1) NOT NULL,
fk_user_id INT NOT NULL,
fk_product_id INT NOT NULL,
CHECK (rating < 10.1),
PRIMARY KEY (review_id),
FOREIGN KEY (fk_user_id) REFERENCES users(user_id),
FOREIGN KEY (fk_product_id) REFERENCES products(product_id)
);

INSERT INTO products (p_name, p_price) 
VALUES
("Notebook", 5.99),
("Pack of Pens", 2.99),
("Laptop", 550.99),
("Ipad", 149.99),
("Motorola Razr", 89.99);

INSERT INTO products (p_name, p_price)
VALUES("Dummy to delete", 23.99);

INSERT INTO users(forename, surname, postcode)
VALUES
("John"," Doe", "Q65 5TH"),
("Mary", "Jane", "S65 6KJ"),
("Molly", "Ringwald", "K93 7CH"),
("Derek", "Brown", "H58 8SK"),
("John", "Smith", "K29 8CH"),
("Jane", "Smith", "K98 7HB");

INSERT INTO orders(fk_user_id)
VALUES 
(1),(2),(3),(4),(5),(1),(2),(1);

INSERT INTO orderline (fk_order_id, fk_product_id)
VALUES (1,1), (1,2),(2,3), (2,1),(3,4), (3,2),(4,4), (4,5),(5,1), (5,3);


INSERT INTO reviews (review_details, rating, fk_user_id, fk_product_id)
VALUES 
("Loved it!", 9.5, 2, 4),
("Meh, it was okay", 6.7, 4, 1),
("Hated it but served a purpose", 3.4, 3, 2);

UPDATE users 
SET forename="Jane"
WHERE forename="John" AND surname = "Doe";

UPDATE products
SET p_price=750.99
WHERE p_name="Laptop";

SELECT * FROM users;

SELECT p_name, p_price FROM products;

SELECT pr.p_name, pr.p_price, ord.order_date, ord.fk_user_id
FROM orderline ol 
JOIN products pr
ON pr.product_id=ol.fk_product_id
JOIN orders ord
ON ord.order_id=ol.fk_order_id;

SELECT forename, surname, postcode, order_id, user_id
FROM users us
JOIN orders ord
ON us.user_id=ord.fk_user_id;

SELECT COUNT(user_id) AS total_users FROM users;

SELECT user_id, forename, COUNT(order_id) AS total_orders 
FROM users
JOIN orders 
ON users.user_id=orders.fk_user_id
GROUP BY user_id
ORDER BY total_orders desc;

SELECT pr.p_name, pr.p_price, ord.order_date, ord.fk_user_id
FROM orderline ol 
JOIN products pr
ON pr.product_id=ol.fk_product_id
JOIN orders ord
ON ord.order_id=ol.fk_order_id
WHERE p_price < 100
ORDER BY p_price desc;

SELECT user_id, forename, COUNT(order_id) AS total_orders 
FROM users
JOIN orders 
ON users.user_id=orders.fk_user_id
GROUP BY user_id
ORDER BY total_orders desc
LIMIT 3;

SELECT * FROM users
WHERE postcode LIKE "S%";

SELECT user_id, order_id, forename, surname, order_date, p_name, SUM(p_price) AS total_paid
FROM users us
JOIN orders ord
ON us.user_id=ord.fk_user_id
JOIN orderline ol
ON ord.order_id=ol.fk_order_id
JOIN products pr
ON ol.fk_product_id=pr.product_id
WHERE user_id=(SELECT user_id 
FROM users 
WHERE forename = "John"
LIMIT 1
)
GROUP BY user_id
ORDER BY total_paid desc;

DELETE  
FROM products 
WHERE p_name="Dummy to delete";

DELETE FROM users WHERE forename="Jane" AND surname="Smith";

DELETE FROM orders WHERE order_id=7;

