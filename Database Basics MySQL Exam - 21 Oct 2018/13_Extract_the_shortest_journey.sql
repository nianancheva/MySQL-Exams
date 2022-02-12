select j.id,
pl.`name` as `planet_name`,
sp.`name` as `spaceport_name`,
j.`purpose` as `journey_purpose`
from `journeys` as j
join `spaceports` as sp
on j.destination_spaceport_id = sp.id
join `planets` as pl
on sp.planet_id = pl.id
order by (date(journey_end) - date(journey_start))
limit 1;
