{{
    config(
        materialized='table'
    )
}}

Select 
    --from raw_orders
    o.OrderId,
    o.OrderDate,
    o.Shipdate,
    o.Shipmode,        
    o.OrderSellingPrice - o.OrderCostPrice as OrderProfit,
    o.OrderCostPrice,
    o.OrderSellingPrice,
    --from raw customers
    c.customername,
    c.segment,
    c.country,
    --from raw product
    p.category,
    p.productname,
    p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }}  as c on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p on o.productid = p.productid