view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    label: "created"
    type: time
    datatype: date
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    drill_fields: [created_date,created_month,created_quarter]
  }

  dimension: Data_dates {
    label: "month"
    type: date
    sql: ${created_month} ;;
    drill_fields: [created_date]
  }

  dimension: Data_date {
    label: "dates"
    type: date
    sql: ${created_date} ;;
    drill_fields: [Data_dates]

  }
  dimension: status {
    type: string
    sql: ${TABLE}.status;;
    html: {% if value == 'complete' %}
    <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
    ;;

  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: sum_of_status {
    type: number
    sql: ${id} ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
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
