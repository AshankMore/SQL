SELECT
DATE_PART('days', JUSTIFY_HOURS(SUM(stop_time - start_time))) AS total_uptime_days
FROM
(
SELECT s.server_id, s.status_time as start_time,
p.status_time as stop_time
FROM 
(SELECT *, rank() OVER(PARTITION BY server_id ORDER BY status_time) AS srnk 
    FROM server_utilization WHERE session_status = 'start') s 
LEFT JOIN
(SELECT *,rank() OVER(PARTITION BY server_id ORDER BY status_time) AS prnk 
    FROM server_utilization WHERE session_status = 'stop') p
 ON s.server_id = p.server_id AND s.srnk = p.prnk
 ) Z