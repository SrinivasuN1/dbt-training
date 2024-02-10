{{
    config(
        materialized='table'
    )
}}
select *
from RAW_DB.GLOBALMART_SCHEMA.PRODUCT