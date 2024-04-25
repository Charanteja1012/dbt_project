with payments as (
    select * from {{ ref('stg_zonocloud__payment_transaction')}}
),

paymentTransaction as (
    select 
        sellerWorkspaceId as workspaceId,
        inviteId,
        DATE(convert_tz(paymentDate, '+00:00', '+05:30')) AS date,
        paymentMode,
        COUNT(id) as countTransactions,
        SUM(amountPaid) as valueTransactions
    from 
        payments
    group by 
        sellerWorkspaceId,inviteId,date
    order by 
        paymentDate desc           
)

select * from paymentTransaction