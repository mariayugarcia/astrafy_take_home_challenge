{{ config(materialized='table') }}

SELECT
    order_date,
    customer_id,
    order_id,
    order_net_sales,
    sales_net_sales,
    qty_product,
    distinct_products

FROM {{ ref('int_order_metrics') }}

WHERE order_date >= DATE '2025-01-01'
  AND order_date < DATE '2027-01-01'