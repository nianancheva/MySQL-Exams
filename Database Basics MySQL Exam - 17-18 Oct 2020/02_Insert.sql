insert into `products_stores`
select p.id,
1
from `products` as p
where p.id in (
select p.id
from `products` as p
left join `products_stores` as ps
on p.id = ps.product_id
left join `stores` as s
on ps.store_id = s.id
where s.id is null
);
