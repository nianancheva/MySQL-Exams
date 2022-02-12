SELECT c.`name`,
count(gc.`game_id`) as `games_count`,
round(avg(g.budget), 2) as `avg_budget`,
max(g.rating) as `max_rating`
FROM `categories` as c
join `games_categories` as gc
on c.id = gc.category_id
join `games` as g
on g.id = gc.game_id
group by c.`name`
having not max(g.rating) < 9.5
order by `games_count` desc, c.`name` asc;
