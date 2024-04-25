with invoices as (
    select * from {{ ref('stg_zonocloud__invoices') }}
), 

inviteDetails as (
    select * from {{ ref('stg_zonocloud__invite_details') }}
),

dueByCustomer as (
    select 
        i.dueDate as dueDate,
        i.workspaceId as workspaceId,
        i.inviteId as inviteId,
        count(i.id) as noOfInvoices,
        sum(i.paidAmount - i.invoiceAmount) as amount 
    from 
        invoices i left join inviteDeatils id on id.inviteId = i.inviteId   
    group by 
        i.inviteId,i.workspaceId
    order by 
        i.createdDate desc    
)

select * from dueByCustomer