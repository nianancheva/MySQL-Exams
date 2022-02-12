UPDATE `employees` as e
JOIN `teams` as t
on e.id = t.leader_id
set e.`salary` = e.`salary` + 1000
where e.`age` < 40
and e.`salary` < 5000;
