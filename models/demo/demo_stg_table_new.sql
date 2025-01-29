{{ 
    config (
    database='demo_raw',
    schema='demo_schema',
    materialized = 'incremental',
    unique_key = ['x'],
    incremental_strategy='merge'
    )
}}

select * from demo_raw.demo_schema.demo_raw_table