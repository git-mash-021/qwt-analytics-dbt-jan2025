{{config(materialized='table',
        transient=false, 
        schema=env_var('DBT_STAGESCHEMA', 'staging')
        )
}}

select *
from
{{source('qwt_raw','raw_products')}}