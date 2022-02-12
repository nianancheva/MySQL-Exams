CREATE PROCEDURE `udp_modify_user`(address VARCHAR(30), town VARCHAR(30))
BEGIN
if EXISTS (SELECT count(*) from `addresses` as a where a.address = address) = 0
or EXISTS (select count(*) from `addresses` as a where a.town = town) = 0
then ROLLBACK;
else
start TRANSACTION;
update `users` as u
join `addresses` as a
on u.id = a.user_id
set age = age + 10
where a.address = address
and a.town = town;
end if;
END
