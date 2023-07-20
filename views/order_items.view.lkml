view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]
  filter: test_filter {
    type: date
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    html:  <font color="green">{{ value }}</font> ;;
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
  measure: minus_values{
    type: number
    sql: ${count}-400 ;;
  }
  measure: minus_to_zero {
    type: number
    sql: Case when ${minus_values}<0 THEN 0 ELSE ${minus_values} end ;;
  }
}
