
-- Which type of transaction has the highest fraud rate?

SELECT
	use_chip AS Chip_Type,
	COUNT(is_fraud) AS Fraud_Cases,
	FORMAT(COUNT(is_fraud)*1.0/SUM(COUNT(is_fraud)) OVER(),'P2') AS Perc
FROM fraud_detection
WHERE is_fraud = 'Yes'
GROUP BY use_chip