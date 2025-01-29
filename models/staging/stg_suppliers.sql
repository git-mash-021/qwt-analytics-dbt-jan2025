{{config(materialized='table',schema="{{env_var('DBT_STAGINGSCHEMA','staging)}}")}}

select * 
 from
{{source("qwt_raw","raw_suppliers")}}