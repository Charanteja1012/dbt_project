with source as (
    select * from {{ source('commerceservice', 'order') }}
),

todaysOrders as (
    select 
        id,
        state,
        total,
        createdBy,
        orderPlacedAt
    from 
        source
    where 
        orderPlacedAt = '2024-04-24 00:00:00'
)


select * from todaysOrders

