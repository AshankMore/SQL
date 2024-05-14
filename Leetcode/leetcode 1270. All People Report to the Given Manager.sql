SELECT * FROM 
(
SELECT employee_id  FROM Employees where manager_id = 1
UNION
SELECT employee_id FROM Employees where manager_id IN (SELECT employee_id  FROM Employees where manager_id = 1)
UNION
SELECT employee_id FROM Employees where manager_id IN (SELECT employee_id FROM Employees where manager_id IN (SELECT employee_id  FROM Employees where manager_id = 1))
) A
WHERE A.employee_id <> 1;

