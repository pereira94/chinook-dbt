with payments as (
    select InvoiceId
            ,Total
    from {{ source('chinook', 'invoice') }}
)

select *
from payments