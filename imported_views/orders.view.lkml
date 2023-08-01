view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    convert_tz: no
  }

   dimension_group: duration_created {
     type: duration
    intervals: [minute,hour,day]
    sql_start: ${created_date} ;;
    sql_end: CURRENT_TIMESTAMP ;;
   }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }


  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    filters: [status: "cancelled"]
    drill_fields: [detail*]
  }

  measure: sum_1 {
    type: sum
    sql: ${user_id} ;;
  }

  parameter: filtered_quarter {
    type: unquoted
    allowed_value: {value:"Q1-2022"}
    allowed_value: {value:"Q2-2022"}
  }

  measure: test {
    type: number
    sql: ${sum_1} ;;
    link: {
      label: "testing"
      url: "/explore/0_vysakh_thelook/order_items?fields=order_items.sale_price,order_items.returned_quarter,orders.created_quarter&sorts=order_items.returned_quarter&f[orders.filtered_quarter]={{ _filters['filtered_quarter'] }}"
    }

  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
