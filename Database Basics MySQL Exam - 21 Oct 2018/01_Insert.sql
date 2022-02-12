insert into `travel_cards`
(card_number, job_during_journey, colonist_id, journey_id)
SELECT (case
when date(c.birth_date) > date('1980-01-01')
then concat(year(c.birth_date), day(c.birth_date), 
substring(c.ucn, 1, 4))
else concat(year(c.birth_date), month(c.birth_date),
substring(c.ucn, 7, 4))
end),
(select (case
when c.id % 2 = 0 
then 'Pilot'
when c.id % 3 = 0 
then 'Cook'
ELSE 'Engineer'
end
)),
c.id,
substring(c.ucn, 1, 1)
from `colonists` as c
where c.id BETWEEN 96 and 100;
