with payments as (

  select * from {{ ref('stg_payments') }}

),

orders as (

  select * from {{ ref('stg_orders') }}

),

final as (

  select
      orders.id as order_id,
      orders.customer_id as customer_id,
      sum(amount) as amount
  from payments
    join orders on payments.order_id = orders.id
  group by 1,2



)

select * from final
