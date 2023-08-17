view: test_pdt {
  derived_table: {
    sql:
    SELECT
        (DATE(CONVERT_TZ(orders.created_at ,'UTC','America/Los_Angeles'))) AS `created_date`,
        products.category  AS `category`,
        products.department AS `department`,
        products.item_name AS `item_name`,
        group_concat(products.item_name) AS `item_agg`,
        group_concat(products.category) AS `category_agg`,
        COUNT(*) AS `order_count`
    FROM demo_db.order_items  AS order_items
    LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
    LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
    LEFT JOIN demo_db.products  AS products ON inventory_items.product_id = products.id
    WHERE
      {%condition date_filter %} created_date {% endcondition %}
    AND    {%condition category_filter %} category_agg {% endcondition %}
    AND    {%condition department_filter %} department {% endcondition %}
    AND    {%condition product_filter %} item_name {% endcondition %}
    GROUP BY
    1,
    2,
    3,
    4
    ;;
  }

  filter: date_filter {
    type: date
  }

  filter: category_filter {
    type: string
    suggest_dimension: category
    # suggest_persist_for: "0 hours"
  }

  filter: department_filter {
    type: string
    suggest_dimension: department
  }

  filter: product_filter {
    type: string
    suggest_dimension: item_name
  }

  dimension_group: created_date {
    type: time
    timeframes: [month, date, year]
  }

  dimension: category {}

  dimension: department {}

  dimension: item_agg {}

  dimension: item_name {}

  dimension: category_agg {}

  measure: order_count {
    type: sum
    sql: ${TABLE}.order_count ;;
  }

  measure: count {
    type: count
  }
}
