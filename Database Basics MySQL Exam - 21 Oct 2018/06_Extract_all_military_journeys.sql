select id,
journey_start,
journey_end
from `journeys`
where `purpose` = 'Military'
order by journey_start;
