SELECT br.`name`,
count(c.id) as `count_of_cards`
from `branches` as br
left join `employees` as e
on br.id = e.branch_id
left join `employees_clients` as ec
on e.id = ec.employee_id
left join `clients` as cl
on cl.id = ec.client_id
left join bank_accounts as ba
on cl.id = ba.client_id
left join `cards` as c
on c.bank_account_id = ba.id
GROUP BY br.`name`
order by `count_of_cards` desc, br.`name`;
