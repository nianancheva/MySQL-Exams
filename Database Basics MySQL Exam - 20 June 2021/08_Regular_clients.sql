select full_name,
count(cr.id) as `count_of_cars`,
sum(cr.bill) as `total_sum`
from clients as cl
join courses as cr
on cl.id = cr.client_id
join cars as c
on c.id = cr.car_id
group by cl.id
having substring(full_name, 2, 1) = 'a'
and `count_of_cars` > 1
order by full_name;
