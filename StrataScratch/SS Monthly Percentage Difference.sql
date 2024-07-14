WITH t1 as 
        (
        SELECT  to_char(created_at, 'YYYY-MM') as date_month,
        SUM(value) as revenue,
        LAG(sum(value), 1) over(order by to_char(created_at, 'YYYY-MM')) as prev_revenue 
        FROM sf_transactions
        GROUP BY to_char(created_at, 'YYYY-MM')
        )

SELECT  date_month,
        round((revenue - prev_revenue) / prev_revenue * 100, 2) as revenue_diff_pct
FROM t1;
