select *
FROM
{{ source('raw_CHURN', 'CHURN') }}