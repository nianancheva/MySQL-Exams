select s.`name`,
count(p.id) as `product_count`,
round(avg(p.price), 2) as `avg`
from `stores` as s
left join `products_stores` as ps
on s.id = ps.store_id
left join `products` as p
on ps.product_id = p.id
group by s.id
order by `product_count` desc,
`avg` desc,
s.id;
