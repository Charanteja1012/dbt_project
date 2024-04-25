with source as (
    select * from {{ source('commerceservice', 'channel')}}
),

channel as (
    select 
        token 
    from 
        source
)

select * from channel