WITH source AS (
    SELECT state, createdAt
    FROM {{ source('commerceservice', 'order') }} 
    WHERE createdAt > CURRENT_TIMESTAMP - INTERVAL '1 hour'
)

select * from source
