view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    group_label: "{% if _explore._name == 'users' %} ID Group
    {% elsif _explore._name == 'orders' %} ID
    {% else %} Not ID Group {% endif %}"
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

  dimension: country_access {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    required_access_grants: [two]
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: Credentials {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
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
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  dimension: email {
    sql: ${TABLE}.email ;;
    tags: ["email"]
  }

  dimension: user_id {
    sql: ${TABLE}.user_id ;;
    tags: ["user_id"]

  }

  measure: count_of_users{
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [minus]
  }

  measure: count_of_all_users {
    type: count_distinct
    sql: ${id} ;;
  }


measure: hyper{
  type: number
  sql: ${id}/4 ;;
link: {
  label: "Link"
  url: "https://gcpl2310.cloud.looker.com/explore/0_vysakh_thelook/order_items?qid=JkMaA85TyUJu4lsSiUITZ2&origin_space=63&toggle=vis"
}

  html:{% if value > 20 %}
  <a style="color: green">{{rendered_value}}▲</a>
  {% elsif value < 20 %}
  <a style="color: red">{{rendered_value}}▼</a>
  {% else %}
  <a style="color: black">{{rendered_value}}</a>
  {% endif %} ;;
}

measure: minus {
  type: sum
  sql: 567839-56784345656666767 ;;

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
