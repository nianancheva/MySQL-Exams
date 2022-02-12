delete from `employees`
where manager_id is not null
and salary >= 6000;
