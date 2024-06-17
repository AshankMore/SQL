WITH exclusive_employees AS (
SELECT employee_id
FROM employees
JOIN consulting_engagements AS ce 
  ON employees.engagement_id = ce.engagement_id
GROUP BY employee_id
HAVING count(ce.client_name) = 1
)

SELECT 
  ce.client_name, 
  COUNT(employees.employee_id) AS total_staffed,
  COUNT(ee.employee_id) AS exclusive_staffed
FROM employees
INNER JOIN consulting_engagements AS ce 
  ON employees.engagement_id = ce.engagement_id
LEFT JOIN exclusive_employees AS ee 
  ON employees.employee_id = ee.employee_id
GROUP by ce.client_name
ORDER BY ce.client_name;