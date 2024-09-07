select 
c1 as user_id,
c2 as feedback_date,
c3 as rating

from {{ ref('stg_CUSTOMER_FEEDBACK') }}

where c1 != 'user_id'
and c3 is not null
 