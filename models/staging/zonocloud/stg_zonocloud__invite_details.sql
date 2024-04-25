with source as (
    select * from {{ source('zonocloud', 'invitedetails')}}
),

inviteDeatils as (
    select 
        inviteId 
    from 
        source
)

select * from inviteDeatils