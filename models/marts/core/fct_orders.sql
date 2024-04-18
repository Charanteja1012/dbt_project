with final as (
        SELECT state, 
        COUNT(*) AS state_count, 
        CURRENT_TIMESTAMP AS execution_timestamp,createdAt
        FROM {{ ref('stg_orders') }}
        GROUP BY state,createdAt
        ORDER BY createdAt
        
)

select * from final
