WITH daily_weather as (
select 
weather,
date(time) as daily_weather,
temp,
pressure,
humidity,
clouds
from 
{{ source('demo', 'weather') }}
),
daily_weather_agg as (
select 
daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(pressure),2) as avg_pressure,
round(avg(clouds),2) as avg_clouds
--count(weather),
--row_number() over (partition by daily_weather order by count(weather) desc) as row_number
from 
daily_weather
group by daily_weather, weather
qualify row_number() over (partition by daily_weather order by count(weather) desc) = 1
)
select * from daily_weather_agg