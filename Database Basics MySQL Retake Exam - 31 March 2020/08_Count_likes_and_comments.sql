select p.id, 
count(DISTINCT l.id) as `likes_count`,
count(DISTINCT c.id) as `comments_count`
from `photos` as p
left join `likes` as l
on p.id = l.photo_id
left join `comments` as c
on p.id = c.photo_id
group by p.id
ORDER BY `likes_count` desc,
`comments_count` desc,
p.id asc;
