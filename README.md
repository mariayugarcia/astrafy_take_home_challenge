# Astrafy Take-Home

## Project Overview

This project implements an end-to-end analytics solution for e-commerce order data, including data transformation with dbt, data quality testing, customer segmentation and a Looker Studio dashboard.

## Dashboard

[View the Looker Studio Dashboard](PASTE_YOUR_LOOKER_STUDIO_LINK_HERE)

## Project Structure

### Part 1 — Data Transformation

The data transformation pipeline was developed using dbt following a Staging → Intermediate → Marts architecture.

The project includes:

- Staging models for orders and sales
- Intermediate order-level metrics
- Order-level fact tables
- 2025–2026 order dataset
- 2026 customer segmentation
- Monthly 2026 aggregation
- Generic data quality tests
- Singular business logic test for order segmentation

### Part 2 — LookML

The repository also contains the LookML structure required for Looker deployment, including:

- Model file
- Explores
- Order-level view
- Monthly aggregation view
- Business dimensions
- Measures
- Customer segmentation
- Descriptions for business-facing fields

### Part 3 — Design Challenge

The marketing e-commerce dashboard was designed in Looker Studio to monitor:

- Orders
- Net Revenue
- Average Order Value
- Customers
- Daily Revenue
- Daily Orders
- Monthly Revenue
- Customer Segmentation
- Sales Forecast

## Data Quality

An orphan sales record was identified in the source data. The order-level model uses the orders dataset as the master order table and a left join to sales, preventing unmatched sales records from creating invalid orders.

## Key 2026 Results

- Total orders: 2,573
- New customers/orders: 1,087
- Returning: 794
- VIP: 692
- Highest monthly order volume: November
- Highest average products per order: April

## dbt Validation

The final dbt build completed successfully with:

- 7 models
- 54 data tests
- 61 total build steps
- 0 errors
- 0 warnings

## Repository

This repository contains the complete technical implementation for the coding and LookML challenges.
