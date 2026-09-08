view: agg_orders_2026_monthly {

  sql_table_name: main.agg_orders_2026_monthly ;;

  label: "Monthly Orders 2026"
  description: "Monthly aggregation of 2026 order activity, including order volume, revenue, products per order and average order value."

  dimension_group: order_month {
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_month ;;
    label: "Order Month"
    description: "Month in which the orders were created."
    group_label: "Time"
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
    label: "Orders"
    description: "Total number of orders placed during the month."
    group_label: "Order KPIs"
  }

  dimension: total_products {
    type: number
    sql: ${TABLE}.total_products ;;
    label: "Total Products"
    description: "Total quantity of products sold during the month."
    group_label: "Product KPIs"
  }

  dimension: avg_products_per_order {
    type: number
    sql: ${TABLE}.avg_products_per_order ;;
    value_format_name: "decimal_2"
    label: "Average Products per Order"
    description: "Average quantity of products per order during the month."
    group_label: "Product KPIs"
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
    value_format_name: "eur"
    label: "Total Revenue"
    description: "Total revenue generated during the month."
    group_label: "Revenue KPIs"
  }

  dimension: avg_order_value {
    type: number
    sql: ${TABLE}.avg_order_value ;;
    value_format_name: "eur"
    label: "Average Order Value"
    description: "Average revenue per order during the month."
    group_label: "Revenue KPIs"
  }

  measure: monthly_orders {
    type: sum
    sql: ${total_orders} ;;
    label: "Monthly Orders"
    description: "Total orders across the selected months."
    group_label: "KPIs"
  }

  measure: monthly_revenue {
    type: sum
    sql: ${total_revenue} ;;
    value_format_name: "eur"
    label: "Monthly Revenue"
    description: "Total revenue across the selected months."
    group_label: "KPIs"
  }

  measure: average_products_per_order {
    type: average
    sql: ${avg_products_per_order} ;;
    value_format_name: "decimal_2"
    label: "Average Products per Order"
    description: "Average products per order across the selected months."
    group_label: "KPIs"
  }

  measure: average_order_value {
    type: average
    sql: ${avg_order_value} ;;
    value_format_name: "eur"
    label: "Average Order Value"
    description: "Average order value across the selected months."
    group_label: "KPIs"
  }
}