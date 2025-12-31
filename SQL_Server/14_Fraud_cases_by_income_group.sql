
-- Which Income group has the highest rate of fraudulent transactions?

WITH cte_income
AS(
SELECT
	u.income_range AS Income_Group,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	CAST(COUNT(fraud.is_fraud)*100.00/SUM(COUNT(fraud.is_fraud)) OVER() AS decimal(10,2)) AS Perc_by_Income
FROM fraud_detection fraud
JOIN users u ON fraud.client_id = u.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	u.income_range
)
SELECT
	Income_Group,
	Fraud_Cases,
	Perc_by_Income,
	SUM(Perc_by_Income) OVER (ORDER BY Perc_by_Income DESC) AS Cumulative_Perc
FROM cte_income
ORDER BY Perc_by_Income DESC;