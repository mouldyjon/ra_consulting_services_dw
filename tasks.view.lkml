view: tasks {
  sql_table_name: rittman_analytics.tasks ;;
  view_label: "Project Time Entries"

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }



  dimension: user_task_billable_by_default {
    hidden: yes
    type: yesno
    sql: ${TABLE}.billable_by_default ;;
  }




  dimension: user_task_name {
    label: "Consultant Project Role"
    group_label: "Project Timesheets"
    type: string
    sql: ${TABLE}.name ;;
  }


}
