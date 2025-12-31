
-- Which gender has the most fraudulent transactions?

SELECT
	u.gender AS Gender,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	FORMAT(COUNT(fraud.is_fraud)*1.0/SUM(COUNT(fraud.is_fraud)) OVER(),'P2') AS Perc_by_Gender,
	FORMAT(SUM(fraud.amount),'N2') AS Total_Amount
FROM fraud_detection fraud
JOIN users u ON fraud.client_id = u.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	u.gender
ORDER BY
	Perc_by_Gender DESC;