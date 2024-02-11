{{
    config(
        materialized='table'
    )
}}
Select 
    s.productid,
    s.productname,
    s.category,
    s.subcategory,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }} as s
group by 
    s.productid,
    s.productname,
    s.category,
    s.subcategory