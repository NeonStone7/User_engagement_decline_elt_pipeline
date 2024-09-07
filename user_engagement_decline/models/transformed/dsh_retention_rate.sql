-- User Retention Rate: The percentage of users who return to use the product after their first visit

with ENGAGEMENT_DATE_last as (select user_id,
max(ENGAGEMENT_DATE) over(partition by user_id) as last_ENGAGEMENT_DATE

from {{ ref('int_USER_ENGAGEMENT') }}),

signup_to_engagement as 
(select users.*, 
{{ difference_in_dates('users.SIGNUP_DATE', 'eng.last_ENGAGEMENT_DATE', 'day') }} as days_since_signup
from {{ ref('int_users') }} users

left join ENGAGEMENT_DATE_last eng

on users.user_id = eng.user_id
),

is_active_table as (select user_id,days_since_signup, 
case when days_since_signup is not null then 1 else 0 end as is_active
from signup_to_engagement),

all_users as (select count(distinct user_id) as total_users from is_active_table),
active_users as (select count(distinct user_id) as active_users from is_active_table where is_active=1 )

SELECT 
    (active_users.active_users * 1.0 / all_users.total_users) AS active_user_ratio
FROM active_users, all_users




