select tc.job_during_journey as `job_name`
from `travel_cards` as tc
join (select * from journeys ORDER BY 
date(date(journey_end) - date(journey_start)) desc limit 1) as j
on tc.journey_id = j.id
GROUP BY tc.job_during_journey
order by
count(tc.job_during_journey) asc
limit 1;
