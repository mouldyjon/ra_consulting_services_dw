view: project_users {

  sql_table_name: rittman_analytics.project_users ;;
  view_label: "Client Delivery Projects"

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }



  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: project_consultant_hourly_rate {
    type: number
    hidden: yes
    sql: ${TABLE}.hourly_rate ;;
  }

  measure: billable_hourly_rate {
    type: average
    sql: ${TABLE}.hourly_rate ;;
  }



  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }



  dimension: user_id {
    type: number
    hidden: yes
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }


  }
