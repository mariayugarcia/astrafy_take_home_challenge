{{ config(materialized='table') }}

WITH orders AS (

    SELECT
        order_date,
        customer_id,
        order_id,
        order_net_sales,
        sales_net_sales,
        qty_product,
        distinct_products
    FROM {{ ref('fct_orders_2025_2026') }}

),

orders_2026 AS (

    SELECT *
    FROM orders
    WHERE order_date >= DATE '2026-01-01'
      AND order_date < DATE '2027-01-01'

),

orders_with_history AS (

    SELECT
        current_order.order_date,
        current_order.customer_id,
        current_order.order_id,
        current_order.order_net_sales,
        current_order.sales_net_sales,
        current_order.qty_product,
        current_order.distinct_products,

        COUNT(previous_order.order_id) AS previous_orders_12m

    FROM orders_2026 AS current_order

    LEFT JOIN orders AS previous_order
        ON current_order.customer_id = previous_order.customer_id
        AND previous_order.order_date >= current_order.order_date - INTERVAL '12 months'
        AND previous_order.order_date < current_order.order_date

    GROUP BY
        current_order.order_date,
        current_order.customer_id,
        current_order.order_id,
        current_order.order_net_sales,
        current_order.sales_net_sales,
        current_order.qty_product,
        current_order.distinct_products

)

SELECT
    order_date,
    customer_id,
    order_id,
    order_net_sales,
    sales_net_sales,
    qty_product,
    distinct_products,
    previous_orders_12m,

    CASE
        WHEN previous_orders_12m = 0 THEN 'New'
        WHEN previous_orders_12m BETWEEN 1 AND 3 THEN 'Returning'
        WHEN previous_orders_12m >= 4 THEN 'VIP'
    END AS order_segmentation

FROM orders_with_history