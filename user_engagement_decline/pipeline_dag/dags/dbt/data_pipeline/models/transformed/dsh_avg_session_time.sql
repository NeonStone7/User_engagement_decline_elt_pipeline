-- Average Session Duration: The average amount of time a user spends on the platform per session
with session_times as (select *,
TIMESTAMPDIFF('m', SESSION_START, SESSION_END) as session_time
from {{ ref('int_SESSION_DATA') }}),

avg_session_times as 
(select user_id, 
avg(session_time) as avg_session_time
from session_times
group by user_id)

select avg(avg_session_time) as avg_user_session_time_minutes
from avg_session_times 