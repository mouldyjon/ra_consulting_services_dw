view: xero_profit_and_loss {
  sql_table_name: ra_data_warehouse_dbt_prod.xero_profit_and_loss ;;

  dimension: account {
    group_label: "14 Company Finances"
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: account_code {
    group_label: "14 Company Finances"

    type: string
    sql: ${TABLE}.account_code ;;
  }

  dimension: account_type {
    group_label: "14 Company Finances"

    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: actual_or_budget {
    group_label: "14 Company Finances"

    type: string
    sql: ${TABLE}.actual_or_budget ;;
  }

  dimension: amount {
    group_label: "14 Company Finances"

    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_amount {
    group_label: "14 Company Finances"

    type: sum
    sql: ${TABLE}.amount ;;
  }

  dimension: description {
    group_label: "14 Company Finances"

    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: period_ts {
    group_label: "14 Company Finances"
    label: "Period"
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.period_ts ;;
  }


}
