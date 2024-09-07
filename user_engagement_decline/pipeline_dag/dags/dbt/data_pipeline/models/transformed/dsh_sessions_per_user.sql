-- Frequency of Use (Sessions per User): The number of sessions per user over a given period (daily, weekly, or monthly)

with main as (select *,
trunc(session_start, 'day') as session_day,
trunc(session_start, 'month') as session_month

from {{ ref('int_SESSION_DATA') }}),

all_daily_sessions as (select user_id, session_day,
count(distinct session_id) as daily_sessions

from main

group by user_id, session_day

order by user_id),

all_monthly_sessions as 
(select user_id, session_month,
count(distinct session_id) as monthly_sessions

from main

group by user_id, session_month

order by user_id)

select avg(all_daily_sessions.daily_sessions) as avg_daily_sessions,
avg(all_monthly_sessions.monthly_sessions) as avg_monthly_sessions
from all_monthly_sessions, all_daily_sessions


