view: deal_revenue_forecast {
  sql_table_name: deal_revenue_forecast;;




  dimension: deal_id {
    hidden: yes
    type: number
    sql: ${TABLE}.deal_id ;;
  }

  dimension_group: month_ts {
    label: "Revenue Forecast"
    type: time
    timeframes: [month,quarter,year]
    sql: timestamp(${TABLE}.month_ts) ;;
  }

  dimension: revenue_days {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue_days ;;
  }

  measure: total_revenue_days {
    group_label: "Forecast Deal Revenue"
    type: sum_distinct
    hidden: no
    sql_distinct_key: ${deal_id} ;;
    sql: ${revenue_days};;
  }

  dimension: weighted_amount_monthly_forecast {
    group_label: "Forecast Deal Revenue"
    type: number
    hidden: no
    sql: ${TABLE}.weighted_amount_monthly_forecast ;;
  }

  dimension: full_amount_monthly_forecast {
    group_label: "Forecast Deal Revenue"

    type: number
    hidden: no
    sql: ${TABLE}.full_amount_monthly_forecast ;;
  }

  dimension: diff_amount_monthly_forecast {
    group_label: "Forecast Deal Revenue"

    type: number
    hidden: no
    sql: ${TABLE}.diff_amount_monthly_forecast ;;
  }

  measure: total_weighted_amount_monthly_forecast {
    group_label: "Forecast Deal Revenue"

    label: "Allocated Weighted Revenue"
    value_format_name: gbp
    type: sum_distinct
    sql: case when ${deals.services_stage_group} in ('Active Projects','About to Close') then ${weighted_amount_monthly_forecast} else 0 end ;;
    sql_distinct_key: ${deal_id} ;;
  }

  measure: total_amount_monthly_forecast {
    group_label: "Forecast Deal Revenue"

    label: "Allocated Deal Revenue"
    value_format_name: gbp
    type: sum_distinct
    sql: case when ${deals.services_stage_group} in ('Active Projects','About to Close') then ${full_amount_monthly_forecast} else 0 end ;;
    sql_distinct_key: ${deal_id} ;;
  }



}
