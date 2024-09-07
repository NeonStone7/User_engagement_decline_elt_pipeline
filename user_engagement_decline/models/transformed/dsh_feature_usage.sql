-- Feature Usage Metrics: The percentage of users engaging with key product features. 

with main as (select user.user_id, feature.user_id as feature_user_id

from {{ ref('int_users') }} user

left join {{ ref('int_FEATURE_USAGE') }} feature 
on user.user_id = feature.user_id),

all_users as (select count(distinct user_id) as total_users from main),
features_users as (select count(distinct user_id) as total_users from main where feature_user_id is not null)


select distinct features_users.total_users * 1.0 / all_users.total_users as feature_user_percentage
from all_users, main, features_users