select 
user_id,
case when DATE is null then '2024-01-01' else DATE end as engagement_DATE,
SESSION_DURATION,
ACTION,
CONVERSION

from {{ ref('stg_USER_ENGAGEMENT') }}

where SESSION_DURATION > 0
and CONVERSION is not null

limit 100000 --manipulated to show engagement decline