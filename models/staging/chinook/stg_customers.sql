with customers as (
    select CustomerId
            ,FirstName
            ,LastName
    from {{ source('chinook', 'customer') }}
)

select * 
from customers