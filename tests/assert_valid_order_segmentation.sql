SELECT *

FROM {{ ref('fct_orders_2026') }}

WHERE order_segmentation NOT IN (
    'New',
    'Returning',
    'VIP'
)
