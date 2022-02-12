CREATE PROCEDURE udp_update_budget (min_game_rating float)
BEGIN
update `games` as g
left join `games_categories` as gc
on g.id = gc.game_id
set g.`budget` = g.`budget` + 100000,
g.release_date = date_add(g.release_date, interval 1 year)
where gc.`category_id` is null
and g.`rating` > min_game_rating
and g.`rating` is not null
and g.`release_date` is not null
and min_game_rating is not null;
END
