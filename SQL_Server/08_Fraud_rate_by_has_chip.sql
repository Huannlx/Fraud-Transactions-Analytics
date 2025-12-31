
-- What impact do chip cards have on fraudulent transactions?

SELECT
	c.has_chip AS Has_Chip,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	FORMAT(COUNT(fraud.is_fraud)*1.0/SUM(COUNT(fraud.is_fraud)) OVER(),'P2') AS Perc,
	FORMAT(SUM(fraud.amount),'N2') AS Total_Amount
FROM fraud_detection fraud
JOIN cards c ON fraud.card_id = c.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	c.has_chip
ORDER BY Fraud_Cases DESC;

