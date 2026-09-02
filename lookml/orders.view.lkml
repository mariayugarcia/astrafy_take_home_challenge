view: orders {

  sql_table_name: project.dataset.fct_orders_2026 ;;

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;

    description: "Unique identifier of the order."
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;

    description: "Unique identifier of the customer."
  }

  dimension_group: order_date {
    type: time

    timeframes: [
      raw,
      date,
      week,
      month,
      year
    ]

    sql: ${TABLE}.order_date ;;

    description: "Date when the order was placed."
  }

  dimension: order_segmentation {
    type: string

    sql: ${TABLE}.order_segmentation ;;

    description:
      "Customer segment based on the number of orders placed during
       the previous 12 months. New means 0 previous orders,
       Returning means 1 to 3 previous orders, and VIP means
       4 or more previous orders."
  }

  dimension: qty_product {
    type: number
    sql: ${TABLE}.qty_product ;;

    description: "Total quantity of products in the order."
  }

  measure: orders {
    type: count_distinct
    sql: ${order_id} ;;

    label: "Orders"

    description: "Number of unique orders."
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
