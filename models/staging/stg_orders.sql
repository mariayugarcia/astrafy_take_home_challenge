{{ config(materialized='view') }}

SELECT
    CAST(date_date AS DATE) AS order_date,
    CAST(customers_id AS VARCHAR) AS customer_id,
    CAST(orders_id AS VARCHAR) AS order_id,
    CAST(net_sales AS DOUBLE) AS net_sales
FROM read_csv_auto(
    'C:/Users/ymari/OneDrive/Documentos/astrafy-take-home/data/orders_recrutement.csv',
    header=true
)