{{ config(materialized='table') }}

SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    COUNT(*) AS total_orders,
    SUM(qty_product) AS total_products,
    ROUND(AVG(qty_product), 2) AS avg_products_per_order,
    SUM(order_net_sales) AS total_revenue,
    ROUND(AVG(order_net_sales), 2) AS avg_order_value

FROM {{ ref('fct_orders_2025_2026') }}

WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2027-01-01'

GROUP BY 1
ORDER BY 1