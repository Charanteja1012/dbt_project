with orders as (
    select * from {{ ref('stg_commerceservice__orders')}}
),

channels as (
    select * from {{ ref('stg_commerceservice__channels')}}
),

final as (
    select
    o.fullFillmentLocationId,
    o.headDivisionId,
    o.id,
    o.state,
    DATE(convert_tz(o.orderPlacedAt, '+00:00', '+05:30')) AS orderDate,
    o.subTotal,
    c.token

    from orders o left join channels c on o.channelId = c.id

)

select * from final