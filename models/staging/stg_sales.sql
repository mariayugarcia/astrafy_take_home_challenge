WITH source AS (

    SELECT
        order_id,
        product_id,
        quantity

    FROM {{ source('raw', 'sales') }}

)

SELECT *
FROM source
WHERE order_id IS NOT NULL
