/*
Table: Triangle
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.

Report for every three line segments whether they can form a triangle.
Return the result table in any order.
The result format is in the following example.

Example 1:

Input: 
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
*/

create table Triangle (x  int, y  int,  z  int)
insert into Triangle values 
( 13 , 15 , 30 ),
( 10 , 20 , 15 )

--Solution : 

select x,y,x,
case 
    when x<0 and y<0 and z<0 then 'No'
    when x+y>z and x+z>y and z+y>x then 'Yes'
    else 'No' 
end as 'traingle'
from Triangle

