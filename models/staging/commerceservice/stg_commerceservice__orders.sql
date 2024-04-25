with source as (
    select * from {{ source('commerceservice', 'order')}}
),

orders as (
    select 
        fullFillmentLocationId,
        headDivisionId,
        id,
        state,
        subTotal 
    from 
        source 
    where 
        DATE(orderPlacedAt) >= '%2024-04-24%'
)

select * from orders