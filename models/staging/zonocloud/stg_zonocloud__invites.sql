with source as (
    select * from {{ source('zonocloud', 'invite') }}
),

invite as (
    select 
        id, 
        userType,
        invitedUserId,senderUserId 
    from 
        source 
    where 
        userType = 'Sales'
)

select * from invite