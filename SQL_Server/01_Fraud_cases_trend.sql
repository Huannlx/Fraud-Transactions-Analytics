
-- How many fraud cases change over time?

WITH cte_fraud_trend
AS(
SELECT
	YEAR(date) AS Year,
	MONTH(date) AS Month,
	COUNT(is_fraud) AS Fraud_Cases
FROM fraud_detection
WHERE is_fraud = 'Yes'
GROUP BY
	YEAR(date),
	MONTH(date)
)
SELECT
	Year AS Year,
	SUM(CASE WHEN Month = 1 THEN Fraud_Cases ELSE 0 END) AS Jan,
	SUM(CASE WHEN Month = 2 THEN Fraud_Cases ELSE 0 END) AS Feb,
	SUM(CASE WHEN Month = 3 THEN Fraud_Cases ELSE 0 END) AS Mar,
	SUM(CASE WHEN Month = 4 THEN Fraud_Cases ELSE 0 END) AS Apr,
	SUM(CASE WHEN Month = 5 THEN Fraud_Cases ELSE 0 END) AS May,
	SUM(CASE WHEN Month = 6 THEN Fraud_Cases ELSE 0 END) AS Jun,
	SUM(CASE WHEN Month = 7 THEN Fraud_Cases ELSE 0 END) AS Jul,
	SUM(CASE WHEN Month = 8 THEN Fraud_Cases ELSE 0 END) AS Aug,
	SUM(CASE WHEN Month = 9 THEN Fraud_Cases ELSE 0 END) AS Sep,
	SUM(CASE WHEN Month = 10 THEN Fraud_Cases ELSE 0 END) AS Oct,
	SUM(CASE WHEN Month = 11 THEN Fraud_Cases ELSE 0 END) AS Nov,
	SUM(CASE WHEN Month = 12 THEN Fraud_Cases ELSE 0 END) AS Dec,
	SUM(Fraud_Cases) AS Fraud_Cases,
	CASE 
        WHEN LAG(SUM(Fraud_Cases), 1) OVER (ORDER BY Year) = 0 THEN NULL
        ELSE
        FORMAT((SUM(Fraud_Cases) - LAG(SUM(Fraud_Cases), 1) OVER (ORDER BY Year)) * 1.0
        / LAG(SUM(Fraud_Cases), 1) OVER (ORDER BY Year),'P2')
    END AS YoY_Change
FROM cte_fraud_trend
GROUP BY Year
ORDER BY Year
