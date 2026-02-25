{% macro get_season(x) %}

CASE
WHEN MONTH(to_timestamp({{x}}) ) IN (12,1,2) then 'Winter'
WHEN MONTH(to_timestamp({{x}}) ) IN (3,4,5) then 'Summer'
WHEN MONTH(to_timestamp({{x}}) ) IN (6,7,8) then 'Monsoon'
else 'Autumn' end

{% endmacro %}

{% macro day_type(x) %}
CASE WHEN 
DAYNAME(to_timestamp({{x}}) ) IN ('Sat', 'Sun')
then 'WEEKEND'
else 'Businessday'
end
{% endmacro %}