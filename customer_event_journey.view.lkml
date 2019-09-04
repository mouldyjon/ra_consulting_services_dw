view: customer_event_journey {
  sql_table_name: ra_data_warehouse_dbt_prod.customer_event_journey ;;

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: event_type_1 {
    type: string
    sql: ${TABLE}.event_type_1 ;;
  }

  dimension: event_type_10 {
    type: string
    sql: ${TABLE}.event_type_10 ;;
  }

  dimension: event_type_2 {
    type: string
    sql: ${TABLE}.event_type_2 ;;
  }

  dimension: event_type_3 {
    type: string
    sql: ${TABLE}.event_type_3 ;;
  }

  dimension: event_type_4 {
    type: string
    sql: ${TABLE}.event_type_4 ;;
  }

  dimension: event_type_5 {
    type: string
    sql: ${TABLE}.event_type_5 ;;
  }

  dimension: event_type_6 {
    type: string
    sql: ${TABLE}.event_type_6 ;;
  }

  dimension: event_type_7 {
    type: string
    sql: ${TABLE}.event_type_7 ;;
  }

  dimension: event_type_8 {
    type: string
    sql: ${TABLE}.event_type_8 ;;
  }

  dimension: event_type_9 {
    type: string
    sql: ${TABLE}.event_type_9 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
