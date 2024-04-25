with customers as (
    select * from {{ ref('stg_commerceservice__customers')}}
),

with orders as (
    select * from {{ ref('int_orders')}}
),

final as (
    select
    o.fullFillmentLocationId
    o.headDivisionId,
    o.state,
    o.id,
    o.orderDate,
    o.subTotal
    o.token,
    c.inviteId

    from orders o left join customers c on o.customerId = c.id

)

select * from final