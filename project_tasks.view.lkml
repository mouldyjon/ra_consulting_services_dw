view: project_tasks {
  sql_table_name: rittman_analytics.project_tasks ;;
  view_label: "Project Time Entries"

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }



  dimension: project_task_billable {
    type: yesno

    sql: ${TABLE}.billable ;;
  }

  dimension: project_task_budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension_group: created {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: project_task_hourly_rate {
    hidden: yes
    type: number
    sql: ${TABLE}.hourly_rate ;;
  }

  measure: avg_project_task_hourly_rate {
    hidden: no
    type: average
    sql: ${TABLE}.hourly_rate ;;
  }



  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: task_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.task_id ;;
  }




}
