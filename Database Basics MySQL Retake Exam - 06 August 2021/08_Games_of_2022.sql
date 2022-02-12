select g.`name`,
g.`release_date`,
concat(substring(g.`description`, 1, 10), '...')
	as `summary`,
(case
when month(g.release_date) 
in (1, 2, 3) then 'Q1'
when month(g.release_date) 
in (4, 5, 6) then 'Q2'
when month(g.release_date) 
in (7, 8, 9) then 'Q3'
when month(g.release_date) 
in (10, 11, 12) then 'Q4'
else g.release_date
end) as `Quarters`,
t.`name` as `team_name`
from `games` as g
join `teams` as t
on g.team_id = t.id
where g.`name` like '%2'
and year(g.release_date) = 2022
and month(g.release_date) % 2 = 0
order by `Quarters`;
