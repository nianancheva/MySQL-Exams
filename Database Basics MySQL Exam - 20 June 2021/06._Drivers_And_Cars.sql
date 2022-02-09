select d.first_name, d.last_name,
c.make, c. model, c.mileage
from drivers as d
join cars_drivers as cd
on d.id = cd.driver_id
join cars as c
on c.id = cd.car_id
where mileage is not null
order by mileage desc, first_name asc;
