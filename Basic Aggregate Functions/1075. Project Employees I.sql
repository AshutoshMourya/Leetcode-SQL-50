/*
Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Each row of this table indicates that the employee with employee_id is working on the project with project_id.

 

Table: Employee

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
Each row of this table contains information about one employee.

 

Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation: The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50


*/


create table Project (project_id  int , employee_id int )
insert into project ( project_id  , employee_id ) values 
(1 ,49 ),
(1 ,40 ),
(1 ,52 ),
(1 ,50 ),
(1 ,33 ),
(1 ,16 ),
( 1           , 1  ),
( 1           , 2  ),
( 1           , 3  ),
( 2           , 1  ),
( 2           , 4  ),
(1 ,49 ),
(1 ,40 ),
(1 ,52 ),
(1 ,50 ),
(1 ,33 ),
(1 ,16 ),


create table Employee1 (employee_id int, name  nvarchar(50), experience_years int) 
insert into Employee1 values 
(1,'fmspwb', 6  ),
(2,'eqnlmz', 27 ),
(3,'dgpsgmmmj', 12 ),
(4,'swbayvdpuk', 24 ),
(5,'nfzjbc', 20 ),
(6,'gwyiyhpmta', 30 ),
(1           ,'Khaled' , 3 ),
(2           ,'Ali'    , 2 ),
(3           ,'John'   , 1 ),
(4           ,'Doe'    , 2 )

--Solution : 

SELECT P.PROJECT_ID, ROUND((CAST(SUM(E.EXPERIENCE_YEARS) AS DECIMAL(10,2))/ COUNT(P.EMPLOYEE_ID)), 2) AS AVERAGE_YEARS
FROM PROJECT P
LEFT JOIN EMPLOYEE E
ON E.EMPLOYEE_ID = P.EMPLOYEE_ID
GROUP BY P.PROJECT_ID
ORDER BY P.PROJECT_ID