view: user_project_tasks {
  sql_table_name: rittman_analytics.user_project_tasks ;;
  view_label: "Project Time Entries"



  dimension: project_task_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.project_task_id ;;
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


}
