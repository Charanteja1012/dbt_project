with source as (
    select * from {{ source('zonocloud', 'fulfillmentlocation')}}
),

fulFillmentLocations as (
    select 
        cityName 
    from 
        source
)

select * from fulFillmentLocations