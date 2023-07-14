- dashboard: dashboard
  title: Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
      - name: add_a_unique_name_1689343751
        title: Untitled Visualization
        model: 0_vysakh_thelook
        explore: order_items
        type: table
        fields: [orders.created_year, orders.status]
        sorts: [orders.created_year desc]
        limit: 500
        column_limit: 50
        query_timezone: UTC
