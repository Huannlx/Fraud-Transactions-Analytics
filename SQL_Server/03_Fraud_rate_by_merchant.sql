
-- Which merchant_id has the highest fraud rate?

WITH cte_merchant_cases_rate 
AS(
SELECT
	merchant_id AS Merchant_ID,
	mer.merchant_city AS Merchant_City,
	cate.catogory AS Category,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	SUM(fraud.amount) AS Total_Amount
FROM fraud_detection fraud
JOIN merchant mer ON fraud.merchant_key = mer.merchant_key
JOIN merchant_category cate ON fraud.mcc = cate.mcc_id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	mer.merchant_id,
	mer.merchant_city,
	cate.catogory
),

cte_fraud_investigated
AS(
SELECT
	mer.merchant_id AS Merchant_ID,
	COUNT(fraud.is_fraud) AS Fraud_Investigated
FROM fraud_detection fraud
JOIN merchant mer ON fraud.merchant_key = mer.merchant_key
WHERE is_fraud IN ('Yes','No')
GROUP BY
	mer.merchant_id
)
SELECT
	cte_mcr.Merchant_ID,
	cte_mcr.Merchant_City,
	cte_mcr.Category,
	cte_fraud.Fraud_Investigated,
	cte_mcr.Fraud_Cases,
	cte_mcr.Total_Amount,
	FORMAT(cte_mcr.Fraud_Cases*1.0/cte_fraud.Fraud_Investigated,'P2') AS Fraud_Rate
FROM cte_merchant_cases_rate cte_mcr
LEFT JOIN cte_fraud_investigated cte_fraud ON cte_mcr.Merchant_ID = cte_fraud.Merchant_ID
ORDER BY Fraud_Rate DESC;
