with state as (
    select * from {{ ref('stg_zonocloud__state')}}
),

location as (
    select * from {{ ref('int_fulfillmentlocation_orders')}}
),

final as (
    select 
        o.inviteId as customerId
        o.fullFillmentLocationId as cfaId,
        o.headDivisionId as headDivisionId,
        s.name as state
        o.cityName as city
        count(o.id) as noOfOrders
        o.state as status
        o.orderDate as orderDate
        o.token as sellerWorkspaceId,
        sum(o.subTotal) as totalValue

    from 
        locations o left join state s on s.id = o.stateId
    group by 
        customerId,status,sellerWorkspaceId,cfaId,DATE(convert_tz(o.orderPlacedAt, '+00:00', '+05:30'))

)

select * from final

