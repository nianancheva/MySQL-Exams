select g.`name`,
(case
when g.`budget` < 50000
then 'Normal budget'
else 'Insufficient budget'
end) as `budget_level`,
t.`name` as `team_name`,
a.`name` as `addresss_name`
from `games` as g
left join `games_categories` as gc
on g.id = gc.game_id
join `teams` as t
on g.team_id = t.id
join `offices` as o
on t.office_id = o.id
join `addresses` as a
on o.address_id = a.id
where g.release_date is null
and gc.category_id is null
order by g.`name`;
