
-- Which product category has the most fraudulent transactions?

SELECT
	cate.catogory AS Category,
	COUNT(DISTINCT mer.merchant_id) AS Total_Merchant,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	SUM(fraud.amount) AS Total_Amount
FROM fraud_detection fraud
JOIN merchant mer ON fraud.merchant_key = mer.merchant_key
JOIN merchant_category cate ON fraud.mcc = cate.mcc_id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	cate.catogory
ORDER BY Fraud_Cases DESC;
