#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: sql_runner_query {
  derived_table: {
    sql: SELECT * from demo_db.orders AS orders ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_sum_1 {
    type: number
    sql: ${TABLE}.`orders.sum_1` ;;
  }

  set: detail {
    fields: [
        orders_status,
  orders_sum_1
    ]
  }
}
