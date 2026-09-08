{{ config(materialized='table') }}

WITH sales_by_order AS (

    SELECT
        order_id,
        SUM(net_sales) AS sales_net_sales,
        SUM(quantity) AS total_quantity,
        COUNT(DISTINCT product_id) AS distinct_products
    FROM {{ ref('stg_sales') }}
    GROUP BY order_id

),

orders AS (

    SELECT
        order_date,
        customer_id,
        order_id,
        net_sales
    FROM {{ ref('stg_orders') }}

)

SELECT
    o.order_date,
    o.customer_id,
    o.order_id,
    o.net_sales AS order_net_sales,
    COALESCE(s.sales_net_sales, 0) AS sales_net_sales,
    COALESCE(s.total_quantity, 0) AS total_quantity,
    COALESCE(s.distinct_products, 0) AS distinct_products

FROM orders AS o

LEFT JOIN sales_by_order AS s
    ON o.order_id = s.order_id