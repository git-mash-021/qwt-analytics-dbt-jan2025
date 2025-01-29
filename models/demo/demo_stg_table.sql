{{
    config(
        materialized='incremental',
        database='demo_raw',
        schema='demo_schema',
        unique_key=['z','x'],
        pre_hook='truncate table demo_raw.demo_schema.demo_stg_table;'
    )
}}

select * from demo_raw.demo_schema.demo_raw_table

{% if is_incremental() %}
where z > (select max(z) from DEMO_RAW.DEMO_SCHEMA.DEMO_PUB_TABLE)
{% endif %}
