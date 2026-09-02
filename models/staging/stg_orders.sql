WITH source AS (

    SELECT
        order_id,
        client_id,
        DATE(order_date) AS order_date

    FROM {{ source('raw', 'orders') }}

)

SELECT *
FROM source
WHERE order_id IS NOT NULL
