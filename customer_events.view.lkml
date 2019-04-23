view: customer_events {
  label: "Customer Events"
  sql_table_name: ra_data_warehouse.customer_events ;;



  filter: billable_client {
    hidden: no

    type: yesno
    sql: ${TABLE}.billable_client ;;
    default_value: "Yes"
  }


  filter: sales_prospect {
    type: yesno
    hidden: no

    sql: ${TABLE}.sales_prospect ;;

  }

  dimension: customer_id {
    type: number
    hidden: no
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    hidden: no
    sql: ${customer_master.customer_name} ;;
  }

  dimension: pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: concat(cast(${customer_id} as string),cast(${event_seq} as string)) ;;
  }



  dimension: days_since_last_billable_day {
    group_label: "Retention"
    type: number
    sql: ${TABLE}.days_since_last_billable_day ;;
  }

  dimension: churn_status {
    group_label: "Retention"
    type: string
    sql: case when ${TABLE}.days_since_last_billable_day < 30 then 'Active'
              when ${TABLE}.days_since_last_billable_day between 30 and 89 then 'Inactive'
              when ${TABLE}.days_since_last_billable_day between 90 and 180 then 'Dormant'
              when ${TABLE}.days_since_last_billable_day > 180 then 'Churned'
              else 'n/a' end;;

  }

  dimension: days_since_last_incoming_email {
    group_label: "Retention"
    hidden: yes

    type: number
    sql: ${TABLE}.days_since_last_incoming_email ;;
  }

  dimension: days_since_last_outgoing_email {
    group_label: "Retention"
    hidden: yes


    type: number
    sql: ${TABLE}.days_since_last_outgoing_email ;;
  }

  dimension: time_since_last_email_contact {
    group_label: "Retention"
    type: string
    sql: case when ${TABLE}.days_since_last_billable_day < 30 then 'This month'
    when ${TABLE}.days_since_last_billable_day between 30 and 89 then 'Last 3 Months'
    when ${TABLE}.days_since_last_billable_day between 90 and 180 then 'Last 6 Months'
    when ${TABLE}.days_since_last_billable_day > 180 then '>6 Months Ago'
    else 'n/a' end;;
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
      day_of_week,
      day_of_week_index,
      day_of_month,
      week_of_year,
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

  measure: total_events {
    hidden: no
    type: sum
    sql: 1 ;;
  }

  dimension_group: first_billable_day_ts {
    label: "Customer Since"
    group_label: "Retention"

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

  dimension: months_since_first_contact_day {
    group_label: "Retention"

    type: number
    sql: ${TABLE}.months_since_first_contact_day ;;
  }

  dimension: weeks_since_first_contact_day {
    group_label: "Retention"

    type: number
    sql: ${TABLE}.weeks_since_first_contact_day ;;
  }


}
