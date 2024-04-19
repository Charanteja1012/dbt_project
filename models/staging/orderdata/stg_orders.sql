WITH source AS (
    SELECT state, createdAt,orderPlacedAt
    FROM {{ source('commerceservice', 'order') }} 
    WHERE createdAt BETWEEN DATE_TRUNC('day', CURRENT_TIMESTAMP) - INTERVAL '1 day' AND DATE_TRUNC('day', CURRENT_TIMESTAMP)
)

SELECT * FROM source


