with teamCustomer as (
    select * from {{ ref('stg_zonocloud__team_customer')}}
),

paymentTransaction as (
    select * from {{ ref('stg_zonocloud__sales_payment_transaction')}}
)

salesPayments as (
    select 
        tc.teamMemberId AS teamMemberId,
        pt.sellerWorkspaceId AS workspaceId,
        DATE(convert_tz(pt.paymentDate, '+00:00', '+05:30')) AS paymentDate,
        COUNT(pt.id) as countTransactions,
        SUM(pt.amountPaid) as valueTransactions
    from 
        paymentTransaction pt inner join teamCustomer tc on pt.inviteId = tc.customerId
    group by
        tc.teamMemberId    
)

select * from salesPayments