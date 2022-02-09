select c.id, make, mileage,
count(cr.id) as `count_of_courses`,
round(avg(cr.bill), 2) as `avg_bill`
from cars as c
left join courses as cr
on 
c.id = cr.car_id
group by c.id
having `count_of_courses` != 2
order by `count_of_courses` desc, c.id;
