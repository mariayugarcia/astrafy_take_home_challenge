SELECT *
FROM {{ ref('fct_orders') }}
ORDER BY order_date, order_id
