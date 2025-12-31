
-- What kind of clients profile is most at risk of fraud?

SELECT
	u.age_group AS Age_Group,
	u.credit_score_level AS Credit_Score_Group,
	u.income_range AS Income_Group,
	u.debt_level AS Debt_Group,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	CAST(COUNT(fraud.is_fraud)*100.00/SUM(COUNT(fraud.is_fraud)) OVER() AS decimal(10,2)) AS Perc_by_Cases
FROM fraud_detection fraud
JOIN users u ON fraud.client_id = u.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	u.age_group,
	u.credit_score_level,
	u.income_range,
	u.debt_level
ORDER BY
	Fraud_Cases DESC;