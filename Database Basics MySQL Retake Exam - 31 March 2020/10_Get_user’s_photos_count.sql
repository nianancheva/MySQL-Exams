CREATE FUNCTION udf_users_photos_count(username VARCHAR(30))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN (select
count(DISTINCT p.id) as `photosCount`
from `users` as u
left join `users_photos` as up
on u.id = up.user_id
left join `photos` as p
on p.id = up.photo_id
where u.username = username
group by u.id);
END

--

create function udf_users_photos_count(username VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE p_count INT;
SET p_count := (
select
count(p.id)
from photos p
inner join users_photos up on up.user_id = p.id
inner join users u on u.id = up.user_id
where u.username = username);
RETURN p_count;
END
