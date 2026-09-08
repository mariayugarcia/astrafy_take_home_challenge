{{ config(
    partition_by={
        "field": "order_date",
        "data_type": "date",
        "granularity": "month"
    },
    cluster_by=["customer_id"]
) }}

SELECT
    h.order_id,
    h.customer_id,
    h.order_date,
    o.net_sales,
    COALESCE(p.qty_product, 0) AS qty_product,
    h.previous_orders_12m,

    CASE
        WHEN h.previous_orders_12m = 0 THEN 'New'
        WHEN h.previous_orders_12m BETWEEN 1 AND 3 THEN 'Returning'
        ELSE 'VIP'
    END AS order_segmentation

FROM {{ ref('int_order_history') }} h

LEFT JOIN {{ ref('int_order_products') }} p
    ON h.order_id = p.order_id

LEFT JOIN {{ ref('stg_orders') }} o
    ON h.order_id = o.order_id

WHERE h.order_date >= '2026-01-01'
  AND h.order_date < '2027-01-01'
