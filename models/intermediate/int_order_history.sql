SELECT
    o.order_id,
    o.client_id,
    o.order_date,
    COUNT(previous.order_id) AS previous_orders_12m

FROM {{ ref('stg_orders') }} o

LEFT JOIN {{ ref('stg_orders') }} previous
    ON o.client_id = previous.client_id
    AND previous.order_date < o.order_date
    AND previous.order_date >= DATE_SUB(
        o.order_date,
        INTERVAL 12 MONTH
    )

GROUP BY
    o.order_id,
    o.client_id,
    o.order_date
