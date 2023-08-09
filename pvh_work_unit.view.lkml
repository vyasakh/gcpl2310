include: "/work_unit.view.lkml"
view: +work_unit {
  dimension: d_id {
    sql: case when ${work_unit.id}<${users.id} then 1 end ;;
  }
  }
