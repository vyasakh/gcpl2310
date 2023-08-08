view: sub_test {



 sql_table_name:
{% if sub_test.investment._in_query %}
   demo_db.orders
{% else %}
   demo_db.orders
{% endif %};;

  measure: investment {
    label: "          Investment"
    type: sum
    sql: ${TABLE}.id ;;
    value_format_name: usd_0

    html: {% if  investment._value  < 1 %}
              <p style="background-color: Khaki;
                        font-size:100%;
                        text-align:center"> {{ linked_value }} </p
            {% else %}
              <p style="font-size:100%;
                        text-align:center"> {{ linked_value }} </p>
            {% endif %};;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: dupe {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw,time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }


  }
