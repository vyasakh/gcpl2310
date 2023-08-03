view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.id ;;
  }
  dimension:  testc{
    type: tier
    style: integer
    tiers: [1001, 1501, 2001, 3001, 4001]
    value_format_name: decimal_0
    sql: ${id} ;;

  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    link: {
      label: "link"
      url: "https://gcpl2310.cloud.looker.com/explore/0_vysakh_thelook/order_items?fields=users.id,users.count_new&f[users.id]=>500&f[users.created_date]={{users.filter_start}}&sorts=users.count_new desc"
    }
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: trial{
  sql: sum(${age}) ;;
  }
  measure: summ {
    type: number
    sql: sum(${trial}) ;;
  }

  filter: comparison {
    suggest_dimension: selected_field
    type: string
    suggestable: yes
    full_suggestions: yes
    bypass_suggest_restrictions: yes
  }

  dimension: selected_field {
    label_from_parameter: field_select
    type:  string
    sql:  CASE  WHEN {% parameter field_select %} = 'first_name' THEN ${first_name}
                  WHEN {% parameter field_select %} = 'gender' THEN ${gender}
                 ELSE ''
            END
      ;;
  }

  parameter: field_select {
    type:  string
    allowed_value: { label: "first name"
      value: "first_name"}
    allowed_value: { label: "gender"
      value: "gender"
    }
  }

  dimension: state_flag_image {
    type: string
    sql: ${state} ;;
    html:
              {% if state._value == "California" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/0/01/Flag_of_California.svg" height="170" width="255">
              {% elsif state._value == "New York" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_New_York.svg/1200px-Flag_of_New_York.svg.png" height="170" width="255">
              {% elsif state._value == "Colorado" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Flag_of_Colorado.svg/255px-Flag_of_Colorado.svg.png" height="170" width="255">
              {% elsif state._value == "Illinois"%}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Illinois.svg/1200px-Flag_of_Illinois.svg.png" height="170" width="255">
              {% else %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
              {% endif %} ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  #measure: pending_users {
  #  type: count
   # filters: [orders.status: "pending"]
  #}
  #measure: complete_users {
   # type: count
    #filters: [orders.status: "complete"]
  #}
  #measure:cancelled_users {
   # type: count
    #filters: [orders.status: "cancelled"]
  #}

 measure: count_new {
  type: count_distinct
  sql: ${id} ;;
 # filters: [orders.status: "-NULL"]
  drill_fields: [detail*]
}

  dimension: filter_start{
    type: date
    sql: {% date_start created_date %} ;;
   # html:{{ rendered_value |date: "%Y%m%d" }};;

  }

  dimension: filter_end{
    type: date
    sql: {% date_end created_date %} ;;
  }
  measure: m1_400 {
    type: count_distinct
    sql: ${TABLE}.id ;;
    filters: [created_date: "400 days"]
  }

  measure: m2_500 {
    type: count_distinct
    sql: ${TABLE}.id ;;
    filters: [created_date: "500 days"]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
