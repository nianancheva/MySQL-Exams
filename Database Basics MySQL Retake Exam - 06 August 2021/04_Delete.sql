delete g from `games` as g
left join `games_categories` as gc
on g.id = gc.game_id
where gc.category_id is null
and g.release_date is null;
