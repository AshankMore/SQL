select
max(case when continent='America' then name end) as America
,max(case when continent='Asia' then name end) as Asia
,max(case when continent='Europe' then name end) as Europe
from
(
select
continent,
name,
row_number() over (partition by continent order by name) as rn
from
Student
)i
group by rn;
