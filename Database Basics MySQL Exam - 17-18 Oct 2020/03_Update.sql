update `employees` as e
join `stores` as s
on e.store_id = s.id
set salary = salary - 500,
manager_id = 3
where s.name not in ('Cardguard', 'Veribet')
and year(hire_date) > 2003;
