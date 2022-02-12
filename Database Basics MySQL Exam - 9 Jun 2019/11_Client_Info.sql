CREATE PROCEDURE `udp_clientinfo` (full_name varchar(50))
BEGIN
select cl.full_name,
cl.age,
ba.account_number,
concat('$', ba.balance) as `balance`
from `clients` as cl
join `bank_accounts` as ba
on cl.id = ba.client_id
where cl.full_name = full_name;
END
