SELECT SEARCH_ID, MAX(rating)
from
(
SELECT
search_id, 
case when clicked = 0 then 1 
     when clicked = 1 and search_results_position > 3 then 2
     when clicked = 1 and search_results_position <= 3 then 3
     else Null 
     end as rating
from fb_search_events
) p
group by 1;
