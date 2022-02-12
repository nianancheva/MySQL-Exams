insert into `cards` 
(card_number, card_status, bank_account_id)
SELECT reverse(c.full_name),
'Active',
c.id
from `clients` as c
where c.id BETWEEN 191 and 200;
