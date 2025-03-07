{{config(materialized='table',schema=env_var('DBT_STAGESCHEMA', 'staging'))}}

select 
    orderid,
    lineno,
    shipperid,
    customerid,
    productid,
    employeeid,
    to_date(split_part(shipmentdate,' ',1)) as shipmentdate,
    status
  from
 {{source("qwt_raw","raw_shippments")}}