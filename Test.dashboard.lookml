# - dashboard: test
#   title: Test
#   layout: newspaper
#   preferred_viewer: dashboards-next
#   tile_size: 100

#   filters:

#   elements:
#     - name: hello_world
#       type: looker_column
- dashboard: test_getlookml
  title: Test_GetLookML
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: yR2hWjhBQN8GfszOdFqykB
  elements:
  - title: Test_GetLookML
    name: Test_GetLookML
    model: 0_vysakh_thelook2
    explore: order_items
    type: looker_grid
    fields: [orders.created_time, orders.status, orders.count]
    sorts: [orders.created_time desc]
    limit: 5000
    column_limit: 50
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      orders.count:
        is_active: false
    truncate_column_names: false
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
