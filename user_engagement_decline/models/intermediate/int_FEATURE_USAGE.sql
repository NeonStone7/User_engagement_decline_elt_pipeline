select 
user_id,
feature_id,
case when DATE is null then '2024-01-01' else DATE end as Feature_use_DATE,
case when USAGE_COUNT<=0 then 1 else USAGE_COUNT end as USAGE_COUNT

from {{ ref('stg_FEATURE_USAGE') }}

