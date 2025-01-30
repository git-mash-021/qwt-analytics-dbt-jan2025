{{config(materialized='table', schema=env_var('DBT_STAGESCHEMA', 'staging'))}}

select * 
from
{{ source('qwt_raw','raw_customers')}}
