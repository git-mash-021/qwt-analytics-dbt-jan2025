{{config(materialized='view', schema='salesmart')}}

{% set min_order_date=get_min_orderdate() %}
{% set max_order_date=get_max_orderdate() %}

{{ dbt_date.get_date_dimension(min_order_date, max_order_date) }}

/*
{% set min_order_date='2007-04-19'%}
{% set max_order_date='2012-04-02'%}
{{ dbt_date.get_date_dimension(min_order_date, max_order_date) }}
{{ dbt_date.get_date_dimension("2015-01-01", "2022-12-31") }}
*/