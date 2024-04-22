MERGE INTO {{ ref('salesOrderReport') }} AS target
USING (
    SELECT * FROM {{ ref('stg_todaysSalesOrderReport') }}
) AS source
ON 
    target.salesTeamMemberId = source.salesTeamMemberId 
    AND target.state = source.state 
    AND target.orderDate = source.orderDate
WHEN MATCHED THEN
    UPDATE SET
        noOfOrders = source.noOfOrders,
        totalValue = source.totalValue
WHEN NOT MATCHED THEN
    INSERT (salesTeamMemberId, sellerWorkspaceId, state, orderDate, noOfOrders, totalValue)
    VALUES (source.salesTeamMemberId, source.sellerWorkspaceId, source.state, source.orderDate, source.noOfOrders, source.totalValue);
