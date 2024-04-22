select id,state,total,createdBy,orderPlacedAt 
from {{ source('commerceservice', 'order') }} where orderPlacedAt > '2024-04-20'

