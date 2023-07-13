view: pagination {

    derived_table: {
      datagroup_trigger: 0_vysakh_thelook_default_datagroup

      sql:
          SELECT * FROM `demo_db`.`order_items` AS `order_items`;;

    }
   # LIMIT {{ number_per_page._parameter_value }}
    #      OFFSET {{ number_per_page._parameter_value | times: page._parameter_value | minus: number_per_page._parameter_value }} ;;
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension_group: returned_at {
    type: time
    sql: ${TABLE}.returned_at ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
dimension: phoness {
  type: yesno
  sql: ${id}={%parameter page%} ;;
  #sql: ${id}= {% condition period_filter %} ${id} {% endcondition %}  ;;

}
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }

  set: detail {
    fields: [
      id,
      order_id,
      sale_price,
      inventory_item_id,
      returned_at_time,
      phone,
      phones
    ]
  }

filter: period_filter {
  type: number
}
    parameter: page {
      type: number
    }

    parameter: number_per_page {
      type: number
    }
    }
