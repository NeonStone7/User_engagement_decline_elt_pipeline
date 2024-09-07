select *
FROM
{{ source('raw_FEATURE_USAGE', 'FEATURE_USAGE') }}