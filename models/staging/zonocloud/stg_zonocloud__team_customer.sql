with source as (
    select * from {{ source('zonocloud', 'teamcustomer') }}
),

teamCustomer as (
    select 
        teamMemberId,
        customerId
    from 
        source    

)

select * from teamCustomer