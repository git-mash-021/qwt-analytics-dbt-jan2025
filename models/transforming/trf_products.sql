{{config(materialized='table',schema=env_var('DBT_TRANSFORMSCHEMA', 'transforming'))}}

select 
        p.productid,
        p.productname,
        s.companyname as suppliercompany,
        s.contactname as suppliercontact,
        s.city as suppliercity,
        s.country as suppliercountry,
        c.categoryname,
        p.unitcost,
        p.unitprice,
        p.unitsinstock,
        p.unitsonorder,
        to_decimal(p.unitprice -p.unitcost,5,2) as profit,
        iff(p.unitsonorder > unitsinstock, 'Not Available','Available') as productavailability
 from 
 {{ ref('stg_products')}} as p left join {{ ref("trf_suppliers")}} as s 
 on p.supplierid=s.supplierid left join {{ ref("lkp_categories")}} as c
 on p.categoryid = c.categoryid
