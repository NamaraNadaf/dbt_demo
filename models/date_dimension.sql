with cte as (
select 
to_timestamp(started_at) as started_at,
DATE(to_timestamp(started_at) ) AS DATE_STARTED_AT,
HOUR(to_timestamp(started_at) ) AS HOUR_STARTED_AT,
CASE WHEN 
DAYNAME(to_timestamp(started_at) ) IN ('Sat', 'Sun')
then 'WEEKEND'
else 'Businessday'
end AS DAY_TYPE,
CASE
WHEN MONTH(to_timestamp(started_at) ) IN (12,1,2) then 'Winter'
WHEN MONTH(to_timestamp(started_at) ) IN (3,4,5) then 'Summer'
WHEN MONTH(to_timestamp(started_at) ) IN (6,7,8) then 'Monsoon'
else 'Autumn' end as Season_of_year
from {{ source('demo', 'bike') }}

)

select * from cte