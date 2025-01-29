{{config(materialized='table',
        transient=false, 
        schema="{{env_var('DBT_STAGINGSCHEMA','staging)}}"),
        post_hook='create table staging.stg_products_test clone staging.stg_products_hook;')
}}

select *
from
{{source('qwt_raw','raw_products')}}