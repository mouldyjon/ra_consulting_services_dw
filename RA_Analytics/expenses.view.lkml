view: expenses {
  sql_table_name: rittman_analytics.expenses ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: billable {
    group_label: "Project Expenses"
    type: yesno
    sql: ${TABLE}.billable ;;
  }

  dimension: client_id {
    hidden: yes
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: created {
    group_label: "Project Expenses"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: expense_category_id {
    hidden: yes
    type: number
    sql: ${TABLE}.expense_category_id ;;
  }

  dimension: invoice_id {
    hidden: yes

    type: number
    # hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: is_billed {
    group_label: "Project Expenses"
    label: "Has Been Billed"

    type: yesno
    sql: ${TABLE}.is_billed ;;
  }

  dimension: is_closed {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_locked {
    hidden: yes

    type: yesno
    sql: ${TABLE}.is_locked ;;
  }

  dimension: locked_reason {
    hidden: yes

    type: string
    sql: ${TABLE}.locked_reason ;;
  }

  dimension: notes {
    group_label: "Project Expenses"
    label: "Expense Item"
    type: string
    sql: ${TABLE}.notes ;;
    link: {label: "View Expense Receipt"
      url: "{{ expenses.receipt_url._value }}"
      icon_url: "https://rittman.harvestapp.com/favicon.ico"}
  }

  dimension: project_id {
    hidden: yes

    type: number
    # hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: receipt_content_type {
    hidden: yes

    type: string
    sql: ${TABLE}.receipt_content_type ;;
  }

  dimension: receipt_file_name {
    hidden: yes

    type: string
    sql: ${TABLE}.receipt_file_name ;;
  }

  dimension: receipt_file_size {
    hidden: yes

    type: number
    sql: ${TABLE}.receipt_file_size ;;
  }

  dimension: receipt_url {
    group_label: "Project Expenses"
    hidden: yes
    label: "Receipt"
    type: string
    sql: ${TABLE}.receipt_url ;;

  }

  dimension_group: spent {
    group_label: "Project Expenses"
    label: "Expense Incurred"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.spent_date ;;
  }

  dimension: total_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.total_cost ;;
  }

  measure: expenses {
    group_label: "Project Timesheets"
    label: "Billable Expenses"
    type: sum
    sql: ${total_cost} ;;
  }

  dimension: units {
    hidden: yes

    type: number
    sql: ${TABLE}.units ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_assignment_id {
    hidden: yes

    type: number
    sql: ${TABLE}.user_assignment_id ;;
  }

  dimension: user_id {
    hidden: yes

    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    group_label: "Project Timesheets"
    label: "Count of Expense Claims"
    type: count
  }


}
