select ad.`name`, 
(case 
when hour(cr.`start`) between 6 and 20 then 'Day'
else 'Night' end) as `day_time`,
cr.bill, cl.full_name, c.make, c.model, cat.`name`
from courses as cr
join addresses as ad
on cr.from_address_id = ad.id
join cars as c
on cr.car_id = c.id
join clients as cl
on cr.client_id = cl.id
join categories as cat
on c.category_id = cat.id
order by cr.id;
