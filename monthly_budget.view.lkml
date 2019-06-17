view: monthly_budget {
  derived_table: {
    sql: SELECT * FROM `ra-development.ra_data_warehouse.budget`
      ;;
  }



  dimension: account {
    type: string
    sql: ${TABLE}.Account ;;
  }

  dimension: month {
    type: date
    sql: ${TABLE}.month ;;
  }

  dimension: budget_amount {
    type: number
    sql: ${TABLE}.budget_amount ;;
  }

  measure: total_budget_amount {
    type: sum
    sql: ${TABLE}.budget_amount ;;
  }


}
