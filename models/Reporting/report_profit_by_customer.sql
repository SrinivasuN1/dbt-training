{{
    config(
        materialized='table'
    )
}}
select 
    s.customerid,
    s.segment,
    s.country,
    sum(s.orderprofit) as profit
from {{ ref('stg_orders') }} as s
group by 
    s.customerid,
    s.segment,
    s.country