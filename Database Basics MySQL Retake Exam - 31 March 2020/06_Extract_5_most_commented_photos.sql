SELECT p.id,
p.`date` as `date_and_time`,
p.`description`,
count(c.id) as `commentsCount`
from `photos` as p
join `comments` as c
on p.id = c.photo_id
GROUP BY p.id
ORDER BY `commentsCount` desc, p.id asc
LIMIT 5;
