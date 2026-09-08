connection: "astrafy_bigquery"

include: "/views/*.view.lkml"

explore: fct_orders_2026_segmented {
  label: "Orders 2026"
  description: "Order-level analysis for 2026, including revenue, product metrics and dynamic customer segmentation."
}

explore: agg_orders_2026_monthly {
  label: "Monthly Orders 2026"
  description: "Monthly business KPIs for 2026, including orders, revenue, products per order and average order value."
}