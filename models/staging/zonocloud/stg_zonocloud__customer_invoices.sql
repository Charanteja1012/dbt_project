with source as (
    select * from {{ source('zonocloud', 'invoices')}}
),

invoices as (
    select 
        dueDate,
        workspaceId,
        inviteId,id,
        paidAmount,
        invoiceAmount,
        createdDate
    from 
        source 
    where 
        createdDate >= '2024-04-24'    
)

select * from invoices

