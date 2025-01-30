{{config(materialized='table',
        transient=false, 
        schema=env_var('DBT_STAGESCHEMA', 'staging'),
        post_hook='create or replace table staging.stg_products_test(x string)'
)
}}

select *
from
{{source('qwt_raw','raw_products')}}