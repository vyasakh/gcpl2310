#connection: "thelook"

include: "/views/order_items.view.lkml"
include: "/dpr_test.model.lkml"
include: "/views/users.view.lkml"
explore: order_items {
  extends: [orders]
  join: users {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.id}=${order_items.id} ;;
  }
  join: work_unit {
    relationship: one_to_one
    sql: ${work_unit.id}=${order_items.id} ;;
  }
}
