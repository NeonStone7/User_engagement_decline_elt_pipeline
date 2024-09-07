select 
user_id,
case when CHURN_DATE is null then '2024-01-01' else CHURN_DATE end as CHURN_DATE, 
case when SATISFACTION_SCORE is null then 0 else SATISFACTION_SCORE end as SATISFACTION_SCORE

from {{ ref('stg_churn') }}

