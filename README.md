# sql_practise_qa

![image](https://user-images.githubusercontent.com/81429555/154256452-b2dd1604-e6c9-44d6-b2a9-9f767ae83e74.png)

Apologies for the lines, draw.io is not very good at moving them. 
But, users has a zero to many relationship with orders, users can place many orders, one order or zero orders
Orders would technically have a many to many relationship with products as many products can be part of many orders, but as this is not possible in MySQL, orderline is used as a 'middle man' or 'child-table' to create this relationship

Users has zero to many with Reviews, and Reviews has zero to many with products. 
