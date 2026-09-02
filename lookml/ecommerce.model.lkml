connection: "bigquery_connection"

include: "/views/*.view.lkml"

explore: orders {

  label: "E-commerce Orders"

}
