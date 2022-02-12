select concat(first_name, ' ', last_name) 
	as `name`,
e.started_on,
count(ec.client_id) as `count_of_clients`
from `employees` as e
join `employees_clients` as ec
on e.id = ec.employee_id
GROUP BY e.id
order by `count_of_clients` desc, e.id asc
limit 5;
