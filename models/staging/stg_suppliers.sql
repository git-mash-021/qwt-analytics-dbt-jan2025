{{config(materialized='table',schema='staging')}}

select * 
 from
{{source("qwt_raw","raw_suppliers")}}