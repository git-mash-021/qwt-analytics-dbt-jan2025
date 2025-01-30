{{ config(materialized = 'incremental',schema=env_var('DBT_STAGESCHEMA', 'staging'), unique_key='orderid') }}
 

select * from
{{source('qwt_raw','raw_orders')}}
 
{% if is_incremental() %}
 
where orderdate > (select max(orderdate) from {{this}})
 
{% endif %}