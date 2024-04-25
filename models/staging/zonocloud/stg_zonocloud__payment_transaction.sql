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
        status = 'P'      
)

select * from paymentTransaction