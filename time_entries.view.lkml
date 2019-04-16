view: time_entries {
  sql_table_name: rittman_analytics.time_entries ;;

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
    sql_distinct_key: ${project_id} ;;
    sql: ${TABLE}.billable_rate ;;
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
    type: average_distinct
    sql_distinct_key: ${project_id} ;;
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

  measure: total_billed_project_time_entry_hours {
    type: sum
    sql: ${TABLE}.hours ;;
  }

  measure: total_project_time_entry_billed_days {
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
      date
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
    hidden: yes

    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
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

  measure: count {
    hidden: yes

    type: count
  }

  # ----- Sets of fields for drilling ------

}
