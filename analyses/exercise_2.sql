SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    COUNT(DISTINCT order_id) AS number_of_orders

FROM {{ ref('stg_orders') }}

WHERE order_date >= '2026-01-01'
  AND order_date < '2027-01-01'

GROUP BY 1
ORDER BY 1
