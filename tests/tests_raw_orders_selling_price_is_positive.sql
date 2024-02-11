with 
orders as (
    select 
        *
    from {{ ref('raw_orders') }}
)
select 
    O.Orderid,
    sum(ORDERSELLINGPRICE) as total_sp
from orders as O
group by Orderid
having total_sp<0