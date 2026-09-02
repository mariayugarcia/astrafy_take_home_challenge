{{ config(
    partition_by={
        "field": "order_date",
        "data_type": "date",
        "granularity": "month"
    },
    cluster_by=["client_id"]
) }}

SELECT
    o.order_id,
    o.client_id,
    o.order_date,
    COALESCE(p.qty_product, 0) AS qty_product

FROM {{ ref('stg_orders') }} o

LEFT JOIN {{ ref('int_order_products') }} p
    ON o.order_id = p.order_id

WHERE o.order_date >= '2025-01-01'
  AND o.order_date < '2027-01-01'
