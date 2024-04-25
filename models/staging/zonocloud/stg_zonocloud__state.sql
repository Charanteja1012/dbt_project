with source as (
    select * from {{ source('zonocloud', 'state')}}
),

state as (
    select 
        name 
    from 
        source
)

select * from state