WITH T1 AS 
(SELECT LEFT(pay_date, 7) as pay_month, AVG(amount) AS comp_avg
FROM SALARY
GROUP BY 1),

T2 AS 
(SELECT LEFT(pay_date, 7) as pay_month, department_id, AVG(amount) AS dept_avg
FROM SALARY S LEFT JOIN EMPLOYEE E ON S.employee_id = E.employee_id
GROUP BY 1,2)

SELECT T2.pay_month, T2.department_id, 
(case when dept_avg > comp_avg then 'higher' 
     when dept_avg < comp_avg then 'lower'
     else 'same' end ) as comparison FROM T2 LEFT JOIN T1 ON T2.pay_month = T1.pay_month 
order by 1 ;
