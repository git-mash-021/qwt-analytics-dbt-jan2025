{{config(materialized='table',schema=env_var('DBT_TRANSFORMSCHEMA', 'transforming'))}}

 select o.orderid,
        od.lineno,
        od.productid,
        o.customerid,
        o.orderdate,
        o.employeeid,
        o.shipperid,
        od.quantity,
        od.unitprice,
        od.discount, 
        to_decimal((p.unitprice*od.quantity)*(1- od.discount )) as linesalesamount,
        to_decimal((p.unitcost*od.quantity)) as costofgoodssold,
        to_decimal((od.unitprice*od.quantity)*((1 - od.discount) - (p.unitcost*od.quantity))) as margin
        from {{ref('stg_orders')}} as o inner join {{ref('stg_orderdetails')}} as od 
        on (o.orderid=od.orderid)
        inner join 
        {{ref('stg_products')}} as p on (p.productid=od.productid)