WITH T1 AS 
(
SELECT request_at, 
      SUM(CASE 
           WHEN STATUS = 'cancelled_by_driver' OR 
                STATUS = 'cancelled_by_client' THEN 1 
                ELSE 0 END) AS CRSUM
FROM Trips
WHERE client_id IN (SELECT users_id  FROM Users WHERE Banned = 'No')
AND driver_id IN (SELECT users_id  FROM Users WHERE Banned = 'No')
GROUP BY 1
),

T2 AS 
(SELECT request_at, COUNT(*) AS CNT
FROM Trips 
WHERE client_id IN (SELECT users_id  FROM Users WHERE Banned = 'No')
AND driver_id IN (SELECT users_id  FROM Users WHERE Banned = 'No')
GROUP BY 1
)

SELECT T1.request_at AS Day, ROUND(T1.CRSUM/T2.CNT,2) AS 'Cancellation Rate'
FROM T1 LEFT JOIN T2 ON T1.request_at = T2.request_at
WHERE T1.request_at between "2013-10-01" and "2013-10-03"
;
