select *
FROM
{{ source('raw_CUSTOMER_FEEDBACK', 'CUSTOMER_FEEDBACK') }}