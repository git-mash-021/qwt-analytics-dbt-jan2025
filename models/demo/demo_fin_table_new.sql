{{
    config(
        materialized='table',
        database='demo_raw',
        schema='demo_schema'
        )
}}

select * from {{ref("demo_stg_table_new")}}
union
select * from {{ref("demo_stg_table_new_1")}}
