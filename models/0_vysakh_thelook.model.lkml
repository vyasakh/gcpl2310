connection: "thelook"

# include all the views
include: "/views/**/*.view.lkml"


include: "/totals.view.lkml"
#include: "/testing.view.lkml"
include: "/order.explore.lkml"


#datagroup: 0_vysakh_thelook_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM users;;
 # max_cache_age: "1 hour"
#}
# explore: testing {}
datagroup:  dpr{
  sql_trigger: MODE(case when current_date < '2023-08-02' THEN 1 ELSE 2 + 1 END, 12) ;;
}
explore: sql_runner_query {}
fiscal_month_offset: -6
#test2

# i have been changing this can you check

# test: historic_revenue_is_accurate {
#   explore_source: orders {
#     column: total_revenue {
#       field: orders.id
#     }
#     filters: [orders.created_date: "2019"]
#   }
#   assert: revenue_is_expected_value {
#     expression: round(${orders.id},0) >= 73 AND round(${orders.id},0) <= 100;;
#   }
# }


week_start_day: sunday
access_grant: One {
  user_attribute: grant
  allowed_values: ["1"]
}
access_grant: two {
  user_attribute: grant
  allowed_values: ["2"]
}
access_grant: Three {
  user_attribute: grant
  allowed_values: ["3"]
}

access_grant: four {
  user_attribute: grant
  allowed_values: ["4"]
}
  #Hello Ragha

# datagroup: new_schedule_check2 {
#   sql_trigger: SELECT *,
#   (CASE
#   WHEN current_date < '2023-07-04' THEN "hi"
#   ELSE
#   CASE
#   WHEN EXTRACT(HOUR FROM CURRENT_TIMESTAMP) ='10' THEN  "ho"
#   ELSE "hi"
#   END
#   END);;
# }

#persist_with: 0_vysakh_thelook_default_datagroup


explore: account {}
explore: totals {}


explore: employees {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: pagination {}

explore: flights {
  always_filter: {
    filters: [flights.arr_date: ""]
  }
}



explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}


explore: persons {}


explore: products {}

explore: salary {
  join: dept {
    type: left_outer
    sql_on: ${salary.dept_id} = ${dept.dept_id} ;;
    relationship: many_to_one
  }
}


explore: users {}
