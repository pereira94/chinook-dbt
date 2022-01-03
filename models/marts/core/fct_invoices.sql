with invoices as  (
    select * from {{ ref('stg_invoices' )}}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

final as (

    select
        invoices.InvoiceID
        ,invoices.CustomerID
        ,invoices.InvoiceDate
        ,payments.Total
    from invoices
    left join payments on invoices.InvoiceID = payments.InvoiceID
)

select * from final