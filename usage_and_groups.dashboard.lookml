- dashboard: seats_and_roles_reorg
  title: Seats and Roles Reorg
  layout: newspaper
  elements:
  - title: Which Users Should we Disable Now?
    name: Which Users Should we Disable Now?
    model: system__activity
    explore: user
    type: looker_grid
    fields: [user_facts.last_ui_login_quarter, user.name, user_facts.count, role.name]
    pivots: [role.name]
    filters:
      user_facts.last_ui_login_quarter: before 2019/10/01
      user.is_disabled: 'No'
      user.email: "-%@looker%"
    sorts: [user_facts.last_ui_login_quarter desc 0, role.name]
    subtotals: [user_facts.last_ui_login_quarter]
    limit: 500
    total: true
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_labels:
      user_facts.last_ui_login_quarter: Last Used
      user.name: Name
      user_facts.count: Count
    series_column_widths:
      user_facts.last_ui_login_quarter: 135
      user.name: 136
    series_cell_visualizations:
      user_facts.count:
        is_active: false
    defaults_version: 1
    series_types: {}
    note_state: expanded
    note_display: above
    note_text: |-
      We can save 3 admin seats, 10 edit seats and 40 view seats by deleting the accounts of Qubytes who have not used Looker since Q3 2019 - and leaving their accounts open is a security risk anyway).

      Suggested action - let Mark know which ones *not* to disable, and I'll disable the rest.
    listen: {}
    row: 4
    col: 0
    width: 16
    height: 12
  - title: How to Users Group Themselves?
    name: How to Users Group Themselves?
    model: system__activity
    explore: history
    type: looker_grid
    fields: [user.count, permission_set.name, query.view]
    pivots: [permission_set.name]
    filters:
      user_facts.last_ui_login_quarter: 2 quarters
      query.view: -"content_usage",-dashboard,-"data_refresh_status",-"event_attribute",-history,-look
      permission_set.name: "-Admin"
    sorts: [permission_set.name desc, user.count desc 0]
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      user.count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4A80BC",
        font_color: !!null '', color_application: {collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c,
          palette_id: 95584bf9-c29e-41ea-b6e7-79e9c126e177, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    font_size: '12'
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Qubit (all data) and Harvest (PS) data have most usage, then SaaSOptics,
      Product and Sales/Marketing. Would make sense to group remaining users by role
      aligning with these groupings (PS, CS, Product, Sales, Marketing) or at least
      by (Customer, Product, Sales/Marketing) along with current HR and Leadership
      groupings, i.e. replace "Commercial" with three more granular groups.
    listen: {}
    row: 4
    col: 16
    width: 8
    height: 15
  - title: Actual vs Licensed Seats
    name: Actual vs Licensed Seats
    model: system__activity
    explore: user
    type: looker_grid
    fields: [permission_set.name, user.count]
    filters:
      permission_set.name: View Only Seat,Edit Seat
      user.is_disabled: 'No'
    sorts: [user.count desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: variance, label: Variance, expression: "${user.count}-${target}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: target, label: Target, expression: 'if(${permission_set.name}="View
          Only Seat",75,if(${permission_set.name}="Edit Seat",20,0))', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number},
      {table_calculation: proposed_count, label: Proposed Count, expression: 'if(${permission_set.name}="View
          Only Seat",${user.count}-30,if(${permission_set.name}="Edit Seat",${user.count}-10,0))',
        value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", permission_set.name, user.count, target,
      variance]
    show_totals: true
    show_row_totals: true
    series_labels:
      target: Limit
      user.count: Seats
    series_cell_visualizations:
      user.count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#23AEB5",
        font_color: !!null '', color_application: {collection_id: fdefe09c-d08e-44e8-b505-6f40711a5350,
          palette_id: 90278dfa-06c8-4933-85dd-7d719932d9f8, options: {steps: 5, mirror: true,
            constraints: {mid: {type: number, value: 0}}, reverse: true}}, bold: false,
        italic: false, strikethrough: false, fields: [variance]}, {type: along a scale...,
        value: !!null '', background_color: "#23AEB5", font_color: !!null '', color_application: {
          collection_id: fdefe09c-d08e-44e8-b505-6f40711a5350, palette_id: 3993ec9c-5bfb-4bbc-9e9b-9ad48e33b408,
          options: {steps: 5, mirror: true, constraints: {mid: {type: number, value: 0}},
            reverse: false}}, bold: false, italic: false, strikethrough: false, fields: [
          proposed_count]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    series_types: {}
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: How should we re-organise User Roles?
    body_text: How many users do we have registered to use Qubit-bi and how many are
      actually active? And how are users self-organizing into groups that we could
      then use to better arrange our groups and roles?
    row: 0
    col: 0
    width: 8
    height: 4
  - title: Users with No Group Assigned
    name: Users with No Group Assigned
    model: system__activity
    explore: user
    type: table
    fields: [user.name, group.groups, user_facts.last_ui_login_date, history.query_run_count]
    filters:
      group.name: "-Admin,-Custom Fields Beta Users"
      user_facts.last_ui_login_quarter: 2 quarters
      group.groups: "-%^,%"
      user.is_disabled: 'No'
      user.email: "%qubit.com%"
    sorts: [group.groups desc]
    limit: 500
    dynamic_fields: [{table_calculation: groups_less_all_users, label: Groups (less
          All Users), expression: "${group.count}-1", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: UTC
    row: 0
    col: 16
    width: 8
    height: 4
