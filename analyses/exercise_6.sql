SELECT
    order_id,
    client_id,
    order_date,
    qty_product,
    order_segmentation

FROM {{ ref('fct_orders_2026') }}

ORDER BY order_date, order_id
