WITH source AS (
    SELECT state, createdAt
    FROM {{ source('commerceservice', 'order') }}
    WHERE DATE(createdAt) = CURRENT_DATE
)


select * from source


