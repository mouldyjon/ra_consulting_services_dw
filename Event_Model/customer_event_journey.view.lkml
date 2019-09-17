view: customer_event_journey {
  sql_table_name: ra_data_warehouse_dbt_prod.customer_event_journey ;;

  dimension: customer_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: event_type_1 {
    group_label: "Event Type Sequence"
    type: string
    sql: ${TABLE}.event_type_1 ;;
  }

  dimension: event_type_2 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_2 ;;
  }

  dimension: event_type_3 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_3 ;;
  }

  dimension: event_type_4 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_4 ;;
  }

  dimension: event_type_5 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_5 ;;
  }

  dimension: event_type_6 {
    group_label: "Event Type Sequence"
    type: string
    sql: ${TABLE}.event_type_6 ;;
  }

  dimension: event_type_7 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_8 ;;
  }

  dimension: event_type_8 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_8 ;;
  }

  dimension: event_type_9 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_9 ;;
  }

  dimension: event_type_10 {
    group_label: "Event Type Sequence"

    type: string
    sql: ${TABLE}.event_type_10;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
