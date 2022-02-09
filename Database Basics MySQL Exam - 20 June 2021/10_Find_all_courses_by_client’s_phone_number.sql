CREATE FUNCTION `udf_courses_by_client` (phone_num VARCHAR (20))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN 
(select count(cr.id) as `count`
from clients as cl
join courses as cr
on cl.id = cr.client_id
group by phone_number
having phone_number = phone_num);
END
