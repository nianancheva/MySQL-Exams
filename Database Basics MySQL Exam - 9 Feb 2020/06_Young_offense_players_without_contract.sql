SELECT p.id,
concat(first_name, ' ', last_name) as `full_name`,
age, position, hire_date
from `players` as p
join `skills_data` as sd
on p.skills_data_id = sd.id
WHERE p.age < 23
and p.position = 'A'
and hire_date is NULL
and sd.strength > 50
ORDER BY p.salary asc, age;
