SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    COUNT(previous.order_id) AS previous_orders_12m

FROM {{ ref('stg_orders') }} o

LEFT JOIN {{ ref('stg_orders') }} previous
    ON o.customer_id = previous.customer_id
    AND previous.order_date < o.order_date
    AND previous.order_date >= DATE_SUB(
        o.order_date,
        INTERVAL 12 MONTH
    )

GROUP BY
    o.order_id,
    o.customer_id,
    o.order_date
