select
    id,
    user_id as customer_id,
    order_date,
    status
from raw.jaffle_shop.orders
