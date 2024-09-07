-- Churn Rate: The percentage of users who stop using the product over a specific time period( a month, 6 months). 
with main as 
(select user.user_id, user.signup_date, 
churn.CHURN_DATE,
{{ difference_in_dates("user.signup_date", "churn.CHURN_DATE", 'month') }} as churn_months_after_signup

from {{ ref('int_users') }} user

left join {{ ref('int_churn') }} churn
on churn.user_id = user.user_id
where user.signup_date <= churn.CHURN_DATE),

churn_within_one_month as 
(
select count(distinct user_id)as num_users_within_one_month from main where churn_months_after_signup <=1 
),

churn_within_six_month as 
(
select count(distinct user_id) as num_users_within_six_months from main where churn_months_after_signup <=6
),

churn_greater_than_six_months as 
(
select count(distinct user_id) as num_users_greater_than_six_months from main where churn_months_after_signup > 6
),

total_users as (select count(distinct user_id) as all_users from {{ ref('int_users') }})

select 
(churn_greater_than_six_months.num_users_greater_than_six_months * 1.0 )/ total_users.all_users as per_user_churn_after_six_months,
(churn_within_six_month.num_users_within_six_months * 1.0 )/ total_users.all_users as per_user_churn_within_six_months,
(churn_within_one_month.num_users_within_one_month * 1.0 )/ total_users.all_users as per_user_churn_within_one_month

from churn_within_six_month, churn_greater_than_six_months, churn_within_one_month, total_users




