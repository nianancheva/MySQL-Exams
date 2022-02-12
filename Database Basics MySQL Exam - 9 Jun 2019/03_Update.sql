UPDATE `clients` as c
JOIN `employees_clients` as ec
on c.id = ec.employee_id
set ec.employee_id = (select * from (select ec1.employee_id
from `employees_clients` as ec1
GROUP BY ec1.employee_id
ORDER BY count(ec1.employee_id) asc, ec1.employee_id
LIMIT 1
) as ss)
where ec.client_id = ec.employee_id;
