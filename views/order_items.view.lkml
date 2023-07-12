view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

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
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "weekly"
      value: "week"
    }
    allowed_value: {
      label: "monthly"
      value: "month"
    }
    allowed_value: {
      label: "yearly"
      value: "year"
    }
  }

  dimension: date {
    sql:
    {% if date_granularity._parameter_value == 'week' %}
      ${returned_week}
    {% elsif date_granularity._parameter_value == 'month' %}
      ${returned_month}
    {% elsif date_granularity._parameter_value == 'year' %}
      ${returned_year}
    {% else %}
      ${returned_date}
    {% endif %};;
  }
}
