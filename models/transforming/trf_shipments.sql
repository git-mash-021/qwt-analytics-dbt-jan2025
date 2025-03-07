{{config(materialized='table', schema=env_var('DBT_TRANSFORMSCHEMA', 'transforming'))}}

select 
    sh.orderid,
    sh.lineno,
    sp.companyname,
    sh.shipmentdate,
    sh.status
from
    {{ref('shipment_snapshot')}} as sh left join
    {{ref('lkp_shippers')}} sp on sh.shipperid=sp.shipperid
where
    sh.dbt_valid_to is null