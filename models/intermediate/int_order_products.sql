SELECT
    order_id,
    SUM(qty) AS qty_product
FROM {{ ref('stg_sales') }}
GROUP BY order_id
