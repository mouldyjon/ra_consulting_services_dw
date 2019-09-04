view: users {
  sql_table_name: rittman_analytics.users ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }








  dimension: cost_rate {
    hidden: yes
    type: number
    sql: ${TABLE}.cost_rate ;;
  }

  measure: consultant_avg_cost_rate {
    type: average
    group_label: "Project Resource"
    sql: ${TABLE}.cost_rate ;;
  }

  dimension_group: consultant_created {
    type: time
    hidden: yes
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: consultant_default_hourly_rate {
    type: number
    hidden: yes
    sql: ${TABLE}.default_hourly_rate ;;
  }

  measure: consultant_avg_default_hourly_rate {
    group_label: "Project Resource"

    type: average
    sql: ${TABLE}.default_hourly_rate ;;
  }

  dimension: consultant_email {
    group_label: "Project Resource"
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: consultant_name {
    group_label: "Project Resource"

    type: string
    sql: concat(concat(${TABLE}.first_name,' '),${TABLE}.last_name) ;;
  }



  dimension: consultant_is_active {
    group_label: "Project Resource"

    type: yesno
    sql: ${TABLE}.is_active ;;
  }



  dimension: consultant_is_contractor {
    group_label: "Project Resource"
    type: yesno
    sql: ${TABLE}.is_contractor ;;
  }

  dimension: consultant_is_project_manager {
    group_label: "Project Resource"

    type: yesno
    sql: ${TABLE}.is_project_manager ;;
  }

  dimension: last_name {
    hidden: yes

    type: string
    sql: ${TABLE}.last_name ;;
  }





  dimension: consultant_weekly_capacity {
    hidden: yes
    type: number
    sql: ${TABLE}.weekly_capacity ;;
  }



  measure: total_consultant_weekly_capacity {
    type: sum
    group_label: "Project Resource"

    sql: ${TABLE}.weekly_capacity ;;
  }

  measure: count_consultants {
    group_label: "Project Resource"

    type: count

  }
}
