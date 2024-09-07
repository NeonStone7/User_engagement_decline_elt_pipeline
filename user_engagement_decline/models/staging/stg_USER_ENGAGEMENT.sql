select *
FROM
{{ source('raw_USER_ENGAGEMENT', 'USER_ENGAGEMENT') }}