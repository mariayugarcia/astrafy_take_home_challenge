SELECT
    order_id,
    customer_id,
    order_date,
    previous_orders_12m,
    order_segmentation

FROM {{ ref('fct_orders_2026_segmented') }}

WHERE
    (
        previous_orders_12m = 0
        AND order_segmentation != 'New'
    )
    OR
    (
        previous_orders_12m BETWEEN 1 AND 3
        AND order_segmentation != 'Returning'
    )
    OR
    (
        previous_orders_12m >= 4
        AND order_segmentation != 'VIP'
    )