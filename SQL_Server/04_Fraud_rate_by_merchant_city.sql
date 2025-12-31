
-- Which merchant city has the highest fraud rate?

SELECT
	mer.merchant_city AS Merchant_City,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	FORMAT(SUM(fraud.amount),'N2') AS Total_Amount
FROM fraud_detection fraud
JOIN merchant mer ON fraud.merchant_key = mer.merchant_key
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	mer.merchant_city
ORDER BY Fraud_Cases DESC;