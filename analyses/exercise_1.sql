SELECT
    COUNT(DISTINCT order_id) AS number_of_orders

FROM {{ ref('stg_orders') }}

WHERE order_date >= '2026-01-01'
  AND order_date < '2027-01-01'
