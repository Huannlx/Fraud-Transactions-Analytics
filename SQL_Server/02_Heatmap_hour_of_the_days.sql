
-- What time of day do most fraudulent transactions occur?

WITH cte_heatmap_by_hour
AS(
SELECT
	hour AS Hour,
	LEFT(DATENAME(WEEKDAY,date),3) AS Week_day,
	COUNT(is_fraud) AS Fraud_Cases
FROM fraud_detection
WHERE is_fraud = 'Yes'
GROUP BY
	hour,
	LEFT(DATENAME(WEEKDAY,date),3)
)
SELECT
	Hour,
	SUM(CASE WHEN Week_day = 'Mon' THEN Fraud_Cases ELSE 0 END) AS Mon,
	SUM(CASE WHEN Week_day = 'Tus' THEN Fraud_Cases ELSE 0 END) AS Tus,
	SUM(CASE WHEN Week_day = 'Wed' THEN Fraud_Cases ELSE 0 END) AS Wed,
	SUM(CASE WHEN Week_day = 'Thu' THEN Fraud_Cases ELSE 0 END) AS Thu,
	SUM(CASE WHEN Week_day = 'Fri' THEN Fraud_Cases ELSE 0 END) AS Fri,
	SUM(CASE WHEN Week_day = 'Sat' THEN Fraud_Cases ELSE 0 END) AS Sat,
	SUM(CASE WHEN Week_day = 'Sun' THEN Fraud_Cases ELSE 0 END) AS Sun,
	SUM(Fraud_Cases) AS Fraud_Cases
FROM cte_heatmap_by_hour
GROUP BY Hour
ORDER BY Hour;
