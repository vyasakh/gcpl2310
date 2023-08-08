view: latest_dates {


    derived_table: {
      sql: select  returned_at, id  from demo_db.order_items where returned_at >= DATE_SUB(CURRENT_DATE, INTERVAL 2000 DAY) ;;
      }

    dimension: returned_at {
      type: date
      sql: ${TABLE}.returned_at ;;
    }

    dimension: id {
      type: number
      sql: ${TABLE}.id ;;
    }

}
