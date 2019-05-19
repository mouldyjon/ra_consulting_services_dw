view: time_entries {
  sql_table_name: ra_data_warehouse_dbt_dev.harvest_time_entries ;;

  dimension: timesheet_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }




  dimension: project_time_entry_billable {
    type: yesno
    sql: ${TABLE}.billable ;;
  }

  dimension: project_time_entry_billable_rate {
    type: number
    sql: ${TABLE}.billable_rate ;;
  }

  measure: avg_hourly_project_time_entry_billable_rate {
    type: average_distinct
    value_format_name: gbp_0

    sql_distinct_key: ${timesheet_id} ;;
    sql: ${TABLE}.billable_rate ;;
  }

  measure: avg_daily_project_time_entry_billable_rate {
    value_format_name: gbp_0

    type: average_distinct
    sql_distinct_key: ${timesheet_id} ;;
    sql: ${TABLE}.billable_rate*8 ;;
  }

  dimension: project_time_entry_budgeted {
    type: number
    sql: ${TABLE}.budgeted ;;
  }

  dimension: timesheet_client_id {
    hidden: yes
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: project_time_entry_cost_rate {
    type: number
    sql: ${TABLE}.cost_rate ;;
  }

  measure: avg_project_time_entry_cost_rate {
    value_format_name: gbp_0

    type: average_distinct
    sql_distinct_key: ${timesheet_id} ;;
    sql: ${TABLE}.cost_rate ;;
  }

  dimension_group: project_time_entry_created {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: hours {
    type: number
    hidden: yes
    sql: ${TABLE}.hours ;;
  }

  dimension: billable_revenue {
    type: number
    sql: ${hours} * ${project_time_entry_billable_rate} ;;
  }

  measure: total_billable_revenue {
    value_format_name: gbp_0

    type: sum
    sql: ${hours} * ${project_time_entry_billable_rate} ;;
  }

  measure: total_available_time_entry_hours {
    type: sum
    sql: ${TABLE}.hours ;;
  }

  measure: target_pct_billed_time_entry_hours {
    type: number
    sql: 0.75 ;;
  }

  measure: target_pct_admin_time_entry_hours {
    type: number
    sql: 0.05 ;;
  }

  measure: target_pct_sales_time_entry_hours {
    type: number
    sql: 0.2 ;;
  }

  measure: total_billed_project_time_entry_hours {
    type: sum
    sql: ${TABLE}.hours ;;
    filters: {field: project_time_entry_billable
              value: "yes"}
  }

  measure: total_project_time_entry_billed_days {
    type: sum
    sql: ${TABLE}.hours/8 ;;
    filters: {field: project_time_entry_billable
      value: "yes"}
  }



  measure: total_unbilled_project_time_entry_hours {
    type: sum
    sql: case when ${project_time_entry_billable} is false and ${timesheet_client_id} <> 7639423 then ${TABLE}.hours end;;

  }

  measure: total_excluded_holidays_time_entry_hours {
    type: sum
    sql: case when (not ${TABLE}.billable)
         and ${timesheet_client_id} = 7639423
         and (${project_time_entry_task_id} in (11262415, 11262375, 9453328)) then ${TABLE}.hours end;;
  }

  measure: total_nonbillable_admin_sales_time_entry_hours {
    type: sum
    sql: case when (not ${TABLE}.billable)
         and ${timesheet_client_id} = 7639423
         and (${project_time_entry_task_id} not in (11262415, 11262375, 9453328)) then ${TABLE}.hours end;;
  }

  measure: total_available_time_entry_billed_days {
    type: sum
    sql: ${TABLE}.hours/8 ;;
  }





  dimension: timesheet_invoice_id {
    type: number
    hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: project_time_entry_is_billed {
    type: yesno
    sql: ${TABLE}.is_billed ;;
  }

  dimension: project_time_entry_is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: project_time_entry_is_locked {
    type: yesno
    sql: ${TABLE}.is_locked ;;
  }

  dimension: project_time_entry_is_running {
    type: yesno
    sql: ${TABLE}.is_running ;;
  }

  dimension: project_time_entry_locked_reason {
    type: string
    sql: ${TABLE}.locked_reason ;;
  }

  dimension: project_time_entry_notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: project_time_entry_billed {
    type: time
    timeframes: [
      date,
      week,
      day_of_week,
      day_of_month,
      day_of_week_index,
      week_of_year,
      month,
      quarter
    ]
    sql: ${TABLE}.spent_date ;;
  }

  dimension: task_assignment_id {
    hidden: yes
    type: number
    sql: ${TABLE}.task_assignment_id ;;
  }

  dimension: project_time_entry_task_id {

    type: number
    hidden: no
    sql: ${TABLE}.task_id ;;
  }

  dimension_group: updated {
    hidden: no

    type: time
    timeframes: [
      time
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_assignment_id {
    hidden: yes

    type: number
    sql: ${TABLE}.user_assignment_id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }



  # ----- Sets of fields for drilling ------

}
