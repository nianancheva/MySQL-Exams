insert into clients (`full_name`, `phone_number`)
select 
concat_ws(' ', d.`first_name`, d.`last_name`),
concat ('(088) 9999', d.id * 2)
from `drivers` as d
where d.id BETWEEN 10 and 20
;
