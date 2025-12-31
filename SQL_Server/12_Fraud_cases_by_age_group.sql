
-- Which age group has the highest rate of fraudulent transactions?

WITH cte_age
AS(
SELECT
	u.age_group AS Age_Group,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	CAST(COUNT(fraud.is_fraud)*100.00/SUM(COUNT(fraud.is_fraud)) OVER() AS decimal(10,2)) AS Perc_by_Age
FROM fraud_detection fraud
JOIN users u ON fraud.client_id = u.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	u.age_group
)
SELECT
	Age_Group,
	Fraud_Cases,
	Perc_by_Age,
	SUM(Perc_by_Age) OVER (ORDER BY Perc_by_Age DESC) AS Cumulative_Perc
FROM cte_age
ORDER BY Perc_by_Age DESC;