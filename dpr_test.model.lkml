connection: "thelook"

#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

 include: "/views/orders.view.lkml"
include: "/work_unit.view.lkml"

explore: orders {
  join: work_unit {
    type: left_outer
    relationship: one_to_one
    sql: ${orders.id}=${work_unit.id} ;;
  }
}
