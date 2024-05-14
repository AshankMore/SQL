SELECT ROUND(
  100.0 * 
    COUNT(DISTINCT purchases.user_id) / 
    COUNT(DISTINCT signups.user_id), 2) AS same_week_purchases_pct
FROM signups
LEFT JOIN user_purchases AS purchases
  ON signups.user_id = purchases.user_id
WHERE purchases.purchase_date IS NULL
  OR (purchases.purchase_date BETWEEN signups.signup_date 
  AND (signups.signup_date + '7 days'::INTERVAL));