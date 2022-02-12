select pl.`name` as `planet_name`,
count(j.id) as `journeys_count`
from `planets` as pl
join `spaceports` as sp
on pl.id = sp.planet_id
join `journeys` as j
on j.destination_spaceport_id = sp.id
GROUP BY pl.`id`
order by `journeys_count` desc, pl.`name` asc;
