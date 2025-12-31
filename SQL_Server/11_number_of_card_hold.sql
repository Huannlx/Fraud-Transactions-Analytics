
-- How does the number of cards held relate to the number of fraudulent transactions?

SELECT
	u.num_credit_cards AS Number_Cards,
	COUNT(fraud.is_fraud) AS Fraud_Cases
FROM fraud_detection fraud
JOIN users u ON fraud.client_id = u.id
WHERE fraud.is_fraud = 'Yes'
GROUP BY
	u.num_credit_cards
ORDER BY
	Fraud_Cases DESC;