UPDATE `addresses`
SET `country` = 'Blocked'
WHERE `country` like 'B%';
UPDATE `addresses`
SET `country` = 'Test'
WHERE `country` like 'T%';
UPDATE `addresses`
SET `country` = 'In Progress'
WHERE `country` like 'P%';

---

UPDATE `addresses`
SET `country` = (CASE
WHEN `country` like 'B%' THEN 'Blocked'
WHEN `country` like 'T%' THEN 'Test'
WHEN `country` like 'P%' THEN 'In Progress'
else `country`
END
);
