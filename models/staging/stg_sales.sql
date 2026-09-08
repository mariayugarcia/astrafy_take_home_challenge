WITH source AS (

    SELECT
        PARSE_DATE('%Y-%m-%d', date_date) AS sales_date,
        customer_id,
        order_id,
        products_id AS product_id,
        net_sales,
        qty
    FROM {{ source('raw', 'sales_recrutement') }}

)

SELECT *
FROM source
WHERE order_id IS NOT NULL
