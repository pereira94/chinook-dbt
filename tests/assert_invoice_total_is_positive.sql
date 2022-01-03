with payments as (
    select *
    from {{ ref('stg_payments') }}
)

select 
    InvoiceID
    ,sum(Total) as total
from payments
group by InvoiceID
having total < 0