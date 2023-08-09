view: latest_dates {


    derived_table: {
      sql: select  returned_at, id
      from demo_db.order_items where returned_at >= (select max(returned_at) - INTERVAL 7 DAY from demo_db.order_items ) ;;
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
