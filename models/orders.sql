with payments as (

  select * from {{ ref('stg_payments') }}

),

orders as (

  select * from {{ ref('stg_orders') }}

),

order_payments as (

  select
      orders.id as order_id,
      sum(amount) as amount
  from payments
    join orders on payments.order_id = orders.id
  group by 1



),

final as (

  select
      orders.id,
      orders.customer_id,
      orders.order_date,
      orders.status,
      coalesce(order_payments.amount, 0) as amount
  from orders
    join order_payments on orders.id = order_payments.order_id

)

select * from final
