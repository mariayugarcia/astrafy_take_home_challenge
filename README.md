# Astrafy Take-Home Challenge

## Overview

This repository contains my solution to the Astrafy Take-Home Challenge.

The project uses dbt and BigQuery to transform order and sales data
into business-ready models and exposes the resulting data through
a LookML semantic layer.

## Project Structure

- `models/staging`: cleaning and standardization of source data
- `models/intermediate`: intermediate transformations
- `models/marts`: business-ready models
- `analyses`: SQL queries corresponding to the challenge exercises
- `tests`: data quality tests
- `macros`: reusable dbt macros
- `lookml`: semantic layer

## Data Model

The project follows a simple three-layer architecture:

Raw Data
→ Staging
→ Intermediate
→ Marts

The staging layer contains cleaned source data.

The intermediate layer calculates order-level product quantities
and customer order history.

The mart layer contains the final business-ready order tables.

## Customer Segmentation

Orders are segmented according to the number of orders made by the
same customer during the previous 12 months:

- New: 0 previous orders
- Returning: 1–3 previous orders
- VIP: 4 or more previous orders

The current order is not included in the calculation.

## Data Quality

The project includes `not_null`, `unique` and `accepted_values`
tests, as well as a singular test for customer segmentation.

## BigQuery Performance

The final order models are partitioned by `order_date` and clustered
by `client_id`.

Partitioning helps reduce data scanned by time-based queries.
Clustering supports customer-level queries used in the segmentation
logic.

## LookML

The LookML semantic layer exposes business-oriented dimensions and
measures such as:

- Orders
- Total products
- Average products per order
- Customer segmentation
- Order date

Technical fields are hidden where appropriate and business
definitions are included in descriptions to provide context for
natural-language queries.

## Dashboard

The dashboard focuses on:

- Order volume
- Product volume
- Average products per order
- Customer segmentation
- New vs Returning vs VIP customers
- Monthly trends

## Data Availability

The challenge description states that the provided data covers
2022–2023, while the exercises request results for 2025 and 2026.

I therefore did not fabricate data for the requested years.
The transformations are designed to work with 2025 and 2026 data
when those records are available.

 ---
***Data availability note**: The challenge description states that the provided data covers
2022–2023, while the exercises request results for 2025 and 2026.*

*I therefore did not fabricate data for the requested years.
The transformations are designed to work with 2025 and 2026 data
when those records are available.*
