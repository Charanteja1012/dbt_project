with locations as (
    select * from {{ ref('stg_zonocloud_fulfillment_locations')}}
),

with order as (
    select * from {{ ref('int_customer_orders')}}
),

final as (
    select o.fullFillmentLocationId
    o.headDivisionId,
    o.state,
    o.id,
    o.orderDate,
    o.subTotal,
    o.token,
    o.inviteId,
    fl.cityName

    from order o left join locations fl on fl.id = o.fullFillmentLocationId
)

select * from final