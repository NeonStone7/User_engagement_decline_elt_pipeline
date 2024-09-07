select *
FROM
{{ source('raw_SESSION_DATA', 'SESSION_DATA') }}