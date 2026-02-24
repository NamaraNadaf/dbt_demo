with cte as (
select 
to_timestamp(started_at) as started_at,
DATE(to_timestamp(started_at) ) AS DATE_STARTED_AT,
HOUR(to_timestamp(started_at) ) AS HOUR_STARTED_AT,
{{day_type('started_at')}} AS DAY_TYPE,
{{ get_season('started_at') }} as season_of_year
from {{ source('demo', 'bike') }}

)

select * from cte