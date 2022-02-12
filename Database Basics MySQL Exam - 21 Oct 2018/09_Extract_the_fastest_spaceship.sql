SELECT s.`name`,
sp.name
FROM `spaceships` as s
join `journeys` as j
on s.id = j.spaceship_id
join `spaceports` as sp
on j.destination_spaceport_id = sp.id
ORDER BY light_speed_rate desc
limit 1;
