SELECT c.id,
concat(c.card_number, ' : ', cl.full_name) as `card_token`
from `cards` as c
join `bank_accounts` as ba
on c.bank_account_id = ba.id
join `clients` as cl
on cl.id = ba.client_id
ORDER BY c.id desc;
