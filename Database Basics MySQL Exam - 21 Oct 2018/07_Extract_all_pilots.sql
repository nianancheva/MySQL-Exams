select c.id,
concat(c.first_name, ' ', c.last_name) as `full_name`
from `colonists`as c
join `travel_cards` as tc
on c.id = tc.colonist_id
where tc.job_during_journey = 'Pilot'
order by c.id asc;
