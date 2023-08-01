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
  dimension: is_green {
    sql: 1 ;;
  }
  dimension: not_green {
    sql: -1 ;;
  }
  dimension: is_null {
    sql: null ;;
  }


  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  measure: test_avg {
    type: average
    sql:  ${id};;
  }
  measure: mix_diff {
    type: number
    sql: ${sum1}-${avg} ;;
  }

  measure: sum1 {
    type: sum
    sql: ${sale_price}
    ;;
    html: {% if value >= 20000 %}
    <p>{{value}}</p>
    {% else %}
    <p> -{{value}}</p>
    {% endif %};;
    #value_format: "0\%"
  }

  measure: count {
    type: count

  }

  measure: avg {
    type: average
    sql: ${sale_price} ;;
    html: {% if sum1._value >= 25000 %}
    <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif sum1._value <= 20000 %}
    <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif sum1._value == 20250 %}
    <p style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
    ;;
    link: {
      label: "demo"
      url: "https://gcpl2310.cloud.looker.com/dashboards/6"
      }
  }


}
