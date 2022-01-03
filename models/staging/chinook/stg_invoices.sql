with invoices as (
    select InvoiceId
            ,CustomerId
            ,InvoiceDate
    from {{ source('chinook', 'invoice') }}
)

select *
from invoices