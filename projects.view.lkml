view: projects {
  sql_table_name: rittman_analytics.projects ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }





  dimension: bill_by {
    type: string
    sql: ${TABLE}.bill_by ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  measure: total_budget {
    type: sum
    sql: ${TABLE}.budget ;;
  }


  dimension: budget_by {
    type: string
    sql: ${TABLE}.budget_by ;;
  }

  dimension: budget_is_monthly {
    type: yesno
    sql: ${TABLE}.budget_is_monthly ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: cost_budget {
    type: number
    sql: ${TABLE}.cost_budget ;;
  }

  measure: total_cost_budget {
    type: sum
    sql: ${TABLE}.cost_budget ;;
  }



  dimension: cost_budget_include_expenses {
    type: yesno
    sql: ${TABLE}.cost_budget_include_expenses ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }



  dimension: fee {
    type: number
    sql: ${TABLE}.fee ;;
  }

  measure: total_fee {
    type: sum
    sql: ${TABLE}.fee ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_billable {
    type: yesno
    sql: ${TABLE}.is_billable ;;
  }

  dimension: is_fixed_fee {
    type: yesno
    sql: ${TABLE}.is_fixed_fee ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: notify_when_over_budget {
    type: yesno
    sql: ${TABLE}.notify_when_over_budget ;;
  }

  dimension: over_budget_notification_percentage {
    type: number
    sql: ${TABLE}.over_budget_notification_percentage ;;
  }

  dimension: show_budget_to_all {
    type: yesno
    sql: ${TABLE}.show_budget_to_all ;;
  }

  dimension: starts_on {
    type: string
    sql: ${TABLE}.starts_on ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count_projects {
    type: count_distinct
    sql_distinct_key: ${id} ;;

  }

  # ----- Sets of fields for drilling ------

}
