select 
user_id,
case when SIGNUP_DATE is null then '2024-01-01' else SIGNUP_DATE end as SIGNUP_DATE,
country,
case when age<=0 or age>=100 then 56 else age end as age,
case when gender is null then 'Unknown' else gender end as gender,
case when DEVICE is null then 'Unknown' else DEVICE end as DEVICE

from {{ ref('stg_USERS') }}