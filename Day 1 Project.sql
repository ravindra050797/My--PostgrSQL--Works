CREATE TABLE My_Outlier_Earning
(Work_Date date,
 Item_id VARCHAR(100),
Project_Name VARCHAR(50),
Duration VARCHAR(20),
Rate VARCHAR(10),
Payable VARCHAR(10),
Type VARCHAR(50),
Status VARCHAR(50));
SELECT * FROM My_Outlier_Earning;

--Question 1: Calculate the total payable amount by removing the '$' sign from My_Outlier_Earning?
--Answer:-
SELECT SUM(REPLACE(Payable, '$', '')::NUMERIC) AS total_payable
FROM My_Outlier_Earning;

--Question 2: Make all Project Name as Capital Latter?
--Answer:-
SELECT UPPER (Project_Name) FROM My_Outlier_Earning;

--Question 3: Find the Maximum Payable amount in this table?
--Answer:-
SELECT MAX (Payable) FROM My_Outlier_Earning;

--Question 4: Find the 5 Higest paying project name and payable amount 'Use ORDER BY and LIMIT'?
--Answer:-
SELECT Project_Name, Payable
FROM My_Outlier_Earning
ORDER BY REPLACE(Payable, '$', '')::NUMERIC DESC
LIMIT 5;

--Question 5: Find the top payable project name and amount?
--Answer:-
SELECT Project_Name, Payable
FROM My_Outlier_Earning
WHERE REPLACE (Payable, '$', '')::NUMERIC = (SELECT MAX(REPLACE(Payable, '$', '')::NUMERIC)FROM My_Outlier_Earning);
