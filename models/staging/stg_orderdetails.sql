{{ config(materialized = 'incremental', 
        unique_key= ['orderid', 'lineno'],
        schema=env_var('DBT_STAGESCHEMA', 'staging')) 
}}
 
select
 
od.*,
o.orderdate
 
from
 
{{source('qwt_raw', 'raw_orders')}} as o inner join
{{source('qwt_raw', 'raw_order_details')}} as od on o.orderid = od.orderid
 
{% if is_incremental() %}
 
where o.orderdate > (select max(orderdate) from {{this}} )
 
{% endif %}