
-- Which card number has the most fraudulent transactions?

WITH cte_card_number
AS(
SELECT
	c.card_number AS Card_Number,
	COUNT(fraud.is_fraud) AS Fraud_Cases,
	FORMAT(SUM(fraud.amount),'N2') AS Total_Amount
FROM fraud_detection fraud
JOIN cards c ON fraud.card_id = c.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	c.card_number
),
cte_total_transaction
AS(
SELECT
	c.card_number,
	COUNT(fraud.id) AS Total_Transaction
FROM fraud_detection fraud
JOIN cards c ON fraud.card_id = c.id
GROUP BY
	c.card_number
)
SELECT
	cte_cn.Card_Number,
	cte_tt.Total_Transaction,
	cte_cn.Fraud_Cases,
	FORMAT(cte_cn.Fraud_Cases*1.0/cte_tt.Total_Transaction,'P2') AS Perc_Per_Cards,
	cte_cn.Total_Amount
FROM cte_card_number cte_cn
LEFT JOIN cte_total_transaction cte_tt ON cte_cn.Card_Number = cte_tt.card_number
ORDER BY Perc_Per_Cards DESC;
