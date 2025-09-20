/*
Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]

 

Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

The result format is in the following example.

 

Example 1:

Input: 
Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.


*/
create table Prices ( product_id int, start_date nvarchar(20), end_date  nvarchar(20), price  int)
insert into Prices  values
(1          ,'2019-02-17','2019-02-28', 5  ),
(1          ,'2019-03-01','2019-03-22', 20 ),
(2          ,'2019-02-01','2019-02-20', 15 ),
(2          ,'2019-02-21','2019-03-31', 30 )

create table UnitsSold ( product_id int, purchase_date nvarchar(20), units INT) 
insert into UnitsSold VALUES ( 1  ,'2019-02-25'    , 100  ),
( 1  ,'2019-03-01'    , 15   ),
( 2  ,'2019-02-10'    , 200  ),
( 2  ,'2019-03-22'    , 30   )

--Solution :

select * from Cinema where id%2=1 
and description not like '%boring%' order by RATING desc 