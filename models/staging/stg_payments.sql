select
    id,
    "orderID" as order_id,
    "paymentMethod" as payment_method,
    amount / 100 as amount,
    created as created_on
from raw.stripe.payment
