CREATE FUNCTION `udf_client_cards_count`(`name` VARCHAR(30)) 
RETURNS int
DETERMINISTIC
BEGIN
RETURN (SELECT
count(c.id)
from `clients` as cl
join `bank_accounts` as ba
on cl.id = ba.client_id
join `cards` as c
on ba.id = c.bank_account_id
where cl.full_name = `name`
group by cl.id
LIMIT 1);
END
