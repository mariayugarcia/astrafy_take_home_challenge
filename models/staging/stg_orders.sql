WITH source AS (

    SELECT
        orders_id AS order_id,
        customers_id AS customer_id,
        date_date AS order_date,
        net_sales
    FROM {{ source('raw', 'orders_recrutement') }}

)

SELECT *
FROM source
WHERE order_id IS NOT NULL
