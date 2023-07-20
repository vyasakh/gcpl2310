view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  filter: test {
    type: date
  }

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
   # map_layer_name: countries
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
    drill_fields: [detail*]
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
    drill_fields: [minus,id]
  }

  dimension: user_id {
    sql: ${TABLE}.user_id ;;
    tags: ["user_id"]

  }
  measure: minus {
    type: sum
    sql: ${id}-987654333567 ;;
  }

  measure: count_of_users{
    type: count_distinct
    sql: ${id} ;;

  }

  measure: count_of_all_users {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [minus]
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
  measure: hyperdupe{
    type: number
    sql: ${id}/4 ;;
    # link: {
    #   label: "Link"
    #   url: "https://gcpl2310.cloud.looker.com/explore/0_vysakh_thelook/order_items?qid=JkMaA85TyUJu4lsSiUITZ2&origin_space=63&toggle=vis"
    # }

    html:{% if value > 20 %}
        <a style="color: green" href="https://gcpl2310.cloud.looker.com/explore/0_vysakh_thelook/order_items?qid=JkMaA85TyUJu4lsSiUITZ2&origin_space=63&toggle=vis">{{rendered_value}}▲</a>
        {% elsif value < 20 %}
        <a style="color: red" href="https://gcpl2310.cloud.looker.com/explore/0_vysakh_thelook/order_items?qid=JkMaA85TyUJu4lsSiUITZ2&origin_space=63&toggle=vis">{{rendered_value}}▼</a>
        {% else %}
        <a style="color: black" href="https://gcpl2310.cloud.looker.com/explore/0_vysakh_thelook/order_items?qid=JkMaA85TyUJu4lsSiUITZ2&origin_space=63&toggle=vis">{{rendered_value}}</a>
        {% endif %} ;;
  }


  # dimension: state_flag_image {
  #   type: string
  #   sql: ${state} ;;
  #   html:
  #             {% if state._value == "California" %}
  #             <img src="https://upload.wikimedia.org/wikipedia/commons/0/01/Flag_of_California.svg" height="170" width="255">
  #             {% elsif state._value == "New York" %}
  #             <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_New_York.svg/1200px-Flag_of_New_York.svg.png" height="170" width="255">
  #             {% elsif state._value == "Colorado" %}
  #             <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Flag_of_Colorado.svg/255px-Flag_of_Colorado.svg.png" height="170" width="255">
  #             {% elsif state._value == "Illinois"%}
  #             <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Illinois.svg/1200px-Flag_of_Illinois.svg.png" height="170" width="255">
  #             {% else %}
  #             <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
  #             {% endif %} ;;
  # }

measure: reason{
  type: list
  list_field: gender
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
