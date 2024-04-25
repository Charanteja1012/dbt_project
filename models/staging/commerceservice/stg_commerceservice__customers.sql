

with source as (
    select * from {{ source('commerceservice', 'customer')}}
),

customer as (
    select 
        inviteId 
    from 
        source
)

select * from customer

