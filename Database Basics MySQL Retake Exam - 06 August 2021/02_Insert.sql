INSERT into `games`
(`name`, `rating`, `budget`, `team_id`)
SELECT
reverse(substring(lower(t.`name`), 2)),
t.`id`,
t.`leader_id` * 1000,
t.`id`
from `teams` as t
where t.id BETWEEN 1 and 9;
