view: harvest_users {
  sql_table_name: harvest_users ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: no
    group_label: "Harvest IDs"
    label: "User Project User ID"
    sql: ${TABLE}.id ;;
  }








  dimension: cost_rate {
    group_label: "Project Users"
    hidden: no
    type: number
    sql: ${TABLE}.cost_rate ;;
  }

  measure: user_avg_cost_rate {
    type: average
    group_label: "Project Users"
    sql: ${TABLE}.cost_rate ;;
  }

  dimension_group: user_created_at {
    type: time
    hidden: no
    group_label: "Project Users"

    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_default_hourly_rate {
    type: number
    hidden: no
    group_label: "Project Users"

    sql: ${TABLE}.default_hourly_rate ;;
  }

  measure: avg_user_default_hourly_rate {
    group_label: "Project Users"

    type: average
    sql: ${TABLE}.default_hourly_rate ;;
  }

  dimension: consultant_email {
    group_label: "Project Users"
    hidden: no
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: user_name {
    group_label: "Project Users"

    type: string
    sql: concat(concat(${TABLE}.first_name,' '),${TABLE}.last_name) ;;
  }



  dimension: user_is_active {
    group_label: "Project Users"

    type: yesno
    sql: ${TABLE}.is_active ;;
  }



  dimension: user_is_contractor {
    group_label: "Project Users"
    type: yesno
    sql: ${TABLE}.is_contractor ;;
  }

  dimension: user_is_project_manager {
    group_label: "Project Users"

    type: yesno
    sql: ${TABLE}.is_project_manager ;;
  }

  dimension: last_name {
    hidden: yes

    type: string
    sql: ${TABLE}.last_name ;;
  }





  dimension: user_weekly_capacity {
    hidden: no
    group_label: "Project Users"

    type: number
    sql: ${TABLE}.weekly_capacity ;;
  }



  measure: total_user_weekly_capacity {
    type: sum
    group_label: "Project Users"

    sql: ${TABLE}.weekly_capacity ;;
  }

  measure: count_users {
    group_label: "Project Users"

    type: count_distinct
    sql: ${id} ;;

  }
}
