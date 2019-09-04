view: customer_events {
  sql_table_name: ra_data_warehouse_dbt_prod.customer_events ;;

  dimension: billable_client {
    type: yesno
    sql: ${TABLE}.billable_client ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: days_since_last_billable_day {
    type: number
    sql: ${TABLE}.days_since_last_billable_day ;;
  }

  dimension: days_since_last_incoming_email {
    type: number
    sql: ${TABLE}.days_since_last_incoming_email ;;
  }

  dimension: days_since_last_outgoing_email {
    type: number
    sql: ${TABLE}.days_since_last_outgoing_email ;;
  }

  dimension: event_details {
    type: string
    sql: ${TABLE}.event_details ;;
  }

  dimension: event_seq {
    type: number
    sql: ${TABLE}.event_seq ;;
  }

  dimension: event_source {
    type: string
    sql: ${TABLE}.event_source ;;
  }

  dimension_group: event_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_ts ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: event_units {
    type: number
    sql: ${TABLE}.event_units ;;
  }

  dimension: event_value {
    type: number
    sql: ${TABLE}.event_value ;;
  }

  dimension_group: first_billable_day_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_billable_day_ts ;;
  }

  dimension_group: first_contact_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_contact_ts ;;
  }

  dimension_group: first_invoice_day_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_invoice_day_ts ;;
  }

  dimension_group: last_billable_day_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_billable_day_ts ;;
  }

  dimension_group: last_incoming_email_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_incoming_email_ts ;;
  }

  dimension_group: last_invoice_day_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_invoice_day_ts ;;
  }

  dimension_group: last_outgoing_email_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_outgoing_email_ts ;;
  }

  dimension: months_since_first_billable_day {
    type: number
    sql: ${TABLE}.months_since_first_billable_day ;;
  }

  dimension: months_since_first_contact_day {
    type: number
    sql: ${TABLE}.months_since_first_contact_day ;;
  }

  dimension: sales_prospect {
    type: yesno
    sql: ${TABLE}.sales_prospect ;;
  }

  dimension: weeks_since_first_billable_day {
    type: number
    sql: ${TABLE}.weeks_since_first_billable_day ;;
  }

  dimension: weeks_since_first_contact_day {
    type: number
    sql: ${TABLE}.weeks_since_first_contact_day ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}
