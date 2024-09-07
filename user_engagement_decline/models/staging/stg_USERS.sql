select *
FROM
{{ source('raw_USERS', 'USERS') }}