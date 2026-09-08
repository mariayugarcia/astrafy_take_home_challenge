{{ config(materialized='view') }}

SELECT
    CAST(date_date AS DATE) AS sales_date,
    CAST(customer_id AS VARCHAR) AS customer_id,
    CAST(order_id AS VARCHAR) AS order_id,
    CAST(products_id AS VARCHAR) AS product_id,
    CAST(net_sales AS DOUBLE) AS net_sales,
    CAST(qty AS INTEGER) AS quantity
FROM read_csv_auto(
    'C:/Users/ymari/OneDrive/Documentos/astrafy-take-home/data/sales_recrutement.csv',
    header=true
)