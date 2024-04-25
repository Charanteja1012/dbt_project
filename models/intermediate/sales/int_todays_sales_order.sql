with invite as (
    select * from {{ ref('stg_zonocloud__invites') }}
),

todaysOrders as (
    select * from {{ ref('stg_commerceservice__todays_orders')}}
),

final as (
    SELECT
        i.id as salesTeamMemberId,
        i.senderUserId,
        o.state,
        o.orderPlacedAt,
        o.id,
        o.total
    FROM  
        invite i 
    JOIN 
        todaysOrders o ON i.invitedUserId = o.createdBy
)


select * from final