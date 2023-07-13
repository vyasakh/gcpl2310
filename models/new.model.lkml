connection: "thelook"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
 include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include:"/pagination.view.lkml"
datagroup: 0_vysakh_thelook_default_datagroup{
  sql_trigger: SELECT mod(case when current_date < [second thursday of current month] THEN
               current_month_num ELSE when EXTRACT(HOUR FROM CURRENT_TIMESTAMP) = 7 then
               current_month_num + 1 else current_month END, 12) ;;
}

explore: xyz {
  from: pagination

}
explore: users {}
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
