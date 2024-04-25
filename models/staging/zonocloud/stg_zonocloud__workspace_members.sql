with source as (
    select * from {{ source('zonocloud', 'workspacemembers') }}
),

workspaceMembers as (
    select 
        workspaceId,
        userId 
    from 
        source 
)

select * from workspaceMembers

