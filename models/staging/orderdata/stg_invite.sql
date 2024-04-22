SELECT id, userType,invitedUserId,senderUserId
FROM {{ source('zonocloud', 'invite') }} 
WHERE userType = 'Sales'
