CREATE DATABASE IF NOT EXISTS extrashopdb;
USE extrashopdb;

/* Make sure to create the tables in order first before inserting any data */
/* and make sure data is inserted into parent tables before inserting into child tables (tables with no primary key) eg; orderline */


CREATE TABLE IF NOT EXISTS sales_person (
id INT AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO sales_person (name, address)
VALUES ("John Doe", "K98 7HG"), ("Mary Jane", "J87 3VH"), ("Jane Smith", "L98 6CF"), ("Mary Magdalene", "K98 5FS"), ("John Smith", "K09 6DS");

CREATE TABLE IF NOT EXISTS customer (
id INT AUTO_INCREMENT,
sales_personid INT, 
name VARCHAR(255) NOT NULL, 
address VARCHAR(255) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (sales_personid) REFERENCES sales_person(id)
);


INSERT INTO customer (sales_personid, name, address)
VALUES (2, "James", "K65 7CH"), (3, "Derek", "K98 6DR"), (1, "Shamima","K98 6GV"), (4, "Bika", "K93 7CU"), (5, "Jermaine", "L92 7CG");

CREATE TABLE IF NOT EXISTS orders (
id INT AUTO_INCREMENT,
customerid INT,
PRIMARY KEY (id),
FOREIGN KEY (customerid) REFERENCES customer(id)
);


INSERT INTO orders (customerid)
VALUES  (1), (3), (2), (4), (5);

CREATE TABLE IF NOT EXISTS product(
id INT AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO product (title)
VALUES ("Keyboard"), ("Ipad"), ("Desktop"), ("Monitor"), ("Mouse");

CREATE TABLE IF NOT EXISTS orderline(
productid INT,
orderid INT,
FOREIGN KEY (productid) REFERENCES product(id)
);


INSERT INTO orderline (productid, orderid)
VALUES (1,3), (2,2), (3,1), (4,5), (5,4),(2,3), (1,2), (4,1), (5,5), (3,4);


CREATE TABLE IF NOT EXISTS part(
id INT AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO part(name)
VALUES ("Scroll Wheel"), ("Motherboard"), ("Frame"), ("Keyboard Keys"), ("Graphics Card");

CREATE TABLE IF NOT EXISTS product_part(
productid INT,
partid INT,
FOREIGN KEY (productid) REFERENCES product(id),
FOREIGN KEY (partid) REFERENCES part(id)
);

INSERT INTO product_part(productid, partid)
VALUES (1,4), (2,2), (3,5), (4,3), (5,1);

CREATE TABLE IF NOT EXISTS employee (
id INT AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO employee (name, address)
VALUES ("Sam Doe", "K98 7HG"), ("Shannon Jane", "J87 3VH"), ("Derek Smith", "L98 6CF"), ("Lily Magdalene", "K98 5FS"), ("Kevin Smith", "K09 6DS");

CREATE TABLE IF NOT EXISTS assembling(
productid INT,
employeeid INT,
FOREIGN KEY (productid) REFERENCES product(id),
FOREIGN KEY (employeeid) REFERENCES employee(id)
);

INSERT INTO assembling(productid, employeeid)
VALUES (1,2), (2,1), (3,5), (4,4), (5,3);

CREATE TABLE IF NOT EXISTS supplier(
id INT AUTO_INCREMENT,
name VARCHAR(255) NOT NULL, 
address VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO supplier (name, address)
VALUES ("Razer", "USA"), ("Corsair", "China"), ("Dell", "USA"), ("HP" ,"UK"), ("Logitech", "China");

CREATE TABLE IF NOT EXISTS supplier_part (
supplierid INT,
partid INT,
FOREIGN KEY (supplierid) REFERENCES supplier(id),
FOREIGN KEY (partid) REFERENCES part(id)
);

INSERT INTO supplier_part (supplierid, partid)
VALUES (4,1), (3,2), (1,5), (2,3), (5,4);
