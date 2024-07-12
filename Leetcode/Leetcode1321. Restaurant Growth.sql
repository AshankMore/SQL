select T2.visited_on, T2.amount, T2.average_amount

from

(select visited_on, 
SUM(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING) AS amount,
round(avg(amount) OVER (ORDER BY visited_on ROWS 6 PRECEDING),2) AS average_amount,
row_number() over (ORDER BY visited_on) as rn_num
from
(select visited_on, sum(amount) as amount
from customer
group by visited_on order by visited_on) as T1) as T2

where T2.rn_num >= 7;
