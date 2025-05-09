CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    Churn INT,
    Tenure INT,
    PreferredLoginDevice TEXT,
    CityTier INT,
    WarehouseToHome INT,
    PreferredPaymentMode TEXT,
    Gender TEXT,
    HourSpendOnApp INT,
    NumberOfDeviceRegistered INT,
    PreferedOrderCat TEXT,
    SatisfactionScore INT,
    MaritalStatus TEXT,
    NumberOfAddress INT,
    Complain INT,
    OrderAmountHikeFromlastYear INT,
    CouponUsed INT,
    OrderCount INT
)

----------------------------------------------------------------------------------------------------------------------------------------
    
/* Get the churn rate of customers in the dataset */
    
SELECT ROUND(1.0*SUM(CASE WHEN "Churn" = 1 THEN 1 ELSE 0 END) / COUNT(*), 2)
FROM customers    

/* RESULT = 0.17 */

----------------------------------------------------------------------------------------------------------------------------------------

/* Get the average tenure of customers who churn and those who have not */

SELECT ROUND(AVG("Tenure"), 2)
FROM customers
WHERE "Churn" = 1

/* RESULT = 3.38 */

SELECT ROUND(AVG("Tenure"), 2)
FROM customers
WHERE "Churn" = 0

/* RESULT = 11.50 */

----------------------------------------------------------------------------------------------------------------------------------------

/* Get the average distance from warehouse of customers who churn and those who have not */

SELECT "Churn", ROUND(AVG("WarehouseToHome"), 2)
FROM customers
GROUP BY "Churn"

/* RESULT = (Churn = 0, 15.35, Churn = 1, 17.13) */

----------------------------------------------------------------------------------------------------------------------------------------

/* Get the churn rate by gender  */

WITH total_customers AS (
  SELECT COUNT(*) AS total FROM customers
)

SELECT c."Gender", ROUND(1.0*SUM(c."Churn") / t.total, 2)
FROM customers AS c, total_customers AS t
GROUP BY c."Gender"

/* RESULT = (Female, 0.06, Male, 0.11) */

----------------------------------------------------------------------------------------------------------------------------------------

/* Get the churn rate by satisfaction score  */

SELECT "SatisfactionScore", COUNT(*) AS count_of_scores, SUM("Churn") AS count_of_churns, ROUND(1.0*SUM("Churn") / COUNT(*) , 2) AS ratio
FROM customers
GROUP BY "SatisfactionScore"
ORDER BY "SatisfactionScore"
    
/* RESULT
"1"	"1164"	"134"	"0.12"
"2"	"586"	"74"	"0.13"
"3"	"1698"	"292"	"0.17"
"4"	"1074"	"184"	"0.17"
"5"	"1108"	"264"	"0.24"	
*/

----------------------------------------------------------------------------------------------------------------------------------------

/* Get the churn rate if complaint */

SELECT "Complain", ROUND(1.0*SUM("Churn") / COUNT(*) , 2) AS churn_rate
FROM customers
GROUP BY "Complain"

/* RESULT = (Complaint = 0, 0.11) (Complaint = 1, 0.32) */

----------------------------------------------------------------------------------------------------------------------------------------

/* Get the average days since last order of customers who churn */
    
SELECT "Churn", ROUND(AVG("DaySinceLastOrder"), 2)
FROM customers
GROUP BY "Churn"

/* RESULT = (Churn = 0, 4.81, Churn = 1, 3.24) */

;
