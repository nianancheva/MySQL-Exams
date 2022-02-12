select id,
concat(first_name, ' ', last_name) as `full_name`,
ucn
from `colonists`
ORDER BY first_name, last_name, id;
