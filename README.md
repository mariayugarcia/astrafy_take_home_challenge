# Astrafy Take-Home

## Project Overview

This project implements an end-to-end analytics solution for e-commerce order data, covering data transformation with dbt, data quality testing, customer segmentation, LookML modeling, and a Looker Studio dashboard.

The solution follows a modular analytics architecture designed to be maintainable, reusable, and suitable for business analysis.

## Dashboard

The final marketing e-commerce dashboard was developed in Looker Studio.

**[View the Looker Studio Dashboard](https://datastudio.google.com/reporting/0c89a31e-95ed-4b74-b0b0-07c16ae5e585)**

The dashboard provides daily monitoring of:

* Orders
* Net Revenue
* Average Order Value (AOV)
* Customers
* Daily Revenue
* Daily Orders
* Monthly Revenue
* Customer Segmentation
* Sales Forecast

---

# Part 1 — Data Transformation

The data transformation pipeline was developed using **dbt** following a:

**Staging → Intermediate → Marts**

architecture.

## dbt Models

### Staging

The staging layer standardizes the raw orders and sales datasets:

* `stg_orders.sql`
* `stg_sales.sql`

Responsibilities include data type casting and standardization of field names.

### Intermediate

The intermediate layer contains reusable order-level calculations:

* `int_order_metrics.sql`

This model calculates product quantities and order-level metrics from the sales data.

### Marts

The mart layer contains business-ready models:

* `fct_orders.sql` — order-level fact table combining order and sales information
* `fct_orders_2025_2026.sql` — order-level dataset covering 2025 and 2026
* `fct_orders_2026_segmented.sql` — 2026 orders with customer purchase-history segmentation
* `agg_orders_2026_monthly.sql` — monthly 2026 business metrics

## Coding Exercises

The requested coding exercises are implemented through the dbt models:

| Exercise                                                 | Implementation                                       |
| -------------------------------------------------------- | ---------------------------------------------------- |
| 1. Number of orders in 2026                              | `fct_orders_2025_2026.sql`                           |
| 2. Number of orders per month in 2026                    | `agg_orders_2026_monthly.sql`                        |
| 3. Average products per order per month                  | `agg_orders_2026_monthly.sql`                        |
| 4. One row per order for 2025–2026 with product quantity | `fct_orders_2025_2026.sql` + `int_order_metrics.sql` |
| 5. Customer purchase-history calculation for 2026        | `fct_orders_2026_segmented.sql`                      |
| 6. New / Returning / VIP segmentation                    | `fct_orders_2026_segmented.sql`                      |

The segmentation logic uses the number of previous orders placed by the same customer during the preceding 12 months:

* **New:** 0 previous orders
* **Returning:** 1–3 previous orders
* **VIP:** 4+ previous orders

## Data Quality Testing

The project includes both generic dbt tests and a singular business-logic test.

The final dbt build completed successfully:

* **7 models**
* **54 data tests**
* **61 total build steps**
* **0 errors**
* **0 warnings**

## Performance and Maintainability

The project uses dbt model dependencies through `ref()` rather than hard-coded model relationships.

The architecture separates:

* Raw data preparation
* Reusable intermediate transformations
* Business-ready marts

This improves maintainability and allows downstream models to reuse previously transformed data.

---

# Part 2 — LookML

The repository contains a LookML structure prepared for Looker deployment.

## LookML Structure

The `looker/` directory contains:

* `astrafy_take_home.model.lkml`
* `manifest.lkml`
* `views/fct_orders_2026_segmented.view.lkml`
* `views/agg_orders_2026_monthly.view.lkml`

The LookML implementation includes:

* Business dimensions
* Dimension groups for dates
* Order-level metrics
* Revenue measures
* Product quantity measures
* Customer counts
* New / Returning / VIP segmentation
* Explores for order-level and monthly analysis
* Business-facing descriptions

The customer segmentation is exposed as a business dimension so that New, Returning, and VIP customers can be used for filtering, grouping, and analysis.

The LookML structure is designed to be deployment-ready for a Looker environment while the final visual dashboard is implemented in Looker Studio.

---

# Part 3 — Design Challenge

The Looker Studio dashboard was designed for daily marketing e-commerce monitoring.

## Dashboard KPIs

The dashboard includes four primary KPIs:

* **Orders** — monitors business activity and order volume
* **Net Revenue** — monitors overall sales performance
* **AOV** — measures average revenue per order
* **Customers** — monitors customer activity and the customer base

## Dashboard Visualizations

### Daily Net Revenue

Tracks daily revenue fluctuations and helps identify unusual peaks, drops, and changes in sales performance.

### Daily Orders

Monitors daily order volume and provides a direct view of changes in business activity.

### Monthly Revenue

Provides a higher-level view of revenue evolution throughout 2026 and helps identify seasonal patterns.

### Customer Segmentation

Customers/orders are segmented into:

* New
* Returning
* VIP

This allows marketing performance to be evaluated according to customer purchase behavior.

### Sales Forecast

The dashboard includes a forecast component to support forward-looking analysis of expected sales performance.

---

# Data Quality

An orphan sales record was identified in the source data.

The order-level model uses the orders dataset as the master order table and a left join to the sales data. This prevents unmatched sales records from creating invalid orders in the final order-level models.

This anomaly was documented rather than silently modifying the original source data.

---

# Key 2026 Results

The resulting 2026 dataset contains:

* **2,573 total orders**
* **1,087 New**
* **794 Returning**
* **692 VIP**

Additional observations:

* **November** had the highest order volume.
* **April** had the highest average number of products per order.

These results are reflected in the dashboard and support the marketing analysis presented in the Design Challenge.

---

# Repository Structure

```text
astrafy_take_home_challenge/
│
├── data/
│   ├── orders_recrutement.csv
│   └── sales_recrutement.csv
│
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
│
├── tests/
│
├── looker/
│   ├── manifest.lkml
│   ├── astrafy_take_home.model.lkml
│   └── views/
│
└── README.md
```

The repository contains the complete technical implementation for the Coding Challenge and LookML Challenge, together with the documentation and link to the final Looker Studio dashboard.
