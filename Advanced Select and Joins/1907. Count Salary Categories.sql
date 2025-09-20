/*
Table: Accounts

+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.

 

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

    "Low Salary": All the salaries strictly less than $20000.
    "Average Salary": All the salaries in the inclusive range [$20000, $50000].
    "High Salary": All the salaries strictly greater than $50000.

The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.

*/

create table Accounts (account_id int,  income int)
insert into Accounts values
(3  ,108939 ),
(2  ,12747  ),
(8  ,87709  ),
(6  ,91796  )


--Solution : 

select a.category, count(a.category) OVER (PARTITION BY a.category) as 'accounts_count' from 
(
    select account_id , income, 
    case 
        when income <20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        else 'High Salary' end
           as 'category'
    from Accounts 
) a

WITH Categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
AccountsCategorized AS (
    SELECT 
        account_id, 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary' 
        END AS category
    FROM Accounts
)
SELECT 
    c.category,
    COUNT(a.account_id) AS accounts_count
FROM Categories c
LEFT JOIN AccountsCategorized a 
    ON c.category = a.category
GROUP BY c.category