view: harvest_forecast_entries {
  sql_table_name: ra_data_warehouse_dbt_dev.harvest_forecast_entries ;;

  dimension: id {
    primary_key: no
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(cast(${TABLE}.id as string),cast(${TABLE}.billable_rate as string)) ;;
  }



  dimension: allocation {
    group_label: "Forecast Invoice Revenue"
    type: number
    sql: ${TABLE}.allocation ;;
  }

  dimension: billable_rate {
    group_label: "Forecast Invoice Revenue"

    type: number
    sql: ${TABLE}.billable_rate ;;
  }

  dimension: client_harvest_id {
    hidden: yes

    type: number
    sql: ${TABLE}.client_harvest_id ;;
  }

  dimension_group: forecast_days_end {
    group_label: "Forecast Invoice Revenue"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: forecast_days {
    type: number
    hidden: yes

    sql: ${TABLE}.forecast_days ;;
  }

  measure: total_forecast_days {
    group_label: "Forecast Invoice Revenue"

    type: sum
    sql: ${forecast_days} ;;
  }

  dimension: forecast_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.forecast_revenue ;;
  }

  measure: total_forecast_revenue {
    group_label: "Forecast Invoice Revenue"

    type: sum
    value_format_name: gbp_0
    sql: ${forecast_revenue} ;;
  }

  dimension: harvest_user_id {
    hidden: yes

    type: number
    sql: ${TABLE}.harvest_user_id ;;
  }



  dimension: project_harvest_id {
    hidden: yes

    type: number
    sql: ${TABLE}.project_harvest_id ;;
  }

  dimension: project_id {
    hidden: yes

    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: forecast_days_start {
    group_label: "Forecast Invoice Revenue"

    type: time
    timeframes: [
      date,
      month
    ]
    sql: ${TABLE}.start_date ;;
  }


}
