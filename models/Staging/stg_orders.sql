{{
    config(
        materialized='table'
    )
}}

Select 
    {{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_orders,
    --from raw_orders
    o.OrderId,
    o.OrderDate,
    o.Shipdate,
    o.Shipmode,        
    o.OrderSellingPrice - o.OrderCostPrice as OrderProfit,
    o.OrderCostPrice,
    o.OrderSellingPrice,
    --from raw customers
    c.customerid,
    c.customername,
    c.segment,
    c.country,
    --from raw product
    p.category,
    p.productid,
    p.productname,
    p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }}  as c on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p on o.productid = p.productid