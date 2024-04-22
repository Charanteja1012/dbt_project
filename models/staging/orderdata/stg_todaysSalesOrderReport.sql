WITH todaysOrdersByInviteId AS (
    SELECT
        i.id as salesTeamMemberId,
        i.senderUserId,
        o.state,
        o.orderPlacedAt,
        o.id,
        o.total
    FROM  
        {{ ref('stg_invite')}} i 
    JOIN 
        {{ ref('stg_todaysOrders')}} o ON i.invitedUserId = o.createdBy
),

todaysSalesOrderReport AS (
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
        {{ ref('stg_workspacemembers')}} wsm ON t.senderUserId = wsm.userId
    GROUP BY 
        t.salesTeamMemberId, wsm.workspaceId, t.state, orderDate
)

SELECT * FROM todaysSalesOrderReport