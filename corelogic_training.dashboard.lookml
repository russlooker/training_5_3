- dashboard: corelogic_training
  title: CoreLogic Training
  layout: newspaper
  elements:
  - title: Order Revenue by Day
    name: Order Revenue by Day
    model: training_5_3_18
    explore: order_items
    type: looker_line
    fields:
    - order_items.created_date
    - order_items.total_sale_price
    fill_fields:
    - order_items.created_date
    filters:
      order_items.id: NOT NULL
      order_items.created_date: 90 days
    sorts:
    - order_items.created_date desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 0
    col: 0
    width: 24
    height: 6
