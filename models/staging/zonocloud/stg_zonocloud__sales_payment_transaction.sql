with source as (
    select * from {{ source('zonocloud', 'paymenttransaction')}}
),

paymentTransaction as (
    select 
        sellerWorkspaceId,
        inviteId,
        paymentDate,
        paymentMode,
        id,
        amountPaid
    from
        source
    where 
        status != 'F' and status != 'N' and createdDate >= '2024-04-23'
          
)

select * from paymentTransaction