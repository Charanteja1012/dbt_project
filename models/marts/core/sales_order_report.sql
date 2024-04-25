
{{
  config(
    materialized = 'incremental'
  )
}}


with todaysOrdersByInviteId as (
    select * from {{ ref('int_todays_sales_order')}}
),

workspaceMembers as (
    select * from {{ ref('stg_zonocloud__workspace_members') }}
),

todaysSalesOrderReport as (
    SELECT
        t.salesTeamMemberId,
        wsm.workspaceId AS sellerWorkspaceId,
        t.state,
        DATE_TRUNC('day', t.orderPlacedAt) AS orderDate,
        COUNT(t.id) AS noOfOrders,
        SUM(t.total) AS totalValue
    FROM
        todaysOrdersByInviteId t
    JOIN 
        workspaceMembers wsm ON t.senderUserId = wsm.userId
    GROUP BY 
        t.salesTeamMemberId, wsm.workspaceId, t.state, orderDate
)

select * 
from todaysSalesOrderReport

{% if is_incremental() %}

where orderDate >= (select max(orderDate) from {{ this }})

{% endif %}
