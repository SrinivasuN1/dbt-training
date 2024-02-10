{{
    config(
        materialized='table'
    )
}}

Select *
from RAW_DB.GLOBALMART_SCHEMA.ORDERS
