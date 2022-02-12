select pl.`name`,
sp.`name`
from `planets` as pl
right join `spaceports` as sp
on pl.id = sp.planet_id
right join `journeys` as j
on j.destination_spaceport_id = sp.id
where j.purpose = 'Educational'
order by sp.`name` desc;
