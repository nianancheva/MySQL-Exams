UPDATE cars
SET `condition` = 'C'
where `condition` != 'C'
and (
(`mileage` >= 800000
or `mileage` is null)
and (`year` <= 2010)
and (`make` != 'Mercedes-Benz'));

--

UPDATE cars
SET `condition` = 'C'
where(
(`mileage` >= 800000
or `mileage` is null)
and (`year` <= 2010)
and (`make` != 'Mercedes-Benz'));
