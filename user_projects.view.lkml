view: user_projects {
  sql_table_name: rittman_analytics.user_projects ;;
  view_label: "Project Time Entries"


  dimension: id {
    primary_key: yes
    type: number
    hidden: yes

    sql: ${TABLE}.id ;;
  }



  dimension: client_id {
    hidden: yes
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: user_assigned_to_project {
    hidden: yes

    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_assigned_to_hourly_rate {
    hidden: yes

    type: number
    sql: ${TABLE}.hourly_rate ;;
  }



  dimension: user_assigned_as_project_manager {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_project_manager ;;
  }

  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: updated {
    hidden: yes
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: number
     hidden: yes
    sql: ${TABLE}.user_id ;;
  }




}
