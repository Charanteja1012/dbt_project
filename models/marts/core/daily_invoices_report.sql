with invoices as (
    select * from {{ ref('stg_zonocloud__invoices')}}
),

final as (
    select 
        workspaceId,
        DATE(convert_tz(invoiceDate, '+00:00', '+05:30')) AS date,  
        count(id) as countInvoices,
        SUM(invoiceAmount) as valueInvoices,  
	    inviteId
    from invoices    
    group by workspaceId,inviteId,date

)

select * from final