
-- Which Debt group has the highest rate of fraudulent transactions?

WITH cte_debt
AS(
SELECT
	u.debt_level AS Debt_Group,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	CAST(COUNT(fraud.is_fraud)*100.00/SUM(COUNT(fraud.is_fraud)) OVER() AS decimal(10,2)) AS Perc_by_Debt
FROM fraud_detection fraud
JOIN users u ON fraud.client_id = u.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	u.debt_level
)
SELECT
	Debt_Group,
	Fraud_Cases,
	Perc_by_Debt,
	SUM(Perc_by_Debt) OVER (ORDER BY Perc_by_Debt DESC) AS Cumulative_Perc
FROM cte_debt
ORDER BY Perc_by_Debt DESC;