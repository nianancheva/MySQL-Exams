select concat(substring(`description`, 1, 30), '...') as `summary`,
`date`
from photos
where day(`date`) = 10
order by `date` desc;
