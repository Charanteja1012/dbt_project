with source as (
    select * from {{ source('zonocloud', 'invoices')}}
),

invoices as (
    select 
        workspaceId,
        invoiceDate,
        id,
        invoiceAmount,
        inviteId
    from 
        source
    where 
        invoiceStatus != 'C' AND invoiceDate >= '2024-04-22 00:00:00'

)

select * from invoices