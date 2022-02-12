SELECT id,
concat(first_name, ' ', last_name) as `full_name`,
concat('$', salary) as `salary`,
started_on
from `employees`
where salary >= 100000
and date(started_on) >= date('2018-01-01')
order by salary desc;
