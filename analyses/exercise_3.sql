WITH order_products AS (

    SELECT
        order_id,
        SUM(quantity) AS qty_product

    FROM {{ ref('stg_sales') }}

    GROUP BY order_id

)

SELECT
    DATE_TRUNC(o.order_date, MONTH) AS month,
    AVG(op.qty_product) AS avg_products_per_order

FROM {{ ref('stg_orders') }} o

LEFT JOIN order_products op
    ON o.order_id = op.order_id

WHERE o.order_date >= '2026-01-01'
  AND o.order_date < '2027-01-01'

GROUP BY 1
ORDER BY 1
