CREATE FUNCTION `udf_game_info_by_name`(game_name VARCHAR (20)) RETURNS text
    DETERMINISTIC
BEGIN
DECLARE game_info text;
set game_info := (
select concat('The ', g.`name`, ' is developed by a ',
t.`name`, ' in an office with an address ', a.`name`) as `info`
from `games` as g
join `teams` as t
on g.team_id = t.id
join `offices` as o
on t.office_id = o.id
join `addresses` as a
on o.address_id = a.id
where g.`name` = game_name
);
RETURN game_info;
END
