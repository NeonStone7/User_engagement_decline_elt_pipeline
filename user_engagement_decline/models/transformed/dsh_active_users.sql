--Daily Active Users (DAU) / Monthly Active Users (MAU): The number of unique users who engage with the product on a daily or monthly basis
with daily_active_users as (select 
trunc(ENGAGEMENT_DATE, 'day') as day,
count(USER_ID) as num_users_daily

from {{ ref('int_USER_ENGAGEMENT') }}

group by trunc(ENGAGEMENT_DATE, 'day') 
order by day),

monthly_active_users as (select 
trunc(ENGAGEMENT_DATE, 'month') as month,
count(USER_ID) as num_users_monthly

from {{ ref('int_USER_ENGAGEMENT') }} 

group by trunc(ENGAGEMENT_DATE, 'month') 
order by month)


select * from monthly_active_users, daily_active_users