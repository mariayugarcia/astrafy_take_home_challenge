SELECT
    COUNT(DISTINCT order_id) AS number_of_orders

FROM {{ ref('stg_orders') }}

WHERE EXTRACT(YEAR FROM order_date) = 2026
