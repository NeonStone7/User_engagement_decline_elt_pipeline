select 
user_id,SESSION_ID, session_start, session_end,
SESSION_TYPE

from {{ ref('stg_SESSION_DATA') }}

where session_start is not null
and session_end is not null
and SESSION_TYPE is not null
