with final as (
        SELECT state, 
        COUNT(*) AS state_count, 
        CURRENT_TIMESTAMP AS execution_timestamp,
        orderPlacedAt
        FROM {{ ref('stg_orders') }}
        GROUP BY state,orderPlacedAt
        
)

select * from final
