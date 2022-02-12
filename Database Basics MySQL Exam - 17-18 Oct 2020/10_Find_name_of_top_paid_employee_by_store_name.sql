CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50))
RETURNS text
DETERMINISTIC
BEGIN
RETURN (SELECT concat(e.first_name, ' ', e.middle_name, '. ', e.last_name,
' works in store for ', ((year('2020-10-18')) - (year(e.hire_date))), ' years')
	as `full_info`
from `stores` as s
join `employees` as e
on e.store_id = s.id
where s.`name` = store_name
ORDER BY e.`salary` DESC
limit 1);
END
