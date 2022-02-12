SELECT concat(u.id, ' ', u.username) as `id_username`,
u.email
from `users` as u
join `users_photos` as ph
on u.id = ph.user_id
where u.id = ph.photo_id
order by u.id;
