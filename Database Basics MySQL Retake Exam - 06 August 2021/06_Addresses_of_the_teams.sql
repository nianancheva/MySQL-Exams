SELECT t.`name` as `team_name`,
a.`name` as `address_name`,
char_length(a.`name`)
from `teams` as t
join `offices` as o
on t.office_id = o.id
join `addresses` as a
on o.address_id = a.id
where o.website is not null
order by t.`name`, a.`name`;
