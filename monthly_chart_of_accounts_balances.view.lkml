view: monthly_chart_of_accounts_balances {
  sql_table_name: ra_data_warehouse_dbt_dev.monthly_chart_of_accounts_balances ;;

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension_group: period {
    type: time
    timeframes: [
      month

    ]
    sql: ${TABLE}.month_ts ;;
  }

  dimension: pk {
    type: string
    hidden: yes
    primary_key: yes
    sql: concat(${account},cast(${period_month} as string);;
  }

  measure: total_balance {
    type: sum
    sql: ${TABLE}.total ;;
  }

  measure: avg_balance {
    type: average
    sql: ${TABLE}.total ;;
  }


}
