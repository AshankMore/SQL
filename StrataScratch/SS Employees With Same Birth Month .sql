select profession as department, 
sum(case when birth_month = 1 then 1 else 0 end ) as month_1,
sum(case when birth_month = 2 then 1 else 0 end ) as month_2,
sum(case when birth_month = 3 then 1 else 0 end ) as month_3,
sum(case when birth_month = 4 then 1 else 0 end ) as month_4,
sum(case when birth_month = 5 then 1 else 0 end ) as month_5,
sum(case when birth_month = 6 then 1 else 0 end ) as month_6,
sum(case when birth_month = 7 then 1 else 0 end ) as month_7,
sum(case when birth_month = 8 then 1 else 0 end ) as month_8,
sum(case when birth_month = 9 then 1 else 0 end )as month_9,
sum(case when birth_month = 10 then 1 else 0 end )as month_10,
sum(case when birth_month = 11 then 1 else 0 end ) as month_11,
sum(case when birth_month = 12 then 1 else 0 end ) as month_12

from employee_list
group by 1