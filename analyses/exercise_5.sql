SELECT
    order_id,
    client_id,
    order_date,
    previous_orders_12m,

    CASE
        WHEN previous_orders_12m = 0
            THEN 'New'

        WHEN previous_orders_12m BETWEEN 1 AND 3
            THEN 'Returning'

        ELSE 'VIP'
    END AS order_segmentation

FROM {{ ref('int_order_history') }}

WHERE order_date >= '2026-01-01'
  AND order_date < '2027-01-01'

ORDER BY order_date, order_id
