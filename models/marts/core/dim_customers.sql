with customers as (
    select *
    from {{ ref('stg_customers') }}
)

, invoices as (
    select *
    from {{ ref('fct_invoices') }}
)

, customer_invoices as (
    select CustomerId 
            ,min(InvoiceDate) as first_order
            ,max(InvoiceDate) as last_order
            ,count(InvoiceId) as number_of_orders
            ,sum(Total) as lifetime_value
    from invoices
    group by 1 
)

, final as (
    select customer_invoices.CustomerId
            ,customers.FirstName
            ,customers.LastName
            ,customer_invoices.first_order
            ,customer_invoices.last_order
            ,date_diff(customer_invoices.last_order, customer_invoices.first_order, day) as days_as_customer
            ,customer_invoices.number_of_orders
            ,customer_invoices.lifetime_value 
    from customer_invoices 
    left join customers on customer_invoices.CustomerId = customers.CustomerId
)

select * 
from final
