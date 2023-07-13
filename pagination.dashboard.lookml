- dashboard: pagination
  title: pagination
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: TTOSPfXEwUc3RmZpgVEBXb
  elements:
  - title: pagination
    name: pagination
    model: 0_vysakh_thelook
    explore: pagination
    type: table
    fields: [pagination.id]
    filters: {}
    sorts: [pagination.id]
    limit: 5000
    column_limit: 50
    query_timezone: UTC
    listen:
      Number per Page: pagination.number_per_page
      Page: pagination.page
    row:
    col:
    width:
    height:
  filters:
  - name: Number per Page
    title: Number per Page
    type: field_filter
    default_value: '2'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: 0_vysakh_thelook
    explore: pagination
    listens_to_filters: []
    field: pagination.number_per_page
  - name: Page
    title: Page
    type: field_filter
    default_value: '2'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: 0_vysakh_thelook
    explore: pagination
    listens_to_filters: []
    field: pagination.page
