view: financial_results {
  sql_table_name: ra_data_warehouse_dbt_prod.financial_results ;;
  view_label: "Monthly Financial KPIs"

  measure: total_cogs {
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.cogs ;;
  }

  measure: avg_cogs {
    type: average
    value_format_name: gbp

    sql: ${TABLE}.cogs ;;
  }

  measure: avg_gross_margin_pct {
    type: average
    value_format_name: percent_1

    sql: ${TABLE}.gross_margin_pct ;;
  }

  measure: total_gross_sales {
    type: sum_distinct
    value_format_name: gbp

    sql: ${TABLE}.gross_sales ;;
  }

  measure: avg_gross_sales {
    type: average
    value_format_name: gbp

    sql: ${TABLE}.gross_sales ;;
  }

  measure: avg_net_margin_pct {
    value_format_name: percent_1

    type: average
    sql: ${TABLE}.net_margin_pct ;;
  }

  measure: total_net_profit {
    type: sum
    value_format_name: gbp

    sql: ${TABLE}.net_profit ;;
  }

  measure: avg_net_profit {
    type: average

    value_format_name: gbp

    sql: ${TABLE}.net_profit ;;
  }

  measure: total_net_sales {
    type: sum
    value_format_name: gbp

    sql: ${TABLE}.net_sales ;;
  }

  measure: avg_net_sales {
    type: average
    value_format_name: gbp

    sql: ${TABLE}.net_sales ;;
  }

  measure: total_operating_expenses {
    type: sum
    value_format_name: gbp

    sql: ${TABLE}.operating_expenses ;;
  }

  measure: avg_operating_expenses {
    type: average
    value_format_name: gbp

    sql: ${TABLE}.operating_expenses ;;
  }

  dimension: pk {
    sql: cast(${period_month} as string) ;;
    hidden: yes
    primary_key: yes
  }

  dimension_group: period {
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}.period ;;
  }


}
