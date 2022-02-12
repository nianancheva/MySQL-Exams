insert into `addresses` (address, town, country, user_id)
SELECT u.`username`,
u.`password`,
u.`ip`,
u.`age`
from `users` as u
WHERE u.`gender` = 'M';
