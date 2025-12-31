
-- Which credit score group has the highest rate of fraudulent transactions?

WITH cte_credit_score
AS(
SELECT
	u.credit_score_level AS Credit_Score_Group,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	CAST(COUNT(fraud.is_fraud)*100.00/SUM(COUNT(fraud.is_fraud)) OVER() AS decimal(10,2)) AS Perc_by_credit_score
FROM fraud_detection fraud
JOIN users u ON fraud.client_id = u.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	u.credit_score_level
)
SELECT
	Credit_Score_Group,
	Fraud_Cases,
	Perc_by_Age,
	SUM(Perc_by_Age) OVER (ORDER BY Perc_by_Age DESC) AS Cumulative_Perc
FROM cte_credit_score
ORDER BY Perc_by_Age DESC;