with invoice as (
    select * from {{ ref('stg_zonocloud__invoices')}}
),

teamCustomer as (
    select * from {{ ref('stg_zonocloud__team_customer')}}
)

salesInvoices as (
    select 
        i.workspaceId as workspaceId,
        DATE(convert_tz(i.invoiceDate, '+00:00', '+05:30')) AS invoiceDate,
        COUNT(i.id) as countInvoices,
        (SUM(i.invoiceAmount)) as valueInvoices,
        tc.teamMemberId AS teamMemberId 
    from 
        invoice i inner join teamCustomer tc on i.inviteId = tc.customerId   
    group by 
        tc.teamMemberId,i.workspaceId,invoiceDate         
)


select * from salesInvoices