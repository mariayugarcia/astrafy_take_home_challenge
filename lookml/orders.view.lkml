view: orders {

  sql_table_name: project.dataset.fct_orders_2026 ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
    description: "Unique identifier of the order."
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
    description: "Unique identifier of the customer."
  }

  dimension_group: order_date {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.order_date ;;
    description: "Date when the order was placed."
  }

  dimension: order_segmentation {
    type: string
    sql: ${TABLE}.order_segmentation ;;
    description: "Customer segment based on the number of orders placed during the previous 12 months. New: 0 previous orders. Returning: 1 to 3 previous orders. VIP: 4 or more previous orders."
  }

  dimension: qty_product {
    type: number
    sql: ${TABLE}.qty_product ;;
    description: "Total quantity of products included in the order."
  }

  measure: orders {
    type: count_distinct
    sql: ${order_id} ;;
    label: "Orders"
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}.net_sales ;;
    label: "Net Revenue"
    value_format_name: decimal_2
  }

  measure: average_order_value {
    type: average
    sql: ${TABLE}.net_sales ;;
    label: "Average Order Value"
    value_format_name: decimal_2
  }

  measure: total_products {
    type: sum
    sql: ${qty_product} ;;
    label: "Total Products"
  }

  measure: average_products_per_order {
    type: average
    sql: ${qty_product} ;;
    label: "Average Products per Order"
  }
}
