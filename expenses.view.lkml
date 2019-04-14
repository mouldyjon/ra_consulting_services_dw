view: expenses {
  sql_table_name: rittman_analytics.expenses ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: billable {
    type: yesno
    sql: ${TABLE}.billable ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: created {
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

  dimension: expense_category_id {
    type: number
    sql: ${TABLE}.expense_category_id ;;
  }

  dimension: invoice_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: is_billed {
    type: yesno
    sql: ${TABLE}.is_billed ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_locked {
    type: yesno
    sql: ${TABLE}.is_locked ;;
  }

  dimension: locked_reason {
    type: string
    sql: ${TABLE}.locked_reason ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: project_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: receipt_content_type {
    type: string
    sql: ${TABLE}.receipt_content_type ;;
  }

  dimension: receipt_file_name {
    type: string
    sql: ${TABLE}.receipt_file_name ;;
  }

  dimension: receipt_file_size {
    type: number
    sql: ${TABLE}.receipt_file_size ;;
  }

  dimension: receipt_url {
    type: string
    sql: ${TABLE}.receipt_url ;;
  }

  dimension_group: spent {
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
    sql: ${TABLE}.spent_date ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}.units ;;
  }

  dimension_group: updated {
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
    type: number
    sql: ${TABLE}.user_assignment_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      receipt_file_name,
      projects.id,
      projects.name,
      invoices.id,
      users.firstname,
      users.lastname,
      users.id,
      users.first_name,
      users.last_name
    ]
  }
}
