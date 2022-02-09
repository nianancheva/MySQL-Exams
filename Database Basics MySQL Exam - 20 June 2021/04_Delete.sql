delete c from clients as c
left join courses as cr
on c.id = cr.client_id
where cr.client_id is null
and char_length(c.full_name) > 3;
