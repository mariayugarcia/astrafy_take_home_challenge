SELECT
    order_id,
    SUM(quantity) AS qty_product

FROM {{ ref('stg_sales') }}

GROUP BY order_id
