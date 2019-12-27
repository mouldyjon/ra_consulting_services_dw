view: timesheets {
  derived_table: {
    sql: SELECT * FROM `ra-development.ra_data_warehouse_dbt_prod.timesheets`
      ;;
  }



  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: spent_date {
    group_label: "Timesheets"
    label: "Timesheet"
    type: time
    timeframes: [raw,date,day_of_week,day_of_year,week,week_of_year,month,month_num,quarter,quarter_of_year,year]
    sql: ${TABLE}.spent_date ;;
  }

  dimension: user_id {
    hidden: yes

    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: project_id {
    hidden: yes

    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: client_id {
    hidden: yes

    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: invoice_id {
    hidden: yes
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: billable {
    group_label: "Timesheets"

    type: yesno
    sql: ${TABLE}.billable ;;
  }

  filter: is_billed {
    group_label: "Timesheets"
    default_value: "Yes"
    type: yesno
    sql: ${TABLE}.is_billed ;;
  }

  dimension: is_locked {
    group_label: "Timesheets"
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_locked ;;
  }




  dimension: billable_rate {
    group_label: "Timesheets"

    type: number
    sql: ${TABLE}.billable_rate ;;
  }

  dimension: cost_rate {
    group_label: "Timesheets"

    type: number
    sql: ${TABLE}.cost_rate ;;
  }

  dimension: timesheet_notes {
    group_label: "Timesheets"

    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: hours {
    group_label: "Timesheets"
    hidden: yes

    type: number
    sql: ${TABLE}.hours ;;
  }

measure: total_timesheet_hours {
  group_label: "Timesheets"
  hidden: no

  type: sum
  sql: ${TABLE}.hours ;;
}



  dimension: billable_revenue {
    hidden: yes

    type: number
    sql: ${TABLE}.billable_revenue ;;
  }

measure: total_billable_revenue {
  hidden: no
  group_label: "Timesheets"

  type: sum
  sql: ${TABLE}.billable_revenue ;;
}

  dimension: billed_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.billed_revenue ;;
  }

measure: total_billed_revenue {
  group_label: "Timesheets"

  hidden: no
  type: sum
  sql: ${TABLE}.billed_revenue ;;
}

  dimension: task_assignment_id {
    hidden: yes

    type: number
    sql: ${TABLE}.task_assignment_id ;;
  }

  dimension: task_id {
    hidden: yes

    type: number
    sql: ${TABLE}.task_id ;;
  }


}
