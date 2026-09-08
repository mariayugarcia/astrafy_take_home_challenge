SELECT
    order_id,
    customer_id,
    order_date,
    net_sales,
    qty_product,
    order_segmentation

FROM {{ ref('fct_orders_2026') }}

ORDER BY order_date, order_id
