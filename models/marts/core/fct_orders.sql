with orders as (

    select 
        order_id,
        customer_id
    
    from {{ ref('stg_orders')}}

),

payments as (
    
select
    order_id,
    amount

from {{ ref('stg_payments') }}

)

select
    orders.customer_id,
    orders.order_id,
    payments.amount

from 
    orders 
    join payments
        on orders.order_id = payments.order_id    