{{config(materialized='table', schema='transforming', sql_header='use warehouse compute_wh;')}}

select 
c.customerid,
c.companyname,
c.contactname,
c.city,
c.country,
d.divisionname,
c.address,
c.fax,
c.phone,
c.postalcode,
IFF(stateprovince='','NA', stateprovince) as statename
FROM
{{ref('stg_customers')}} as c inner join {{ref('lkp_divisions')}} as d
on c.divisionid=d.divisionid

/* select * exclude(stateprovince) , 
          iff(stateprovince='', 'NA',stateprovince) statename 
   from {{ ref('stg_customers') }} 
*/

