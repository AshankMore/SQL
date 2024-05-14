WITH CTE AS
(
    SELECT
        action_date,
        COUNT(DISTINCT R.post_id)/COUNT(DISTINCT A.post_id) *100 AS cnt
    FROM Actions A
    LEFT JOIN Removals R
        ON A.post_id = R.post_id
    WHERE action = 'report' AND extra = 'spam'
    GROUP BY 1
)
SELECT 
    ROUND(AVG(cnt),2) AS average_daily_percent
FROM CTE
;
