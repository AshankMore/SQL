WITH T1 AS
(
SELECT 
    USER_ID, 
    DATE_PART('year', login_date::DATE) AS year,
    DATE_PART('month', login_date::DATE) AS curr_month,
    'Y' ACTIVE_FLAG
FROM USER_LOGINS
),
T2 AS
(SELECT A.user_id,
    A.year,
    A.curr_month,
    A.active_flag,
    B.active_flag AS previous_month_active_flag
  FROM
    T1 A
    LEFT JOIN T1 B ON A.user_id = B.user_id
    AND A.year = B.year AND A.curr_month = B.curr_month + 1
    )
    
 
  SELECT curr_month AS MTH, COUNT(DISTINCT USER_ID) AS REACTIVATED_USERS
  FROM T2 
  WHERE YEAR = 2022
  AND (ACTIVE_FLAG = 'Y' AND previous_month_active_flag IS NULL)
  GROUP BY 1