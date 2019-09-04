view: budget {
  sql_table_name: ra_data_warehouse.budget ;;

  dimension: account {
    type: string
    sql: ${TABLE}.Account ;;
  }

  dimension: budget_amount {
    type: number
    value_format_name: gbp_0
    sql: ${TABLE}.budget_amount ;;
  }

  dimension_group: month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
