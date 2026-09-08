SELECT
    order_id,
    customer_id,
    order_date,
    net_sales,
    qty_product

FROM {{ ref('fct_orders') }}

ORDER BY order_date, order_id
