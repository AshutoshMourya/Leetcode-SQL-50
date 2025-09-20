/*
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.

Initially, all products have price 10.

Write a solution to find the prices of all products on the date 2019-08-16.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+

*/

create table Products (product_id int, new_price int,  change_date date)
insert into Products values
(1 ,20 ,'2019-08-14'),
(2 ,50 ,'2019-08-14'),
(1 ,30 ,'2019-08-15'),
(1 ,35 ,'2019-08-16'),
(2 ,65 ,'2019-08-17'),
(3 ,20 ,'2019-08-18')


--Solution : 

WITH max_dates AS (
        SELECT product_id, MAX(change_date) AS max_date
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    ),
    new_prices AS (
        SELECT p.product_id, p.change_date, p.new_price AS price
        FROM Products p
        JOIN max_dates m ON p.product_id = m.product_id AND p.change_date = m.max_date
        UNION ALL
        SELECT product_id, change_date, (CASE WHEN change_date > '2019-08-16' THEN 10 END) AS price
        FROM Products
        WHERE change_date > '2019-08-16'
    )