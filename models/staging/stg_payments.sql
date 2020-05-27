with payments as (

  select * from {{ source('stripe', 'payment')}}

),

final as (

select
    id,
    "orderID" as order_id,
    "paymentMethod" as payment_method,
    amount / 100 as amount,
    created as created_on
from payments

)

select * from final
