INSERT into `coaches` (first_name, last_name, salary, coach_level)
SELECT first_name, last_name, salary, char_length(first_name)
FROM `players`
where age >= 45;
