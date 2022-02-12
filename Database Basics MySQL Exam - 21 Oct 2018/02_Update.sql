update `journeys`
set `purpose` = (case
when id % 2 = 0
then 'Medical'
when id % 3 = 0
then 'Technical'
when id % 5 = 0
then 'Educational'
when id % 7 = 0
then 'Military'
else `purpose`
end);
