{% macro difference_in_dates(start_column, end_column, date_type) %}
  
  DATEDIFF({{ date_type }}, {{ start_column }}, {{ end_column }})

{% endmacro %}
