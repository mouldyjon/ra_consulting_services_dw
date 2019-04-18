view: customer_events {
  label: "Customer Events"
  sql_table_name: ra_data_warehouse.customer_events ;;

  dimension: billable_client {
    type: yesno
    sql: ${TABLE}.billable_client ;;
  }

  dimension: sales_prospect {
    type: yesno
    sql: ${TABLE}.sales_prospect ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    hidden: yes
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: days_since_last_billable_day {
    group_label: "Retention"
    type: number
    sql: ${TABLE}.days_since_last_billable_day ;;
  }

  dimension: days_since_last_incoming_email {
    group_label: "Retention"

    type: number
    sql: ${TABLE}.days_since_last_incoming_email ;;
  }

  dimension: days_since_last_outgoing_email {
    group_label: "Retention"

    type: number
    sql: ${TABLE}.days_since_last_outgoing_email ;;
  }

  dimension: event_details {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_details ;;
  }

  dimension: event_seq {
    group_label: "Retention"

    type: number
    sql: ${TABLE}.event_seq ;;
  }

  dimension_group: event_ts {
    label: "Event"
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.event_ts ;;
  }

  dimension: event_type {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: event_value {
    hidden: yes
    type: number
    sql: ${TABLE}.event_value ;;
  }

  measure: total_event_value {
    hidden: no
    type: sum
    sql: ${TABLE}.event_value ;;
  }

  dimension_group: first_billable_day_ts {
    label: "First Billing"
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}.first_billable_day_ts ;;
  }

  dimension_group: first_invoice_day_ts {
    type: time
    hidden: yes
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
    hidden: yes

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

  dimension_group: last_invoice_day_ts {
    hidden: yes

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

  dimension: months_since_first_billable_day {
    group_label: "Retention"

    type: number
    sql: ${TABLE}.months_since_first_billable_day ;;
  }

  dimension: weeks_since_first_billable_day {
    group_label: "Retention"

    type: number
    sql: ${TABLE}.weeks_since_first_billable_day ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}
