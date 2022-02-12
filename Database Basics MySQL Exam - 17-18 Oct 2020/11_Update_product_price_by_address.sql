CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN
update `products` as p
join `products_stores` as ps
on p.id = ps.product_id
join `stores` as s
on s.id = ps.store_id
join `addresses` as a
on a.id = s.address_id
set price = (case
when a.`name` like '0%' then price + 100
else price + 200
end)
where a.`name` = address_name;
END
