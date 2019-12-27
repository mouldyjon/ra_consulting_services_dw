view: harvest_tasks {
  sql_table_name: rittman_analytics.tasks ;;
  view_label: "Project Time Entries"

  dimension: id {
    primary_key: yes
    type: number
    hidden: no
    group_label: "Harvest IDs"
    label: "Task ID"
    sql: ${TABLE}.id ;;
  }



  dimension: task_billable_by_default {
    hidden: no
    group_label: "Harvest Tasks"

    type: yesno
    sql: ${TABLE}.billable_by_default ;;
  }

  dimension: task_default_hourly_rate {
    group_label: "Harvest Tasks"

    hidden: no
    type: number
    sql: ${TABLE}.default_hourly_rate ;;
  }





  dimension: task_name {
    label: "Task Name"
    group_label: "Harvest Tasks"
    type: string
    sql: ${TABLE}.name ;;
  }


}
