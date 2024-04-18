WITH source AS (
    SELECT state, createdAt
    FROM {{ source('commerceservice', 'order') }} 
    WHERE createdAt > DATEADD(DAY, -2, GETDATE())
)

select * from source
