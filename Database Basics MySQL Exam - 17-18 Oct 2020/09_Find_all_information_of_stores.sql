select reverse(s.`name`) as `reversed_name`,
concat(upper(t.`name`), '-', a.`name`)
	as `full_address`,
count(e.id) as `employees_count`
from `stores` as s
join `addresses` as a
on s.address_id = a.id
join `towns` as t
on t.id = a.town_id
join `employees` as e
on s.id = e.store_id
GROUP BY s.id
-- HAVING `employees_count` > 1
ORDER BY `full_address` asc;
