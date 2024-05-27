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
order by 1 

/*
SELECT DISTINCT pay_month, department_id, 
(
    CASE
    WHEN avg_dept_sal > avg_company_sal THEN "higher"
    WHEN avg_dept_sal < avg_company_sal THEN "lower"
    WHEN avg_dept_sal = avg_company_sal THEN "same"
    END
) as comparison
FROM 
(
    SELECT s.employee_id, amount, pay_Date, department_id, LEFT(s.pay_date, 7) as pay_month,
     AVG(s.amount) OVER(PARTITION BY s.pay_date) as avg_company_sal,
     AVG(s.amount) OVER(PARTITION BY s.pay_Date, e.department_id) as avg_dept_sal
    FROM Salary s
    JOIN Employee e ON s.employee_id = e.employee_id
) as tmp;
*/