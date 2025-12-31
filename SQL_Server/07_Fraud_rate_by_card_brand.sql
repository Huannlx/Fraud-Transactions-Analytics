
-- Which card brand has the highest fraud rate?

SELECT
	c.card_brand AS Card_Brand,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	FORMAT(COUNT(fraud.is_fraud)*1.0/SUM(COUNT(fraud.is_fraud)) OVER(),'P2') AS Perc_by_card_brand,
	FORMAT(SUM(fraud.amount),'N2') AS Total_Amount
FROM fraud_detection fraud
JOIN cards c ON fraud.card_id = c.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	C.card_brand
ORDER BY Fraud_Cases DESC;